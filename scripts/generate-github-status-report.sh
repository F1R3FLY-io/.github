#!/usr/bin/env bash
#
# generate-github-status-report.sh - Generate status reports for F1R3FLY.io
#
# This script:
# 1. Fetches data from all F1R3FLY repositories via GitHub API (gh CLI)
# 2. Generates a comprehensive markdown report
# 3. Stores report in docs/reports/
#
# Usage:
#   generate-github-status-report.sh [OPTIONS]
#
# Period Options (mutually exclusive):
#   --month YYYY-MM    Monthly report for specific month (default: previous month)
#   --daily [DATE]     Daily report (default: yesterday, or specify YYYY-MM-DD)
#   --mtd              Month-to-date report (1st of current month to today)
#   --annual [YEAR]    Annual report (default: previous year, or specify YYYY)
#
# Other Options:
#   --output FILE      Output file path (default: auto-generated based on period)
#   --dry-run          Preview without writing file
#   --category CAT     Only process specific category
#   --repos REPO,...   Only process specific repos (comma-separated)
#   --verbose          Show detailed progress
#   --help, -h         Show this help message
#
# Dependencies:
#   - gh CLI (GitHub CLI) - must be authenticated via `gh auth login`
#   - jq - for JSON processing
#
# Examples:
#   ./generate-github-status-report.sh                    # Monthly report for previous month
#   ./generate-github-status-report.sh --month 2025-01    # Monthly report for January 2025
#   ./generate-github-status-report.sh --daily            # Daily report for yesterday
#   ./generate-github-status-report.sh --daily 2025-01-10 # Daily report for specific date
#   ./generate-github-status-report.sh --mtd              # Month-to-date report
#   ./generate-github-status-report.sh --annual           # Annual report for previous year
#   ./generate-github-status-report.sh --annual 2024      # Annual report for 2024
#   ./generate-github-status-report.sh --dry-run          # Preview without writing
#

set -euo pipefail

# Script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
LIB_DIR="${SCRIPT_DIR}/lib"

# Source libraries
source "${LIB_DIR}/github-report-integration.sh"
source "${LIB_DIR}/report-formatting.sh"

# Default configuration
REPORT_TYPE="monthly"  # monthly, daily, mtd, annual
TARGET_PERIOD=""       # Depends on type: YYYY-MM, YYYY-MM-DD, or YYYY
OUTPUT_FILE=""
DRY_RUN=false
VERBOSE=false
SPECIFIC_CATEGORY=""
SPECIFIC_REPOS=""

# Colors
if [[ -t 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    BLUE='\033[0;34m'
    BOLD='\033[1m'
    RESET='\033[0m'
else
    RED=''
    GREEN=''
    YELLOW=''
    BLUE=''
    BOLD=''
    RESET=''
fi

#
# Print usage information
#
usage() {
    cat <<EOF
generate-github-status-report.sh - Generate F1R3FLY.io status reports

Usage: generate-github-status-report.sh [OPTIONS]

Period Options (mutually exclusive):
  --month YYYY-MM      Monthly report for specific month (default: previous month)
  --daily [DATE]       Daily report for yesterday or specific YYYY-MM-DD date
  --mtd                Month-to-date report (1st of month to today)
  --annual [YEAR]      Annual report for previous year or specific YYYY

Other Options:
  --output FILE        Output file path (default: auto-generated)
  --dry-run            Preview report without writing to file
  --category CAT       Only process specific category
  --repos REPO,...     Only process specific repos (comma-separated)
  --verbose            Show detailed progress
  --help, -h           Show this help message

Examples:
  $(basename "$0")                         # Monthly report for previous month
  $(basename "$0") --month 2025-01         # Monthly report for January 2025
  $(basename "$0") --daily                 # Daily report for yesterday
  $(basename "$0") --daily 2025-01-10      # Daily report for specific date
  $(basename "$0") --mtd                   # Month-to-date report
  $(basename "$0") --annual                # Annual report for previous year
  $(basename "$0") --annual 2024           # Annual report for 2024
  $(basename "$0") --dry-run               # Preview without writing

Output Files:
  Monthly: docs/reports/YYYY-MM-monthly-report.md
  Daily:   docs/reports/YYYY-MM-DD-daily-report.md
  MTD:     docs/reports/YYYY-MM-mtd-report.md
  Annual:  docs/reports/YYYY-annual-report.md

Post-generation:
  Use the /github-activity-report Claude Code command to add narrative summaries
  to the AI_NARRATIVE placeholder sections.

Requirements:
  - gh CLI must be installed and authenticated (run: gh auth login)
  - jq must be installed (run: brew install jq)
EOF
}

#
# Log message with timestamp
#
log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp
    timestamp=$(date '+%H:%M:%S')

    case "$level" in
        INFO)
            echo -e "${BLUE}[$timestamp]${RESET} $message" >&2
            ;;
        SUCCESS)
            echo -e "${GREEN}[$timestamp]${RESET} $message" >&2
            ;;
        WARN)
            echo -e "${YELLOW}[$timestamp]${RESET} $message" >&2
            ;;
        ERROR)
            echo -e "${RED}[$timestamp]${RESET} $message" >&2
            ;;
        DEBUG)
            if [[ "$VERBOSE" == true ]]; then
                echo -e "[$timestamp] $message" >&2
            fi
            ;;
    esac
}

