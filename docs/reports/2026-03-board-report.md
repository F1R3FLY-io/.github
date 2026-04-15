---
doc_type: monthly-board-report
period: 2026-03
cadence: monthly
generated_at: 2026-04-15T23:30:21Z
generated_by: generate-board-report.sh
audience: board
---

# F1R3FLY.io Board Report

**Period:** March 2026
**Cadence:** Monthly
**Generated:** 2026-04-15T23:30:21Z

---

## Executive Overview

### Organization Health

| Indicator | Value | Status |
|-----------|-------|--------|
| Active Repositories | 8 / 25 | - |
| Commits (period) | 234 | - |
| PRs Merged | 52 | - |
| PRs Open | 58 | - |
| Issues Closed | 16 | - |
| Issues Open (backlog) | 142 | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_overview -->
March was a Core Platform month: 166 of 234 org-wide commits (71%) and 37 of 52 merged PRs came from f1r3fly, which landed an auto-versioning and release-tagging pipeline for both Rust and Scala builds, closed two consensus-correctness gaps (shard replay determinism and GC cycle handling), and migrated CI to GitHub-hosted runners. Rholang-rs and rust-client advanced in parallel with new numeric types, a WASM build, and a library-crate split. Frontend and application repositories (7 repos) had zero commits this period, concentrating attention upstream. Strategic-visibility gaps surfaced by this report — 22 of 24 repos lack a `docs/roadmap.md`, 10 f1r3fly release tags violate SemVer, and only 1 milestone is open org-wide — frame the decision asks below.
<!-- AI_NARRATIVE_END -->

---

## Category Health

| Category | Repos Active | Commits | PRs Merged | Issues Closed | Open Issues |
|----------|-------------|---------|------------|---------------|-------------|
| Core Platform | 1/1 | 166 | 37 | 14 | 50 |
| Language & Compiler | 1/6 | 23 | 6 | 0 | 30 |
| Frontend & Applications | 0/7 | 0 | 0 | 0 | 33 |
| Developer Tools | 2/5 | 22 | 5 | 2 | 8 |
| Research & Language Dev | 2/3 | 10 | 4 | 0 | 18 |
| Documentation & Governance | 2/3 | 13 | 0 | 0 | 3 |

---

## Strategic Milestones

| Project | Milestone | Progress | Due Date | Status |
|---------|-----------|----------|----------|--------|
| embers | choreographer | 100% (1/1) | TBD | - |

### Milestone Commentary

<!-- AI_NARRATIVE_START: milestone_commentary -->
One open milestone exists org-wide (`embers/choreographer`, 100% complete but still open, no due date set). This is a hygiene gap rather than a delivery gap: the work landed but the milestone wasn't closed, and the absence of a due date means the delivery couldn't be assessed as on-time or late. No new milestones were opened this period despite 52 PRs shipping. Recommend treating milestone adoption as a Q2 objective tied to the new workspace standard.
<!-- AI_NARRATIVE_END -->

---

## Milestone Analysis

### Completed This Period

_No milestones completed this period_

#### Milestone Continuity

Milestones tracked in previous board reports:

| Project | Milestone | Previous Report |
|---------|-----------|-----------------|
| null | choreographer | 2026-02 |

### Open & Upcoming

| Project | Milestone | Progress | Due Date | Open Issues |
|---------|-----------|----------|----------|-------------|
| embers | choreographer | 100% (1/1) | **Not set** | 0 |

> **Planning gap:** 1 open milestone(s) have no due date set.

### Date Gaps

**1 open milestone(s) still have no due date** — see the Open & Upcoming table above.


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
Milestone coverage sits at 4% (1 of 24 repos), and delivery reliability can't be measured because no closed milestone in the period carried a due date. This is a material strategic-tracking gap across the organization. The new workspace [Roadmap, Release Date, and Version Normalization Standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md) now defines the convention, and `/harmonize` has been wired to bootstrap compliant `docs/roadmap.md` files. Recommend formalizing open milestones with due dates for at least the three highest-activity repos — f1r3fly, rholang-rs, and F1R3FLYFS — by mid-Q2, and setting an org-wide adoption deadline for the standard.
<!-- AI_NARRATIVE_END -->

---

## Product Delivery

### Deliverables This Period

| Category | Repository | Commits | PRs Merged | Issues Closed |
|----------|------------|---------|------------|---------------|
| Core Platform | f1r3fly | 166 | 37 | 14 |
| Language & Compiler | rholang-rs | 23 | 6 | 0 |
| Developer Tools | rust-client | 17 | 5 | 2 |
| Developer Tools | f1r3drive-extension | 5 | 0 | 0 |
| Research & Language Dev | MeTTa | 5 | 0 | 0 |
| Research & Language Dev | F1R3FLYFS | 5 | 4 | 0 |
| Documentation & Governance | F1R3FLY-io.github.io | 1 | 0 | 0 |
| Documentation & Governance | .github | 12 | 0 | 0 |

