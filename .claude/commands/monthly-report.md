# Monthly Report Generation

Generate comprehensive status reports for F1R3FLY.io repositories with GitHub activity metrics, progress summaries, and planned work.

## Quick Commands

```bash
# Monthly report for previous month (most common)
./scripts/generate-monthly-report.sh

# Monthly report for specific month
./scripts/generate-monthly-report.sh --month 2025-01

# Daily report for yesterday
./scripts/generate-monthly-report.sh --daily

# Daily report for specific date
./scripts/generate-monthly-report.sh --daily 2025-01-10

# Month-to-date report (1st of current month to today)
./scripts/generate-monthly-report.sh --mtd

# Annual report for previous year
./scripts/generate-monthly-report.sh --annual

# Annual report for specific year
./scripts/generate-monthly-report.sh --annual 2024

# Preview without writing file
./scripts/generate-monthly-report.sh --dry-run
```

## Script Options

```
Period Options (mutually exclusive):
  --month YYYY-MM      Monthly report for specific month (default: previous month)
  --daily [DATE]       Daily report for yesterday or specific YYYY-MM-DD date
  --mtd                Month-to-date report (1st of month to today)
  --annual [YEAR]      Annual report for previous year or specific YYYY

Other Options:
  --output FILE        Custom output path
  --dry-run            Preview without writing
  --category CAT       Only specific category (e.g., "Core Platform")
  --repos REPO,...     Only specific repos (comma-separated)
  --verbose            Detailed progress output
```

## Workflow

### Step 1: Generate Initial Report

Run the script to fetch GitHub data and generate the report:

```bash
./scripts/generate-monthly-report.sh
```

### Step 2: Add Narrative Summaries

Fill in the `<!-- AI_NARRATIVE_START: section_name -->` placeholders with context:

**Executive Summary:**
```markdown
<!-- AI_NARRATIVE_START: executive_summary -->
Key accomplishments this period:
- [Highlight 1]
- [Highlight 2]
<!-- AI_NARRATIVE_END -->
```

### Step 3: Validate and Commit

```bash
./skills/monthly-report/scripts/validate-report.sh docs/reports/YYYY-MM-monthly-report.md
/quick-commit
```

## Prerequisites

```bash
brew install gh && gh auth login
brew install jq
```

## Output Files

| Type | Location |
|------|----------|
| Monthly | `docs/reports/YYYY-MM-monthly-report.md` |
| Daily | `docs/reports/YYYY-MM-DD-daily-report.md` |
| MTD | `docs/reports/YYYY-MM-mtd-report.md` |
| Annual | `docs/reports/YYYY-annual-report.md` |
