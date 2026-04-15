---
doc_type: monthly-board-report
period: 2026-02
cadence: monthly
generated_at: 2026-03-20T04:02:12Z
generated_by: generate-board-report.sh
audience: board
---

# F1R3FLY.io Board Report

**Period:** February 2026
**Cadence:** Monthly
**Generated:** 2026-03-20T04:02:12Z

---

## Executive Overview

### Organization Health

| Indicator | Value | Status |
|-----------|-------|--------|
| Active Repositories | 8 / 25 | - |
| Commits (period) | 317 | - |
| PRs Merged | 47 | - |
| PRs Open | 51 | - |
| Issues Closed | 21 | - |
| Issues Open (backlog) | 136 | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_overview -->
February delivered 317 commits and 47 merged PRs across 8 of 25 repositories, with Core Platform accounting for 80% of commits (252) and 60% of merged PRs (28). Key accomplishments: consensus non-determinism fix and Proposer crash resilience improvements stabilize the f1r3node platform for production readiness; whitelabel rebranding removes hardcoded REV/rchain references, enabling partner deployments; division-by-zero crash fixes address critical runtime stability. On the product side, the OSLF editor in embers-frontend reached functional maturity with tree view navigation and sidebar components (14 PRs merged). CI infrastructure migrated to self-hosted runners, reducing external dependency costs. The backlog decreased slightly from 141 to 136 open issues. 12 contributors were active, with the DevBrother team delivering the majority of frontend work.
<!-- AI_NARRATIVE_END -->

---

## Category Health

| Category | Repos Active | Commits | PRs Merged | Issues Closed | Open Issues |
|----------|-------------|---------|------------|---------------|-------------|
| Core Platform | 1/1 | 252 | 28 | 17 | 48 |
| Language & Compiler | 2/6 | 6 | 0 | 0 | 30 |
| Frontend & Applications | 2/7 | 30 | 17 | 3 | 29 |
| Developer Tools | 1/5 | 11 | 2 | 1 | 8 |
| Research & Language Dev | 1/3 | 6 | 0 | 0 | 18 |
| Documentation & Governance | 1/3 | 12 | 0 | 0 | 3 |

---

## Strategic Milestones

| Project | Milestone | Progress | Due Date | Status |
|---------|-----------|----------|----------|--------|
| embers | choreographer | 100% (1/1) | TBD | - |

### Milestone Commentary

<!-- AI_NARRATIVE_START: milestone_commentary -->
The Embers "choreographer" milestone is at 100% completion (1/1 issues) but remains open with no due date set. Only one formal milestone is tracked across the entire organization, indicating that strategic planning would benefit from more granular milestone definitions. The f1r3node platform is progressing toward production readiness through consensus stabilization and whitelabel work, but lacks a formalized milestone to track these efforts.
<!-- AI_NARRATIVE_END -->

---

## Milestone Analysis

### Completed This Period

_No milestones completed this period_


### Open & Upcoming

| Project | Milestone | Progress | Due Date | Open Issues |
|---------|-----------|----------|----------|-------------|
| embers | choreographer | 100% (1/1) | **Not set** | 0 |

> **Planning gap:** 1 open milestone(s) have no due date set.

### Delivery Reliability

_No completed milestones to assess delivery reliability_

### Tracking Coverage

**Milestone coverage:** 1 of 24 repositories have milestones defined

#### No Tracking Defined

> **Recommendation:** 23 repositories have no milestones, labeled tracking issues, or project boards. Consider adding milestones for strategic visibility.

- f1r3fly
- rholang-rs
- rholang-language-server
- rholang
- graph-to-rholang-parser
- rholang-nvim
- rholang-vscode-client
- embers-frontend
- f1r3sky
- f1r3sky-client
- f1r3sky-backend-ts
- lightning-bug
- F1r3bu1ld3r
- rust-client
- IaC
- f1r3drive-extension
- Sankey_block_explorer
- MeTTa
- bnfc
- F1R3FLYFS
- F1R3FLY-io.github.io
- .github
- fflip

### Milestone Analysis Commentary

<!-- AI_NARRATIVE_START: milestone_analysis -->
No milestones were completed or closed this period, and delivery reliability cannot be assessed due to the absence of completed milestones with due dates. The sole open milestone (embers/choreographer) is 100% complete but has no due date, which should be either closed or assigned a target date. Tracking coverage is critically low: only 1 of 24 repositories (4%) has any milestone defined, and none of the 23 remaining repos use labeled tracking issues or project boards as alternatives. Immediate recommendations: (1) close the choreographer milestone since all issues are resolved; (2) create milestones for f1r3fly covering consensus stabilization and whitelabel completion; (3) create a milestone for rholang-rs Rust interpreter progress; (4) establish a policy requiring milestones for all active repositories to improve board-level visibility into strategic delivery.
<!-- AI_NARRATIVE_END -->

---

## Product Delivery

### Deliverables This Period

| Category | Repository | Commits | PRs Merged | Issues Closed |
|----------|------------|---------|------------|---------------|
| Core Platform | f1r3fly | 252 | 28 | 17 |
| Language & Compiler | rholang-rs | 4 | 0 | 0 |
| Language & Compiler | graph-to-rholang-parser | 2 | 0 | 0 |
| Frontend & Applications | embers | 7 | 3 | 0 |
| Frontend & Applications | embers-frontend | 23 | 14 | 3 |
| Developer Tools | rust-client | 11 | 2 | 1 |
| Research & Language Dev | MeTTa | 6 | 0 | 0 |
| Documentation & Governance | .github | 12 | 0 | 0 |

