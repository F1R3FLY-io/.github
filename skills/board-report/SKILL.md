---
name: generate-board-report
description: Generate board/stakeholder status reports for F1R3FLY.io repositories. Use when user asks to "generate board report", "create stakeholder report", "board status update", or "executive summary report".
version: 1.0.0
---

# Board Report Generation Skill

Generate business-oriented status reports for board members and stakeholders across all F1R3FLY.io organization repositories, including organizational health metrics, strategic milestone progress, risk assessment, and resource utilization.

## When to Use This Skill

Activate when the user:
- Requests a board or stakeholder status report
- Wants an executive-level summary of GitHub activity
- Needs a risk assessment across the organization
- Asks for a strategic milestone progress update

## Quick Start

### Generate a New Report

```bash
# Monthly board report for previous month (most common)
./scripts/generate-board-report.sh

# Monthly board report for specific month
./scripts/generate-board-report.sh --month 2026-02

# Bi-weekly board report (last 14 days)
./scripts/generate-board-report.sh --biweekly

# Bi-weekly report starting from specific date
./scripts/generate-board-report.sh --biweekly 2026-02-24

# Preview without writing
./scripts/generate-board-report.sh --dry-run
```

### Add Narratives

After generating, open the report and fill in the `<!-- AI_NARRATIVE_START -->` sections with business-oriented summaries.

## Complete Workflow

### Step 1: Generate Initial Report

Run the generation script:

```bash
cd /Users/jeff/src/CurrentProjects/FF/github
./scripts/generate-board-report.sh
```

The script will:
1. Authenticate with GitHub via `gh` CLI
2. Fetch data from all F1R3FLY repositories
3. Generate report at `docs/reports/YYYY-MM-board-report.md`
4. Show validation results

### Step 2: Review Generated Report

Open and review the generated report:

1. **Verify metrics** - Organization health dashboard accuracy
2. **Check milestones** - Strategic milestone progress is current
3. **Review risks** - Overdue milestones and elevated backlogs
4. **Identify decisions** - Items needing board attention

### Step 3: Add Narrative Summaries

For each `<!-- AI_NARRATIVE_START: section_name -->` marker, write a business-oriented summary.

**Executive Overview example:**
```markdown
<!-- AI_NARRATIVE_START: executive_overview -->
The organization maintained strong development velocity this period with 125 commits across 8 active repositories. Core Platform delivered consensus stability fixes and whitelabel rebranding, while Frontend shipped 14 PRs advancing the OSLF editor. Two strategic milestones are on track for Q1 completion.
<!-- AI_NARRATIVE_END -->
```

**Milestone Commentary example:**
```markdown
<!-- AI_NARRATIVE_START: milestone_commentary -->
The RNode v2.0 milestone is at 75% completion with the remaining work focused on multi-consensus integration testing. The Embers wallet milestone is on schedule for March delivery. No milestone adjustments are recommended at this time.
<!-- AI_NARRATIVE_END -->
```

**Decisions Required example:**
```markdown
<!-- AI_NARRATIVE_START: decisions_required -->
- Approve allocation of 2 additional engineering weeks for consensus testing
- Review proposed deprecation timeline for legacy RNode API endpoints
- Decide on community hackathon date for Q2
<!-- AI_NARRATIVE_END -->
```

### Step 4: Validate and Finalize

Run validation:

```bash
./skills/board-report/scripts/validate-report.sh docs/reports/YYYY-MM-board-report.md
```

Checks performed:
- All narrative placeholders filled
- YAML frontmatter present with audience and cadence fields
- Required sections exist (Executive Overview, Strategic Milestones, Risk Register, etc.)
- Links are valid markdown format

### Step 5: Commit Report

```bash
/quick-commit
```

## Script Options

```
./scripts/generate-board-report.sh [OPTIONS]

Cadence Options (mutually exclusive):
  --monthly              Monthly report for previous month (default)
  --month YYYY-MM        Monthly report for specific month
  --biweekly             Bi-weekly report for last 14 days
  --biweekly YYYY-MM-DD  Bi-weekly report starting from specific date

Other Options:
  --output FILE          Custom output path
  --dry-run              Preview without writing
  --category CAT         Only specific category
  --repos REPO,...       Only specific repos (comma-separated)
  --verbose              Detailed progress output
  --help                 Show help

Output Files:
  Monthly:   docs/reports/YYYY-MM-board-report.md
  Bi-weekly: docs/reports/YYYY-MM-DD-biweekly-board-report.md
```

