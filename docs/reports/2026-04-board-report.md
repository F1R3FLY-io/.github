---
doc_type: monthly-board-report
period: 2026-04
cadence: monthly
generated_at: 2026-05-04T17:54:13Z
generated_by: generate-board-report.sh
audience: board
---

# F1R3FLY.io Board Report

**Period:** April 2026
**Cadence:** Monthly
**Generated:** 2026-05-04T17:54:13Z

---

## Executive Overview

### Organization Health

| Indicator | Value | Status |
|-----------|-------|--------|
| Active Repositories | 4 / 26 | - |
| Commits (period) | 91 | - |
| PRs Merged | 22 | - |
| PRs Open | 65 | - |
| Issues Closed | 10 | - |
| Issues Open (backlog) | 169 | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_overview -->
April 2026 delivered concentrated, high-impact technical progress alongside structural risk indicators. Core Platform produced 64 of 91 organizational commits (70%) and 20 of 22 merged PRs (91%), spread across the f1r3node monorepo (58 commits, 20 PRs, seven release tags) and the newly-tracked **f1r3node-rust** standalone repository (6 commits, no releases yet). The two-month chain of `rust-v0.4.9` → `rust-v0.4.13` pre-releases on f1r3node reflects a deliberate hardening cadence; in parallel, f1r3node-rust began accumulating evaluation-readiness work behind a formally tracked milestone (`Transfer f1r3node Rust code post-ASI-chain hand-off`) gated on ASI Chain testing completion. Counter-balancing the technical momentum: only 4 of 26 repositories saw any commits this month, and engineering effort remains thin (3 active contributors, 2 commits each).
<!-- AI_NARRATIVE_END -->

---

## Category Health

| Category | Repos Active | Commits | PRs Merged | Issues Closed | Open Issues |
|----------|-------------|---------|------------|---------------|-------------|
| Core Platform | 2/2 | 64 | 20 | 10 | 75 |
| Language & Compiler | 0/6 | 0 | 0 | 0 | 30 |
| Frontend & Applications | 0/7 | 0 | 0 | 0 | 35 |
| Developer Tools | 1/5 | 15 | 2 | 0 | 8 |
| Research & Language Dev | 0/3 | 0 | 0 | 0 | 18 |
| Documentation & Governance | 1/3 | 12 | 0 | 0 | 3 |

---

## Strategic Milestones

| Project | Milestone | Progress | Due Date | Status |
|---------|-----------|----------|----------|--------|
| f1r3node-rust | Transfer f1r3node Rust code post-ASI-chain hand-off | 0% (0/0) | TBD | - |
| embers | choreographer | 100% (1/1) | TBD | - |

### Milestone Commentary

<!-- AI_NARRATIVE_START: milestone_commentary -->
Two milestones are now tracked organization-wide. **embers/choreographer** continues to show 100% complete with no due date and has appeared in the 2026-02 and 2026-03 reports — recommend formally closing or re-baselining it to clear the tracking signal. **f1r3node-rust/Transfer f1r3node Rust code post-ASI-chain hand-off** was opened during this reporting window and is the new strategic anchor for the ASI Chain integration. Its description encodes three explicit gating conditions (ASI Chain testing complete; defect fixes resolved upstream in f1r3node; formal hand-off received from the ASI Chain team) and a branch cutover mapping (`rust/dev → dev`, `rust/staging → staging`, `main → master`). It currently has no due date and no enumerated issues; recommend decomposing it into trackable issues and setting a target window once ASI Chain testing readiness is confirmed.
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
| null | choreographer | 2026-03 |

### Open & Upcoming

| Project | Milestone | Progress | Due Date | Open Issues |
|---------|-----------|----------|----------|-------------|
| f1r3node-rust | Transfer f1r3node Rust code post-ASI-chain hand-off | 0% (0/0) | **Not set** | 0 |
| embers | choreographer | 100% (1/1) | **Not set** | 0 |

> **Planning gap:** 2 open milestone(s) have no due date set.

