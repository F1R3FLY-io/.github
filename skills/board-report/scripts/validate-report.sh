#!/usr/bin/env bash
#
# validate-report.sh - Validate board report format and completeness
#
# Usage:
#   validate-report.sh <report-file>
#
# Checks:
#   - File exists and is readable
#   - YAML frontmatter present with required fields
#   - Required sections exist
#   - Narrative placeholders are balanced
#   - Links are valid markdown format
#

set -euo pipefail

# Colors
if [[ -t 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    RESET='\033[0m'
else
    RED=''
    GREEN=''
    YELLOW=''
    RESET=''
fi

ERRORS=0
WARNINGS=0

usage() {
    echo "Usage: $(basename "$0") <report-file>"
    echo ""
    echo "Validates a board report for completeness and format."
    echo ""
    echo "Example:"
    echo "  $(basename "$0") docs/reports/2026-02-board-report.md"
}

check_pass() {
    echo -e "${GREEN}[PASS]${RESET} $1"
}

check_fail() {
    echo -e "${RED}[FAIL]${RESET} $1"
    ((ERRORS++))
}

check_warn() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
    ((WARNINGS++))
}

validate() {
    local report_file="$1"

    echo "Validating: $report_file"
    echo "---"

    # Check file exists
    if [[ ! -f "$report_file" ]]; then
        check_fail "File not found: $report_file"
        return 1
    fi
    check_pass "File exists"

    if [[ ! -r "$report_file" ]]; then
        check_fail "File not readable"
        return 1
    fi
    check_pass "File readable"

    # Check YAML frontmatter
    if head -1 "$report_file" | grep -q "^---$"; then
        check_pass "YAML frontmatter present"

        if grep -q "^doc_type:" "$report_file"; then
            check_pass "doc_type field present"
        else
            check_warn "Missing doc_type in frontmatter"
        fi

        if grep -q "^period:" "$report_file"; then
            check_pass "period field present"
        else
            check_warn "Missing period in frontmatter"
        fi

        if grep -q "^cadence:" "$report_file"; then
            check_pass "cadence field present"
        else
            check_warn "Missing cadence in frontmatter"
        fi

        if grep -q "^audience:" "$report_file"; then
            check_pass "audience field present"
        else
            check_warn "Missing audience in frontmatter"
        fi
    else
        check_fail "Missing YAML frontmatter (file should start with ---)"
    fi

    # Check required sections
    local required_sections=(
        "Executive Overview"
        "Category Health"
        "Strategic Milestones"
        "Milestone Analysis"
        "Product Delivery"
        "Risk Register"
        "Team & Resources"
        "Decisions Required"
        "Next Period Outlook"
    )

    for section in "${required_sections[@]}"; do
        if grep -q "^## $section" "$report_file"; then
            check_pass "Section present: $section"
        else
            check_fail "Missing section: $section"
        fi
    done

    # Check narrative placeholders
    local start_count end_count
    start_count=$(grep -c "AI_NARRATIVE_START" "$report_file") || start_count="0"
    end_count=$(grep -c "AI_NARRATIVE_END" "$report_file") || end_count="0"

    if [[ "$start_count" -eq "$end_count" ]]; then
        check_pass "Narrative markers balanced ($start_count pairs)"
    else
        check_fail "Mismatched narrative markers (START: $start_count, END: $end_count)"
    fi

    # Check if narratives are filled
    local unfilled
    unfilled=$(grep -cE "_Add.*here_|_Add.*summary_|_Add.*:_|_List.*_|_Add.*notes_" "$report_file") || unfilled="0"

    if [[ "$unfilled" -gt 0 ]]; then
        check_warn "$unfilled unfilled narrative placeholder(s) found"
    else
        check_pass "All narratives appear to be filled"
    fi

    # Check for broken links
    if grep -qE '\[.*\]\(\)' "$report_file"; then
        check_warn "Empty link targets found"
    else
        check_pass "No empty link targets"
    fi

    # Check for error messages in report
    if grep -qi "not found\|error\|inaccessible" "$report_file"; then
        check_warn "Report contains error messages (review for issues)"
    fi

    # Summary
    echo "---"
    echo ""

    if [[ $ERRORS -eq 0 ]] && [[ $WARNINGS -eq 0 ]]; then
        echo -e "${GREEN}Validation passed${RESET}"
        return 0
    elif [[ $ERRORS -eq 0 ]]; then
        echo -e "${YELLOW}Validation passed with $WARNINGS warning(s)${RESET}"
        return 0
    else
        echo -e "${RED}Validation failed: $ERRORS error(s), $WARNINGS warning(s)${RESET}"
        return 1
    fi
}

main() {
    if [[ $# -lt 1 ]]; then
        usage
        exit 1
    fi

    if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
        usage
        exit 0
    fi

    validate "$1"
}

main "$@"