## Report Structure

The generated report includes:

| Section | Content |
|---------|---------|
| Executive Overview | Organization health dashboard, key metrics, highlights |
| Category Health | Per-category summary table (repos active, commits, PRs, issues) |
| Strategic Milestones | Open milestones with progress and due dates |
| Milestone Analysis | Completed this period, open & upcoming, **date gaps** (30-day horizon + no due dates), delivery reliability, tracking coverage |
| Product Delivery | Active repos with commit/PR/issue counts |
| Risk Register | Overdue milestones, elevated backlogs, dormant repos, **release cadence risks** (no release >90 days on active repos, non-SemVer tags, stale drafts), **roadmap staleness** (missing `docs/roadmap.md`, `updated:` >60 days old) |
| Team & Resources | Active contributors with commit share |
| Decisions Required | Items needing board attention (narrative) |
| Next Period Outlook | Forward-looking summary (narrative) |

### Release Date Gap Analysis

The Milestone Analysis and Risk Register sections consume GitHub Releases and `docs/roadmap.md` frontmatter per the workspace [Roadmap, Release Date, and Version Normalization Standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md). Thresholds:

| Signal | Threshold | Surface |
|--------|-----------|---------|
| Open milestone with no `due_on` | any | Milestone Analysis > Open & Upcoming (planning gap callout) + Date Gaps count |
| Open milestone due within 30 days, <50% progress | 30 days | Milestone Analysis > Date Gaps |
| Open milestone overdue | any | Risk Register > Overdue Milestones |
| No published release on active repo | 90 days | Risk Register > Release Cadence Risks |
| Non-SemVer release tag | any | Risk Register > Non-SemVer Release Tags |
| Draft release older than 14 days | 14 days | Risk Register > Stale Draft Releases |
| Missing `docs/roadmap.md` | any | Risk Register > Roadmap Staleness |
| `roadmap.md` `updated:` >60 days old | 60 days | Risk Register > Roadmap Staleness |

Repositories that lack `docs/roadmap.md` can be bootstrapped by running `/harmonize` in the target repo.

## Narrative Writing Guidelines

When filling in narrative sections for board audiences:

1. **Lead with impact** - Business outcomes and strategic progress first
2. **Quantify results** - Use specific numbers and percentages
3. **Flag risks clearly** - Identify blockers and mitigations
4. **Recommend actions** - Provide clear options for decision items
5. **Keep it concise** - Board members need scannable summaries

**Good narrative:**
> Core Platform delivered 28 merged PRs addressing consensus stability and whitelabel rebranding. The v2.0 milestone advanced to 75% completion, on track for Q1 delivery. One risk identified: CI migration to self-hosted runners requires 48-hour monitoring window.

**Poor narrative:**
> We did some stuff. Things are going well. Some risks exist.

## Differences from Monthly Technical Report

| Aspect | Board Report | Monthly Report |
|--------|-------------|----------------|
| Audience | Executives, stakeholders | Engineering team |
| Detail Level | High-level metrics, strategic view | Per-repo technical detail |
| Focus | Business impact, risks, decisions | Code changes, PRs, issues |
| Cadence | Bi-weekly or monthly | Monthly |
| Narrative Tone | Business-oriented | Technical |
| Sections | Risk register, decisions required | Detailed PR lists, raw JSON |

## Files Reference

| File | Purpose |
|------|---------|
| `scripts/generate-board-report.sh` | Main generation script |
| `scripts/lib/github-report-integration.sh` | GitHub API functions (shared) |
| `scripts/lib/board-report-formatting.sh` | Board report formatting |
| `skills/board-report/scripts/validate-report.sh` | Validation utility |
| `docs/reports/YYYY-MM-board-report.md` | Generated monthly reports |
| `docs/reports/YYYY-MM-DD-biweekly-board-report.md` | Generated bi-weekly reports |

## Related Commands

- `/generate-github-status` - Generate technical monthly report
- `/generate-community-report` - Generate community/developer report
- `/quick-commit` - Commit the completed report
- `/recursive-push` - Push to remote
