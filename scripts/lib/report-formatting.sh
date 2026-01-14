#!/usr/bin/env bash
#
# report-formatting.sh - Markdown formatting utilities for monthly reports
#
# This library provides:
# 1. Markdown generation helpers
# 2. Template rendering
# 3. Data formatting functions
#
# Usage:
#   source /path/to/report-formatting.sh
#   markdown=$(format_repo_section "$repo_data")
#

# Prevent re-sourcing
if [[ -n "${REPORT_FORMATTING_LOADED:-}" ]]; then
    return 0
fi
REPORT_FORMATTING_LOADED=1

#
# Format a metrics table for a repository
#
format_metrics_table() {
    local commits="$1"
    local merged_prs="$2"
    local closed_issues="$3"
    local open_issues="$4"

    cat <<EOF
| Metric | Value |
|--------|-------|
| Commits | ${commits} |
| Merged PRs | ${merged_prs} |
| Closed Issues | ${closed_issues} |
| Open Issues | ${open_issues} |
EOF
}

#
# Format a list of merged PRs
#
format_pr_list() {
    local prs_json="$1"
    local repo="$2"

    if [[ -z "$prs_json" ]] || [[ "$prs_json" == "[]" ]] || [[ "$prs_json" == "null" ]]; then
        echo "_No PRs merged this period_"
        return
    fi

    echo "$prs_json" | jq -r --arg repo "$repo" '
        if length == 0 then
            "_No PRs merged this period_"
        else
            .[] | "- [#\(.number)](\(.url)) - \(.title) (@\(.user), \(.merged_at | split("T")[0]))"
        end
    '
}

#
# Format a single repository section
#
format_repo_section() {
    local repo_data="$1"

    local repo_name
    repo_name=$(echo "$repo_data" | jq -r '.repo')

    local exists
    exists=$(echo "$repo_data" | jq -r '.exists')

    if [[ "$exists" != "true" ]]; then
        cat <<EOF

### ${repo_name}

_Repository not found or inaccessible_

EOF
        return
    fi

    local commits merged_prs closed_issues open_issues
    commits=$(echo "$repo_data" | jq -r '.commits.count // 0')
    merged_prs=$(echo "$repo_data" | jq -r '.prs.merged_count // 0')
    closed_issues=$(echo "$repo_data" | jq -r '.issues.closed_in_period // 0')
    open_issues=$(echo "$repo_data" | jq -r '.issues.open_count // 0')

    local description
    description=$(echo "$repo_data" | jq -r '.info.description // "No description"')

    local prs_json
    prs_json=$(echo "$repo_data" | jq '.prs.merged_prs // []')

    local pr_list
    pr_list=$(format_pr_list "$prs_json" "$repo_name")

    local activity_note=""
    if [[ "$commits" == "0" ]] && [[ "$merged_prs" == "0" ]] && [[ "$closed_issues" == "0" ]]; then
        activity_note="_No activity this period_"
    fi

    cat <<EOF

### ${repo_name}

${description}

$(format_metrics_table "$commits" "$merged_prs" "$closed_issues" "$open_issues")

**Merged PRs:**
${pr_list}
${activity_note}

**Notes:**
<!-- AI_NARRATIVE_START: ${repo_name} -->
_Add narrative summary here_
<!-- AI_NARRATIVE_END -->

EOF
}

#
# Format a category section with all its repos
#
format_category_section() {
    local category_data="$1"

    local category
    category=$(echo "$category_data" | jq -r '.category')

    # Calculate category totals
    local total_commits total_prs total_closed_issues
    total_commits=$(echo "$category_data" | jq '[.repos[].commits.count // 0] | add')
    total_prs=$(echo "$category_data" | jq '[.repos[].prs.merged_count // 0] | add')
    total_closed_issues=$(echo "$category_data" | jq '[.repos[].issues.closed_in_period // 0] | add')

    cat <<EOF

---

## ${category}

**Category Totals:** ${total_commits} commits, ${total_prs} merged PRs, ${total_closed_issues} issues closed

EOF

    # Format each repo in the category
    local repos_count
    repos_count=$(echo "$category_data" | jq '.repos | length')

    for ((i=0; i<repos_count; i++)); do
        local repo_data
        repo_data=$(echo "$category_data" | jq ".repos[$i]")
        format_repo_section "$repo_data"
    done
}

