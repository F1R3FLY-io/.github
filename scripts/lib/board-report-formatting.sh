#!/usr/bin/env bash
#
# board-report-formatting.sh - Formatting utilities for board/stakeholder reports
#
# Produces a business-oriented report with:
# - Executive overview with organization health metrics
# - Strategic milestone progress
# - Product delivery summary
# - Risk register (blockers, overdue milestones, critical issues)
# - Team and resource utilization
# - Decision items and next-period outlook
#
# Usage:
#   source /path/to/board-report-formatting.sh
#   markdown=$(generate_board_report "$all_data" "$period_name" "$period" "$generated_at" "$cadence")
#

# Prevent re-sourcing
if [[ -n "${BOARD_REPORT_FORMATTING_LOADED:-}" ]]; then
    return 0
fi
BOARD_REPORT_FORMATTING_LOADED=1

#
# Format organization health dashboard
#
format_board_health_dashboard() {
    local all_data="$1"

    local total_commits total_prs total_closed total_open active_repos total_repos

    total_commits=$(echo "$all_data" | jq '[.[].repos[].commits.count // 0] | add')
    total_prs=$(echo "$all_data" | jq '[.[].repos[].prs.merged_count // 0] | add')
    total_closed=$(echo "$all_data" | jq '[.[].repos[].issues.closed_in_period // 0] | add')
    total_open=$(echo "$all_data" | jq '[.[].repos[].issues.open_count // 0] | add')

    active_repos=$(echo "$all_data" | jq '[.[].repos[] | select((.commits.count // 0) > 0 or (.prs.merged_count // 0) > 0)] | length')
    total_repos=$(echo "$all_data" | jq '[.[].repos[]] | length')

    local open_prs
    open_prs=$(echo "$all_data" | jq '[.[].repos[].prs.open_count // 0] | add')

    cat <<EOF
| Indicator | Value | Status |
|-----------|-------|--------|
| Active Repositories | ${active_repos} / ${total_repos} | - |
| Commits (period) | ${total_commits} | - |
| PRs Merged | ${total_prs} | - |
| PRs Open | ${open_prs} | - |
| Issues Closed | ${total_closed} | - |
| Issues Open (backlog) | ${total_open} | - |
EOF
}

