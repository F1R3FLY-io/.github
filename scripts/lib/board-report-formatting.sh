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
        if ! grep -q "^## Risk Register" "$report_file"; then
            errors+=("Missing Risk Register section")
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
