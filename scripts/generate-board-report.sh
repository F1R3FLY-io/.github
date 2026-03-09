#!/usr/bin/env bash
#
# generate-board-report.sh - Generate board/stakeholder status reports for F1R3FLY.io
#
# Produces a business-oriented report covering organizational health,
# strategic milestones, product delivery, risks, and resource utilization.
#
# Usage:
#   generate-board-report.sh [OPTIONS]
#
# Cadence Options (mutually exclusive):
#   --monthly              Monthly report (default, previous month)
#   --month YYYY-MM        Monthly report for specific month
#   --biweekly             Bi-weekly report (last 14 days)
#   --biweekly YYYY-MM-DD  Bi-weekly report starting from specific date
#
# Other Options:
#   --output FILE          Output file path (default: auto-generated)
#   --dry-run              Preview without writing file
#   --category CAT         Only process specific category
#   --repos REPO,...       Only process specific repos (comma-separated)
#   --verbose              Show detailed progress
#   --help, -h             Show this help message
#
# Dependencies:
#   - gh CLI (GitHub CLI) - must be authenticated
#   - jq - for JSON processing
#
# Examples:
#   ./generate-board-report.sh                        # Monthly for previous month
#   ./generate-board-report.sh --month 2026-02        # Monthly for Feb 2026
#   ./generate-board-report.sh --biweekly             # Last 14 days
#   ./generate-board-report.sh --biweekly 2026-02-24  # 14 days from date
#   ./generate-board-report.sh --dry-run              # Preview
#

set -euo pipefail

# Script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
LIB_DIR="${SCRIPT_DIR}/lib"

# Source libraries
source "${LIB_DIR}/github-report-integration.sh"
source "${LIB_DIR}/board-report-formatting.sh"

# Configuration
CADENCE="monthly"
REPORT_TYPE="monthly"
TARGET_PERIOD=""
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

usage() {
    cat <<EOF
generate-board-report.sh - Generate F1R3FLY.io board/stakeholder reports

Usage: generate-board-report.sh [OPTIONS]

Cadence Options (mutually exclusive):
  --monthly              Monthly report for previous month (default)
  --month YYYY-MM        Monthly report for specific month
  --biweekly             Bi-weekly report for last 14 days
  --biweekly YYYY-MM-DD  Bi-weekly report starting from specific date

Other Options:
  --output FILE          Output file path (default: auto-generated)
  --dry-run              Preview report without writing to file
  --category CAT         Only process specific category
  --repos REPO,...       Only process specific repos (comma-separated)
  --verbose              Show detailed progress
  --help, -h             Show this help message

Examples:
  $(basename "$0")                         # Monthly for previous month
  $(basename "$0") --month 2026-02         # Monthly for February 2026
  $(basename "$0") --biweekly              # Last 14 days
  $(basename "$0") --biweekly 2026-02-24   # 14 days starting 2026-02-24
  $(basename "$0") --dry-run               # Preview without writing

Output Files:
  Monthly:   docs/reports/YYYY-MM-board-report.md
  Bi-weekly: docs/reports/YYYY-MM-DD-biweekly-board-report.md

Requirements:
  - gh CLI must be installed and authenticated (run: gh auth login)
  - jq must be installed (run: brew install jq)
EOF
}

log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp
    timestamp=$(date '+%H:%M:%S')

    case "$level" in
        INFO)    echo -e "${BLUE}[$timestamp]${RESET} $message" >&2 ;;
        SUCCESS) echo -e "${GREEN}[$timestamp]${RESET} $message" >&2 ;;
        WARN)    echo -e "${YELLOW}[$timestamp]${RESET} $message" >&2 ;;
        ERROR)   echo -e "${RED}[$timestamp]${RESET} $message" >&2 ;;
        DEBUG)   [[ "$VERBOSE" == true ]] && echo -e "[$timestamp] $message" >&2 ;;
    esac
}

parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --monthly)
                CADENCE="monthly"
                REPORT_TYPE="monthly"
                shift
                ;;
            --month)
                CADENCE="monthly"
                REPORT_TYPE="monthly"
                TARGET_PERIOD="$2"
                shift 2
                ;;
            --biweekly)
                CADENCE="biweekly"
                REPORT_TYPE="biweekly"
                if [[ $# -gt 1 ]] && [[ ! "$2" =~ ^-- ]]; then
                    TARGET_PERIOD="$2"
                    shift 2
                else
                    TARGET_PERIOD=""
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

check_dependencies() {
    log INFO "Checking dependencies..."

    if ! command -v jq >/dev/null 2>&1; then
        log ERROR "jq is required but not installed. Install with: brew install jq"
        exit 1
    fi

    if ! command -v gh >/dev/null 2>&1; then
        log ERROR "GitHub CLI (gh) is required but not installed."
        exit 1
    fi

    if ! gh auth status >/dev/null 2>&1; then
        log ERROR "GitHub CLI is not authenticated. Run: gh auth login"
        exit 1
    fi

    log SUCCESS "Dependencies OK (gh CLI authenticated)"
}

#
# Calculate biweekly date range (14 days)
#
get_biweekly_date_range() {
    local start_date="${1:-}"

    if [[ -z "$start_date" ]]; then
        # Default: 14 days ago to today
        if command -v gdate >/dev/null 2>&1; then
            start_date=$(gdate -d "14 days ago" +%Y-%m-%d)
        else
            start_date=$(date -d "14 days ago" +%Y-%m-%d 2>/dev/null || \
                         date -v-14d +%Y-%m-%d)
        fi
    fi

    # End date: start + 13 days
    local end_date
    if command -v gdate >/dev/null 2>&1; then
        end_date=$(gdate -d "${start_date} + 13 days" +%Y-%m-%d)
    else
        end_date=$(date -d "${start_date} + 13 days" +%Y-%m-%d 2>/dev/null || \
                   date -j -v+13d -f "%Y-%m-%d" "$start_date" +%Y-%m-%d)
    fi

    echo "${start_date}:${end_date}"
}

#
# Format biweekly period name
#
get_biweekly_period_name() {
    local start_date="$1"
    local end_date="$2"

    local start_fmt end_fmt
    if command -v gdate >/dev/null 2>&1; then
        start_fmt=$(gdate -d "$start_date" "+%B %d")
        end_fmt=$(gdate -d "$end_date" "+%B %d, %Y")
    else
        start_fmt=$(date -d "$start_date" "+%B %d" 2>/dev/null || \
                    date -jf "%Y-%m-%d" "$start_date" "+%B %d")
        end_fmt=$(date -d "$end_date" "+%B %d, %Y" 2>/dev/null || \
                  date -jf "%Y-%m-%d" "$end_date" "+%B %d, %Y")
    fi

    echo "${start_fmt} - ${end_fmt}"
}

setup_period() {
    case "$REPORT_TYPE" in
        monthly)
            if [[ -z "$TARGET_PERIOD" ]]; then
                TARGET_PERIOD=$(get_previous_month)
            fi
            if ! [[ "$TARGET_PERIOD" =~ ^[0-9]{4}-[0-9]{2}$ ]]; then
                log ERROR "Invalid month format: $TARGET_PERIOD (expected YYYY-MM)"
                exit 1
            fi
            DATE_RANGE=$(get_month_date_range "$TARGET_PERIOD")
            PERIOD_NAME=$(get_period_name "monthly" "$TARGET_PERIOD")
            DEFAULT_OUTPUT="${REPO_ROOT}/docs/reports/${TARGET_PERIOD}-board-report.md"
            ;;
        biweekly)
            if [[ -n "$TARGET_PERIOD" ]] && ! [[ "$TARGET_PERIOD" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
                log ERROR "Invalid date format: $TARGET_PERIOD (expected YYYY-MM-DD)"
                exit 1
            fi
            DATE_RANGE=$(get_biweekly_date_range "$TARGET_PERIOD")
            START_DATE="${DATE_RANGE%:*}"
            END_DATE="${DATE_RANGE#*:}"
            PERIOD_NAME=$(get_biweekly_period_name "$START_DATE" "$END_DATE")
            if [[ -z "$TARGET_PERIOD" ]]; then
                TARGET_PERIOD="$START_DATE"
            fi
            DEFAULT_OUTPUT="${REPO_ROOT}/docs/reports/${TARGET_PERIOD}-biweekly-board-report.md"
            ;;
    esac

    START_DATE="${DATE_RANGE%:*}"
    END_DATE="${DATE_RANGE#*:}"

    if [[ -z "$OUTPUT_FILE" ]]; then
        OUTPUT_FILE="$DEFAULT_OUTPUT"
    fi
}

collect_data() {
    local start_date="$1"
    local end_date="$2"
    local all_data="[]"

    log INFO "Collecting data for period: $start_date to $end_date"

    for category in "${CATEGORY_ORDER[@]}"; do
        if [[ -n "$SPECIFIC_CATEGORY" ]] && [[ "$category" != "$SPECIFIC_CATEGORY" ]]; then
            log DEBUG "Skipping category: $category"
            continue
        fi

        log INFO "Processing category: ${BOLD}$category${RESET}"
        local category_data
        category_data=$(fetch_category_data "$category" "$start_date" "$end_date")
        all_data=$(echo "$all_data" | jq --argjson cat "$category_data" '. + [$cat]')
    done

    echo "$all_data"
}

main() {
    parse_args "$@"

    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
    echo -e "${BOLD}|     F1R3FLY.io Board Report Generator            |${RESET}"
    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
    echo ""

    check_dependencies
    setup_period

    log INFO "Report cadence: ${BOLD}${CADENCE}${RESET}"
    log INFO "Report period: ${BOLD}${PERIOD_NAME}${RESET} ($START_DATE to $END_DATE)"
    log INFO "Output file: $OUTPUT_FILE"

    if [[ "$DRY_RUN" == true ]]; then
        log WARN "DRY RUN mode - no files will be written"
    fi

    local repo_count
    repo_count=$(get_repo_count)
    log INFO "Fetching data from $repo_count repositories..."

    local all_data
    all_data=$(collect_data "$START_DATE" "$END_DATE")

    local data_count
    data_count=$(echo "$all_data" | jq 'length')

    if [[ "$data_count" -eq 0 ]]; then
        log ERROR "No data collected. Check GitHub authentication."
        exit 1
    fi

    log SUCCESS "Data collected for $data_count categories"
    log INFO "Generating board report..."

    local generated_at
    generated_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')

    local report
    report=$(generate_board_report "$all_data" "$PERIOD_NAME" "$TARGET_PERIOD" "$generated_at" "$CADENCE")

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
        mkdir -p "$(dirname "$OUTPUT_FILE")"
        echo "$report" > "$OUTPUT_FILE"
        log SUCCESS "Report written to: $OUTPUT_FILE"
        echo ""
        validate_board_report "$OUTPUT_FILE"
        echo ""
        log INFO "Next steps:"
        echo "  1. Review the generated report"
        echo "  2. Fill in narrative sections (AI_NARRATIVE placeholders)"
        echo "  3. Commit and push when complete"
    fi

    echo ""
    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
    echo -e "${BOLD}|                    Complete                      |${RESET}"
    echo -e "${BOLD}+--------------------------------------------------+${RESET}"
}

main "$@"