#
# Format executive summary metrics table
#
format_executive_summary() {
    local all_data="$1"
    local prev_data="${2:-}"

    # Calculate totals
    local total_commits total_prs total_closed total_open active_repos total_repos

    total_commits=$(echo "$all_data" | jq '[.[].repos[].commits.count // 0] | add')
    total_prs=$(echo "$all_data" | jq '[.[].repos[].prs.merged_count // 0] | add')
    total_closed=$(echo "$all_data" | jq '[.[].repos[].issues.closed_in_period // 0] | add')
    total_open=$(echo "$all_data" | jq '[.[].repos[].issues.open_count // 0] | add')

    # Count active repos (those with any activity)
    active_repos=$(echo "$all_data" | jq '[.[].repos[] | select((.commits.count // 0) > 0 or (.prs.merged_count // 0) > 0)] | length')
    total_repos=$(echo "$all_data" | jq '[.[].repos[]] | length')

    # Previous month comparisons (if available)
    local prev_commits prev_prs prev_closed commits_change prs_change closed_change
    if [[ -n "$prev_data" ]] && [[ "$prev_data" != "null" ]]; then
        prev_commits=$(echo "$prev_data" | jq '[.[].repos[].commits.count // 0] | add // 0')
        prev_prs=$(echo "$prev_data" | jq '[.[].repos[].prs.merged_count // 0] | add // 0')
        prev_closed=$(echo "$prev_data" | jq '[.[].repos[].issues.closed_in_period // 0] | add // 0')

        commits_change=$(format_change "$total_commits" "$prev_commits")
        prs_change=$(format_change "$total_prs" "$prev_prs")
        closed_change=$(format_change "$total_closed" "$prev_closed")
    else
        prev_commits="-"
        prev_prs="-"
        prev_closed="-"
        commits_change="-"
        prs_change="-"
        closed_change="-"
    fi

    cat <<EOF
### Key Metrics

| Metric | This Month | Previous Month | Change |
|--------|------------|----------------|--------|
| Total Commits | ${total_commits} | ${prev_commits} | ${commits_change} |
| Merged PRs | ${total_prs} | ${prev_prs} | ${prs_change} |
| Closed Issues | ${total_closed} | ${prev_closed} | ${closed_change} |
| Open Issues | ${total_open} | - | - |
| Active Repos | ${active_repos}/${total_repos} | - | - |

EOF
}

#
# Format change indicator
#
format_change() {
    local current="$1"
    local previous="$2"

    if [[ "$previous" == "-" ]] || [[ -z "$previous" ]] || [[ "$previous" == "0" ]]; then
        echo "-"
        return
    fi

    local diff=$((current - previous))
    if [[ $diff -gt 0 ]]; then
        echo "+${diff}"
    elif [[ $diff -lt 0 ]]; then
        echo "${diff}"
    else
        echo "0"
    fi
}

#
# Format milestones section
#
format_milestones_section() {
    local all_data="$1"

    # Extract all milestones with open state
    local milestones
    milestones=$(echo "$all_data" | jq '[
        .[].repos[] |
        .repo as $repo |
        .milestones[] |
        select(.state == "open") |
        {repo: $repo, title, due_on, progress, open_issues, closed_issues, url}
    ] | sort_by(.due_on) | .[:10]')

    if [[ "$milestones" == "[]" ]] || [[ -z "$milestones" ]]; then
        echo "_No open milestones found_"
        return
    fi

    echo "$milestones" | jq -r '.[] |
        "#### \(.title) (\(.repo))\n- **Due:** \(.due_on // "No due date")\n- **Progress:** \(.progress)% (\(.closed_issues)/\(.open_issues + .closed_issues) issues)\n- [View milestone](\(.url))\n"
    '
}