### Date Gaps

**2 open milestone(s) still have no due date** — see the Open & Upcoming table above.


### Delivery Reliability

_No completed milestones to assess delivery reliability_

### Tracking Coverage

**Milestone coverage:** 2 of 25 repositories have milestones defined

#### No Tracking Defined

> **Recommendation:** 23 repositories have no milestones, labeled tracking issues, or project boards. Consider adding milestones for strategic visibility.

- f1r3node
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
Strategic visibility remains thin: only 2 of 25 reporting repositories have any milestone defined, and neither has a due date or enumerated issues yet. Delivery reliability cannot be assessed because no milestones with due dates have closed in recent periods. The April milestone-coverage improvement from 1/25 to 2/25 reflects the new `f1r3node-rust/Transfer f1r3node Rust code post-ASI-chain hand-off` — a meaningful structural signal because it is the strategic anchor for the ASI Chain / ASI Alliance (SingularityNET, Fetch.ai, Ocean Protocol, CUDOS) integration story.

#### Structured Plan: Repository Readiness for ASI Chain & ASI Alliance Integration

The plan below targets the five repositories on the ASI integration critical path. Rows are ordered by ASI integration priority — `f1r3node-rust` leads because it is the planned cut-over destination for ASI Chain once their testing resources are in place to begin evaluation. The newly-opened milestone on this repo already encodes three gating conditions (ASI Chain testing complete; defect fixes resolved upstream; formal hand-off received) and a branch cutover mapping (`rust/dev → dev`, `rust/staging → staging`, `main → master`); the remaining work is to set a target window, decompose into issues, and cut a first artifact for ASI testing teams to pin against.

| Repository | Strategic Role for ASI | Milestone (with due date) | roadmap.md | Release Hygiene | Integration Artifacts |
|------------|------------------------|---------------------------|------------|-----------------|-----------------------|
| **f1r3node-rust** (standalone Rust node) | **Planned cut-over target for ASI Chain** once their testing resources come online; supersedes the Rust track in the f1r3node monorepo. April status: active (6 commits, 28 open issues), milestone open but ungated and unscheduled, no releases yet | Existing milestone `Transfer f1r3node Rust code post-ASI-chain hand-off`: assign target window (e.g. cut-over GA 2026-Q4 / 2027-Q1, contingent on ASI testing); decompose into trackable issues for each gating condition and the branch-cutover mapping | Publish `docs/roadmap.md` mirroring the milestone's gating conditions and cutover branch mapping | Establish SemVer from `v0.1.0`; cut a first pre-release tag this quarter so ASI testing teams can pin a known artifact; publish signed release notes | Cut-over migration guide (monorepo → standalone); validator operator runbook; ASI evaluation harness compatibility statement; shared test-fixture commitment |
| **f1r3node** (Core Platform monorepo) | Current high-throughput Rholang execution layer; transitional home for the Rust track until cut-over to `f1r3node-rust` completes. Upstream defect-fix gate for the f1r3node-rust milestone | `v0.5 production` (target 2026-Q3); `Rust/Scala parity` (target 2026-Q3); `cut-over hand-off to f1r3node-rust` (target 2026-Q4) | Publish `docs/roadmap.md` referencing the cut-over and ASI integration milestones | Adopt unified SemVer (resolve `rust-v0.4.x` / `scala-v0.4.x` dual-tracking); publish signed release notes per tag; clearly mark which tags feed the standalone repo | API compatibility matrix; WebSocket protocol spec; deploy guide for ASI validator operators; deprecation notices for the in-monorepo Rust track |
| **rholang-rs** (Language & Compiler) | Native Rust Rholang interpreter — required for embedded execution in Rust-based ASI agents and the standalone `f1r3node-rust` runtime | `Rust interpreter parity` (target 2026-Q3); `embedded-API freeze` (target 2026-Q4) | Publish `docs/roadmap.md` aligned to `f1r3node-rust` and f1r3node release cadence | Cut first SemVer pre-release tag; publish to crates.io once API freezes | Embedding guide for Rust hosts (Fetch.ai-style agents); ABI stability statement; integration test matrix vs. `f1r3node-rust` |
| **rust-client** (Developer Tools) | Canonical SDK for ASI ecosystem partners to interact with f1r3node and `f1r3node-rust` | `1.0 SDK GA` (target 2026-Q3); `f1r3node-rust compatibility` (target 2026-Q4) | Publish `docs/roadmap.md` covering CLI and library surfaces, including the dual-target (monorepo / standalone) period | Promote `v0.1.x` pre-releases to stable SemVer; publish to crates.io | Quickstart guide; example integrations for SingularityNET-style agent calls; compatibility matrix listing supported f1r3node and `f1r3node-rust` versions |
| **embers** (Wallet & Agents) | Reference wallet & agent runtime — analog/companion to Fetch.ai agents and SingularityNET endpoints | `wallet GA` (target 2026-Q4); close or re-baseline open `choreographer` milestone with explicit due date | Publish `docs/roadmap.md` with agent-runtime roadmap | Cut first tagged release with SemVer | Agent-protocol spec; interop notes vs. ASI Alliance agent standards |