#
# Parse command line arguments
#
parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --month)
                REPORT_TYPE="monthly"
                TARGET_PERIOD="$2"
                shift 2
                ;;
            --daily)
                REPORT_TYPE="daily"
                # Check if next arg is a date (not another flag)
                if [[ $# -gt 1 ]] && [[ ! "$2" =~ ^-- ]]; then
                    TARGET_PERIOD="$2"
                    shift 2
                else
                    TARGET_PERIOD=""  # Will use yesterday
                    shift
                fi
                ;;
            --mtd)
                REPORT_TYPE="mtd"
                shift
                ;;
            --annual)
                REPORT_TYPE="annual"
                # Check if next arg is a year (not another flag)
                if [[ $# -gt 1 ]] && [[ "$2" =~ ^[0-9]{4}$ ]]; then
                    TARGET_PERIOD="$2"
                    shift 2
                else
                    TARGET_PERIOD=""  # Will use previous year
                    shift
                fi
                ;;
            --output)
                OUTPUT_FILE="$2"
                shift 2
                ;;
            --dry-run)
                DRY_RUN=true
                shift
                ;;
            --category)
                SPECIFIC_CATEGORY="$2"
                shift 2
                ;;
            --repos)
                SPECIFIC_REPOS="$2"
                shift 2
                ;;
            --verbose|-v)
                VERBOSE=true
                shift
                ;;
            --help|-h)
                usage
                exit 0
                ;;
            *)
                log ERROR "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done
}

#
# Check dependencies
#
check_dependencies() {
    log INFO "Checking dependencies..."

    # Check jq
    if ! command -v jq >/dev/null 2>&1; then
        log ERROR "jq is required but not installed. Install with: brew install jq"
        exit 1
    fi

    # Check gh CLI is installed
    if ! command -v gh >/dev/null 2>&1; then
        log ERROR "GitHub CLI (gh) is required but not installed."
        log ERROR "Install with: brew install gh"
        log ERROR "Then authenticate with: gh auth login"
        exit 1
    fi

    # Check gh CLI is authenticated
    if ! gh auth status >/dev/null 2>&1; then
        log ERROR "GitHub CLI is not authenticated."
        log ERROR "Please run: gh auth login"
        exit 1
    fi

    log SUCCESS "Dependencies OK (gh CLI authenticated)"
}

#
# Set up period parameters based on report type
#
setup_period() {
    case "$REPORT_TYPE" in
        monthly)
            if [[ -z "$TARGET_PERIOD" ]]; then
                TARGET_PERIOD=$(get_previous_month)
            fi
            # Validate format
            if ! [[ "$TARGET_PERIOD" =~ ^[0-9]{4}-[0-9]{2}$ ]]; then
                log ERROR "Invalid month format: $TARGET_PERIOD (expected YYYY-MM)"
                exit 1
            fi
            DATE_RANGE=$(get_month_date_range "$TARGET_PERIOD")
            PERIOD_NAME=$(get_period_name "monthly" "$TARGET_PERIOD")
            DEFAULT_OUTPUT="${REPO_ROOT}/docs/reports/${TARGET_PERIOD}-monthly-report.md"
            ;;
        daily)
            if [[ -z "$TARGET_PERIOD" ]]; then
                TARGET_PERIOD=$(get_yesterday)
            fi
            # Validate format
            if ! [[ "$TARGET_PERIOD" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
                log ERROR "Invalid date format: $TARGET_PERIOD (expected YYYY-MM-DD)"
                exit 1
            fi
            DATE_RANGE=$(get_daily_date_range "$TARGET_PERIOD")
            PERIOD_NAME=$(get_period_name "daily" "$TARGET_PERIOD")
            DEFAULT_OUTPUT="${REPO_ROOT}/docs/reports/${TARGET_PERIOD}-daily-report.md"
            ;;
        mtd)
            TARGET_PERIOD=$(date +%Y-%m)
            DATE_RANGE=$(get_mtd_date_range)
            PERIOD_NAME=$(get_period_name "mtd" "$TARGET_PERIOD")
            DEFAULT_OUTPUT="${REPO_ROOT}/docs/reports/${TARGET_PERIOD}-mtd-report.md"
            ;;
        annual)
            if [[ -z "$TARGET_PERIOD" ]]; then
                TARGET_PERIOD=$(get_previous_year)
            fi
            # Validate format
            if ! [[ "$TARGET_PERIOD" =~ ^[0-9]{4}$ ]]; then
                log ERROR "Invalid year format: $TARGET_PERIOD (expected YYYY)"
                exit 1
            fi
            DATE_RANGE=$(get_annual_date_range "$TARGET_PERIOD")
            PERIOD_NAME=$(get_period_name "annual" "$TARGET_PERIOD")
            DEFAULT_OUTPUT="${REPO_ROOT}/docs/reports/${TARGET_PERIOD}-annual-report.md"
            ;;
    esac

    START_DATE="${DATE_RANGE%:*}"
    END_DATE="${DATE_RANGE#*:}"

    if [[ -z "$OUTPUT_FILE" ]]; then
        OUTPUT_FILE="$DEFAULT_OUTPUT"
    fi
}