### Delivery Commentary

<!-- AI_NARRATIVE_START: delivery_commentary -->
Core Platform (f1r3fly) delivered 28 PRs: consensus non-determinism fix, time-based deploy expiration, whitelabel rebranding removing hardcoded REV references across Scala and Rust, division-by-zero crash fixes, and CI migration to self-hosted runners. Embers-frontend shipped 14 PRs building out the OSLF editor with sidebar navigation, tree view, typesafe i18n, agent management improvements, and demo preparation. Rust-client received 11 commits and 2 PRs with 1 issue closed, showing increased activity in the developer tools category. Rholang-rs and graph-to-rholang-parser had minimal commit activity (4 and 2 respectively) with no PRs merged. Documentation repository (.github) added 12 commits for organizational tooling and board report infrastructure.
<!-- AI_NARRATIVE_END -->

---

## Risk Register

#### Elevated Backlogs

| Repository | Open Issues |
|------------|-------------|
| f1r3fly | 48 |
| rholang-rs | 25 |

#### Dormant Repositories (16)

- rholang-language-server
- rholang
- rholang-nvim
- rholang-vscode-client
- f1r3sky
- f1r3sky-client
- f1r3sky-backend-ts
- lightning-bug
- F1r3bu1ld3r
- IaC
- f1r3drive-extension
- Sankey_block_explorer
- bnfc
- F1R3FLYFS
- F1R3FLY-io.github.io
- fflip

### Risk Commentary

<!-- AI_NARRATIVE_START: risk_commentary -->
Two repositories have elevated backlogs: f1r3fly (48 open issues) and rholang-rs (25 open issues). The f1r3fly backlog decreased from 52 to 48 this period despite heavy development, reflecting ongoing triage. The rholang-rs backlog dropped slightly from 27 to 25 but with only 4 commits and no PRs merged, the Rust interpreter may need additional resourcing or reprioritization. 16 of 25 repositories (64%) were dormant, including the entire f1r3sky ecosystem (5 repos), all Rholang developer tooling (3 repos), and most developer tools (3 of 5). The f1r3sky and Language & Compiler categories warrant review to confirm alignment with strategic priorities. Additionally, the near-total absence of milestone tracking (4% coverage) poses a governance risk: the board has limited visibility into whether development effort is aligned with strategic objectives.
<!-- AI_NARRATIVE_END -->

---

## Team & Resources

**Active contributors:** 12

| Contributor | Commits | Share |
|-------------|---------|-------|
| IhorR-DevBrother | 3 | 18% |
| AndriiS-DevBrother | 2 | 12% |
| spreston8 | 2 | 12% |
| Lucius Meredith | 1 | 6% |
| MarcinR-DevBrother | 1 | 6% |
| NazarY-DevBrother | 1 | 6% |
| OleksandrK-DevBrother | 1 | 6% |
| berecik | 1 | 6% |
| dependabot[bot] | 1 | 6% |
| jeffrey-l-turner | 1 | 6% |

### Resource Commentary

<!-- AI_NARRATIVE_START: resource_commentary -->
12 active contributors this period, up from 10 in January. The DevBrother team (5 members: IhorR, AndriiS, MarcinR, NazarY, OleksandrK) continues to provide the majority of development capacity across Core Platform and Frontend. @spreston8 led Core Platform delivery with consensus and CI work. @berecik is a new contributor this period. @leithaus and @jeffrey-l-turner contributed to research and documentation respectively. Dependabot handled automated dependency management. Current team capacity is concentrated on f1r3fly and embers-frontend; rholang-rs and the f1r3sky ecosystem have no dedicated contributors, which will become a bottleneck if those projects move to higher priority.
<!-- AI_NARRATIVE_END -->

---

## Decisions Required

<!-- AI_NARRATIVE_START: decisions_required -->
- Establish milestone tracking policy: only 1 of 24 repositories has a milestone defined -- approve a requirement for milestones on all active repositories to improve strategic visibility
- Review rholang-rs prioritization: 25 open issues with minimal activity (4 commits, 0 PRs) -- decide whether to accelerate Rust interpreter development or formally deprioritize
- Evaluate f1r3sky ecosystem status: 5 dormant repositories -- decide whether to archive, consolidate, or plan reactivation
- Assess self-hosted CI runner infrastructure costs following the migration from external runners
<!-- AI_NARRATIVE_END -->

---

## Next Period Outlook

<!-- AI_NARRATIVE_START: next_period_outlook -->
March focus areas: continue f1r3node consensus stabilization and complete whitelabel integration testing; advance the OSLF editor toward a user-testable release with tree view and sidebar components now functional; monitor self-hosted CI runner stability post-migration. The embers-frontend demo build should be ready for stakeholder review. Dependency management will continue via Dependabot. The rholang-rs and f1r3sky categories will likely remain dormant unless reprioritized. Recommend establishing formal milestones for Q2 planning during March to address the tracking coverage gap identified in this report.
<!-- AI_NARRATIVE_END -->

---

_Report generated by F1R3FLY.io Board Report System_