### Delivery Commentary

<!-- AI_NARRATIVE_START: delivery_commentary -->
- **f1r3fly (Core Platform)**: 37 merged PRs delivered an auto-versioning + changelog + release-tagging pipeline for both Rust and Scala builds ([#454](https://github.com/F1R3FLY-io/f1r3node/pull/454), [#455](https://github.com/F1R3FLY-io/f1r3node/pull/455)), consensus correctness fixes for shard replay under duplicate channel sends ([#461](https://github.com/F1R3FLY-io/f1r3node/pull/461)) and GC cycle handling ([#450](https://github.com/F1R3FLY-io/f1r3node/pull/450)), a CI move to GitHub-hosted runners ([#458](https://github.com/F1R3FLY-io/f1r3node/pull/458)), and new operator-facing CLI flags ([#444](https://github.com/F1R3FLY-io/f1r3node/pull/444)).
- **rholang-rs (Language)**: 6 PRs added extended numeric types (Float, BigInt, BigRat, FixedPoint), an interactive shell with async execution, and a WASM build — enabling browser and scripting use cases.
- **rust-client (Developer Tools)**: shipped as a library crate with feature-gated CLI and released `v0.1.1` under compliant SemVer.
- **F1R3FLYFS**: 4 PRs delivered CLI enhancements, Finder visibility, and a Heartbeat-based end-to-end test harness.
- **f1r3drive-extension**: released `v0.1.1`.
<!-- AI_NARRATIVE_END -->

---

## Risk Register

#### Elevated Backlogs

| Repository | Open Issues |
|------------|-------------|
| f1r3fly | 50 |
| rholang-rs | 25 |

#### Dormant Repositories (16)

- rholang-language-server
- rholang
- graph-to-rholang-parser
- rholang-nvim
- rholang-vscode-client
- embers
- embers-frontend
- f1r3sky
- f1r3sky-client
- f1r3sky-backend-ts
- lightning-bug
- F1r3bu1ld3r
- IaC
- Sankey_block_explorer
- bnfc
- fflip

#### Release Cadence Risks

Active repositories without a published release in the last 90 days:

| Repository | Commits (period) | Latest Release | Published |
|------------|------------------|----------------|-----------|
| rholang-rs | 23 | _none_ | _never_ |
| MeTTa | 5 | _none_ | _never_ |
| F1R3FLY-io.github.io | 1 | _none_ | _never_ |
| .github | 12 | _none_ | _never_ |
| F1R3FLYFS | 5 | v0.1.0 | 2025-06-18T15:21:30Z |

#### Non-SemVer Release Tags

| Repository | Tag | Published |
|------------|-----|-----------|
| f1r3fly | rust-v0.4.11 | 2026-04-09T06:47:22Z |
| f1r3fly | rust-v0.4.10 | 2026-04-06T05:44:04Z |
| f1r3fly | scala-v0.4.8 | 2026-04-02T22:35:17Z |
| f1r3fly | rust-v0.4.9 | 2026-04-01T06:49:38Z |
| f1r3fly | scala-v0.4.7 | 2026-03-31T23:57:13Z |
| f1r3fly | scala-v0.4.6 | 2026-03-31T01:37:02Z |
| f1r3fly | rust-v0.4.8 | 2026-03-31T22:45:58Z |
| f1r3fly | rust-v0.4.7 | 2026-03-30T23:07:31Z |
| f1r3fly | rust-v0.4.6 | 2026-03-30T04:33:13Z |
| f1r3fly | scala-v0.4.5 | 2026-03-29T23:03:57Z |

#### Roadmap Staleness

_Per [roadmap-release-normalization-standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md)._

**Missing roadmap.md (22 repos):** run `/harmonize` to bootstrap from the workspace template.

- f1r3fly
- rholang-rs
- rholang-language-server
- rholang
- graph-to-rholang-parser
- rholang-nvim
- rholang-vscode-client
- embers
- embers-frontend
- f1r3sky
- f1r3sky-client
- f1r3sky-backend-ts
- lightning-bug
- rust-client
- IaC
- f1r3drive-extension
- Sankey_block_explorer
- MeTTa
- bnfc
- F1R3FLYFS
- F1R3FLY-io.github.io
- fflip

**Roadmap updated >60 days ago (1 repos):**

| Repository | Path | Updated |
|------------|------|---------|
| .github | docs/roadmap.md | YYYY-MM-DD |

**Roadmap present but `updated:` field missing or unparseable (1 repos):**

- F1r3bu1ld3r (docs/roadmap.md)

### Risk Commentary

<!-- AI_NARRATIVE_START: risk_commentary -->
- **SemVer non-compliance on f1r3fly releases (10 tags)**: the auto-versioning pipeline is emitting `rust-vX.Y.Z` and `scala-vX.Y.Z` prefixed tags, which violate the workspace release-tagging standard and will break downstream tooling that assumes strict SemVer. *Mitigation options:* adjust the pipeline ([#454](https://github.com/F1R3FLY-io/f1r3node/pull/454), [#455](https://github.com/F1R3FLY-io/f1r3node/pull/455)) to emit conformant tags, or formalize a documented exemption for multi-language monorepos. Decision required — see Decisions Required below.
- **Release cadence stalls on 5 active repositories** (rholang-rs, MeTTa, F1R3FLY-io.github.io, .github, F1R3FLYFS): each has commit activity in the window but has published no release within 90 days, or ever. *Mitigation:* tag initial releases for rholang-rs and F1R3FLYFS given their recent feature deliveries.
- **Frontend-application dormancy (7 repos, 0 commits, 33 open issues)**: embers, embers-frontend, f1r3sky, f1r3sky-client, f1r3sky-backend-ts, and lightning-bug had no activity, deferring customer-facing work. *Mitigation:* explicit Q2 prioritization decision required.
- **Roadmap coverage gap (22 of 24 repos)**: `/harmonize` now bootstraps `docs/roadmap.md` from the workspace template; one-time adoption pass is the mitigation. Two repos (`.github`, `F1r3bu1ld3r`) have the file but with unpopulated or unparseable `updated:` fields — template curation step needed.
- **Contributor concentration**: @spreston8 owned the release-tooling landing on f1r3fly single-handedly. Key-person risk if the pipeline needs rework.
<!-- AI_NARRATIVE_END -->

---

## Team & Resources

**Active contributors:** 10

| Contributor | Commits | Share |
|-------------|---------|-------|
| machieke | 3 | 18% |
| spreston8 | 3 | 18% |
| AndriiS-DevBrother | 2 | 12% |
| jeffrey-l-turner | 2 | 12% |
| Lucius Meredith | 1 | 6% |
| NazarY-DevBrother | 1 | 6% |
| a-k-l-sdao | 1 | 6% |
| berecik | 1 | 6% |
| github-actions[bot] | 1 | 6% |
| leithaus | 1 | 6% |

### Resource Commentary

<!-- AI_NARRATIVE_START: resource_commentary -->
10 contributors active this period, with the top 4 (@machieke, @spreston8, @AndriiS-DevBrother, @jeffrey-l-turner) covering 60% of commits. DevBrother agency engineers (@AndriiS, @NazarY, @SerhiiL) continued to deliver on F1R3FLYFS, f1r3node error-handling refactors, and rholang-rs AST work — a healthy augmentation of core-team capacity. Founder-level contributions from @leithaus and Lucius Meredith remained lightweight (1 commit each). Concentration risk on @spreston8 for f1r3node infrastructure (noted under Risk Register); otherwise distribution is balanced. No hiring or allocation signals in this data alone warrant board action.
<!-- AI_NARRATIVE_END -->

---

## Decisions Required

<!-- AI_NARRATIVE_START: decisions_required -->
- **SemVer strategy for f1r3fly releases** — approve either (a) adjust the auto-versioning pipeline to emit strict `vX.Y.Z` tags and reserve language disambiguation for release names/metadata, or (b) formalize a documented exemption to the workspace standard for this multi-language monorepo. Current `rust-v` / `scala-v` prefixes violate the standard and block downstream tooling assumptions.
- **Adoption deadline for the [Roadmap, Release Date, and Version Normalization Standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md)** — recommend all 22 non-compliant repos run `/harmonize` and publish a populated `docs/roadmap.md` by end of Q2 2026.
- **Q2 product prioritization: frontend revival vs. continued core-platform focus** — 7 frontend/application repos had zero commits in March against 33 carried-over open issues. Needs explicit decision on whether to re-staff, defer, or scope down.
- **First formal `v1.0.0` tag under the new auto-versioning pipeline** — approve target repo (f1r3fly or rust-client) and milestone for the first production-intent release.
<!-- AI_NARRATIVE_END -->

---

## Next Period Outlook

<!-- AI_NARRATIVE_START: next_period_outlook -->
- **f1r3fly**: consolidate the March release-tooling win with a first formal SemVer-compliant release tag, continue consensus-stability iteration on mergeable-channel GC and replay paths.
- **rholang-rs**: publish an initial release exercising the WASM build and numeric-types work; formalize a milestone aligned to the new standard.
- **F1R3FLYFS**: expand Heartbeat-based end-to-end coverage and establish a release cadence beyond the single `v0.1.0` tag from mid-2025.
- **Governance**: drive `/harmonize` adoption across the 22 repos missing `docs/roadmap.md`; curate the two stale/unparseable roadmaps (`.github`, `F1r3bu1ld3r`).
- **Frontend**: decision-gated (see Decisions Required) — if approved, re-engage embers and embers-frontend with a near-term milestone.
- **Next board report** is expected to show the first measurable delivery-reliability metric as milestones begin carrying due dates.
<!-- AI_NARRATIVE_END -->

---

_Report generated by F1R3FLY.io Board Report System_
