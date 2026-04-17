#!/usr/bin/env bash
#
# community-report-formatting.sh - Formatting utilities for community/developer reports
#
# Produces a developer-community-oriented report with:
# - Product updates and releases
# - Technical highlights and notable changes
# - Repository activity spotlights
# - Merged PRs of interest
# - Contributor recognition and spotlights
# - Good first issues and contribution opportunities
# - Upcoming features and roadmap preview
#
# Usage:
#   source /path/to/community-report-formatting.sh
#   markdown=$(generate_community_report "$all_data" "$period_name" "$period" "$generated_at" "$cadence")
#

# Prevent re-sourcing
if [[ -n "${COMMUNITY_REPORT_FORMATTING_LOADED:-}" ]]; then
    return 0
fi
COMMUNITY_REPORT_FORMATTING_LOADED=1

#
# Format notable PRs across all repos, one table per repo with cycle time,
# LOC delta, and comment/review counts.
#
format_community_notable_prs() {
    local all_data="$1"

    local prs
    prs=$(echo "$all_data" | jq '[
        .[].repos[] |
        .repo as $repo |
        (.prs.merged_prs // [])[] |
        {repo: $repo, number, title, user, created_at, merged_at, url,
         additions: (.additions // 0),
         deletions: (.deletions // 0),
         comments: (.comments // 0),
         review_comments: (.review_comments // 0),
         reviews_count: (.reviews_count // 0)}
    ] | sort_by(.merged_at) | reverse')

    local pr_count
    pr_count=$(echo "$prs" | jq 'length')

    if [[ "$pr_count" -eq 0 ]]; then
        echo "_No PRs merged this period_"
        return
    fi

    # One table per repo, rows ordered newest-merged first.
    # Title pipes are escaped so they don't break the markdown table.
    echo "$prs" | jq -r '
        def cycle(c; m):
          if c == null or m == null then "—"
          else
            (((m | fromdateiso8601) - (c | fromdateiso8601)) / 3600) as $h |
            if $h >= 24 then (((($h / 24) * 10) | floor) / 10 | tostring) + "d"
            elif $h >= 1 then ($h | floor | tostring) + "h"
            else (($h * 60) | floor | tostring) + "m"
            end
          end;
        def trunc(s; n):
          if (s | length) > n then (s[0:n-1] + "…") else s end;

        group_by(.repo)[] |
        "**\(.[0].repo)**",
        "",
        "| # | Title | Author | Cycle | LOC | Comments | Review Comments | Reviews |",
        "|---|-------|--------|-------|-----|----------|-----------------|---------|",
        (.[] |
          (.title | gsub("\\|"; "\\|")) as $t |
          "| [#\(.number)](\(.url)) | \(trunc($t; 60)) | @\(.user) | \(cycle(.created_at; .merged_at)) | +\(.additions) / -\(.deletions) | \(.comments) | \(.review_comments) | \(.reviews_count) |"
        ),
        ""
    '
}

#
# Format activity overview table
#
format_community_activity_overview() {
    local all_data="$1"

    local total_commits total_prs total_closed active_repos total_repos

    total_commits=$(echo "$all_data" | jq '[.[].repos[].commits.count // 0] | add')
    total_prs=$(echo "$all_data" | jq '[.[].repos[].prs.merged_count // 0] | add')
    total_closed=$(echo "$all_data" | jq '[.[].repos[].issues.closed_in_period // 0] | add')
    active_repos=$(echo "$all_data" | jq '[.[].repos[] | select((.commits.count // 0) > 0 or (.prs.merged_count // 0) > 0)] | length')
    total_repos=$(echo "$all_data" | jq '[.[].repos[]] | length')

    cat <<EOF
| Metric | Value |
|--------|-------|
| Active Repositories | ${active_repos} / ${total_repos} |
| Total Commits | ${total_commits} |
| PRs Merged | ${total_prs} |
| Issues Closed | ${total_closed} |
EOF
}

#
# Format active repository spotlights (detailed for repos with significant activity)
#
format_community_repo_spotlights() {
    local all_data="$1"

    # Repos with significant activity (>= 3 commits or >= 1 merged PR)
    echo "$all_data" | jq -r '
        [.[].repos[] |
        select((.commits.count // 0) >= 3 or (.prs.merged_count // 0) >= 1)] |
        sort_by(-.commits.count) |
        .[] |
        "### \(.repo)\n\n\(.info.description // "No description")\n\n| Metric | Value |\n|--------|-------|\n| Commits | \(.commits.count // 0) |\n| PRs Merged | \(.prs.merged_count // 0) |\n| Issues Closed | \(.issues.closed_in_period // 0) |\n| Open Issues | \(.issues.open_count // 0) |\n"
    '
}

#
# Format contributor leaderboard
#
format_community_contributors() {
    local all_data="$1"

    local contributors
    contributors=$(echo "$all_data" | jq -r '
        [.[].repos[].commits.contributors // []] | flatten | group_by(.) |
        map({name: .[0], commits: length}) |
        sort_by(-.commits)
    ')

    local count
    count=$(echo "$contributors" | jq 'length')

    if [[ "$count" -eq 0 ]]; then
        echo "_No contributor data available_"
        return
    fi

    echo "| Contributor | Commits | Repos Active In |"
    echo "|-------------|---------|-----------------|"

    # Get repos per contributor
    local contributor_repos
    contributor_repos=$(echo "$all_data" | jq '
        [.[].repos[] |
        .repo as $repo |
        (.commits.contributors // [])[] |
        {contributor: ., repo: $repo}] |
        group_by(.contributor) |
        map({
            name: .[0].contributor,
            repos: ([.[].repo] | unique | length)
        }) |
        INDEX(.name)
    ')

    echo "$contributors" | jq -r --argjson repos "$contributor_repos" '
        .[:15][] |
        .name as $name |
        "| @\(.name) | \(.commits) | \($repos[$name].repos // 1) |"
    '
}

#
# Format new contributors (contributors with low commit counts, likely new)
#
format_community_new_contributors() {
    local all_data="$1"

    local contributors
    contributors=$(echo "$all_data" | jq -r '
        [.[].repos[].commits.contributors // []] | flatten | group_by(.) |
        map({name: .[0], commits: length}) |
        [.[] | select(.commits <= 2)]
    ')

    local count
    count=$(echo "$contributors" | jq 'length')

    if [[ "$count" -eq 0 ]]; then
        echo "_No new contributors this period_"
        return
    fi

    echo "$contributors" | jq -r '.[] | "- @\(.name) (\(.commits) commit\(if .commits > 1 then "s" else "" end))"'
}

#
# Format open issues suitable for community contribution
#
format_community_open_issues() {
    local all_data="$1"

    # Show repos with manageable open issue counts
    local repos_with_issues
    repos_with_issues=$(echo "$all_data" | jq '[
        .[].repos[] |
        select((.issues.open_count // 0) > 0) |
        {repo, open_count: .issues.open_count}
    ] | sort_by(-.open_count)')

    if [[ "$repos_with_issues" == "[]" ]] || [[ -z "$repos_with_issues" ]]; then
        echo "_No open issues found_"
        return
    fi

    echo "| Repository | Open Issues | Link |"
    echo "|------------|-------------|------|"
    echo "$repos_with_issues" | jq -r '.[] |
        "| \(.repo) | \(.open_count) | [Browse issues](https://github.com/F1R3FLY-io/\(.repo)/issues) |"
    '
}

#
# Format upcoming milestones for community visibility.
#
# Includes a Target Release column derived from the milestone title
# (SemVer prefix per roadmap-release-normalization-standard Section 1.1:
# milestones are titled "vX.Y.Z — <theme>"). When the SemVer prefix is
# absent, the column shows "—".
#
format_community_upcoming() {
    local all_data="$1"

    local milestones
    milestones=$(echo "$all_data" | jq '[
        .[].repos[] |
        .repo as $repo |
        (.milestones // [])[] |
        select(.state == "open") |
        {repo: $repo, title, due_on, progress, open_issues, closed_issues}
    ] | sort_by(.due_on) | .[:10]')

    if [[ "$milestones" == "[]" ]] || [[ -z "$milestones" ]]; then
        echo "_No upcoming milestones_"
        return
    fi

    echo "| Project | Milestone | Target Release | Progress | Due |"
    echo "|---------|-----------|----------------|----------|-----|"
    echo "$milestones" | jq -r '.[] |
        ((.title | capture("^(?<ver>v[0-9]+\\.[0-9]+\\.[0-9]+(-[0-9A-Za-z.-]+)?)")) // null) as $m |
        (if $m then $m.ver else "—" end) as $release |
        "| \(.repo) | \(.title) | \($release) | \(.progress)% (\(.closed_issues)/\(.open_issues + .closed_issues)) | \(.due_on // "TBD") |"
    '
}

#
# Format Recent Releases for community transparency.
#
# Lists published (non-draft) releases within the reporting period.
# Thresholds and tag validation per roadmap-release-normalization-standard
# Section 2.
#
format_community_recent_releases() {
    local all_data="$1"
    local start_date="$2"
    local end_date="$3"

    local releases
    releases=$(echo "$all_data" | jq \
        --arg start "${start_date}T00:00:00Z" \
        --arg end "${end_date}T23:59:59Z" '[
        .[].repos[] |
        .repo as $repo |
        (.releases.recent // [])[] |
        select(.draft == false and .published_at != null
               and .published_at >= $start and .published_at <= $end) |
        {repo: $repo, tag: .tag_name, name, published_at, prerelease, semver_ok, url, body_empty}
    ] | sort_by(.published_at) | reverse')

    local release_count
    release_count=$(echo "$releases" | jq 'length')

    if [[ "$release_count" -eq 0 ]]; then
        echo "_No releases published this period._"
        return
    fi

    echo "| Project | Version | Published | Notes |"
    echo "|---------|---------|-----------|-------|"
    echo "$releases" | jq -r '.[] |
        (if .prerelease then " (pre-release)" else "" end) as $pre |
        (if .body_empty then "[tag](\(.url))" else "[notes](\(.url))" end) as $link |
        "| \(.repo) | \(.tag)\($pre) | \(.published_at[:10]) | \($link) |"
    '
}

#
# Generate complete community report
#
generate_community_report() {
    local all_data="$1"
    local period_name="$2"
    local period="$3"
    local generated_at="$4"
    local cadence="${5:-monthly}"
    local start_date="${6:-}"
    local end_date="${7:-}"

    local doc_type="${cadence}-community-report"

    cat <<EOF
---
doc_type: ${doc_type}
period: ${period}
cadence: ${cadence}
generated_at: ${generated_at}
generated_by: generate-community-report.sh
audience: community
---

# F1R3FLY.io Community & Developer Update

**Period:** ${period_name}
**Cadence:** $(echo "${cadence}" | sed 's/biweekly/Bi-weekly/' | sed 's/monthly/Monthly/')
**Generated:** ${generated_at}

---

## What's New

### Activity at a Glance

$(format_community_activity_overview "$all_data")

### Product Updates

<!-- AI_NARRATIVE_START: product_updates -->
_Add product updates: new features shipped, improvements, and user-facing changes._
<!-- AI_NARRATIVE_END -->

---

## Technical Highlights

<!-- AI_NARRATIVE_START: technical_highlights -->
_Add technical highlights: notable architecture changes, performance improvements, tooling updates, and interesting technical decisions._
<!-- AI_NARRATIVE_END -->

---

## Repository Spotlights

$(format_community_repo_spotlights "$all_data")

---

## Merged PRs

$(format_community_notable_prs "$all_data")

---

## Contributor Recognition

### Top Contributors

$(format_community_contributors "$all_data")

### New Contributors

$(format_community_new_contributors "$all_data")

### Contributor Spotlight

<!-- AI_NARRATIVE_START: contributor_spotlight -->
_Add contributor spotlight: recognize outstanding contributions, first-time contributors, and community members._
<!-- AI_NARRATIVE_END -->

---

## Get Involved

### Open Issues

$(format_community_open_issues "$all_data")

### How to Contribute

<!-- AI_NARRATIVE_START: how_to_contribute -->
_Add guidance on how to contribute: good first issues, areas seeking help, mentorship opportunities._
<!-- AI_NARRATIVE_END -->

---

## Coming Soon

### Upcoming Milestones

$(format_community_upcoming "$all_data")

### Recent Releases

$(format_community_recent_releases "$all_data" "$start_date" "$end_date")

### Roadmap Preview

<!-- AI_NARRATIVE_START: roadmap_preview -->
_Add preview of upcoming features, planned releases, and areas of active development._
<!-- AI_NARRATIVE_END -->

---

## Community

<!-- AI_NARRATIVE_START: community_notes -->
_Add community notes: events, discussions, calls, resources, and links._
<!-- AI_NARRATIVE_END -->

---

_Report generated by F1R3FLY.io Community Report System_
EOF
}

#
# Validate community report
#
validate_community_report() {
    local report_file="$1"
    local errors=()

    if [[ ! -f "$report_file" ]]; then
        errors+=("Report file not found: $report_file")
    else
        if ! grep -q "^## What's New" "$report_file"; then
            errors+=("Missing What's New section")
        fi
        if ! grep -q "^## Contributor Recognition" "$report_file"; then
            errors+=("Missing Contributor Recognition section")
        fi
        if ! grep -q "^## Get Involved" "$report_file"; then
            errors+=("Missing Get Involved section")
        fi
        if ! head -1 "$report_file" | grep -q "^---$"; then
            errors+=("Missing YAML frontmatter")
        fi

        local start_count end_count
        start_count=$(grep -c "AI_NARRATIVE_START" "$report_file" || echo "0")
        end_count=$(grep -c "AI_NARRATIVE_END" "$report_file" || echo "0")
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