#
# Collect data from all repositories
#
collect_data() {
    local start_date="$1"
    local end_date="$2"

    local all_data="[]"

    log INFO "Collecting data for period: $start_date to $end_date"

    for category in "${CATEGORY_ORDER[@]}"; do
        # Skip if specific category requested and this isn't it
        if [[ -n "$SPECIFIC_CATEGORY" ]] && [[ "$category" != "$SPECIFIC_CATEGORY" ]]; then
            log DEBUG "Skipping category: $category"
            continue
        fi

        log INFO "Processing category: ${BOLD}$category${RESET}"

        local category_data
        category_data=$(fetch_category_data "$category" "$start_date" "$end_date")

        # Add to all_data array
        all_data=$(echo "$all_data" | jq --argjson cat "$category_data" '. + [$cat]')
    done

    echo "$all_data"
}

#
# Main function
#
main() {
    parse_args "$@"

    local report_title
    case "$REPORT_TYPE" in
        monthly) report_title="Monthly Status Report" ;;
        daily)   report_title="Daily Status Report" ;;
        mtd)     report_title="Month-to-Date Status Report" ;;
        annual)  report_title="Annual Status Report" ;;
    esac

    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
    echo -e "${BOLD}|     F1R3FLY.io ${report_title} Generator${RESET}"
    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
    echo ""

    # Check dependencies
    check_dependencies

    # Set up period parameters
    setup_period

    log INFO "Report type: ${BOLD}${REPORT_TYPE}${RESET}"
    log INFO "Report period: ${BOLD}${PERIOD_NAME}${RESET} ($START_DATE to $END_DATE)"
    log INFO "Output file: $OUTPUT_FILE"

    if [[ "$DRY_RUN" == true ]]; then
        log WARN "DRY RUN mode - no files will be written"
    fi

    # Collect data
    local repo_count
    repo_count=$(get_repo_count)
    log INFO "Fetching data from $repo_count repositories using gh CLI..."

    local all_data
    all_data=$(collect_data "$START_DATE" "$END_DATE")

    # Check if we got data
    local data_count
    data_count=$(echo "$all_data" | jq 'length')

    if [[ "$data_count" -eq 0 ]]; then
        log ERROR "No data collected. Check GitHub authentication and repository access."
        log ERROR "Run 'gh auth status' to verify authentication."
        exit 1
    fi

    log SUCCESS "Data collected for $data_count categories"

    # Generate report
    log INFO "Generating report..."

    local generated_at
    generated_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')

    local report
    report=$(generate_report "$all_data" "$PERIOD_NAME" "$TARGET_PERIOD" "$generated_at" "$REPORT_TYPE")

    # Output or write report
    if [[ "$DRY_RUN" == true ]]; then
        echo ""
        echo -e "${BOLD}=== REPORT PREVIEW ===${RESET}"
        echo ""
        echo "$report" | head -100
        echo ""
        echo -e "${YELLOW}... (truncated, showing first 100 lines)${RESET}"
        echo ""
        log INFO "Dry run complete. Use without --dry-run to write file."
    else
        # Create output directory if needed
        mkdir -p "$(dirname "$OUTPUT_FILE")"

        # Write report
        echo "$report" > "$OUTPUT_FILE"

        log SUCCESS "Report written to: $OUTPUT_FILE"

        # Validate report
        echo ""
        validate_report "$OUTPUT_FILE"

        echo ""
        log INFO "Next steps:"
        echo "  1. Review the generated report"
        echo "  2. Use /github-activity-report to add narrative summaries"
        echo "  3. Commit and push when complete"
    fi

    echo ""
    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
    echo -e "${BOLD}|                    Complete                      |${RESET}"
    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
}

# Run main
main "$@"
