#!/usr/bin/env bash
#
# github-report-integration.sh - GitHub API integration for monthly reports
#
# This library provides:
# 1. Repository data fetching (issues, PRs, commits, milestones)
# 2. Rate limiting and retry logic
# 3. Organization-wide data aggregation
#
# Dependencies:
#   - gh CLI (GitHub CLI) - Required
#   - jq - Required for JSON manipulation
#
# Usage:
#   source /path/to/github-report-integration.sh
#   data=$(fetch_repo_issues "rholang-rs" "2025-01-01" "2025-01-31")
#

# Prevent re-sourcing
if [[ -n "${GITHUB_REPORT_INTEGRATION_LOADED:-}" ]]; then
    return 0
fi
GITHUB_REPORT_INTEGRATION_LOADED=1

# Configuration
GITHUB_ORG="F1R3FLY-io"
RATE_LIMIT_DELAY=0.5
MAX_RETRIES=3
RATE_LIMIT_WAIT=60

# Repository categories (from Organization_of_Repositories.md)
declare -A REPO_CATEGORIES
REPO_CATEGORIES=(
    ["Core Platform"]="f1r3fly"
    ["Language & Compiler"]="rholang-rs rholang-language-server rholang graph-to-rholang-parser rholang-nvim rholang-vscode-client"
    ["Frontend & Applications"]="embers embers-frontend f1r3sky f1r3sky-client f1r3sky-backend-rs f1r3sky-backend-ts lightning-bug"
    ["Developer Tools"]="F1r3bu1ld3r rust-client IaC f1r3drive-extension Sankey_block_explorer"
    ["Research & Language Dev"]="MeTTa bnfc F1R3FLYFS"
    ["Documentation & Governance"]="F1R3FLY-io.github.io .github fflip"
)

# Category order for report
CATEGORY_ORDER=(
    "Core Platform"
    "Language & Compiler"
    "Frontend & Applications"
    "Developer Tools"
    "Research & Language Dev"
    "Documentation & Governance"
)

#
# Check if gh CLI is available and authenticated
#
github_report_check() {
    if ! command -v gh >/dev/null 2>&1; then
        echo '{"available": false, "error": "gh CLI not installed"}'
        return 1
    fi

    if ! gh auth status >/dev/null 2>&1; then
        echo '{"available": false, "error": "gh CLI not authenticated"}'
        return 1
    fi

    echo '{"available": true}'
    return 0
}

#
# Execute API call with rate limiting and retry
#
rate_limited_api() {
    local attempt=1
    local result
    local exit_code

    while [[ $attempt -le $MAX_RETRIES ]]; do
        result=$(gh api "$@" 2>&1)
        exit_code=$?

        if [[ $exit_code -eq 0 ]]; then
            echo "$result"
            sleep "$RATE_LIMIT_DELAY"
            return 0
        fi

        # Check for rate limiting
        if echo "$result" | grep -qi "rate limit"; then
            echo "Rate limited, waiting ${RATE_LIMIT_WAIT}s (attempt $attempt/$MAX_RETRIES)..." >&2
            sleep "$RATE_LIMIT_WAIT"
        elif echo "$result" | grep -qi "not found"; then
            # Repo doesn't exist or no access
            echo '{"error": "not_found"}'
            return 1
        else
            echo "API error (attempt $attempt/$MAX_RETRIES): $result" >&2
            sleep 2
        fi

        ((attempt++))
    done

    echo '{"error": "max_retries_exceeded"}'
    return 1
}

#
# Execute paginated API call with slurp (for use with jq pipe)
# Returns raw JSON array combining all pages
#
paginated_api() {
    local endpoint="$1"
    local attempt=1
    local result
    local exit_code

    while [[ $attempt -le $MAX_RETRIES ]]; do
        # Discard stderr, capture only stdout
        result=$(gh api "$endpoint" --paginate --slurp 2>/dev/null)
        exit_code=$?

        if [[ $exit_code -eq 0 ]] && [[ -n "$result" ]]; then
            echo "$result"
            sleep "$RATE_LIMIT_DELAY"
            return 0
        fi

        # On failure, check exit code for likely causes
        if [[ $exit_code -eq 1 ]]; then
            # Could be rate limit or not found - retry
            sleep 2
        fi

        ((attempt++))
    done

    echo '[]'
    return 0
}

