---
name: generate-community-report
description: Generate community/developer update reports for F1R3FLY.io repositories. Use when user asks to "generate community report", "create developer update", "community newsletter", or "contributor report".
version: 1.0.0
---

# Community Report Generation Skill

Generate developer-community-oriented reports for all F1R3FLY.io organization repositories, including product updates, technical highlights, contributor recognition, and contribution opportunities.

## When to Use This Skill

Activate when the user:
- Requests a community or developer update report
- Wants to summarize product updates for the developer community
- Needs a contributor recognition report
- Asks for a community newsletter or developer digest

## Quick Start

### Generate a New Report

```bash
# Monthly community report for previous month (most common)
./scripts/generate-community-report.sh

# Monthly community report for specific month
./scripts/generate-community-report.sh --month 2026-02

# Bi-weekly community report (last 14 days)
./scripts/generate-community-report.sh --biweekly

# Bi-weekly report starting from specific date
./scripts/generate-community-report.sh --biweekly 2026-02-24

# Preview without writing
./scripts/generate-community-report.sh --dry-run
```

### Add Narratives

After generating, open the report and fill in the `<!-- AI_NARRATIVE_START -->` sections with community-friendly summaries.

## Complete Workflow

### Step 1: Generate Initial Report

Run the generation script:

```bash
cd /Users/jeff/src/CurrentProjects/FF/github
./scripts/generate-community-report.sh
```

The script will:
1. Authenticate with GitHub via `gh` CLI
2. Fetch data from all F1R3FLY repositories
3. Generate report at `docs/reports/YYYY-MM-community-report.md`
4. Show validation results

### Step 2: Review Generated Report

Open and review the generated report:

1. **Verify metrics** - Activity overview accuracy
2. **Check spotlights** - Repository spotlights capture key changes
3. **Review contributors** - Contributor list is correct
4. **Identify highlights** - Notable technical changes for narrative

### Step 3: Add Narrative Summaries

For each `<!-- AI_NARRATIVE_START: section_name -->` marker, write a community-friendly summary.

**Product Updates example:**
```markdown
<!-- AI_NARRATIVE_START: product_updates -->
This period brought several improvements to the F1R3FLY ecosystem:

- **Embers Frontend**: The OSLF editor gained sidebar navigation (#178, #189) and typesafe i18n support (#191), making the development experience smoother for all users
- **f1r3fly Core**: Consensus stability fixes landed, improving reliability for node operators
- **Whitelabel Support**: Rebranding groundwork completed, enabling customization for partner deployments
<!-- AI_NARRATIVE_END -->
```

**Technical Highlights example:**
```markdown
<!-- AI_NARRATIVE_START: technical_highlights -->
- **Division-by-zero crash fix**: A series of PRs (#406-#412) addressed edge cases in the consensus engine that could cause node crashes under specific transaction patterns
- **CI migration**: Build infrastructure moved to self-hosted runners, reducing build times by ~40%
- **Typesafe i18n**: The frontend adopted compile-time checked internationalization, eliminating a class of runtime translation errors
<!-- AI_NARRATIVE_END -->
```

**Contributor Spotlight example:**
```markdown
<!-- AI_NARRATIVE_START: contributor_spotlight -->
A big thank you to all contributors this period. Special recognition to:

- @contributor1 for their extensive work on consensus stability
- @contributor2 for shipping the OSLF editor improvements
- Welcome to @newcontributor who submitted their first PR improving documentation
<!-- AI_NARRATIVE_END -->
```

### Step 4: Validate and Finalize

Run validation:

```bash
./skills/community-report/scripts/validate-report.sh docs/reports/YYYY-MM-community-report.md
```

Checks performed:
- All narrative placeholders filled
- YAML frontmatter present with audience and cadence fields
- Required sections exist (What's New, Contributor Recognition, Get Involved, etc.)
- Links are valid markdown format

### Step 5: Commit Report

```bash
/quick-commit
```

## Script Options

```
./scripts/generate-community-report.sh [OPTIONS]

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
  Monthly:   docs/reports/YYYY-MM-community-report.md
  Bi-weekly: docs/reports/YYYY-MM-DD-biweekly-community-report.md
```

## Report Structure

The generated report includes:

| Section | Content |
|---------|---------|
| What's New | Activity overview metrics, product updates narrative |
| Technical Highlights | Notable technical changes narrative |
| Repository Spotlights | Active repos with metrics and descriptions |
| Merged PRs | Per-repo table of merged PRs (up to 40 per repo) with cycle time (`created_at` → `merged_at`), LOC delta (`+additions / -deletions`), issue comments, inline review comments, and submitted-review counts |
| Contributor Recognition | Leaderboard, new contributors, spotlight narrative |
| Get Involved | Open issues by repo, contribution guidance |
| Coming Soon | Upcoming milestones (with **Target Release** column), **Recent Releases** published this period, roadmap preview |
| Community | Events, discussions, resources |

### Release Visibility

The Coming Soon section is driven by the workspace [Roadmap, Release Date, and Version Normalization Standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md):

- **Target Release** column in the Upcoming Milestones table is derived from the SemVer prefix in the milestone title (milestones should be titled `vX.Y.Z — <theme>`)
- **Recent Releases** lists published (non-draft) GitHub Releases whose `published_at` falls within the reporting period, sorted newest-first; pre-releases are tagged, empty-body releases link to the tag instead of release notes

This section intentionally omits the internal-risk signals (cadence stalls, missing roadmap files) that the board report surfaces. Gaps are framed as "subject to change" in forward-looking narrative, not as risk callouts.

## Narrative Writing Guidelines

When filling in narrative sections for community audiences:

1. **Be welcoming** - Write for newcomers and experienced contributors alike
2. **Celebrate contributions** - Recognize individuals by name
3. **Explain impact** - What does this change mean for users and developers
4. **Lower the barrier** - Point to good first issues and onboarding resources
5. **Build excitement** - Highlight what's coming next

**Good narrative:**
> This month the Embers frontend team shipped 14 PRs bringing the OSLF editor to life. If you've been following the project, you'll notice the new sidebar navigation makes it much easier to work with large Rholang projects. Thanks to @contributor for implementing typesafe i18n -- the UI now supports multiple languages with compile-time safety.

**Poor narrative:**
> Some PRs were merged. The frontend was updated. Contributors contributed.

## Differences from Monthly Technical Report

| Aspect | Community Report | Monthly Report |
|--------|-----------------|----------------|
| Audience | Developers, contributors, community | Internal engineering team |
| Tone | Welcoming, celebratory | Factual, technical |
| Focus | Product updates, recognition, onboarding | Comprehensive technical metrics |
| Detail Level | Curated highlights | Every PR and issue |
| Sections | Get Involved, Contributor Spotlight | Raw JSON appendix, all repo details |
| Cadence | Bi-weekly or monthly | Monthly |

## Files Reference

| File | Purpose |
|------|---------|
| `scripts/generate-community-report.sh` | Main generation script |
| `scripts/lib/github-report-integration.sh` | GitHub API functions (shared) |
| `scripts/lib/community-report-formatting.sh` | Community report formatting |
| `skills/community-report/scripts/validate-report.sh` | Validation utility |
| `docs/reports/YYYY-MM-community-report.md` | Generated monthly reports |
| `docs/reports/YYYY-MM-DD-biweekly-community-report.md` | Generated bi-weekly reports |

## Related Commands

- `/generate-github-status` - Generate technical monthly report
- `/generate-board-report` - Generate board/stakeholder report
- `/quick-commit` - Commit the completed report
- `/recursive-push` - Push to remote