#### Cross-cutting actions (organization-level)

1. **Run `/harmonize`** to bootstrap `roadmap.md` from the workspace template across the 23 repos missing it (now including `f1r3node-rust`); prioritize the five repos above and fold them into the existing `.github` roadmap as the public-facing index.
2. **Adopt the [roadmap-release-normalization-standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md)** so that every roadmap entry maps to a milestone with a due date, and every milestone closes against a SemVer release.
3. **Publish a single org-level "ASI Integration Readiness" milestone** in `.github` aggregating the five repos above, with `f1r3node-rust` cut-over as the headline deliverable, so ecosystem partners and the board share one tracking surface.
4. **Establish a joint testing-readiness checkpoint with ASI Chain** to remove the ambiguity around when `f1r3node-rust` evaluation can begin; document this dependency explicitly on both the `f1r3node-rust` and `f1r3node` roadmaps so the gating signal is visible to the board and external partners.
5. **Cut a first SemVer pre-release on f1r3node-rust** even before the milestone gate opens, so ASI testing teams have a stable artifact to pin against. Currently the repo has zero releases, which makes external coordination unnecessarily ad-hoc.
6. **Decompose the f1r3node-rust milestone into trackable issues** — one per gating condition (testing completion, upstream defect fixes, formal hand-off) plus one per branch in the cutover mapping — so progress against the milestone is visible and reportable rather than a single binary state.
7. **Backfill or close the open `embers/choreographer` milestone** (currently 100% complete, no due date, recurring across three reports) — leaving completed-but-open milestones erodes trust in the tracking signal externally.
<!-- AI_NARRATIVE_END -->

---

## Product Delivery

### Deliverables This Period

| Category | Repository | Commits | PRs Merged | Issues Closed |
|----------|------------|---------|------------|---------------|
| Core Platform | f1r3node | 58 | 20 | 10 |
| Core Platform | f1r3node-rust | 6 | 0 | 0 |
| Developer Tools | rust-client | 15 | 2 | 0 |
| Documentation & Governance | .github | 12 | 0 | 0 |

### Delivery Commentary

<!-- AI_NARRATIVE_START: delivery_commentary -->
Four repositories shipped in April. **f1r3node (Core Platform)** delivered the bulk: a comprehensive API redesign with unified responses, query endpoints, and WebSocket support; async RSpace plus true parallel Rholang evaluation; configurable native token metadata; a self-contained binary deployment; and seven release tags (`rust-v0.4.9` → `rust-v0.4.13`, `scala-v0.4.8`, `scala-v0.4.9`). **f1r3node-rust (Core Platform, newly tracked)** received 6 commits of pre-evaluation work and an opened milestone framing the ASI Chain hand-off; no releases were cut, which is itself an action item (see Risk Commentary). **rust-client (Developer Tools)** received a major library restructure with new commands and documentation, releasing `v0.1.2` and `v0.1.3`. **.github (Documentation & Governance)** advanced 12 commits maintaining org-wide policies and templates. The combined business effect is a markedly stronger production story for the Rust node and a more usable client SDK ahead of integrator outreach.
<!-- AI_NARRATIVE_END -->