#
# Format strategic milestones table for board view
#
format_board_milestones() {
    local all_data="$1"

    local milestones
    milestones=$(echo "$all_data" | jq '[
        .[].repos[] |
        .repo as $repo |
        (.milestones // [])[] |
        select(.state == "open") |
        {repo: $repo, title, due_on, progress, open_issues, closed_issues, url}
    ] | sort_by(.due_on)')

    if [[ "$milestones" == "[]" ]] || [[ -z "$milestones" ]]; then
        echo "_No open milestones found_"
        return
    fi

    echo "| Project | Milestone | Progress | Due Date | Status |"
    echo "|---------|-----------|----------|----------|--------|"
    echo "$milestones" | jq -r '.[] |
        "| \(.repo) | \(.title) | \(.progress)% (\(.closed_issues)/\(.open_issues + .closed_issues)) | \(.due_on // "TBD") | - |"
    '
}

#
# Format milestones completed within the reporting period
#
format_completed_milestones() {
    local all_data="$1"
    local start_date="$2"
    local end_date="$3"

    local completed
    completed=$(echo "$all_data" | jq --arg start "${start_date}" --arg end "${end_date}T23:59:59Z" '[
        .[].repos[] |
        .repo as $repo |
        (.milestones // [])[] |
        select(.state == "closed" and .closed_at != null and .closed_at >= $start and .closed_at <= $end) |
        {repo: $repo, title, closed_at, due_on, progress, open_issues, closed_issues, url}
    ] | sort_by(.closed_at)')

    if [[ "$completed" == "[]" ]] || [[ -z "$completed" ]]; then
        echo "_No milestones completed this period_"
        return
    fi

    echo "| Project | Milestone | Completed | Due Date | Delivery |"
    echo "|---------|-----------|-----------|----------|----------|"
    echo "$completed" | jq -r '.[] |
        (.closed_at[:10]) as $closed_date |
        (if .due_on then .due_on[:10] else "TBD" end) as $due |
        (if .due_on == null then "No due date"
         elif $closed_date <= (.due_on[:10]) then "On-time"
         else "Late" end) as $delivery |
        "| \(.repo) | \(.title) | \($closed_date) | \($due) | \($delivery) |"
    '
}

#
# Format open and upcoming milestones (with and without due dates)
#
format_future_milestones() {
    local all_data="$1"

    local future
    future=$(echo "$all_data" | jq '[
        .[].repos[] |
        .repo as $repo |
        (.milestones // [])[] |
        select(.state == "open") |
        {repo: $repo, title, due_on, progress, open_issues, closed_issues, url}
    ] | sort_by(.due_on // "9999-12-31")')

    if [[ "$future" == "[]" ]] || [[ -z "$future" ]]; then
        echo "_No open milestones found_"
        return
    fi

    echo "| Project | Milestone | Progress | Due Date | Open Issues |"
    echo "|---------|-----------|----------|----------|-------------|"
    echo "$future" | jq -r '.[] |
        (if .due_on then .due_on[:10] else "**Not set**" end) as $due |
        "| \(.repo) | \(.title) | \(.progress)% (\(.closed_issues)/\(.open_issues + .closed_issues)) | \($due) | \(.open_issues) |"
    '

    # Flag milestones without due dates
    local no_date_count
    no_date_count=$(echo "$future" | jq '[.[] | select(.due_on == null)] | length')
    if [[ "$no_date_count" -gt 0 ]]; then
        echo ""
        echo "> **Planning gap:** ${no_date_count} open milestone(s) have no due date set."
    fi
}

#
# Format delivery reliability metrics for completed milestones
#
format_delivery_reliability() {
    local all_data="$1"
    local start_date="$2"
    local end_date="$3"

    local completed
    completed=$(echo "$all_data" | jq --arg start "${start_date}" --arg end "${end_date}T23:59:59Z" '[
        .[].repos[] |
        .repo as $repo |
        (.milestones // [])[] |
        select(.state == "closed" and .closed_at != null and .closed_at >= $start and .closed_at <= $end) |
        {repo: $repo, title, closed_at, due_on}
    ]')

    local total
    total=$(echo "$completed" | jq 'length')

    if [[ "$total" -eq 0 ]]; then
        echo "_No completed milestones to assess delivery reliability_"
        return
    fi

    local on_time late no_due_date
    on_time=$(echo "$completed" | jq '[.[] | select(.due_on != null and (.closed_at[:10]) <= (.due_on[:10]))] | length')
    late=$(echo "$completed" | jq '[.[] | select(.due_on != null and (.closed_at[:10]) > (.due_on[:10]))] | length')
    no_due_date=$(echo "$completed" | jq '[.[] | select(.due_on == null)] | length')

    echo "| Metric | Value |"
    echo "|--------|-------|"
    echo "| Milestones completed | ${total} |"
    echo "| On-time delivery | ${on_time} |"
    echo "| Late delivery | ${late} |"
    echo "| No due date set | ${no_due_date} |"

    local with_dates=$((on_time + late))
    if [[ "$with_dates" -gt 0 ]]; then
        local pct=$((on_time * 100 / with_dates))
        echo "| **Reliability rate** | **${pct}%** |"
    fi
}

#
# Format milestone coverage and tracking signal analysis
#
format_milestone_coverage() {
    local all_data="$1"

    local total_repos with_count without_count
    total_repos=$(echo "$all_data" | jq '[.[].repos[] | select(.exists == true)] | length')
    with_count=$(echo "$all_data" | jq '[.[].repos[] | select(.exists == true and ((.milestones // []) | length) > 0)] | length')
    without_count=$((total_repos - with_count))

    echo "**Milestone coverage:** ${with_count} of ${total_repos} repositories have milestones defined"
    echo ""

    if [[ "$without_count" -eq 0 ]]; then
        return
    fi

    # Check for alternative tracking signals in repos without milestones
    local with_alt no_tracking
    with_alt=$(echo "$all_data" | jq '[
        .[].repos[] |
        select(.exists == true and ((.milestones // []) | length) == 0) |
        select((.tracking_signals.labeled_tracking_issues // 0) > 0 or (.tracking_signals.project_boards // 0) > 0) |
        {
            repo,
            labeled_issues: (.tracking_signals.labeled_tracking_issues // 0),
            projects: (.tracking_signals.project_boards // 0)
        }
    ]')

    no_tracking=$(echo "$all_data" | jq '[
        .[].repos[] |
        select(.exists == true and ((.milestones // []) | length) == 0) |
        select((.tracking_signals.labeled_tracking_issues // 0) == 0 and (.tracking_signals.project_boards // 0) == 0) |
        .repo
    ]')

    local alt_count no_count
    alt_count=$(echo "$with_alt" | jq 'length')
    no_count=$(echo "$no_tracking" | jq 'length')

    if [[ "$alt_count" -gt 0 ]]; then
        echo "#### Alternative Tracking Signals"
        echo ""
        echo "| Repository | Labeled Issues | Project Boards |"
        echo "|------------|---------------|----------------|"
        echo "$with_alt" | jq -r '.[] | "| \(.repo) | \(.labeled_issues) | \(.projects) |"'
        echo ""
    fi

    if [[ "$no_count" -gt 0 ]]; then
        echo "#### No Tracking Defined"
        echo ""
        echo "> **Recommendation:** ${no_count} repositories have no milestones, labeled tracking issues, or project boards. Consider adding milestones for strategic visibility."
        echo ""
        echo "$no_tracking" | jq -r '.[] | "- \(.)"'
        echo ""
    fi
}

#
# Format milestone continuity across previous board reports
#
format_milestone_history() {
    local all_data="$1"
    local current_period="$2"
    local repo_root="${REPO_ROOT:-$(pwd)}"

    local reports_dir="${repo_root}/docs/reports"

    # Find previous board reports (exclude current period)
    local prev_reports
    prev_reports=$(ls "${reports_dir}"/*board-report.md 2>/dev/null | grep -v "${current_period}" | sort)

    if [[ -z "$prev_reports" ]]; then
        return
    fi

    # Get all current milestone names
    local milestone_entries
    milestone_entries=$(echo "$all_data" | jq -r '[
        .[].repos[] |
        (.milestones // [])[] |
        "\(.repo)\t\(.title)"
    ] | unique | .[]')

    if [[ -z "$milestone_entries" ]]; then
        return
    fi

    local has_history=false
    local history_output=""

    while IFS=$'\t' read -r repo title; do
        [[ -z "$title" ]] && continue
        while IFS= read -r report; do
            if grep -qF "$title" "$report" 2>/dev/null; then
                local report_period
                report_period=$(basename "$report" .md | sed 's/-board-report//' | sed 's/-biweekly//')
                if [[ "$has_history" == false ]]; then
                    has_history=true
                fi
                history_output="${history_output}| ${repo} | ${title} | ${report_period} |
"
            fi
        done <<< "$prev_reports"
    done <<< "$milestone_entries"

    if [[ "$has_history" == true ]]; then
        echo "#### Milestone Continuity"
        echo ""
        echo "Milestones tracked in previous board reports:"
        echo ""
        echo "| Project | Milestone | Previous Report |"
        echo "|---------|-----------|-----------------|"
        echo -n "$history_output"
    fi
}

#
# Format Date Gaps: milestones approaching their due date with low progress,
# plus a summary of milestones that have no due_on at all.
#
# Governed by docs/common/roadmap-release-normalization-standard.md Section 1.3.
# Threshold: 30 days + <50% progress (Medium severity in the standard).
#
format_date_gaps() {
    local all_data="$1"

    local today horizon
    today=$(date -u +%Y-%m-%d)
    horizon=$(date -u -v+30d +%Y-%m-%d 2>/dev/null || date -u -d '+30 days' +%Y-%m-%d)

    # Milestones within 30 days AND <50% progress
    local at_risk
    at_risk=$(echo "$all_data" | jq --arg today "$today" --arg horizon "$horizon" '[
        .[].repos[] |
        .repo as $repo |
        (.milestones // [])[] |
        select(.state == "open" and .due_on != null
               and (.due_on[:10]) >= $today
               and (.due_on[:10]) <= $horizon
               and (.progress // 0) < 50) |
        {repo: $repo, title, due_on: .due_on[:10], progress}
    ] | sort_by(.due_on)')

    local at_risk_count
    at_risk_count=$(echo "$at_risk" | jq 'length')

    if [[ "$at_risk_count" -gt 0 ]]; then
        echo "**At-risk milestones (due within 30 days, under 50% progress):**"
        echo ""
        echo "| Project | Milestone | Due | Progress |"
        echo "|---------|-----------|-----|----------|"
        echo "$at_risk" | jq -r '.[] | "| \(.repo) | \(.title) | \(.due_on) | \(.progress)% |"'
        echo ""
    fi

    # Count open milestones missing due_on (already listed by future_milestones
    # but re-surface as an explicit gap count here).
    local no_due
    no_due=$(echo "$all_data" | jq '[
        .[].repos[] |
        (.milestones // [])[] |
        select(.state == "open" and .due_on == null)
    ] | length')

    if [[ "${no_due:-0}" -gt 0 ]]; then
        echo "**${no_due} open milestone(s) still have no due date** — see the Open & Upcoming table above."
        echo ""
    fi

    if [[ "$at_risk_count" -eq 0 ]] && [[ "${no_due:-0}" -eq 0 ]]; then
        echo "_No milestone date gaps detected this period._"
        echo ""
    fi
}

#
# Format Release Cadence Risks for the Risk Register.
#
# Governed by docs/common/roadmap-release-normalization-standard.md Section 2.3.
# Thresholds:
#   - Active repo (commits in window) + no published release >90 days (Medium)
#   - Draft release >14 days old (Low)
#   - Tag does not match SemVer pattern (Medium)
#
format_release_cadence_risks() {
    local all_data="$1"

    local today_epoch cutoff_90d cutoff_14d
    today_epoch=$(date -u +%s)
    cutoff_90d=$((today_epoch - 90*86400))
    cutoff_14d=$((today_epoch - 14*86400))

    # Repos with activity in the window but no release in the last 90 days
    local stale_releases
    stale_releases=$(echo "$all_data" | jq --arg cutoff "$cutoff_90d" '[
        .[].repos[] |
        select(.exists == true and (.commits.count // 0) > 0) |
        . as $r |
        (.releases.latest_published_at // null) as $latest |
        select(
            $latest == null
            or (($latest | fromdateiso8601? // 0) < ($cutoff | tonumber))
        ) |
        {
            repo: .repo,
            latest_published_at: $latest,
            latest_tag: (.releases.latest_tag // null),
            total_releases: (.releases.total_count // 0),
            commits: (.commits.count // 0)
        }
    ] | sort_by(.latest_published_at // "0")')

    local stale_count
    stale_count=$(echo "$stale_releases" | jq 'length')

    if [[ "$stale_count" -gt 0 ]]; then
        echo "#### Release Cadence Risks"
        echo ""
        echo "Active repositories without a published release in the last 90 days:"
        echo ""
        echo "| Repository | Commits (period) | Latest Release | Published |"
        echo "|------------|------------------|----------------|-----------|"
        echo "$stale_releases" | jq -r '.[] |
            "| \(.repo) | \(.commits) | \(.latest_tag // "_none_") | \(.latest_published_at // "_never_") |"'
        echo ""
    fi

    # Non-SemVer tags on published releases
    local semver_violations
    semver_violations=$(echo "$all_data" | jq '[
        .[].repos[] |
        .repo as $repo |
        (.releases.recent // [])[] |
        select(.draft == false and .semver_ok == false) |
        {repo: $repo, tag: .tag_name, published_at}
    ]')

    if [[ "$semver_violations" != "[]" ]] && [[ -n "$semver_violations" ]]; then
        echo "#### Non-SemVer Release Tags"
        echo ""
        echo "| Repository | Tag | Published |"
        echo "|------------|-----|-----------|"
        echo "$semver_violations" | jq -r '.[] | "| \(.repo) | \(.tag) | \(.published_at // "_draft_") |"'
        echo ""
    fi

    # Drafts older than 14 days
    local stale_drafts
    stale_drafts=$(echo "$all_data" | jq --arg cutoff "$cutoff_14d" '[
        .[].repos[] |
        .repo as $repo |
        (.releases.recent // [])[] |
        select(.draft == true and .published_at != null
               and ((.published_at | fromdateiso8601? // 0) < ($cutoff | tonumber))) |
        {repo: $repo, tag: .tag_name, published_at}
    ]')

    if [[ "$stale_drafts" != "[]" ]] && [[ -n "$stale_drafts" ]]; then
        echo "#### Stale Draft Releases (>14 days)"
        echo ""
        echo "| Repository | Tag | Draft Since |"
        echo "|------------|-----|-------------|"
        echo "$stale_drafts" | jq -r '.[] | "| \(.repo) | \(.tag) | \(.published_at) |"'
        echo ""
    fi
}

#
# Format Roadmap Staleness for the Risk Register.
#
# Governed by docs/common/roadmap-release-normalization-standard.md Section 3.3.
# Surfaces:
#   - Missing roadmap.md (High severity)
#   - Roadmap updated >60 days ago (Medium severity)
#
format_roadmap_gaps() {
    local all_data="$1"

    local today_epoch cutoff_60d
    today_epoch=$(date -u +%s)
    cutoff_60d=$((today_epoch - 60*86400))

    local missing
    missing=$(echo "$all_data" | jq '[
        .[].repos[] |
        select(.exists == true and ((.roadmap.present // false) == false)) |
        .repo
    ]')
    local missing_count
    missing_count=$(echo "$missing" | jq 'length')

    local stale
    stale=$(echo "$all_data" | jq --arg cutoff "$cutoff_60d" '[
        .[].repos[] |
        select(.exists == true and ((.roadmap.present // false) == true)
               and (.roadmap.updated != null)
               and (((.roadmap.updated + "T00:00:00Z") | fromdateiso8601? // 0) < ($cutoff | tonumber))) |
        {repo, updated: .roadmap.updated, path: .roadmap.path}
    ] | sort_by(.updated)')
    local stale_count
    stale_count=$(echo "$stale" | jq 'length')

    local unparseable
    unparseable=$(echo "$all_data" | jq '[
        .[].repos[] |
        select(.exists == true and ((.roadmap.present // false) == true)
               and (.roadmap.updated == null)) |
        {repo, path: .roadmap.path, parse_error: .roadmap.parse_error}
    ]')
    local unparseable_count
    unparseable_count=$(echo "$unparseable" | jq 'length')

    if [[ "$missing_count" -eq 0 ]] && [[ "$stale_count" -eq 0 ]] && [[ "$unparseable_count" -eq 0 ]]; then
        return
    fi

    echo "#### Roadmap Staleness"
    echo ""
    echo "_Per [roadmap-release-normalization-standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md)._"
    echo ""

    if [[ "$missing_count" -gt 0 ]]; then
        echo "**Missing roadmap.md (${missing_count} repos):** run \`/harmonize\` to bootstrap from the workspace template."
        echo ""
        echo "$missing" | jq -r '.[] | "- \(.)"'
        echo ""
    fi

    if [[ "$stale_count" -gt 0 ]]; then
        echo "**Roadmap updated >60 days ago (${stale_count} repos):**"
        echo ""
        echo "| Repository | Path | Updated |"
        echo "|------------|------|---------|"
        echo "$stale" | jq -r '.[] | "| \(.repo) | \(.path) | \(.updated) |"'
        echo ""
    fi

    if [[ "$unparseable_count" -gt 0 ]]; then
        echo "**Roadmap present but \`updated:\` field missing or unparseable (${unparseable_count} repos):**"
        echo ""
        echo "$unparseable" | jq -r '.[] | "- \(.repo) (\(.path))"'
        echo ""
    fi
}

#
# Generate complete Milestone Analysis section
#
format_milestone_analysis() {
    local all_data="$1"
    local start_date="$2"
    local end_date="$3"
    local period="$4"

    echo "### Completed This Period"
    echo ""
    format_completed_milestones "$all_data" "$start_date" "$end_date"
    echo ""

    format_milestone_history "$all_data" "$period"
    echo ""

    echo "### Open & Upcoming"
    echo ""
    format_future_milestones "$all_data"
    echo ""

    echo "### Date Gaps"
    echo ""
    format_date_gaps "$all_data"
    echo ""

    echo "### Delivery Reliability"
    echo ""
    format_delivery_reliability "$all_data" "$start_date" "$end_date"
    echo ""

    echo "### Tracking Coverage"
    echo ""
    format_milestone_coverage "$all_data"
}

#
# Format product delivery summary (repos with activity, condensed)
#
format_board_delivery_summary() {
    local all_data="$1"

    echo "| Category | Repository | Commits | PRs Merged | Issues Closed |"
    echo "|----------|------------|---------|------------|---------------|"

    echo "$all_data" | jq -r '
        .[] |
        .category as $cat |
        .repos[] |
        select((.commits.count // 0) > 0 or (.prs.merged_count // 0) > 0 or (.issues.closed_in_period // 0) > 0) |
        "| \($cat) | \(.repo) | \(.commits.count // 0) | \(.prs.merged_count // 0) | \(.issues.closed_in_period // 0) |"
    '
}

#
# Format risk register (critical issues, overdue milestones, blockers)
#
format_board_risk_register() {
    local all_data="$1"

    # Overdue milestones
    local today
    today=$(date -u +%Y-%m-%dT00:00:00Z)

    local overdue
    overdue=$(echo "$all_data" | jq --arg today "$today" '[
        .[].repos[] |
        .repo as $repo |
        (.milestones // [])[] |
        select(.state == "open" and .due_on != null and .due_on < $today) |
        {repo: $repo, title, due_on, progress}
    ]')

    if [[ "$overdue" != "[]" ]] && [[ -n "$overdue" ]]; then
        echo "#### Overdue Milestones"
        echo ""
        echo "| Project | Milestone | Due Date | Progress |"
        echo "|---------|-----------|----------|----------|"
        echo "$overdue" | jq -r '.[] | "| \(.repo) | \(.title) | \(.due_on) | \(.progress)% |"'
        echo ""
    fi

    # High open-issue repos (repos with >20 open issues as a signal)
    local high_backlog
    high_backlog=$(echo "$all_data" | jq '[
        .[].repos[] |
        select((.issues.open_count // 0) > 20) |
        {repo, open_issues: .issues.open_count}
    ] | sort_by(-.open_issues)')

    if [[ "$high_backlog" != "[]" ]] && [[ -n "$high_backlog" ]]; then
        echo "#### Elevated Backlogs"
        echo ""
        echo "| Repository | Open Issues |"
        echo "|------------|-------------|"
        echo "$high_backlog" | jq -r '.[] | "| \(.repo) | \(.open_issues) |"'
        echo ""
    fi

    # Repos with zero activity
    local dormant
    dormant=$(echo "$all_data" | jq '[
        .[].repos[] |
        select(.exists == true and (.commits.count // 0) == 0 and (.prs.merged_count // 0) == 0 and (.issues.closed_in_period // 0) == 0) |
        .repo
    ]')

    local dormant_count
    dormant_count=$(echo "$dormant" | jq 'length')

    if [[ "$dormant_count" -gt 0 ]]; then
        echo "#### Dormant Repositories (${dormant_count})"
        echo ""
        echo "$dormant" | jq -r '.[] | "- \(.)"'
        echo ""
    fi

    # Release cadence and roadmap risks (per roadmap-release-normalization-standard)
    format_release_cadence_risks "$all_data"
    format_roadmap_gaps "$all_data"
}

#
# Format team utilization summary
#
format_board_team_summary() {
    local all_data="$1"

    local contributors
    contributors=$(echo "$all_data" | jq -r '
        [.[].repos[].commits.contributors // []] | flatten | group_by(.) |
        map({name: .[0], commits: length}) |
        sort_by(-.commits)
    ')

    local contributor_count
    contributor_count=$(echo "$contributors" | jq 'length')

    echo "**Active contributors:** ${contributor_count}"
    echo ""

    if [[ "$contributor_count" -gt 0 ]]; then
        echo "| Contributor | Commits | Share |"
        echo "|-------------|---------|-------|"

        local total_commits
        total_commits=$(echo "$contributors" | jq '[.[].commits] | add')

        echo "$contributors" | jq -r --argjson total "$total_commits" '
            .[:10][] |
            "| \(.name) | \(.commits) | \((.commits / $total * 100) | floor)% |"
        '
    fi
}

#
# Format category health summary (one line per category)
#
format_board_category_health() {
    local all_data="$1"

    echo "| Category | Repos Active | Commits | PRs Merged | Issues Closed | Open Issues |"
    echo "|----------|-------------|---------|------------|---------------|-------------|"

    echo "$all_data" | jq -r '
        .[] |
        .category as $cat |
        {
            category: $cat,
            active: [.repos[] | select((.commits.count // 0) > 0 or (.prs.merged_count // 0) > 0)] | length,
            total: (.repos | length),
            commits: [.repos[].commits.count // 0] | add,
            prs: [.repos[].prs.merged_count // 0] | add,
            closed: [.repos[].issues.closed_in_period // 0] | add,
            open: [.repos[].issues.open_count // 0] | add
        } |
        "| \(.category) | \(.active)/\(.total) | \(.commits) | \(.prs) | \(.closed) | \(.open) |"
    '
}

#
# Generate complete board report
#
generate_board_report() {
    local all_data="$1"
    local period_name="$2"
    local period="$3"
    local generated_at="$4"
    local cadence="${5:-monthly}"
    local start_date="${6:-}"
    local end_date="${7:-}"

    local doc_type="${cadence}-board-report"

    cat <<EOF
---
doc_type: ${doc_type}
period: ${period}
cadence: ${cadence}
generated_at: ${generated_at}
generated_by: generate-board-report.sh
audience: board
---

# F1R3FLY.io Board Report

**Period:** ${period_name}
**Cadence:** $(echo "${cadence}" | sed 's/biweekly/Bi-weekly/' | sed 's/monthly/Monthly/')
**Generated:** ${generated_at}

---

## Executive Overview

### Organization Health

$(format_board_health_dashboard "$all_data")

### Highlights

<!-- AI_NARRATIVE_START: executive_overview -->
_Add executive overview: key accomplishments, business impact, notable decisions made._
<!-- AI_NARRATIVE_END -->

---

## Category Health

$(format_board_category_health "$all_data")

---

## Strategic Milestones

$(format_board_milestones "$all_data")

### Milestone Commentary

<!-- AI_NARRATIVE_START: milestone_commentary -->
_Add commentary on milestone progress, delays, and adjustments._
<!-- AI_NARRATIVE_END -->

---

## Milestone Analysis

$(format_milestone_analysis "$all_data" "$start_date" "$end_date" "$period")

### Milestone Analysis Commentary

<!-- AI_NARRATIVE_START: milestone_analysis -->
_Add analysis of milestone completion trends, delivery reliability patterns, and recommendations for improving strategic tracking coverage across the organization._
<!-- AI_NARRATIVE_END -->

---

## Product Delivery

### Deliverables This Period

$(format_board_delivery_summary "$all_data")

### Delivery Commentary

<!-- AI_NARRATIVE_START: delivery_commentary -->
_Add summary of what was shipped, key features delivered, and customer-facing impact._
<!-- AI_NARRATIVE_END -->

---

## Risk Register

$(format_board_risk_register "$all_data")

### Risk Commentary

<!-- AI_NARRATIVE_START: risk_commentary -->
_Add analysis of current risks, mitigations in place, and items requiring escalation._
<!-- AI_NARRATIVE_END -->

---

## Team & Resources

$(format_board_team_summary "$all_data")

### Resource Commentary

<!-- AI_NARRATIVE_START: resource_commentary -->
_Add notes on team capacity, hiring needs, and resource allocation._
<!-- AI_NARRATIVE_END -->

---

## Decisions Required

<!-- AI_NARRATIVE_START: decisions_required -->
_List items requiring board attention or approval._

_Example:_
_- Approve budget for [initiative]_
_- Decide on timeline for [milestone]_
_- Review proposed architecture change for [system]_
<!-- AI_NARRATIVE_END -->

---

## Next Period Outlook

<!-- AI_NARRATIVE_START: next_period_outlook -->
_Add forward-looking summary: planned focus areas, expected deliverables, upcoming milestones._
<!-- AI_NARRATIVE_END -->

---

_Report generated by F1R3FLY.io Board Report System_
EOF
}

#
# Validate board report
#
validate_board_report() {
    local report_file="$1"
    local errors=()

    if [[ ! -f "$report_file" ]]; then
        errors+=("Report file not found: $report_file")
    else
        if ! grep -q "^## Executive Overview" "$report_file"; then
            errors+=("Missing Executive Overview section")
        fi
        if ! grep -q "^## Strategic Milestones" "$report_file"; then
            errors+=("Missing Strategic Milestones section")
        fi
        if ! grep -q "^## Milestone Analysis" "$report_file"; then
            errors+=("Missing Milestone Analysis section")
        fi
        if ! grep -q "^## Risk Register" "$report_file"; then
            errors+=("Missing Risk Register section")
        fi
        if ! head -1 "$report_file" | grep -q "^---$"; then
            errors+=("Missing YAML frontmatter")
        fi

        local start_count end_count
        start_count=$(grep -c "AI_NARRATIVE_START" "$report_file") || start_count="0"
        end_count=$(grep -c "AI_NARRATIVE_END" "$report_file") || end_count="0"
        if [[ "$start_count" != "$end_count" ]]; then
            errors+=("Mismatched narrative markers")
        fi
    fi

    if [[ ${#errors[@]} -gt 0 ]]; then
        echo "Validation errors:"
        for error in "${errors[@]}"; do
            echo "  - $error"
        done
        return 1
    fi

    echo "Report validation passed"
    return 0
}
