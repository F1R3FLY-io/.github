---
name: generate-community-report
description: Generate community/developer update reports for F1R3FLY.io repositories
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
/generate-community-report [OPTIONS]

Cadence Options (mutually exclusive):
  --monthly              Monthly report for previous month (default)
  --month YYYY-MM        Monthly report for specific month
  --biweekly             Bi-weekly report for last 14 days
  --biweekly YYYY-MM-DD  Bi-weekly report starting from specific date

Other Options:
  --output FILE          Custom output path
  --dry-run              Preview without writing file
  --category CAT         Only process specific category
  --repos REPO,...       Only process specific repos (comma-separated)
  --verbose              Detailed progress output
  --narratives FILE      Skip generation; add narrative summaries to existing report

Output Files:
  Monthly:   docs/reports/YYYY-MM-community-report.md
  Bi-weekly: docs/reports/YYYY-MM-DD-biweekly-community-report.md

Prerequisites: gh CLI (authenticated), jq
```

---

## Invocation Guard

This skill requires explicit user invocation via `/generate-community-report`. It must not be triggered proactively by the assistant.

**Validation:** This skill should only proceed when `<command-name>generate-community-report</command-name>` is present in the current user message.

---

You are helping the user generate and enhance F1R3FLY.io community/developer update reports.

This command handles two workflows:
1. **Generate** - Fetch GitHub API data and produce a community-oriented report
2. **Narratives** - Fill in `AI_NARRATIVE` placeholder sections in an existing report

## Architecture

**This command uses a deterministic bash script for generation:**

```
scripts/generate-community-report.sh
```

Located relative to the repository root at `/Users/jeff/src/CurrentProjects/FF/github/`.

**Claude's role**:
- Parse user arguments and map them to script options
- Run the script with appropriate flags
- After generation (or when `--narratives` is used), fill in AI_NARRATIVE placeholders
- Present output and next steps to the user

**Script's role**: Fetch GitHub API data via `gh` CLI, generate markdown reports with community-focused metrics

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

Generate a monthly community report for the previous month, then offer to add narratives.

### If user passes other options

Generate the requested report type, then offer to add narratives.

---

## Execution

### Step 1: Parse and Run

Map the user's arguments to script flags and execute:

```bash
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh [user-provided-flags]
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

1. Read the surrounding context (metrics, PR lists, contributor data)
2. Write a concise narrative summary (2-4 sentences) based on the actual data
3. Replace the placeholder content between the START and END markers

**Community-focused narrative sections:**

| Section | Focus |
|---------|-------|
| `product_updates` | New features shipped, improvements, user-facing changes |
| `technical_highlights` | Notable architecture changes, performance improvements, tooling |
| `contributor_spotlight` | Recognize outstanding contributions, first-time contributors |
| `how_to_contribute` | Good first issues, areas seeking help, mentorship |
| `roadmap_preview` | Upcoming features, planned releases, active development |
| `community_notes` | Events, discussions, calls, resources |

**Narrative writing guidelines for community audiences:**
- Be welcoming - write for newcomers and experienced contributors alike
- Celebrate contributions - recognize individuals by name
- Explain impact - what does this change mean for users and developers
- Lower the barrier - point to good first issues and onboarding resources
- Build excitement - highlight what's coming next

**Good narrative:**
> This month the Embers frontend team shipped 14 PRs bringing the OSLF editor to life. The new sidebar navigation (#178, #189) makes it much easier to work with large Rholang projects. Thanks to @contributor for implementing typesafe i18n (#191) -- the UI now supports multiple languages with compile-time safety. Welcome to @newuser who submitted their first PR!

**Poor narrative:**
> Some PRs were merged. The frontend was updated. Contributors contributed.

### Step 5: Validate

After adding narratives, run validation:

```bash
/Users/jeff/src/CurrentProjects/FF/github/skills/community-report/scripts/validate-report.sh [report-file]
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
# Monthly community report for previous month (most common)
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh
```

### With specific options

```bash
# Monthly report for specific month
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh --month 2026-02

# Bi-weekly report (last 14 days)
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh --biweekly

# Bi-weekly report from specific date
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh --biweekly 2026-02-24

# Preview without writing
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh --dry-run

# Filter to specific category
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh --category "Core Platform"

# Filter to specific repos
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh --repos rholang-rs,f1r3fly

# Combine options
/Users/jeff/src/CurrentProjects/FF/github/scripts/generate-community-report.sh --month 2026-02 --dry-run --verbose
```

---

## Output Files

| Report Type | Output Path |
|-------------|-------------|
| Monthly | `docs/reports/YYYY-MM-community-report.md` |
| Bi-weekly | `docs/reports/YYYY-MM-DD-biweekly-community-report.md` |

---

## Interaction Examples

### Full generate + narratives flow

```
User: /generate-community-report
Claude: [runs: scripts/generate-community-report.sh]
        [shows output with report location]
        [asks: "Would you like to add narrative summaries?"]
User: Yes
Claude: [reads report, fills AI_NARRATIVE sections]
        [runs validation]
        [suggests: /quick-commit to commit]
```

### Bi-weekly report

```
User: /generate-community-report --biweekly
Claude: [runs: scripts/generate-community-report.sh --biweekly]
        [shows output with report location]
        [asks: "Would you like to add narrative summaries?"]
```

### Narratives only on existing report

```
User: /generate-community-report --narratives docs/reports/2026-02-community-report.md
Claude: [reads report file]
        [fills AI_NARRATIVE sections with community-friendly summaries]
        [runs validation]
```

### Quick help

```
User: /generate-community-report ?
Claude: [displays synopsis from Quick Help section and stops]
```

---

## Files Reference

| File | Purpose |
|------|---------|
| `scripts/generate-community-report.sh` | Main generation script |
| `scripts/lib/github-report-integration.sh` | GitHub API functions (shared) |
| `scripts/lib/community-report-formatting.sh` | Community report formatting |
| `docs/templates/community-report.md.template` | Template reference |
| `docs/reports/YYYY-MM-community-report.md` | Generated monthly reports |
| `docs/reports/YYYY-MM-DD-biweekly-community-report.md` | Generated bi-weekly reports |
| `skills/community-report/scripts/validate-report.sh` | Validation utility |

---

## Related Commands

- `/generate-github-status` - Generate technical monthly report
- `/generate-board-report` - Generate board/stakeholder report
- `/quick-commit` - Commit the completed report
- `/recursive-push` - Push to remote