---

## Risk Register

#### Elevated Backlogs

| Repository | Open Issues |
|------------|-------------|
| f1r3node | 47 |
| f1r3node-rust | 28 |
| rholang-rs | 25 |
| embers | 22 |

#### Dormant Repositories (21)

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
- F1r3bu1ld3r
- IaC
- f1r3drive-extension
- Sankey_block_explorer
- MeTTa
- bnfc
- F1R3FLYFS
- F1R3FLY-io.github.io
- fflip

#### Release Cadence Risks

Active repositories without a published release in the last 90 days:

| Repository | Commits (period) | Latest Release | Published |
|------------|------------------|----------------|-----------|
| f1r3node-rust | 6 | _none_ | _never_ |
| .github | 12 | _none_ | _never_ |

#### Non-SemVer Release Tags

| Repository | Tag | Published |
|------------|-----|-----------|
| f1r3node | rust-v0.4.13 | 2026-04-23T04:24:20Z |
| f1r3node | scala-v0.4.9 | 2026-04-20T17:42:27Z |
| f1r3node | rust-v0.4.12 | 2026-04-20T06:06:58Z |
| f1r3node | rust-v0.4.11 | 2026-04-09T06:47:22Z |
| f1r3node | rust-v0.4.10 | 2026-04-06T05:44:04Z |
| f1r3node | scala-v0.4.8 | 2026-04-02T22:35:17Z |
| f1r3node | rust-v0.4.9 | 2026-04-01T06:49:38Z |
| f1r3node | scala-v0.4.7 | 2026-03-31T23:57:13Z |
| f1r3node | scala-v0.4.6 | 2026-03-31T01:37:02Z |
| f1r3node | rust-v0.4.8 | 2026-03-31T22:45:58Z |

#### Roadmap Staleness

_Per [roadmap-release-normalization-standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md)._

**Missing roadmap.md (23 repos):** run `/harmonize` to bootstrap from the workspace template.

- f1r3node
- f1r3node-rust
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
Four risks merit board attention this period:

1. **Contributor concentration (HIGH).** Three contributors split the month roughly evenly (2 commits each), but only @spreston8 carried feature/release work on f1r3node — a single point of dependency for production delivery on the Core Platform. Mitigation requires hiring (see Resource Commentary).
2. **Repository dormancy (MEDIUM).** 21 of 26 repos saw no commits in April, including four with elevated backlogs (f1r3node 47, **f1r3node-rust 28**, rholang-rs 25, embers 22 open issues). The Language & Compiler and Frontend & Applications categories were entirely dormant, blocking parallel progress on rholang-rs and embers wallet GA.
3. **f1r3node-rust release vacuum and external-dependency gating (MEDIUM, ASI-blocking).** The repo has 6 commits and 28 open issues this period and a milestone open but **zero published releases ever**. The milestone is gated on three external/upstream conditions (ASI Chain testing complete, upstream defect fixes, formal hand-off) — none of which the F1R3FLY.io team can unilaterally close. Mitigation: cut a first SemVer pre-release this quarter so ASI testing teams have a stable artifact to pin; designate an executive owner to coordinate the testing-readiness checkpoint with ASI Chain.
4. **Release & roadmap hygiene (MEDIUM).** f1r3node uses non-SemVer dual-track tags (`rust-v0.4.x` and `scala-v0.4.x` interleaved), complicating compatibility communication to integrators. 23 repos lack a `roadmap.md` (now including `f1r3node-rust`), the .github roadmap retains a placeholder date, and one repo has an unparseable `updated:` field. Mitigation: run `/harmonize` to bootstrap roadmaps; decide on a unified vs. dual-track tagging policy as Rust approaches Scala parity and the standalone `f1r3node-rust` repo takes over.
<!-- AI_NARRATIVE_END -->