#
# Fetch repository metadata
#
fetch_repo_info() {
    local repo="$1"
    local result

    result=$(rate_limited_api "repos/${GITHUB_ORG}/${repo}" \
        --jq '{
            name: .name,
            description: .description,
            open_issues_count: .open_issues_count,
            stargazers_count: .stargazers_count,
            forks_count: .forks_count,
            pushed_at: .pushed_at,
            archived: .archived,
            language: .language
        }' 2>/dev/null)

    # Return the result, or a fallback if empty
    if [[ -n "$result" ]]; then
        echo "$result"
    else
        echo '{"error": "failed to fetch repo info"}'
    fi
}

#
# Fetch issues for a repository within date range
#
fetch_repo_issues() {
    local repo="$1"
    local start_date="$2"
    local end_date="$3"

    # Get open issues count from repo info
    local open_count
    open_count=$(rate_limited_api "repos/${GITHUB_ORG}/${repo}" --jq '.open_issues_count' 2>/dev/null || echo "0")

    # Get issues closed in the period
    local closed_data
    closed_data=$(paginated_api "repos/${GITHUB_ORG}/${repo}/issues?state=closed&since=${start_date}T00:00:00Z" | \
        jq "flatten | [.[] | select(.closed_at >= \"${start_date}\" and .closed_at <= \"${end_date}T23:59:59Z\" and .pull_request == null)] | {
            count: length,
            issues: [.[:10] | .[] | {number, title, closed_at, labels: [.labels[].name]}]
        }" 2>/dev/null || echo '{"count": 0, "issues": []}')

    # Get issues opened in the period
    local opened_data
    opened_data=$(paginated_api "repos/${GITHUB_ORG}/${repo}/issues?state=all&since=${start_date}T00:00:00Z" | \
        jq "flatten | [.[] | select(.created_at >= \"${start_date}\" and .created_at <= \"${end_date}T23:59:59Z\" and .pull_request == null)] | length" 2>/dev/null || echo "0")

    # Apply defaults for empty values (avoids zsh parameter expansion issues)
    [[ -z "$open_count" ]] && open_count="0"
    [[ -z "$closed_data" ]] && closed_data='{"count":0,"issues":[]}'
    [[ -z "$opened_data" ]] && opened_data="0"

    jq -n \
        --argjson open "$open_count" \
        --argjson closed "$closed_data" \
        --argjson opened "$opened_data" \
        '{
            open_count: $open,
            closed_in_period: $closed.count,
            opened_in_period: $opened,
            recent_closed: $closed.issues
        }'
}

#
# Fetch merged PRs for a repository within date range
#
fetch_repo_prs() {
    local repo="$1"
    local start_date="$2"
    local end_date="$3"

    # Get merged PRs in period
    local merged_data
    merged_data=$(paginated_api "repos/${GITHUB_ORG}/${repo}/pulls?state=closed" | \
        jq "flatten | [.[] | select(.merged_at != null and .merged_at >= \"${start_date}\" and .merged_at <= \"${end_date}T23:59:59Z\")] | {
            count: length,
            prs: [.[:15] | .[] | {
                number,
                title,
                merged_at,
                user: .user.login,
                url: .html_url,
                additions: .additions,
                deletions: .deletions,
                comments: .comments
            }]
        }" 2>/dev/null || echo '{"count": 0, "prs": []}')

    # Get open PRs count
    local open_prs
    open_prs=$(rate_limited_api "repos/${GITHUB_ORG}/${repo}/pulls?state=open" \
        --jq 'length' 2>/dev/null || echo "0")

    # Apply defaults for empty values
    [[ -z "$merged_data" ]] && merged_data='{"count":0,"prs":[]}'
    [[ -z "$open_prs" ]] && open_prs="0"

    jq -n \
        --argjson merged "$merged_data" \
        --argjson open "$open_prs" \
        '{
            merged_count: $merged.count,
            open_count: $open,
            merged_prs: $merged.prs
        }'
}

