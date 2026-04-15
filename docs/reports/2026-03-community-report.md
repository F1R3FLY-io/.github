---
doc_type: monthly-community-report
period: 2026-03
cadence: monthly
generated_at: 2026-04-15T23:21:19Z
generated_by: generate-community-report.sh
audience: community
---

# F1R3FLY.io Community & Developer Update

**Period:** March 2026
**Cadence:** Monthly
**Generated:** 2026-04-15T23:21:19Z

---

## What's New

### Activity at a Glance

| Metric | Value |
|--------|-------|
| Active Repositories | 8 / 25 |
| Total Commits | 234 |
| PRs Merged | 52 |
| Issues Closed | 16 |

### Product Updates

<!-- AI_NARRATIVE_START: product_updates -->
Several developer-facing additions shipped this month across the ecosystem:

- **Rholang (Rust)**: an interactive shell with multiline input, async execution, and built-in semantic validators ([#43](https://github.com/F1R3FLY-io/rholang-rs/pull/43)) plus a first WASM build ([#71](https://github.com/F1R3FLY-io/rholang-rs/pull/71)). Extended numeric types — `Float`, `BigInt`, `BigRat`, and `FixedPoint` — are now usable in programs ([#89](https://github.com/F1R3FLY-io/rholang-rs/pull/89), [#90](https://github.com/F1R3FLY-io/rholang-rs/pull/90)).
- **rust-client**: now ships as a library crate with feature-gated CLI ([#10](https://github.com/F1R3FLY-io/rust-client/pull/10)), and a fix landed for parsing epoch-rewards over the HTTP API ([#13](https://github.com/F1R3FLY-io/rust-client/pull/13)).
- **f1r3drive-extension** published `v0.1.1` on 2026-03-24.
- **F1R3FLYFS**: CLI enhancements and Finder visibility ([#44](https://github.com/F1R3FLY-io/f1r3drive/pull/44)), Docker volume fix, and Heartbeat-based end-to-end tests ([#41](https://github.com/F1R3FLY-io/f1r3drive/pull/41)).
<!-- AI_NARRATIVE_END -->

---

## Technical Highlights

<!-- AI_NARRATIVE_START: technical_highlights -->
- **Auto-versioning and release tagging pipeline** landed in both Rust ([#455](https://github.com/F1R3FLY-io/f1r3node/pull/455)) and Scala ([#454](https://github.com/F1R3FLY-io/f1r3node/pull/454)) builds of f1r3node, replacing manual release cadence with changelog-driven tagging. You'll see the first practical use of this pipeline in the 12 pre-release tags already published this period (visible in Recent Releases below).
- **Consensus reliability**: shard recovery and replay determinism under duplicate channel sends ([#461](https://github.com/F1R3FLY-io/f1r3node/pull/461)) and graceful cycle handling in the garbage collector ([#450](https://github.com/F1R3FLY-io/f1r3node/pull/450)) close two long-standing correctness gaps.
- **CI**: Rust CI migrated from self-hosted to GitHub-hosted runners ([#458](https://github.com/F1R3FLY-io/f1r3node/pull/458)), and Scala integration tests are now explicitly listed for stability ([#465](https://github.com/F1R3FLY-io/f1r3node/pull/465)).
- **Configuration ergonomics**: Scala config overlays are replaced with CLI flags, with defaults.conf realigned ([#447](https://github.com/F1R3FLY-io/f1r3node/pull/447), [#448](https://github.com/F1R3FLY-io/f1r3node/pull/448)). New flags `--ceremony-master-mode` and `--enable/disable-mergeable-channel-gc` landed in [#444](https://github.com/F1R3FLY-io/f1r3node/pull/444).
<!-- AI_NARRATIVE_END -->

---

## Repository Spotlights

### f1r3fly

No description

| Metric | Value |
|--------|-------|
| Commits | 166 |
| PRs Merged | 37 |
| Issues Closed | 14 |
| Open Issues | 50 |

### rholang-rs

No description

| Metric | Value |
|--------|-------|
| Commits | 23 |
| PRs Merged | 6 |
| Issues Closed | 0 |
| Open Issues | 25 |

### rust-client

No description

| Metric | Value |
|--------|-------|
| Commits | 17 |
| PRs Merged | 5 |
| Issues Closed | 2 |
| Open Issues | 0 |

### .github

Public contributor guidelines and templates

| Metric | Value |
|--------|-------|
| Commits | 12 |
| PRs Merged | 0 |
| Issues Closed | 0 |
| Open Issues | 0 |

### f1r3drive-extension

No description

| Metric | Value |
|--------|-------|
| Commits | 5 |
| PRs Merged | 0 |
| Issues Closed | 0 |
| Open Issues | 2 |

### MeTTa

MeTTa Intermediate Language

| Metric | Value |
|--------|-------|
| Commits | 5 |
| PRs Merged | 0 |
| Issues Closed | 0 |
| Open Issues | 12 |

### F1R3FLYFS

No description

| Metric | Value |
|--------|-------|
| Commits | 5 |
| PRs Merged | 4 |
| Issues Closed | 0 |
| Open Issues | 6 |

---

## Merged PRs

**F1R3FLYFS**
- [#42](https://github.com/F1R3FLY-io/f1r3drive/pull/42) - Feature/integration updates merge with main (@AndriiS-DevBrother)
- [#44](https://github.com/F1R3FLY-io/f1r3drive/pull/44) - feat: CLI enhancements and Finder visibility (@AndriiS-DevBrother)
- [#43](https://github.com/F1R3FLY-io/f1r3drive/pull/43) - fix: use Rust node and Heartbeat mode in e2e test (@AndriiS-DevBrother)
- [#41](https://github.com/F1R3FLY-io/f1r3drive/pull/41) - Whitelabeled Rholang, Docker volume fix, Heartbeat-based E2E tests (@AndriiS-DevBrother)

**f1r3fly**
- [#465](https://github.com/F1R3FLY-io/f1r3node/pull/465) - ci: explicitly list integration test files (Scala) (@spreston8)
- [#456](https://github.com/F1R3FLY-io/f1r3node/pull/456) - refactor: separate produce error handling from NonDeterministicProcessFailure (Rust) (@NazarY-DevBrother)
- [#460](https://github.com/F1R3FLY-io/f1r3node/pull/460) - fix: update fault-tolerance-threshold defaults and add consensus config guide (@spreston8)
- [#461](https://github.com/F1R3FLY-io/f1r3node/pull/461) - fix: shard recovery and replay determinism for duplicate channel sends (@spreston8)
- [#458](https://github.com/F1R3FLY-io/f1r3node/pull/458) - ci: migrate Rust CI to GitHub-hosted runners (@spreston8)
- [#453](https://github.com/F1R3FLY-io/f1r3node/pull/453) - refactor: separate produce error handling from NonDeterministicProces… (@NazarY-DevBrother)
- [#448](https://github.com/F1R3FLY-io/f1r3node/pull/448) - Refactor: replace Scala config overlays with CLI flags, align defaults.conf (@spreston8)
- [#447](https://github.com/F1R3FLY-io/f1r3node/pull/447) - Refactor: replace config overlays with CLI flags, align defaults.conf (@spreston8)
- [#454](https://github.com/F1R3FLY-io/f1r3node/pull/454) - feat: auto-versioning, changelog, and release tagging (Scala) (@spreston8)
- [#455](https://github.com/F1R3FLY-io/f1r3node/pull/455) - feat: auto-versioning, changelog, and release tagging (Rust) (@spreston8)
- [#451](https://github.com/F1R3FLY-io/f1r3node/pull/451) - Merge dev into main (@spreston8)
- [#450](https://github.com/F1R3FLY-io/f1r3node/pull/450) - fix: GC gracefully skips the cycle instead of crashing (@NazarY-DevBrother)
- [#446](https://github.com/F1R3FLY-io/f1r3node/pull/446) - Merge rust/dev into rust/main (@spreston8)
- [#445](https://github.com/F1R3FLY-io/f1r3node/pull/445) - Merge dev into main (@spreston8)
- [#444](https://github.com/F1R3FLY-io/f1r3node/pull/444) - feat: add --ceremony-master-mode and --enable/disable-mergeable-channel-gc CLI flags (@spreston8)

**rholang-rs**
- [#90](https://github.com/F1R3FLY-io/rholang-rs/pull/90) - feat: add extended numeric types (Float, BigInt, BigRat, FixedPoint) (@spreston8)
- [#43](https://github.com/F1R3FLY-io/rholang-rs/pull/43) - Interactive Rholang shell with multiline input, async execution, process management, and built-in semantic validators (@berecik)
- [#71](https://github.com/F1R3FLY-io/rholang-rs/pull/71) - Rholang wasm (@berecik)
- [#89](https://github.com/F1R3FLY-io/rholang-rs/pull/89) - feature/numeric types (@machieke)
- [#48](https://github.com/F1R3FLY-io/rholang-rs/pull/48) - PathMap AST type (@SerhiiL-DevBrother)
- [#55](https://github.com/F1R3FLY-io/rholang-rs/pull/55) - F1r3node dependencies (@spreston8)

**rust-client**
- [#15](https://github.com/F1R3FLY-io/rust-client/pull/15) - ci: add build, test, and release workflows (@spreston8)
- [#14](https://github.com/F1R3FLY-io/rust-client/pull/14) - Merge dev into main — Jan-Mar 2026 changes (@spreston8)
- [#13](https://github.com/F1R3FLY-io/rust-client/pull/13) - fix: parse epoch-rewards response via HTTP API (@spreston8)
- [#12](https://github.com/F1R3FLY-io/rust-client/pull/12) - Improve tip sampling and skip recoverable propose errors (@machieke)
- [#10](https://github.com/F1R3FLY-io/rust-client/pull/10) - Add library crate support with feature-gated CLI (@spreston8)

---

## Contributor Recognition

### Top Contributors

| Contributor | Commits | Repos Active In |
|-------------|---------|-----------------|
| @machieke | 3 | 3 |
| @spreston8 | 3 | 3 |
| @AndriiS-DevBrother | 2 | 2 |
| @jeffrey-l-turner | 2 | 2 |
| @Lucius Meredith | 1 | 1 |
| @NazarY-DevBrother | 1 | 1 |
| @a-k-l-sdao | 1 | 1 |
| @berecik | 1 | 1 |
| @github-actions[bot] | 1 | 1 |
| @leithaus | 1 | 1 |

### New Contributors

- @AndriiS-DevBrother (2 commits)
- @Lucius Meredith (1 commit)
- @NazarY-DevBrother (1 commit)
- @a-k-l-sdao (1 commit)
- @berecik (1 commit)
- @github-actions[bot] (1 commit)
- @jeffrey-l-turner (2 commits)
- @leithaus (1 commit)

### Contributor Spotlight

<!-- AI_NARRATIVE_START: contributor_spotlight -->
Big thanks to everyone who shipped this month. A few contributions worth highlighting:

- **@spreston8** led by volume on f1r3node, delivering the release-tagging pipeline, the config-flag migration, the CI move, and consensus fixes — a full slate of infrastructure work.
- **@berecik** brought the interactive Rholang shell and a first WASM build to `rholang-rs`, two features community members have been asking about.
- **@NazarY-DevBrother** fixed a crash in the garbage collector ([#450](https://github.com/F1R3FLY-io/f1r3node/pull/450)) and refactored produce-error handling in both the Rust and Scala code paths ([#453](https://github.com/F1R3FLY-io/f1r3node/pull/453), [#456](https://github.com/F1R3FLY-io/f1r3node/pull/456)).
- **@AndriiS-DevBrother** owned the F1R3FLYFS improvements: CLI polish, Finder visibility, and the new Heartbeat-based end-to-end test harness.
- **@machieke** added extended numeric types to `rholang-rs` ([#89](https://github.com/F1R3FLY-io/rholang-rs/pull/89)) and improved tip sampling and error recovery in `rust-client` ([#12](https://github.com/F1R3FLY-io/rust-client/pull/12)).

Welcome to @SerhiiL-DevBrother who landed the PathMap AST type ([#48](https://github.com/F1R3FLY-io/rholang-rs/pull/48)) this period.
<!-- AI_NARRATIVE_END -->

---

## Get Involved

### Open Issues

| Repository | Open Issues | Link |
|------------|-------------|------|
| f1r3fly | 50 | [Browse issues](https://github.com/F1R3FLY-io/f1r3fly/issues) |
| rholang-rs | 25 | [Browse issues](https://github.com/F1R3FLY-io/rholang-rs/issues) |
| embers | 20 | [Browse issues](https://github.com/F1R3FLY-io/embers/issues) |
| MeTTa | 12 | [Browse issues](https://github.com/F1R3FLY-io/MeTTa/issues) |
| f1r3sky | 9 | [Browse issues](https://github.com/F1R3FLY-io/f1r3sky/issues) |
| F1R3FLYFS | 6 | [Browse issues](https://github.com/F1R3FLY-io/F1R3FLYFS/issues) |
| Sankey_block_explorer | 5 | [Browse issues](https://github.com/F1R3FLY-io/Sankey_block_explorer/issues) |
| graph-to-rholang-parser | 4 | [Browse issues](https://github.com/F1R3FLY-io/graph-to-rholang-parser/issues) |
| embers-frontend | 4 | [Browse issues](https://github.com/F1R3FLY-io/embers-frontend/issues) |
| F1R3FLY-io.github.io | 3 | [Browse issues](https://github.com/F1R3FLY-io/F1R3FLY-io.github.io/issues) |
| f1r3drive-extension | 2 | [Browse issues](https://github.com/F1R3FLY-io/f1r3drive-extension/issues) |
| rholang-language-server | 1 | [Browse issues](https://github.com/F1R3FLY-io/rholang-language-server/issues) |
| IaC | 1 | [Browse issues](https://github.com/F1R3FLY-io/IaC/issues) |

### How to Contribute

<!-- AI_NARRATIVE_START: how_to_contribute -->
The biggest issue backlogs right now are **f1r3fly** (50 open), **rholang-rs** (25), **embers** (20), and **MeTTa** (12). If you're new and want something scoped, the smaller-backlog repos are friendlier starting points:

- **[graph-to-rholang-parser](https://github.com/F1R3FLY-io/graph-to-rholang-parser/issues)** (4 open) and **[embers-frontend](https://github.com/F1R3FLY-io/embers-frontend/issues)** (4 open) — compact problem domains, good for first PRs.
- **[F1R3FLY-io.github.io](https://github.com/F1R3FLY-io/F1R3FLY-io.github.io/issues)** (3 open) — docs and landing-page work, low barrier to entry.
- **[rholang-language-server](https://github.com/F1R3FLY-io/rholang-language-server/issues)** (1 open) and **[IaC](https://github.com/F1R3FLY-io/IaC/issues)** (1 open) — small and targeted.

New contributors can bootstrap their environment with the org-wide [`/harmonize` workflow](https://gitlab.com/smart-assets.io/gitlab-profile/), which sets up the standard task-tracking files and contributor conventions automatically.
<!-- AI_NARRATIVE_END -->

---

## Coming Soon

### Upcoming Milestones

| Project | Milestone | Target Release | Progress | Due |
|---------|-----------|----------------|----------|-----|
| embers | choreographer | — | 100% (1/1) | TBD |

### Recent Releases

| Project | Version | Published | Notes |
|---------|---------|-----------|-------|
| f1r3fly | scala-v0.4.7 (pre-release) | 2026-03-31 | [notes](https://github.com/F1R3FLY-io/f1r3node/releases/tag/scala-v0.4.7) |
| f1r3fly | rust-v0.4.8 (pre-release) | 2026-03-31 | [notes](https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.8) |
| f1r3fly | scala-v0.4.6 (pre-release) | 2026-03-31 | [notes](https://github.com/F1R3FLY-io/f1r3node/releases/tag/scala-v0.4.6) |
| f1r3fly | rust-v0.4.7 (pre-release) | 2026-03-30 | [notes](https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.7) |
| f1r3fly | rust-v0.4.6 (pre-release) | 2026-03-30 | [notes](https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.6) |
| rust-client | v0.1.1 (pre-release) | 2026-03-30 | [notes](https://github.com/F1R3FLY-io/rust-client/releases/tag/v0.1.1) |
| f1r3fly | scala-v0.4.5 (pre-release) | 2026-03-29 | [notes](https://github.com/F1R3FLY-io/f1r3node/releases/tag/scala-v0.4.5) |
| f1r3drive-extension | v0.1.1 | 2026-03-24 | [notes](https://github.com/F1R3FLY-io/f1r3drive-extension/releases/tag/v0.1.1) |

### Roadmap Preview

<!-- AI_NARRATIVE_START: roadmap_preview -->
With the auto-versioning pipeline now landed, expect regular tagged releases from f1r3node going forward — the 12 `rust-v0.4.*` and `scala-v0.4.*` pre-releases published this month are the pipeline's first live exercise. Upcoming threads to watch:

- **Rholang (Rust)**: maturation of the WASM build and the extended numeric types opens the door to running Rholang in browsers and scripting environments.
- **F1R3FLYFS**: the Heartbeat-based end-to-end tests land the foundation for broader FUSE-layer validation on the Rust node.
- **Frontend applications** (embers, f1r3sky): deferred this period while core-platform consensus stabilized; expected to resume.
- **Roadmap standardization**: F1R3FLY.io is adopting a [workspace-wide roadmap standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md) so every repo publishes its release plan in a consistent `docs/roadmap.md` format — keep an eye on those files for per-project targets.

Subject to change — these are directions, not commitments.
<!-- AI_NARRATIVE_END -->

---

## Community

<!-- AI_NARRATIVE_START: community_notes -->
- **Resources**: the [F1R3FLY.io documentation hub](https://github.com/F1R3FLY-io/.github) is now the canonical entry point for contributor guidance, organization-wide standards, and the monthly, board, and community report archive at `docs/reports/`.
- **Contact**: f1r3fly.ceo@gmail.com for strategic or partnership inquiries.
- **Where to find us**: [F1R3FLY.io on GitHub](https://github.com/F1R3FLY-io) — browse the 25-repo ecosystem and pick a project to watch or contribute to.
<!-- AI_NARRATIVE_END -->

---

_Report generated by F1R3FLY.io Community Report System_