---

## Team & Resources

**Active contributors:** 3

| Contributor | Commits | Share |
|-------------|---------|-------|
| github-actions[bot] | 2 | 33% |
| jeffrey-l-turner | 2 | 33% |
| spreston8 | 2 | 33% |

### Resource Commentary

<!-- AI_NARRATIVE_START: resource_commentary -->
Active engineering capacity in April was three contributors at 2 commits each — one carrying feature/release delivery on f1r3node (@spreston8), one contributing on the standalone f1r3node-rust and documentation tracks (@jeffrey-l-turner), and bot activity making up the balance. With both f1r3node and f1r3node-rust now on the critical path, plus dormant categories for rholang-rs and embers, the organization needs additional engineers in language/compiler and frontend specialties to execute against ASI Chain integration commitments. Recommend authorizing recruitment for (1) one Rust language/compiler engineer to reactivate rholang-rs and accelerate f1r3node-rust toward evaluation-ready, and (2) one frontend engineer to advance the embers wallet milestones.
<!-- AI_NARRATIVE_END -->

---

## Decisions Required

<!-- AI_NARRATIVE_START: decisions_required -->
- **Hiring authorization:** approve recruitment for one Rust language/compiler engineer (rholang-rs / f1r3node-rust) and one frontend engineer (embers) to reduce contributor concentration risk and reactivate dormant strategic categories.
- **f1r3node-rust release authorization:** approve cutting a first SemVer pre-release tag this quarter (gated milestone notwithstanding) to give ASI Chain testing teams a stable artifact to pin against.
- **ASI Chain testing-readiness checkpoint:** designate an executive owner to coordinate with ASI Chain on when their testing resources will be in place to begin `f1r3node-rust` evaluation; remove ambiguity from the cut-over schedule and unblock the existing milestone.
- **Milestone decomposition:** approve breaking the `f1r3node-rust/Transfer ...` milestone into trackable issues (one per gating condition, one per branch in the cutover mapping) so progress is visible incrementally rather than as a single binary state.
- **Release tagging policy:** decide whether to retain dual-track f1r3node tagging (`rust-v0.4.x` / `scala-v0.4.x`) or unify under a single SemVer scheme as the Rust track approaches production parity and the standalone `f1r3node-rust` repo takes over. Affects integrator communications.
- **Milestone framework approval:** ratify formal milestones for f1r3node v0.5 (production), rholang-rs interpreter parity, and embers wallet GA, each with explicit due dates suitable for board tracking; set a target window on the existing f1r3node-rust milestone.
- **Q2 scope ratification:** confirm the implicit shift from breadth (26 repos) to depth (consolidate around f1r3node, f1r3node-rust, rust-client, rholang-rs, and embers) and formally pause work on dormant repos until staffing increases.
<!-- AI_NARRATIVE_END -->

---

## Next Period Outlook

<!-- AI_NARRATIVE_START: next_period_outlook -->
May 2026 should focus on hardening the rapid v0.4.x release cadence into a release-candidate posture for f1r3node, anchored by a formally tracked v0.5 milestone with a due date, while advancing the existing `f1r3node-rust/Transfer ...` milestone toward an actionable state. Expected deliverables: a first SemVer pre-release on `f1r3node-rust`; decomposition of the f1r3node-rust milestone into trackable issues per gating condition and branch in the cutover mapping; integrator-facing documentation for the new f1r3node API and WebSocket surfaces; continued rust-client iteration as the new library structure stabilizes; and renewed activity in the Language & Compiler category to advance `rholang-rs`. Operationally, expect bootstrapping of `roadmap.md` files via `/harmonize` across the 23 repos currently missing them, and (pending board approval) opening of two engineering reqs.
<!-- AI_NARRATIVE_END -->

---

_Report generated by F1R3FLY.io Board Report System_