#
# Fetch commit activity for a repository within date range
#
fetch_repo_commits() {
    local repo="$1"
    local start_date="$2"
    local end_date="$3"

    local commit_data
    commit_data=$(paginated_api "repos/${GITHUB_ORG}/${repo}/commits?since=${start_date}T00:00:00Z&until=${end_date}T23:59:59Z" | \
        jq 'flatten | {
            count: length,
            contributors: ([.[] | .author.login // .commit.author.name] | unique),
            recent: [.[:5] | .[] | {
                sha: .sha[:7],
                message: (.commit.message | split("\n")[0] | if length > 60 then .[:60] + "..." else . end),
                author: (.author.login // .commit.author.name),
                date: .commit.author.date
            }]
        }' 2>/dev/null || echo '{"count": 0, "contributors": [], "recent": []}')

    echo "$commit_data"
}

#
# Fetch milestones for a repository
#
fetch_repo_milestones() {
    local repo="$1"

    rate_limited_api "repos/${GITHUB_ORG}/${repo}/milestones?state=all" \
        --jq '[.[] | {
            title,
            state,
            open_issues,
            closed_issues,
            due_on,
            description: (.description // "" | if length > 100 then .[:100] + "..." else . end),
            progress: (if (.open_issues + .closed_issues) > 0
                then ((.closed_issues / (.open_issues + .closed_issues)) * 100 | floor)
                else 0 end),
            url: .html_url
        }]' 2>/dev/null || echo '[]'
}

#
# Fetch priority/labeled issues for planned work section
#
fetch_priority_issues() {
    local repo="$1"
    local labels="${2:-priority,critical,next,planned}"

    rate_limited_api "repos/${GITHUB_ORG}/${repo}/issues?state=open&labels=${labels}" \
        --jq '[.[:10] | .[] | select(.pull_request == null) | {
            number,
            title,
            labels: [.labels[].name],
            url: .html_url,
            created_at,
            assignee: (.assignee.login // null)
        }]' 2>/dev/null || echo '[]'
}

#
# Fetch PR review comments (for notes on PRs)
#
fetch_pr_comments() {
    local repo="$1"
    local pr_number="$2"

    rate_limited_api "repos/${GITHUB_ORG}/${repo}/pulls/${pr_number}/comments" \
        --jq '[.[] | {
            user: .user.login,
            body: (.body | if length > 200 then .[:200] + "..." else . end),
            created_at
        }]' 2>/dev/null || echo '[]'
}

#
# Fetch all data for a single repository
#
fetch_repo_data() {
    local repo="$1"
    local start_date="$2"
    local end_date="$3"

    local info issues prs commits milestones

    echo "  Fetching data for ${repo}..." >&2

    info=$(fetch_repo_info "$repo")

    # Check if repo exists
    if echo "$info" | jq -e '.error == "not_found"' >/dev/null 2>&1; then
        jq -n --arg repo "$repo" '{
            repo: $repo,
            error: "not_found",
            exists: false
        }'
        return 1
    fi

    issues=$(fetch_repo_issues "$repo" "$start_date" "$end_date")
    prs=$(fetch_repo_prs "$repo" "$start_date" "$end_date")
    commits=$(fetch_repo_commits "$repo" "$start_date" "$end_date")
    milestones=$(fetch_repo_milestones "$repo")

    # Apply defaults for empty values
    [[ -z "$info" ]] && info='{}'
    [[ -z "$issues" ]] && issues='{"open_count":0,"closed_in_period":0,"opened_in_period":0,"recent_closed":[]}'
    [[ -z "$prs" ]] && prs='{"merged_count":0,"open_count":0,"merged_prs":[]}'
    [[ -z "$commits" ]] && commits='{"count":0,"contributors":[],"recent":[]}'
    [[ -z "$milestones" ]] && milestones='[]'

    jq -n \
        --arg repo "$repo" \
        --argjson info "$info" \
        --argjson issues "$issues" \
        --argjson prs "$prs" \
        --argjson commits "$commits" \
        --argjson milestones "$milestones" \
        '{
            repo: $repo,
            exists: true,
            info: $info,
            issues: $issues,
            prs: $prs,
            commits: $commits,
            milestones: $milestones
        }'
}

#
# Fetch data for all repositories in a category
#
fetch_category_data() {
    local category="$1"
    local start_date="$2"
    local end_date="$3"

    local repos="${REPO_CATEGORIES[$category]}"
    local results=()

    echo "Processing category: $category" >&2

    for repo in $repos; do
        local data
        data=$(fetch_repo_data "$repo" "$start_date" "$end_date")
        results+=("$data")
    done

    # Combine into array
    printf '%s\n' "${results[@]}" | jq -s --arg category "$category" '{
        category: $category,
        repos: .
    }'
}

#
# Get list of all repositories
#
get_all_repos() {
    local all_repos=""
    for category in "${CATEGORY_ORDER[@]}"; do
        all_repos="$all_repos ${REPO_CATEGORIES[$category]}"
    done
    echo "$all_repos" | xargs
}

