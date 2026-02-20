---
name: generate-github-status
description: Generate and enhance status reports for F1R3FLY.io repositories (replaces /github-activity-report)
license: SSL
allowed-tools:
  - Bash
  - Read
  - Grep
  - AskUserQuestion
---

## Quick Help

If the user passed `?`, `--help`, or `-h` as the argument, display ONLY this synopsis and stop. Do NOT run any scripts or proceed with the command.

```
/generate-github-status [OPTIONS]

Period Options (mutually exclusive):
  --month YYYY-MM      Monthly report for specific month (default: previous month)
  --daily [DATE]       Daily report for yesterday or specific YYYY-MM-DD date
  --mtd                Month-to-date report (1st of month to today)
  --annual [YEAR]      Annual report for previous year or specific YYYY

Other Options:
  --output FILE        Custom output path
  --dry-run            Preview without writing file
  --category CAT       Only process specific category
  --repos REPO,...     Only process specific repos (comma-separated)
  --verbose            Detailed progress output
  --narratives FILE    Skip generation; add narrative summaries to existing report

Output Files:
  Monthly: docs/reports/YYYY-MM-monthly-report.md
  Daily:   docs/reports/YYYY-MM-DD-daily-report.md
  MTD:     docs/reports/YYYY-MM-mtd-report.md
  Annual:  docs/reports/YYYY-annual-report.md

Prerequisites: gh CLI (authenticated), jq
```

---

## Invocation Guard

This skill requires explicit user invocation via `/generate-github-status`. It must not be triggered proactively by the assistant.

**Validation:** This skill should only proceed when `<command-name>generate-github-status</command-name>` is present in the current user message.

---

You are helping the user generate and enhance F1R3FLY.io GitHub status reports.

This command handles two workflows:
1. **Generate** - Fetch GitHub API data and produce a report with metrics
2. **Narratives** - Fill in `AI_NARRATIVE` placeholder sections in an existing report

## Architecture

**This command uses a deterministic bash script for generation:**

```
scripts/generate-github-status-report.sh
```

Located relative to the repository root at `/Users/jeff/src/CurrentProjects/FF/github/`.

**Claude's role**:
- Parse user arguments and map them to script options
- Run the script with appropriate flags
- After generation (or when `--narratives` is used), fill in AI_NARRATIVE placeholders
- Present output and next steps to the user

**Script's role**: Fetch GitHub API data via `gh` CLI, generate markdown reports with metrics

---

## Prerequisites

The script requires:
- `gh` CLI installed and authenticated (`gh auth login`)
- `jq` installed (`brew install jq`)

If either is missing, the script will exit with a clear error message.

---

## Workflow Selection

### If user passes `--narratives FILE`

Skip generation entirely. Go directly to the Narrative Enhancement workflow (Step 4 below) using the specified report file.

### If user passes no arguments

Generate a monthly report for the previous month, then offer to add narratives.

### If user passes other options

Generate the requested report type, then offer to add narratives.

---

## Execution

### Step 1: Parse and Run

Map the user's arguments to script flags and execute:

```bash
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh [user-provided-flags]
```

Use a timeout of 300000 (5 minutes) since the script fetches data from many repositories.

### Step 2: Present Results

After the script completes:

1. Show the script output (report location, validation results)
2. If the report was written (not dry-run), inform the user of the output file path

### Step 3: Offer Narrative Enhancement

After a successful generation (not dry-run), use AskUserQuestion:

```
Question: "Report generated. Would you like to add narrative summaries to the AI_NARRATIVE placeholders?"
Header: "Narratives"
Options:
1. Yes, add narratives - Fill in AI_NARRATIVE sections with contextual summaries
2. No, I'll review first - Skip narratives for now
```

If the user selects "Yes", proceed to Step 4.

### Step 4: Narrative Enhancement

Read the generated report file and locate all `<!-- AI_NARRATIVE_START: section_name -->` ... `<!-- AI_NARRATIVE_END -->` blocks.

For each narrative section:

1. Read the surrounding context (metrics, PR lists, issue data)
2. Write a concise narrative summary (2-4 sentences) based on the actual data
3. Replace the placeholder content between the START and END markers

**Narrative writing guidelines:**
- Be specific - reference actual PR numbers, issue counts, contributor names from the report data
- Focus on impact - what changed and why it matters
- Keep it brief - 2-4 sentences per section
- Use active voice - "Merged 5 PRs" not "5 PRs were merged"
- Highlight community contributions when present

**Good narrative:**
> Major parser refactoring completed with #45, reducing memory usage by 30%.
> Community contributor @newuser submitted first PR improving test coverage.
> Preparing for v1.5.0 release next month.

**Poor narrative:**
> Some changes were made. Things improved. More work planned.

### Step 5: Validate

After adding narratives, run validation:

```bash
/Users/jeff/src/CurrentProjects/FF/github/skills/monthly-report/scripts/validate-report.sh [report-file]
```

### Step 6: Suggest Next Steps

- Use `/quick-commit` to commit the report
- Use `/recursive-push` to push to remote

### Error Handling

- **Authentication failure**: Suggest `gh auth login`
- **Missing jq**: Suggest `brew install jq`
- **No data collected**: Check API access and repository permissions
- **Rate limiting**: Suggest using `--category` or `--repos` to reduce API calls

---

## Usage Examples

### Generate default monthly report

```bash
# Monthly report for previous month (most common)
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh
```

### With specific options

```bash
# Monthly report for specific month
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --month 2025-01

# Daily report for yesterday
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --daily

# Daily report for specific date
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --daily 2025-01-10

# Month-to-date report
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --mtd

# Annual report for previous year
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --annual

# Annual report for specific year
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --annual 2024

# Preview without writing
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --dry-run

# Filter to specific category
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --category "Core Platform"

# Filter to specific repos
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --repos rholang-rs,f1r3fly

# Combine options
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-github-status-report.sh --month 2025-06 --dry-run --verbose
```

---

## Output Files

| Report Type | Output Path |
|-------------|-------------|
| Monthly | `docs/reports/YYYY-MM-monthly-report.md` |
| Daily | `docs/reports/YYYY-MM-DD-daily-report.md` |
| MTD | `docs/reports/YYYY-MM-mtd-report.md` |
| Annual | `docs/reports/YYYY-annual-report.md` |

---

## Interaction Examples

### Full generate + narratives flow

```
User: /generate-github-status
Claude: [runs: scripts/generate-github-status-report.sh]
        [shows output with report location]
        [asks: "Would you like to add narrative summaries?"]
User: Yes
Claude: [reads report, fills AI_NARRATIVE sections]
        [runs validation]
        [suggests: /quick-commit to commit]
```

### Narratives only on existing report

```
User: /generate-github-status --narratives docs/reports/2025-06-monthly-report.md
Claude: [reads report file]
        [fills AI_NARRATIVE sections with contextual summaries]
        [runs validation]
```

### Quick help

```
User: /generate-github-status ?
Claude: [displays synopsis from Quick Help section and stops]
```

---

## Files Reference

| File | Purpose |
|------|---------|
| `scripts/generate-github-status-report.sh` | Main generation script |
| `scripts/lib/github-report-integration.sh` | GitHub API functions |
| `scripts/lib/report-formatting.sh` | Markdown generation |
| `docs/templates/monthly-report.md.template` | Template reference |
| `docs/reports/YYYY-MM-monthly-report.md` | Generated reports |
| `skills/monthly-report/scripts/validate-report.sh` | Validation utility |

---

## Related Commands

- `/quick-commit` - Commit the completed report
- `/recursive-push` - Push to remote
