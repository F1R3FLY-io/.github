---
name: generate-github-status
description: Generate and enhance status reports for F1R3FLY.io repositories. Use when user asks to "generate monthly report", "create status report", "GitHub activity summary", or "add narratives to report".
version: 2.0.0
---

# Monthly Report Generation Skill

Generate comprehensive monthly status reports for all F1R3FLY.io organization repositories, including GitHub metrics, progress summaries, and planned work.

## When to Use This Skill

Activate when the user:
- Requests a monthly status report
- Wants to summarize GitHub activity across F1R3FLY repos
- Needs to add narrative context to an existing report
- Asks to review or refine a generated report

## Quick Start

### Generate a New Report

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

# Preview without writing
./scripts/generate-monthly-report.sh --dry-run
```

### Add Narratives

After generating, open the report and fill in the `<!-- AI_NARRATIVE_START -->` sections with meaningful summaries.

## Complete Workflow

### Step 1: Generate Initial Report

Run the generation script:

```bash
cd /Users/jeff/src/CurrentProjects/FF/github
./scripts/generate-monthly-report.sh
```

The script will:
1. Authenticate with GitHub via `gh` CLI
2. Fetch data from all 22+ F1R3FLY repositories
3. Generate report at `docs/reports/YYYY-MM-monthly-report.md`
4. Show validation results

**Expected output:**
```
+--------------------------------------------------+
|     F1R3FLY.io Monthly Status Report Generator   |
+--------------------------------------------------+

[HH:MM:SS] Checking dependencies...
[HH:MM:SS] Dependencies OK (gh CLI authenticated)
[HH:MM:SS] Report period: December 2024 (2024-12-01 to 2024-12-31)
[HH:MM:SS] Fetching data from 22 repositories...
[HH:MM:SS] Processing category: Core Platform
  Fetching data for f1r3fly...
[HH:MM:SS] Processing category: Language & Compiler
  Fetching data for rholang-rs...
  ...
[HH:MM:SS] Report written to: docs/reports/2024-12-monthly-report.md
Report validation passed
```

### Step 2: Review Generated Report

Open and review `docs/reports/YYYY-MM-monthly-report.md`:

1. **Verify metrics** - Check commit counts, PR counts, issue counts
2. **Check for errors** - Look for repos marked "not found" or "no data"
3. **Identify highlights** - Note significant changes for narratives

### Step 3: Add Narrative Summaries

For each `<!-- AI_NARRATIVE_START: section_name -->` marker, write a concise summary.

**Executive Summary example:**
```markdown
<!-- AI_NARRATIVE_START: executive_summary -->
This month saw significant progress across the F1R3FLY ecosystem:

- **Rholang Compiler**: 15 PRs merged improving parser performance and error messages
- **f1r3node Core**: Addressed 8 critical issues, preparing for v2.0 milestone
- **Frontend**: embers-frontend gained 3 new contributors with UI improvements
- **Community**: Welcomed 2 new contributors from the open source community
<!-- AI_NARRATIVE_END -->
```

**Repository narrative example:**
```markdown
<!-- AI_NARRATIVE_START: rholang-rs -->
Major refactoring of the AST module completed, reducing memory usage by 30%.
The new pattern matching implementation enables more expressive smart contracts.
Three community PRs improved documentation and test coverage.
<!-- AI_NARRATIVE_END -->
```

**Planned work example:**
```markdown
<!-- AI_NARRATIVE_START: planned_work -->
Focus areas for next month:
- Complete f1r3node v2.0 milestone (currently at 75%)
- Release rholang-language-server 1.5.0 with improved diagnostics
- Begin integration testing for f1r3sky social features
- Community documentation sprint for developer onboarding
<!-- AI_NARRATIVE_END -->
```

### Step 4: Validate and Finalize

Run validation:

```bash
./skills/monthly-report/scripts/validate-report.sh docs/reports/YYYY-MM-monthly-report.md
```

Checks performed:
- All narrative placeholders filled
- YAML frontmatter present
- Required sections exist
- Links are valid markdown format

### Step 5: Commit Report

```bash
# Use quick-commit skill
/quick-commit
```

Or manually:
```bash
git add docs/reports/YYYY-MM-monthly-report.md
git commit -m "docs: add YYYY-MM monthly status report"
```

## Script Options

```
./scripts/generate-monthly-report.sh [OPTIONS]

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
  --help               Show help

Output Files:
  Monthly: docs/reports/YYYY-MM-monthly-report.md
  Daily:   docs/reports/YYYY-MM-DD-daily-report.md
  MTD:     docs/reports/YYYY-MM-mtd-report.md
  Annual:  docs/reports/YYYY-annual-report.md
```

## Report Structure

The generated report includes:

| Section | Content |
|---------|---------|
| Executive Summary | Key metrics table, highlights narrative |
| Core Platform | f1r3fly metrics and activity |
| Language & Compiler | rholang-rs, language-server, etc. |
| Frontend & Apps | embers, f1r3sky ecosystem |
| Developer Tools | F1r3bu1ld3r, IaC, etc. |
| Research | MeTTa, bnfc, F1R3FLYFS |
| Documentation | Website, .github, fflip |
| Planned Work | Open milestones, priority issues |
| Contributors | Activity leaderboard |
| Appendix | Raw JSON data |

## Narrative Writing Guidelines

When filling in narrative sections:

1. **Be specific** - Reference actual PR numbers, issue counts, contributor names
2. **Focus on impact** - What changed and why it matters
3. **Keep it brief** - 2-4 sentences per section
4. **Use active voice** - "Merged 5 PRs" not "5 PRs were merged"
5. **Highlight community** - Call out new contributors and community PRs

**Good narrative:**
> Major parser refactoring completed with #45, reducing memory usage by 30%.
> Community contributor @newuser submitted first PR improving test coverage.
> Preparing for v1.5.0 release next month.

**Poor narrative:**
> Some changes were made. Things improved. More work planned.

## Troubleshooting

### Rate Limiting

If API calls are rate limited:
```bash
# Wait and retry (script handles automatically)
# Or process fewer repos:
./scripts/generate-monthly-report.sh --category "Core Platform"
```

### Authentication Issues

```bash
# Check auth status
gh auth status

# Re-authenticate if needed
gh auth login
```

### Missing Repository Data

1. Verify repo name in `scripts/lib/github-report-integration.sh`
2. Check if repo is private (requires appropriate token scope)
3. Verify date range captures the activity period

### Empty Report

If report shows all zeros:
1. Check the target month has activity
2. Verify GitHub API is accessible
3. Try `--verbose` flag for detailed debugging

## Automation (Optional)

To schedule monthly generation via cron:

```bash
# Edit crontab
crontab -e

# Add entry to run on 1st of each month at 6 AM
0 6 1 * * /path/to/scripts/generate-monthly-report.sh >> /var/log/f1r3fly-report.log 2>&1
```

## Files Reference

| File | Purpose |
|------|---------|
| `scripts/generate-monthly-report.sh` | Main generation script |
| `scripts/lib/github-report-integration.sh` | GitHub API functions |
| `scripts/lib/report-formatting.sh` | Markdown generation |
| `docs/templates/monthly-report.md.template` | Template reference |
| `docs/reports/YYYY-MM-monthly-report.md` | Generated reports |
| `skills/monthly-report/scripts/validate-report.sh` | Validation utility |

## Related Commands

- `/quick-commit` - Commit the completed report
- `/recursive-push` - Push to remote