#
# Get repository count
#
get_repo_count() {
    local count=0
    for category in "${CATEGORY_ORDER[@]}"; do
        local repos="${REPO_CATEGORIES[$category]}"
        for repo in $repos; do
            ((count++))
        done
    done
    echo "$count"
}

#
# Calculate date range for a given month
#
get_month_date_range() {
    local year_month="$1"  # Format: YYYY-MM

    local year="${year_month%-*}"
    local month="${year_month#*-}"

    # Start of month
    local start_date="${year}-${month}-01"

    # End of month (last day)
    local end_date
    if command -v gdate >/dev/null 2>&1; then
        # macOS with coreutils
        end_date=$(gdate -d "${year}-${month}-01 +1 month -1 day" +%Y-%m-%d)
    else
        # Linux
        end_date=$(date -d "${year}-${month}-01 +1 month -1 day" +%Y-%m-%d 2>/dev/null || \
                   date -v1d -v+1m -v-1d -j -f "%Y-%m-%d" "${start_date}" +%Y-%m-%d)
    fi

    echo "${start_date}:${end_date}"
}

#
# Get previous month in YYYY-MM format
#
get_previous_month() {
    if command -v gdate >/dev/null 2>&1; then
        gdate -d "last month" +%Y-%m
    else
        date -d "last month" +%Y-%m 2>/dev/null || \
        date -v-1m +%Y-%m
    fi
}

#
# Get current year in YYYY format
#
get_current_year() {
    date +%Y
}

#
# Get previous year in YYYY format
#
get_previous_year() {
    if command -v gdate >/dev/null 2>&1; then
        gdate -d "last year" +%Y
    else
        date -d "last year" +%Y 2>/dev/null || \
        date -v-1y +%Y
    fi
}

#
# Get today's date in YYYY-MM-DD format
#
get_today() {
    date +%Y-%m-%d
}

#
# Get yesterday's date in YYYY-MM-DD format
#
get_yesterday() {
    if command -v gdate >/dev/null 2>&1; then
        gdate -d "yesterday" +%Y-%m-%d
    else
        date -d "yesterday" +%Y-%m-%d 2>/dev/null || \
        date -v-1d +%Y-%m-%d
    fi
}

#
# Calculate date range for daily report (yesterday)
#
get_daily_date_range() {
    local target_date="${1:-$(get_yesterday)}"
    echo "${target_date}:${target_date}"
}

#
# Calculate date range for month-to-date report
#
get_mtd_date_range() {
    local today
    today=$(get_today)
    local year="${today%%-*}"
    local month="${today#*-}"
    month="${month%%-*}"

    local start_date="${year}-${month}-01"
    echo "${start_date}:${today}"
}

#
# Calculate date range for annual report
#
get_annual_date_range() {
    local year="$1"
    echo "${year}-01-01:${year}-12-31"
}

#
# Format month name from YYYY-MM
#
get_month_name() {
    local year_month="$1"
    local year="${year_month%-*}"
    local month="${year_month#*-}"

    local month_names=("" "January" "February" "March" "April" "May" "June"
                       "July" "August" "September" "October" "November" "December")

    # Remove leading zero if present
    month=$((10#$month))

    echo "${month_names[$month]} ${year}"
}

#
# Format period name based on report type
#
get_period_name() {
    local period_type="$1"
    local period_value="$2"

    case "$period_type" in
        daily)
            # Format: January 14, 2025
            if command -v gdate >/dev/null 2>&1; then
                gdate -d "$period_value" "+%B %d, %Y"
            else
                date -d "$period_value" "+%B %d, %Y" 2>/dev/null || \
                date -jf "%Y-%m-%d" "$period_value" "+%B %d, %Y"
            fi
            ;;
        mtd)
            # Format: January 2025 (Month-to-Date)
            local year="${period_value%-*}"
            local month="${period_value#*-}"
            month="${month%%-*}"
            local month_names=("" "January" "February" "March" "April" "May" "June"
                               "July" "August" "September" "October" "November" "December")
            month=$((10#$month))
            echo "${month_names[$month]} ${year} (Month-to-Date)"
            ;;
        annual)
            echo "Year ${period_value}"
            ;;
        monthly)
            get_month_name "$period_value"
            ;;
        *)
            echo "$period_value"
            ;;
    esac
}
