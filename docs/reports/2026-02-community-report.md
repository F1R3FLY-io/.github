---
doc_type: monthly-community-report
period: 2026-02
cadence: monthly
generated_at: 2026-03-09T17:13:55Z
generated_by: generate-community-report.sh
audience: community
---

# F1R3FLY.io Community & Developer Update

**Period:** February 2026
**Cadence:** Monthly
**Generated:** 2026-03-09T17:13:55Z

---

## What's New

### Activity at a Glance

| Metric | Value |
|--------|-------|
| Active Repositories | 8 / 25 |
| Total Commits | 125 |
| PRs Merged | 47 |
| Issues Closed | 21 |

### Product Updates

<!-- AI_NARRATIVE_START: product_updates -->
February brought major progress on two fronts:

- **OSLF Editor**: The On-chain Smart Legal Form editor in embers-frontend is now functional with a full editor component (#178), sidebar navigation (#189), and tree view (#193) -- making it possible to browse and edit smart legal forms directly in the browser
- **f1r3node Stability**: Consensus non-determinism was fixed (#391, #400) and Proposer crash resilience improved, making the node significantly more reliable for operators
- **Whitelabel Support**: All hardcoded REV and rchain brand references were removed across the Scala, Rust, Python, and config layers (#396-#398), enabling custom-branded deployments
- **Deploy Expiration**: Time-based deploy expiration (#387) was implemented in f1r3node and the rust-client (#7), giving developers better control over transaction lifecycle
- **Typesafe i18n**: The embers-frontend now uses compile-time checked internationalization (#191), eliminating runtime translation errors
<!-- AI_NARRATIVE_END -->

---

## Technical Highlights

<!-- AI_NARRATIVE_START: technical_highlights -->
- **Consensus Non-determinism Fix**: @spreston8 identified and fixed a consensus non-determinism issue in the Scala codebase (#391) and backported it to the Rust implementation (#400). This fix also improved Proposer crash resilience, ensuring the node recovers gracefully from proposer failures
- **Division-by-Zero Crash Fixes**: @NazarY-DevBrother addressed division-by-zero crashes in both Scala (#406) and Rust (#408) codebases, with a careful cherry-pick cycle (#411, #412) to ensure correctness across branches
- **CI Migration to Self-hosted Runners**: The Rust CI pipeline moved to self-hosted runners (#402), with integration test cleanup and aarch64 RUSTFLAGS fixes (#403, #404) reducing build times and external CI costs
- **Stack Overflow Fix**: Casper debug test stack overflows (#305, #306) were resolved (#401), improving test suite reliability
- **WebSocket Event Fixes**: Local development setup for WebSocket events was improved (#390), making it easier for developers to test real-time node communication
- **Agent Refactoring**: The embers-frontend agent system was refactored (#177) with bug fixes (#181, #183) and new gear icon functionality (#184), improving the agent management UX
<!-- AI_NARRATIVE_END -->

---

## Repository Spotlights

### f1r3fly

No description

| Metric | Value |
|--------|-------|
| Commits | 71 |
| PRs Merged | 28 |
| Issues Closed | 17 |
| Open Issues | 52 |

### embers-frontend

No description

| Metric | Value |
|--------|-------|
| Commits | 23 |
| PRs Merged | 14 |
| Issues Closed | 3 |
| Open Issues | 2 |

### .github

Public contributor guidelines and templates

| Metric | Value |
|--------|-------|
| Commits | 12 |
| PRs Merged | 0 |
| Issues Closed | 0 |
| Open Issues | 0 |

### embers

F1R3Sky wallets and agents

| Metric | Value |
|--------|-------|
| Commits | 7 |
| PRs Merged | 3 |
| Issues Closed | 0 |
| Open Issues | 15 |

### MeTTa

MeTTa Intermediate Language

| Metric | Value |
|--------|-------|
| Commits | 6 |
| PRs Merged | 0 |
| Issues Closed | 0 |
| Open Issues | 12 |

### rust-client

No description

| Metric | Value |
|--------|-------|
| Commits | 3 |
| PRs Merged | 2 |
| Issues Closed | 1 |
| Open Issues | 4 |

---

## Merged PRs

**embers**
- [#153](https://github.com/F1R3FLY-io/embers/pull/153) - Bump ruff from 0.14.14 to 0.15.0 in /packages/embers in the all group across 1 directory (@dependabot[bot])
- [#154](https://github.com/F1R3FLY-io/embers/pull/154) - Bump graphl-parser from 0.0.39 to 0.0.40 in the all group across 1 directory (@dependabot[bot])
- [#148](https://github.com/F1R3FLY-io/embers/pull/148) - Bump graphl-parser from 0.0.38 to 0.0.39 in the all group (@dependabot[bot])

**embers-frontend**
- [#193](https://github.com/F1R3FLY-io/embers-frontend/pull/193) - Oslf tree view (@OleksandrK-DevBrother)
- [#192](https://github.com/F1R3FLY-io/embers-frontend/pull/192) - demo fixes (@IhorR-DevBrother)
- [#191](https://github.com/F1R3FLY-io/embers-frontend/pull/191) - typesafe i18n (@IhorR-DevBrother)
- [#189](https://github.com/F1R3FLY-io/embers-frontend/pull/189) - OSLF sidebar and things (@OleksandrK-DevBrother)
- [#190](https://github.com/F1R3FLY-io/embers-frontend/pull/190) - simplify dashboard (@IhorR-DevBrother)
- [#187](https://github.com/F1R3FLY-io/embers-frontend/pull/187) - remove tests from oslf package (@IhorR-DevBrother)
- [#186](https://github.com/F1R3FLY-io/embers-frontend/pull/186) - fix docker (@IhorR-DevBrother)
- [#185](https://github.com/F1R3FLY-io/embers-frontend/pull/185) - update agents team (@IhorR-DevBrother)
- [#178](https://github.com/F1R3FLY-io/embers-frontend/pull/178) - Oslf editor (@OleksandrK-DevBrother)
- [#184](https://github.com/F1R3FLY-io/embers-frontend/pull/184) - add agent gear icon functionality (@IhorR-DevBrother)
- [#183](https://github.com/F1R3FLY-io/embers-frontend/pull/183) - fix stuff (@IhorR-DevBrother)
- [#181](https://github.com/F1R3FLY-io/embers-frontend/pull/181) - agents bugfix (@IhorR-DevBrother)
- [#177](https://github.com/F1R3FLY-io/embers-frontend/pull/177) - refactor agents (@IhorR-DevBrother)
- [#179](https://github.com/F1R3FLY-io/embers-frontend/pull/179) - Automated client update (@IhorR-DevBrother)

**f1r3fly**
- [#411](https://github.com/F1R3FLY-io/f1r3node/pull/411) - cherry-pick for division by zero crashes (@NazarY-DevBrother)
- [#412](https://github.com/F1R3FLY-io/f1r3node/pull/412) - Revert "- fixed division by zero crashes; (#406)" (@NazarY-DevBrother)
- [#408](https://github.com/F1R3FLY-io/f1r3node/pull/408) - fixed division by zero crashes for rust (@NazarY-DevBrother)
- [#406](https://github.com/F1R3FLY-io/f1r3node/pull/406) - fixed division by zero crashes (@NazarY-DevBrother)
- [#404](https://github.com/F1R3FLY-io/f1r3node/pull/404) - chore: remove integration-tests, update CI, fix aarch64 RUSTFLAGS (@spreston8)
- [#403](https://github.com/F1R3FLY-io/f1r3node/pull/403) - chore: remove integration-tests and update CI (@spreston8)
- [#401](https://github.com/F1R3FLY-io/f1r3node/pull/401) - - fix: resolve stack overflow in casper debug tests (#305, #306); [WIP] (@NazarY-DevBrother)
- [#391](https://github.com/F1R3FLY-io/f1r3node/pull/391) - SCALA - Fix consensus non-determinism and improve Proposer crash resilience (@spreston8)
- [#402](https://github.com/F1R3FLY-io/f1r3node/pull/402) - ci: migrate Rust CI to self-hosted runners (@spreston8)
- [#400](https://github.com/F1R3FLY-io/f1r3node/pull/400) - Backport Scala PR #391: Fix consensus non-determinism and improve Proposer crash resilience (@spreston8)
- [#398](https://github.com/F1R3FLY-io/f1r3node/pull/398) - RUST - feat: Remove hardcoded REV references (Rust/Rholang/Python/Config/Docs) #396 (@AndriiS-DevBrother)
- [#397](https://github.com/F1R3FLY-io/f1r3node/pull/397) - SCALA - feat: Remove all hardcoded REV and rchain brand references #396 (@AndriiS-DevBrother)
- [#387](https://github.com/F1R3FLY-io/f1r3node/pull/387) - SCALA - Implement time-based deploy expiration (Issue #382) (@spreston8)
- [#390](https://github.com/F1R3FLY-io/f1r3node/pull/390) - RUST - WebSocket event fixes and local development setup (@spreston8)
- [#389](https://github.com/F1R3FLY-io/f1r3node/pull/389) - RUST - remove node-cli crate and fix build configuration (@spreston8)

**rust-client**
- [#9](https://github.com/F1R3FLY-io/rust-client/pull/9) - Remove hardcoded REV references (@AndriiS-DevBrother)
- [#7](https://github.com/F1R3FLY-io/rust-client/pull/7) - Add deploy expiration timestamp support (@spreston8)

---

## Contributor Recognition

### Top Contributors

| Contributor | Commits | Repos Active In |
|-------------|---------|-----------------|
| @IhorR-DevBrother | 3 | 3 |
| @spreston8 | 2 | 2 |
| @AndriiS-DevBrother | 1 | 1 |
| @Lucius Meredith | 1 | 1 |
| @MarcinR-DevBrother | 1 | 1 |
| @NazarY-DevBrother | 1 | 1 |
| @OleksandrK-DevBrother | 1 | 1 |
| @dependabot[bot] | 1 | 1 |
| @jeffrey-l-turner | 1 | 1 |
| @leithaus | 1 | 1 |

### New Contributors

- @AndriiS-DevBrother (1 commit)
- @Lucius Meredith (1 commit)
- @MarcinR-DevBrother (1 commit)
- @NazarY-DevBrother (1 commit)
- @OleksandrK-DevBrother (1 commit)
- @dependabot[bot] (1 commit)
- @jeffrey-l-turner (1 commit)
- @leithaus (1 commit)
- @spreston8 (2 commits)

### Contributor Spotlight

<!-- AI_NARRATIVE_START: contributor_spotlight -->
A big thank you to everyone who contributed this month:

- **@spreston8** led Core Platform work with consensus fixes, deploy expiration, CI migration, and WebSocket improvements across f1r3node and rust-client
- **@IhorR-DevBrother** drove embers-frontend forward with 10 PRs covering agent management, typesafe i18n, dashboard simplification, Docker fixes, and demo preparation
- **@OleksandrK-DevBrother** built the OSLF editor from the ground up -- editor component, sidebar, and tree view across 3 key PRs
- **@NazarY-DevBrother** tackled critical division-by-zero crashes and stack overflow issues in f1r3node
- **@AndriiS-DevBrother** completed the whitelabel rebranding effort across both Scala and Rust codebases plus the rust-client
- **@leithaus** contributed to MeTTa research work
<!-- AI_NARRATIVE_END -->

---

## Get Involved

### Open Issues

| Repository | Open Issues | Link |
|------------|-------------|------|
| f1r3fly | 52 | [Browse issues](https://github.com/F1R3FLY-io/f1r3fly/issues) |
| rholang-rs | 27 | [Browse issues](https://github.com/F1R3FLY-io/rholang-rs/issues) |
| embers | 15 | [Browse issues](https://github.com/F1R3FLY-io/embers/issues) |
| MeTTa | 12 | [Browse issues](https://github.com/F1R3FLY-io/MeTTa/issues) |
| f1r3sky | 8 | [Browse issues](https://github.com/F1R3FLY-io/f1r3sky/issues) |
| Sankey_block_explorer | 5 | [Browse issues](https://github.com/F1R3FLY-io/Sankey_block_explorer/issues) |
| F1R3FLYFS | 5 | [Browse issues](https://github.com/F1R3FLY-io/F1R3FLYFS/issues) |
| graph-to-rholang-parser | 4 | [Browse issues](https://github.com/F1R3FLY-io/graph-to-rholang-parser/issues) |
| rust-client | 4 | [Browse issues](https://github.com/F1R3FLY-io/rust-client/issues) |
| F1R3FLY-io.github.io | 3 | [Browse issues](https://github.com/F1R3FLY-io/F1R3FLY-io.github.io/issues) |
| embers-frontend | 2 | [Browse issues](https://github.com/F1R3FLY-io/embers-frontend/issues) |
| f1r3drive-extension | 2 | [Browse issues](https://github.com/F1R3FLY-io/f1r3drive-extension/issues) |
| rholang-language-server | 1 | [Browse issues](https://github.com/F1R3FLY-io/rholang-language-server/issues) |
| IaC | 1 | [Browse issues](https://github.com/F1R3FLY-io/IaC/issues) |

### How to Contribute

<!-- AI_NARRATIVE_START: how_to_contribute -->
Looking to get involved? Here are some ways to contribute:

- **rholang-rs** (27 open issues) -- The Rust implementation of the Rholang interpreter has the most open issues and could use help with parser improvements, test coverage, and documentation
- **embers** (15 open issues) -- The F1R3Sky wallet and agent framework has issues spanning Python tooling and smart contract integration
- **MeTTa** (12 open issues) -- Research-oriented work on the MeTTa intermediate language is a great fit for those interested in language design and formal methods
- **rust-client** (4 open issues) -- Small, focused Rust codebase for interacting with f1r3node -- good for Rust developers looking for a manageable entry point
- **Documentation** -- The F1R3FLY-io.github.io website has 3 open issues and is always a welcoming place for first contributions

Check the issue trackers linked above, and feel free to ask questions on any issue before starting work.
<!-- AI_NARRATIVE_END -->

---

## Coming Soon

### Upcoming Milestones

| Project | Milestone | Progress | Due |
|---------|-----------|----------|-----|
| embers | choreographer | 100% (1/1) | TBD |

### Roadmap Preview

<!-- AI_NARRATIVE_START: roadmap_preview -->
Active development areas heading into March:

- **f1r3node Production Readiness**: With consensus stability and whitelabel rebranding complete, the focus shifts to integration testing and monitoring the self-hosted CI infrastructure
- **OSLF Editor Maturation**: The editor, sidebar, and tree view components are functional -- expect continued refinement and a demo-ready build for stakeholder review
- **Deploy Expiration Integration**: The time-based deploy expiration feature is available in both f1r3node and rust-client -- tooling and documentation will follow
- **MeTTa Research**: Ongoing work on the MeTTa intermediate language with 6 commits this period suggesting active exploration
<!-- AI_NARRATIVE_END -->

---

## Community

<!-- AI_NARRATIVE_START: community_notes -->
- Visit the F1R3FLY.io organization on GitHub: [github.com/F1R3FLY-io](https://github.com/F1R3FLY-io)
- Learn about Rholang and process calculus-based concurrent programming at the [Rholang repository](https://github.com/F1R3FLY-io/rholang)
- Explore hyper-dimensional computing research with [MeTTa](https://github.com/F1R3FLY-io/MeTTa)
- Questions or ideas? Open an issue on any repository or reach out at f1r3fly.ceo@gmail.com
<!-- AI_NARRATIVE_END -->

---

_Report generated by F1R3FLY.io Community Report System_