#
# Format priority issues section
#
format_priority_issues() {
    local all_data="$1"

    # This would need priority issues to be fetched separately
    # For now, just output placeholder
    cat <<EOF
<!-- Priority issues will be populated from labeled issues -->
_Priority issues are identified by labels: priority, critical, next, planned_

EOF
}

#
# Format contributors section
#
format_contributors_section() {
    local all_data="$1"

    # Aggregate contributors across all repos
    local contributors
    contributors=$(echo "$all_data" | jq -r '
        [.[].repos[].commits.contributors // []] | flatten | group_by(.) |
        map({name: .[0], commits: length}) |
        sort_by(-.commits) |
        .[:15]
    ')

    if [[ "$contributors" == "[]" ]] || [[ -z "$contributors" ]]; then
        echo "_No contributor data available_"
        return
    fi

    echo "| Contributor | Commits |"
    echo "|-------------|---------|"
    echo "$contributors" | jq -r '.[] | "| \(.name) | \(.commits) |"'
}

#
# Generate complete report from data
#
generate_report() {
    local all_data="$1"
    local month_name="$2"
    local year_month="$3"
    local generated_at="$4"
    local prev_data="${5:-}"

    cat <<EOF
---
doc_type: monthly-report
period: ${year_month}
generated_at: ${generated_at}
generated_by: generate-monthly-report.sh
---

# F1R3FLY.io Monthly Status Report

**Period:** ${month_name}
**Generated:** ${generated_at}

---

## Executive Summary

$(format_executive_summary "$all_data" "$prev_data")

### Highlights

<!-- AI_NARRATIVE_START: executive_summary -->
_Add executive summary highlights here. Key accomplishments, notable changes, and important updates._
<!-- AI_NARRATIVE_END -->

EOF

    # Generate category sections
    local categories_count
    categories_count=$(echo "$all_data" | jq 'length')

    for ((i=0; i<categories_count; i++)); do
        local category_data
        category_data=$(echo "$all_data" | jq ".[$i]")
        format_category_section "$category_data"
    done

    cat <<EOF

---

## Planned Work for Next Month

### Open Milestones

$(format_milestones_section "$all_data")

### Priority Issues

$(format_priority_issues "$all_data")

### Focus Areas

<!-- AI_NARRATIVE_START: planned_work -->
_Add summary of planned work for next month_
<!-- AI_NARRATIVE_END -->

---

## Contributors This Month

$(format_contributors_section "$all_data")

### Community Notes

<!-- AI_NARRATIVE_START: community -->
_Add community highlights and acknowledgments_
<!-- AI_NARRATIVE_END -->

---

## Appendix: Raw Data

<details>
<summary>Click to expand raw metrics JSON</summary>

\`\`\`json
$(echo "$all_data" | jq '.')
\`\`\`

</details>

---

_Report generated by F1R3FLY.io Monthly Status Report System_
EOF
}

#
# Validate report has all required sections
#
validate_report() {
    local report_file="$1"

    local errors=()

    # Check file exists
    if [[ ! -f "$report_file" ]]; then
        errors+=("Report file not found: $report_file")
    else
        # Check for required sections
        if ! grep -q "^## Executive Summary" "$report_file"; then
            errors+=("Missing Executive Summary section")
        fi

        if ! grep -q "^## Planned Work" "$report_file"; then
            errors+=("Missing Planned Work section")
        fi

        # Check for unfilled narrative placeholders
        local unfilled
        unfilled=$(grep -c "AI_NARRATIVE_START" "$report_file" || echo "0")
        local filled
        filled=$(grep -c "AI_NARRATIVE_END" "$report_file" || echo "0")

        if [[ "$unfilled" != "$filled" ]]; then
            errors+=("Mismatched narrative markers")
        fi

        # Check YAML frontmatter
        if ! head -1 "$report_file" | grep -q "^---$"; then
            errors+=("Missing YAML frontmatter")
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
