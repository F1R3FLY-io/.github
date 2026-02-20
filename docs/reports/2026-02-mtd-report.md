---
doc_type: mtd-report
period: 2026-02
generated_at: 2026-02-20T15:56:38Z
generated_by: generate-github-status-report.sh
---

# F1R3FLY.io Month-to-Date Status Report

**Period:** February 2026 (Month-to-Date)
**Generated:** 2026-02-20T15:56:38Z

---

## Executive Summary

### Key Metrics

| Metric | This Month | Previous Month | Change |
|--------|------------|----------------|--------|
| Total Commits | 116 | - | - |
| Merged PRs | 42 | - | - |
| Closed Issues | 21 | - | - |
| Open Issues | 135 | - | - |
| Active Repos | 7/25 | - | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_summary -->
Strong momentum through the first 20 days of February with 116 commits, 42 merged PRs, and 21 issues closed across 7 active repos. The f1r3fly core platform leads with 70 commits focused on consensus stability, whitelabeling (removing hardcoded REV references), CI migration to self-hosted runners, and time-based deploy expiration. The embers-frontend saw heavy development with 13 merged PRs covering OSLF integration, i18n, dashboard simplification, and agent team improvements. The rust-client added deploy expiration support and removed hardcoded branding.
<!-- AI_NARRATIVE_END -->


---

## Core Platform

**Category Totals:** 70 commits, 24 merged PRs, 17 issues closed


### f1r3fly

No description

| Metric | Value |
|--------|-------|
| Commits | 70 |
| Merged PRs | 24 |
| Closed Issues | 17 |
| Open Issues | 50 |

**Merged PRs:**
- [#404](https://github.com/F1R3FLY-io/f1r3node/pull/404) - chore: remove integration-tests, update CI, fix aarch64 RUSTFLAGS (@spreston8, 2026-02-20)
- [#403](https://github.com/F1R3FLY-io/f1r3node/pull/403) - chore: remove integration-tests and update CI (@spreston8, 2026-02-20)
- [#402](https://github.com/F1R3FLY-io/f1r3node/pull/402) - ci: migrate Rust CI to self-hosted runners (@spreston8, 2026-02-19)
- [#401](https://github.com/F1R3FLY-io/f1r3node/pull/401) - - fix: resolve stack overflow in casper debug tests (#305, #306); [WIP] (@NazarY-DevBrother, 2026-02-19)
- [#400](https://github.com/F1R3FLY-io/f1r3node/pull/400) - Backport Scala PR #391: Fix consensus non-determinism and improve Proposer crash resilience (@spreston8, 2026-02-19)
- [#398](https://github.com/F1R3FLY-io/f1r3node/pull/398) - RUST - feat: Remove hardcoded REV references (Rust/Rholang/Python/Config/Docs) #396 (@AndriiS-DevBrother, 2026-02-18)
- [#397](https://github.com/F1R3FLY-io/f1r3node/pull/397) - SCALA - feat: Remove all hardcoded REV and rchain brand references #396 (@AndriiS-DevBrother, 2026-02-18)
- [#391](https://github.com/F1R3FLY-io/f1r3node/pull/391) - SCALA - Fix consensus non-determinism and improve Proposer crash resilience (@spreston8, 2026-02-19)
- [#390](https://github.com/F1R3FLY-io/f1r3node/pull/390) - RUST - WebSocket event fixes and local development setup (@spreston8, 2026-02-06)
- [#389](https://github.com/F1R3FLY-io/f1r3node/pull/389) - RUST - remove node-cli crate and fix build configuration (@spreston8, 2026-02-06)
- [#387](https://github.com/F1R3FLY-io/f1r3node/pull/387) - SCALA - Implement time-based deploy expiration (Issue #382) (@spreston8, 2026-02-08)
- [#386](https://github.com/F1R3FLY-io/f1r3node/pull/386) - RUST - Fix genesis validator race condition + Time-based deploy expiration (@spreston8, 2026-02-06)
- [#381](https://github.com/F1R3FLY-io/f1r3node/pull/381) - SCALA - Fix genesis validator race condition where ApprovedBlock is dropped (@spreston8, 2026-02-04)
- [#380](https://github.com/F1R3FLY-io/f1r3node/pull/380) - Adds logging and metrics for block timing observability to the Rust code base, backport; (@NazarY-DevBrother, 2026-02-03)
- [#378](https://github.com/F1R3FLY-io/f1r3node/pull/378) - SCALA - update Prometheus metric and Grafana dashboard prefixes from `rchain` to `f1r3fly` (align with Rust) (@AndriiS-DevBrother, 2026-02-02)


**Notes:**
<!-- AI_NARRATIVE_START: f1r3fly -->
February focused on platform stability and whitelabeling. @spreston8 fixed consensus non-determinism and Proposer crash resilience (#391, #400), resolved the genesis validator race condition (#381, #386), and implemented time-based deploy expiration (#387, #386). @AndriiS-DevBrother removed all hardcoded REV and rchain brand references in both Scala (#397) and Rust (#398), and rebased Prometheus/Grafana metric prefixes to `f1r3fly` (#378). @NazarY-DevBrother backported block timing observability (#380) and fixed stack overflow in Casper debug tests (#401). CI was migrated to self-hosted runners (#402) and integration tests were extracted to a separate repo (#403, #404). 17 issues closed including long-standing bugs around pending deploys (#294), system deploy consumption (#262), and stack overflows (#305, #306).
<!-- AI_NARRATIVE_END -->


---

## Frontend & Applications

**Category Totals:** 29 commits, 16 merged PRs, 3 issues closed


### embers

F1R3Sky wallets and agents

| Metric | Value |
|--------|-------|
| Commits | 7 |
| Merged PRs | 3 |
| Closed Issues | 0 |
| Open Issues | 12 |

**Merged PRs:**
- [#154](https://github.com/F1R3FLY-io/embers/pull/154) - Bump graphl-parser from 0.0.39 to 0.0.40 in the all group across 1 directory (@dependabot[bot], 2026-02-09)
- [#153](https://github.com/F1R3FLY-io/embers/pull/153) - Bump ruff from 0.14.14 to 0.15.0 in /packages/embers in the all group across 1 directory (@dependabot[bot], 2026-02-09)
- [#148](https://github.com/F1R3FLY-io/embers/pull/148) - Bump graphl-parser from 0.0.38 to 0.0.39 in the all group (@dependabot[bot], 2026-02-03)


**Notes:**
<!-- AI_NARRATIVE_START: embers -->
Dependency maintenance via dependabot: graphl-parser bumped from 0.0.38 to 0.0.40 (#148, #154) and ruff from 0.14.14 to 0.15.0 (#153). @IhorR-DevBrother contributed Docker fixes and dep bumps. No issues closed this period; 12 remain open.
<!-- AI_NARRATIVE_END -->


### embers-frontend

No description

| Metric | Value |
|--------|-------|
| Commits | 22 |
| Merged PRs | 13 |
| Closed Issues | 3 |
| Open Issues | 2 |

**Merged PRs:**
- [#192](https://github.com/F1R3FLY-io/embers-frontend/pull/192) - demo fixes (@IhorR-DevBrother, 2026-02-20)
- [#191](https://github.com/F1R3FLY-io/embers-frontend/pull/191) - typesafe i18n (@IhorR-DevBrother, 2026-02-18)
- [#190](https://github.com/F1R3FLY-io/embers-frontend/pull/190) - simplify dashboard (@IhorR-DevBrother, 2026-02-18)
- [#189](https://github.com/F1R3FLY-io/embers-frontend/pull/189) - OSLF sidebar and things (@OleksandrK-DevBrother, 2026-02-18)
- [#187](https://github.com/F1R3FLY-io/embers-frontend/pull/187) - remove tests from oslf package (@IhorR-DevBrother, 2026-02-13)
- [#186](https://github.com/F1R3FLY-io/embers-frontend/pull/186) - fix docker (@IhorR-DevBrother, 2026-02-12)
- [#185](https://github.com/F1R3FLY-io/embers-frontend/pull/185) - update agents team (@IhorR-DevBrother, 2026-02-12)
- [#184](https://github.com/F1R3FLY-io/embers-frontend/pull/184) - add agent gear icon functionality (@IhorR-DevBrother, 2026-02-11)
- [#183](https://github.com/F1R3FLY-io/embers-frontend/pull/183) - fix stuff (@IhorR-DevBrother, 2026-02-09)
- [#181](https://github.com/F1R3FLY-io/embers-frontend/pull/181) - agents bugfix (@IhorR-DevBrother, 2026-02-06)
- [#179](https://github.com/F1R3FLY-io/embers-frontend/pull/179) - Automated client update (@IhorR-DevBrother, 2026-02-02)
- [#178](https://github.com/F1R3FLY-io/embers-frontend/pull/178) - Oslf editor (@OleksandrK-DevBrother, 2026-02-11)
- [#177](https://github.com/F1R3FLY-io/embers-frontend/pull/177) - refactor agents (@IhorR-DevBrother, 2026-02-02)


**Notes:**
<!-- AI_NARRATIVE_START: embers-frontend -->
The most active frontend repo this month with 22 commits and 13 merged PRs. @IhorR-DevBrother drove the majority: agents refactoring (#177), bugfixes (#181, #183), agent gear icon (#184), agents team updates (#185), Docker fixes (#186), OSLF test cleanup (#187), dashboard simplification (#190), typesafe i18n (#191), and demo fixes (#192). @OleksandrK-DevBrother contributed the OSLF editor (#178) and sidebar integration (#189). Three issues closed including button unification (#58), dark/light mode (#37), and safe draft actions review (#176).
<!-- AI_NARRATIVE_END -->


### f1r3sky

F1R3FLY BlueSky fork

| Metric | Value |
|--------|-------|
| Commits | 0 |
| Merged PRs | 0 |
| Closed Issues | 0 |
| Open Issues | 8 |

**Merged PRs:**
_No PRs merged this period_
_No activity this period_

**Notes:**
<!-- AI_NARRATIVE_START: f1r3sky -->
No merged PRs or commits this period. One new issue opened; 1 PR remains open for review. 8 open issues total.
<!-- AI_NARRATIVE_END -->


### f1r3sky-client

The F1r3Fly Social application for Web, iOS, and Android

| Metric | Value |
|--------|-------|
| Commits | 0 |
| Merged PRs | 0 |
| Closed Issues | 0 |
| Open Issues | 0 |

**Merged PRs:**
_No PRs merged this period_
_No activity this period_

**Notes:**
<!-- AI_NARRATIVE_START: f1r3sky-client -->
No activity this period.
<!-- AI_NARRATIVE_END -->


### f1r3sky-backend-rs

_Repository not found or inaccessible_


### f1r3sky-backend-ts

F1R3FLY BlueSky backend one.

| Metric | Value |
|--------|-------|
| Commits | 0 |
| Merged PRs | 0 |
| Closed Issues | 0 |
| Open Issues | 0 |

**Merged PRs:**
_No PRs merged this period_
_No activity this period_

**Notes:**
<!-- AI_NARRATIVE_START: f1r3sky-backend-ts -->
No activity this period.
<!-- AI_NARRATIVE_END -->


### lightning-bug

A modern, extensible, browser-based code editor.

| Metric | Value |
|--------|-------|
| Commits | 0 |
| Merged PRs | 0 |
| Closed Issues | 0 |
| Open Issues | 0 |

**Merged PRs:**
_No PRs merged this period_
_No activity this period_

**Notes:**
<!-- AI_NARRATIVE_START: lightning-bug -->
No activity this period.
<!-- AI_NARRATIVE_END -->


---

## Planned Work for Next Month

### Open Milestones

_No open milestones found_

### Priority Issues

<!-- Priority issues will be populated from labeled issues -->
_Priority issues are identified by labels: priority, critical, next, planned_

### Focus Areas

<!-- AI_NARRATIVE_START: planned_work -->
The f1r3fly platform has 18 open PRs continuing the Scala-to-Rust backport effort, including caching, mergeable channels, and status reporting features. The rholang-rs repo has 17 open PRs with @MarcinR-DevBrother contributing partial tests. The embers-frontend OSLF integration work continues with the remaining 10 days of February. The graph-to-rholang-parser has 2 open PRs for dependency updates.
<!-- AI_NARRATIVE_END -->

---

## Contributors This Month

| Contributor | Commits |
|-------------|---------|
| IhorR-DevBrother | 3 |
| spreston8 | 2 |
| AndriiS-DevBrother | 1 |
| MarcinR-DevBrother | 1 |
| NazarY-DevBrother | 1 |
| OleksandrK-DevBrother | 1 |
| dependabot[bot] | 1 |
| jeffrey-l-turner | 1 |

### Community Notes

<!-- AI_NARRATIVE_START: community -->
8 contributors active this month. @spreston8 led with heavy f1r3fly core platform work (consensus fixes, CI migration, deploy expiration). @IhorR-DevBrother drove embers-frontend with 11 PRs covering agents, OSLF, i18n, and demo prep. @AndriiS-DevBrother completed the whitelabeling effort across f1r3fly and rust-client. @OleksandrK-DevBrother contributed OSLF editor and sidebar features. @NazarY-DevBrother fixed Casper stack overflows and backported observability. New contributor @MarcinR-DevBrother began work on rholang-rs tests. @jeffrey-l-turner maintained the .github repo with infographic slides and skill consolidation.
<!-- AI_NARRATIVE_END -->

---

## Appendix: Raw Data

<details>
<summary>Click to expand raw metrics JSON</summary>

```json
[
  {
    "category": "Core Platform",
    "repos": [
      {
        "repo": "f1r3fly",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 13,
          "language": "Rust",
          "name": "f1r3node",
          "open_issues_count": 50,
          "pushed_at": "2026-02-20T15:21:35Z",
          "stargazers_count": 14
        },
        "issues": {
          "open_count": 50,
          "closed_in_period": 17,
          "opened_in_period": 9,
          "recent_closed": [
            {
              "number": 399,
              "title": "Inside block approver / genesis ceremony path some code is calling non-deterministic default_blessed_terms_with_timestamp instead of default_blessed_terms",
              "closed_at": "2026-02-17T18:34:10Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 396,
              "title": "Whitelabel node: remove hardcoded REV references, make token ticker configurable at shard creation",
              "closed_at": "2026-02-18T15:16:06Z",
              "labels": [
                "enhancement"
              ]
            },
            {
              "number": 393,
              "title": "Extract integration tests into system-integration repo (Scala + Rust)",
              "closed_at": "2026-02-20T03:46:16Z",
              "labels": [
                "enhancement"
              ]
            },
            {
              "number": 384,
              "title": "Manual propose during heartbeat propose breaks node",
              "closed_at": "2026-02-08T19:54:21Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 382,
              "title": "Add optional signed `expirationTimestamp` to deploys (time-based expiry)",
              "closed_at": "2026-02-19T06:41:51Z",
              "labels": [
                "enhancement"
              ]
            },
            {
              "number": 306,
              "title": "RUST: Integration test test_propose.py::test_find_block_by_deploy_id stack overflow with shortslow.rho and longslow.rho",
              "closed_at": "2026-02-20T08:54:33Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 305,
              "title": "RUST: Casper tests fail with stack overflow due to insufficient default thread stack size",
              "closed_at": "2026-02-20T08:54:54Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 294,
              "title": "Node reports “11 pending user deploys” that are always filtered.",
              "closed_at": "2026-02-20T05:31:36Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 279,
              "title": "Add ticker rename script test to CI",
              "closed_at": "2026-02-12T05:19:54Z",
              "labels": []
            },
            {
              "number": 262,
              "title": "casper-bug-fixes: Platform failure: Unable to consume results of system deploy",
              "closed_at": "2026-02-20T05:12:49Z",
              "labels": [
                "bug"
              ]
            }
          ]
        },
        "prs": {
          "merged_count": 24,
          "open_count": 18,
          "merged_prs": [
            {
              "number": 404,
              "title": "chore: remove integration-tests, update CI, fix aarch64 RUSTFLAGS",
              "merged_at": "2026-02-20T15:21:32Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/404",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 403,
              "title": "chore: remove integration-tests and update CI",
              "merged_at": "2026-02-20T15:20:12Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/403",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 402,
              "title": "ci: migrate Rust CI to self-hosted runners",
              "merged_at": "2026-02-19T07:58:57Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/402",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 401,
              "title": "- fix: resolve stack overflow in casper debug tests (#305, #306); [WIP]",
              "merged_at": "2026-02-19T14:11:17Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/401",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 400,
              "title": "Backport Scala PR #391: Fix consensus non-determinism and improve Proposer crash resilience",
              "merged_at": "2026-02-19T06:24:38Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/400",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 398,
              "title": "RUST - feat: Remove hardcoded REV references (Rust/Rholang/Python/Config/Docs) #396",
              "merged_at": "2026-02-18T15:16:05Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/398",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 397,
              "title": "SCALA - feat: Remove all hardcoded REV and rchain brand references #396",
              "merged_at": "2026-02-18T15:15:46Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/397",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 391,
              "title": "SCALA - Fix consensus non-determinism and improve Proposer crash resilience",
              "merged_at": "2026-02-19T08:00:06Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/391",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 390,
              "title": "RUST - WebSocket event fixes and local development setup",
              "merged_at": "2026-02-06T19:37:52Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/390",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 389,
              "title": "RUST - remove node-cli crate and fix build configuration",
              "merged_at": "2026-02-06T17:51:01Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/389",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 387,
              "title": "SCALA - Implement time-based deploy expiration (Issue #382)",
              "merged_at": "2026-02-08T16:56:37Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/387",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 386,
              "title": "RUST - Fix genesis validator race condition + Time-based deploy expiration",
              "merged_at": "2026-02-06T18:47:49Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/386",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 381,
              "title": "SCALA - Fix genesis validator race condition where ApprovedBlock is dropped",
              "merged_at": "2026-02-04T19:29:59Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/381",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 380,
              "title": "Adds logging and metrics for block timing observability to the Rust code base, backport;",
              "merged_at": "2026-02-03T20:06:04Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/380",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 378,
              "title": "SCALA - update Prometheus metric and Grafana dashboard prefixes from `rchain` to `f1r3fly` (align with Rust)",
              "merged_at": "2026-02-02T16:20:32Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/378",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 70,
          "contributors": [
            "AndriiS-DevBrother",
            "NazarY-DevBrother",
            "spreston8"
          ],
          "recent": [
            {
              "sha": "f2d21cc",
              "message": "Merge pull request #404 from F1R3FLY-io/rust/chore/remove-in...",
              "author": "spreston8",
              "date": "2026-02-20T15:21:31Z"
            },
            {
              "sha": "3015046",
              "message": "fix: always restart Docker daemon on CI to clear TIME_WAIT s...",
              "author": "spreston8",
              "date": "2026-02-20T04:45:14Z"
            },
            {
              "sha": "628cda5",
              "message": "docs: update integration-tests references to point to system...",
              "author": "spreston8",
              "date": "2026-02-20T04:34:32Z"
            },
            {
              "sha": "d53c62c",
              "message": "fix: move sigar reporter off async runtime and fix flaky tes...",
              "author": "spreston8",
              "date": "2026-02-20T04:10:13Z"
            },
            {
              "sha": "8d71fe2",
              "message": "fix: set RUSTFLAGS per-arch to suppress +sse2 warning on aar...",
              "author": "spreston8",
              "date": "2026-02-20T03:42:39Z"
            }
          ]
        },
        "milestones": []
      }
    ]
  },
  {
    "category": "Language & Compiler",
    "repos": [
      {
        "repo": "rholang-rs",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 2,
          "language": "Rust",
          "name": "rholang-rs",
          "open_issues_count": 29,
          "pushed_at": "2026-02-18T17:27:10Z",
          "stargazers_count": 4
        },
        "issues": {
          "open_count": 29,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 17,
          "merged_prs": []
        },
        "commits": {
          "count": 1,
          "contributors": [
            "MarcinR-DevBrother"
          ],
          "recent": [
            {
              "sha": "cdadd95",
              "message": "Partial tests for #371",
              "author": "MarcinR-DevBrother",
              "date": "2026-02-18T17:27:02Z"
            }
          ]
        },
        "milestones": []
      },
      {
        "repo": "rholang-language-server",
        "exists": true,
        "info": {
          "archived": false,
          "description": "LSP-based Language Server for Rholang (Language Server Protocol).",
          "forks_count": 1,
          "language": "Rust",
          "name": "rholang-language-server",
          "open_issues_count": 1,
          "pushed_at": "2025-11-17T20:29:38Z",
          "stargazers_count": 1
        },
        "issues": {
          "open_count": 1,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "rholang",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 0,
          "language": null,
          "name": "rholang",
          "open_issues_count": 0,
          "pushed_at": "2025-08-12T10:36:36Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "graph-to-rholang-parser",
        "exists": true,
        "info": {
          "archived": false,
          "description": "Graph to RhoLang parser",
          "forks_count": 0,
          "language": "C",
          "name": "graphl-parser",
          "open_issues_count": 3,
          "pushed_at": "2026-02-16T18:26:53Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 3,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 2,
          "merged_prs": []
        },
        "commits": {
          "count": 2,
          "contributors": [
            "IhorR-DevBrother"
          ],
          "recent": [
            {
              "sha": "1a7307a",
              "message": "Apply package.json changes for js bindings",
              "author": "IhorR-DevBrother",
              "date": "2026-02-03T15:22:45Z"
            },
            {
              "sha": "8e04eb1",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-02-03T15:04:48Z"
            }
          ]
        },
        "milestones": []
      },
      {
        "repo": "rholang-nvim",
        "exists": true,
        "info": {
          "archived": false,
          "description": "Neovim support for Rholang (LSP Client)",
          "forks_count": 0,
          "language": "Lua",
          "name": "rholang-nvim",
          "open_issues_count": 0,
          "pushed_at": "2025-10-31T17:40:25Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "rholang-vscode-client",
        "exists": true,
        "info": {
          "archived": false,
          "description": "Rholang support for VSCode.",
          "forks_count": 0,
          "language": "TypeScript",
          "name": "rholang-vscode-client",
          "open_issues_count": 0,
          "pushed_at": "2025-11-17T20:31:40Z",
          "stargazers_count": 1
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      }
    ]
  },
  {
    "category": "Frontend & Applications",
    "repos": [
      {
        "repo": "embers",
        "exists": true,
        "info": {
          "archived": false,
          "description": "F1R3Sky wallets and agents",
          "forks_count": 1,
          "language": "Rust",
          "name": "embers",
          "open_issues_count": 12,
          "pushed_at": "2026-02-16T10:53:32Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 12,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 3,
          "open_count": 2,
          "merged_prs": [
            {
              "number": 154,
              "title": "Bump graphl-parser from 0.0.39 to 0.0.40 in the all group across 1 directory",
              "merged_at": "2026-02-09T11:09:12Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/154",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 153,
              "title": "Bump ruff from 0.14.14 to 0.15.0 in /packages/embers in the all group across 1 directory",
              "merged_at": "2026-02-09T11:09:28Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/153",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 148,
              "title": "Bump graphl-parser from 0.0.38 to 0.0.39 in the all group",
              "merged_at": "2026-02-03T14:30:47Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/148",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 7,
          "contributors": [
            "IhorR-DevBrother",
            "dependabot[bot]"
          ],
          "recent": [
            {
              "sha": "28e50d4",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-02-16T10:50:58Z"
            },
            {
              "sha": "b415b3b",
              "message": "Bump ruff in /packages/embers in the all group across 1 dire...",
              "author": "dependabot[bot]",
              "date": "2026-02-09T11:09:28Z"
            },
            {
              "sha": "1322a0e",
              "message": "Bump graphl-parser in the all group across 1 directory (#154...",
              "author": "dependabot[bot]",
              "date": "2026-02-09T11:09:12Z"
            },
            {
              "sha": "0d8c9f4",
              "message": "fix",
              "author": "IhorR-DevBrother",
              "date": "2026-02-09T11:08:05Z"
            },
            {
              "sha": "17062fb",
              "message": "fix docker",
              "author": "IhorR-DevBrother",
              "date": "2026-02-09T11:01:56Z"
            }
          ]
        },
        "milestones": [
          {
            "closed_issues": 1,
            "description": "",
            "due_on": null,
            "open_issues": 0,
            "progress": 100,
            "state": "open",
            "title": "choreographer",
            "url": "https://github.com/F1R3FLY-io/embers/milestone/1"
          }
        ]
      },
      {
        "repo": "embers-frontend",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 1,
          "language": "TypeScript",
          "name": "embers-frontend",
          "open_issues_count": 2,
          "pushed_at": "2026-02-20T13:45:19Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 2,
          "closed_in_period": 3,
          "opened_in_period": 0,
          "recent_closed": [
            {
              "number": 176,
              "title": "review safe draft actions",
              "closed_at": "2026-02-18T11:53:30Z",
              "labels": []
            },
            {
              "number": 58,
              "title": "Unify button usage across embers",
              "closed_at": "2026-02-18T11:53:50Z",
              "labels": []
            },
            {
              "number": 37,
              "title": "dark/light",
              "closed_at": "2026-02-18T11:53:37Z",
              "labels": []
            }
          ]
        },
        "prs": {
          "merged_count": 13,
          "open_count": 1,
          "merged_prs": [
            {
              "number": 192,
              "title": "demo fixes",
              "merged_at": "2026-02-20T13:17:14Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/192",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 191,
              "title": "typesafe i18n",
              "merged_at": "2026-02-18T13:39:56Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/191",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 190,
              "title": "simplify dashboard",
              "merged_at": "2026-02-18T11:27:09Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/190",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 189,
              "title": "OSLF sidebar and things",
              "merged_at": "2026-02-18T11:27:27Z",
              "user": "OleksandrK-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/189",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 187,
              "title": "remove tests from oslf package",
              "merged_at": "2026-02-13T12:58:27Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/187",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 186,
              "title": "fix docker",
              "merged_at": "2026-02-12T15:43:27Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/186",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 185,
              "title": "update agents team",
              "merged_at": "2026-02-12T15:08:48Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/185",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 184,
              "title": "add agent gear icon functionality",
              "merged_at": "2026-02-11T15:49:16Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/184",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 183,
              "title": "fix stuff",
              "merged_at": "2026-02-09T17:43:14Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/183",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 181,
              "title": "agents bugfix",
              "merged_at": "2026-02-06T10:40:03Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/181",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 179,
              "title": "Automated client update",
              "merged_at": "2026-02-02T10:56:07Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/179",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 178,
              "title": "Oslf editor",
              "merged_at": "2026-02-11T17:59:40Z",
              "user": "OleksandrK-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/178",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 177,
              "title": "refactor agents",
              "merged_at": "2026-02-02T12:30:08Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/177",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 22,
          "contributors": [
            "IhorR-DevBrother",
            "OleksandrK-DevBrother"
          ],
          "recent": [
            {
              "sha": "3311862",
              "message": "demo fixes (#192)",
              "author": "IhorR-DevBrother",
              "date": "2026-02-20T13:17:14Z"
            },
            {
              "sha": "b49d233",
              "message": "typesafe i18n (#191)",
              "author": "IhorR-DevBrother",
              "date": "2026-02-18T13:39:56Z"
            },
            {
              "sha": "73c2b04",
              "message": "OSLF sidebar and things (#189)",
              "author": "OleksandrK-DevBrother",
              "date": "2026-02-18T11:27:27Z"
            },
            {
              "sha": "5b56cfa",
              "message": "simplify dashboard (#190)",
              "author": "IhorR-DevBrother",
              "date": "2026-02-18T11:27:09Z"
            },
            {
              "sha": "b090ebb",
              "message": "Apply package.json changes",
              "author": "OleksandrK-DevBrother",
              "date": "2026-02-13T13:01:51Z"
            }
          ]
        },
        "milestones": []
      },
      {
        "repo": "f1r3sky",
        "exists": true,
        "info": {
          "archived": false,
          "description": "F1R3FLY BlueSky fork",
          "forks_count": 2,
          "language": "TypeScript",
          "name": "f1r3sky",
          "open_issues_count": 8,
          "pushed_at": "2026-02-16T17:55:57Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 8,
          "closed_in_period": 0,
          "opened_in_period": 1,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 1,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "f1r3sky-client",
        "exists": true,
        "info": {
          "archived": false,
          "description": "The F1r3Fly Social application for Web, iOS, and Android",
          "forks_count": 0,
          "language": null,
          "name": "f1r3sky-client",
          "open_issues_count": 0,
          "pushed_at": "2025-06-25T13:06:47Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "f1r3sky-backend-rs",
        "error": "not_found",
        "exists": false
      },
      {
        "repo": "f1r3sky-backend-ts",
        "exists": true,
        "info": {
          "archived": false,
          "description": "F1R3FLY BlueSky backend one.",
          "forks_count": 1,
          "language": "TypeScript",
          "name": "f1r3sky-backend",
          "open_issues_count": 0,
          "pushed_at": "2025-11-05T13:33:03Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "lightning-bug",
        "exists": true,
        "info": {
          "archived": false,
          "description": "A modern, extensible, browser-based code editor.",
          "forks_count": 1,
          "language": "Clojure",
          "name": "lightning-bug",
          "open_issues_count": 0,
          "pushed_at": "2025-10-28T18:25:38Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      }
    ]
  },
  {
    "category": "Developer Tools",
    "repos": [
      {
        "repo": "F1r3bu1ld3r",
        "exists": true,
        "info": {
          "archived": false,
          "description": "Visualization tool to produce Infrastructure as Code in DePin and cloud environments",
          "forks_count": 0,
          "language": null,
          "name": "F1r3bu1ld3r",
          "open_issues_count": 0,
          "pushed_at": "2025-06-20T13:29:32Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "rust-client",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 4,
          "language": "Rust",
          "name": "rust-client",
          "open_issues_count": 2,
          "pushed_at": "2026-02-18T15:31:32Z",
          "stargazers_count": 2
        },
        "issues": {
          "open_count": 2,
          "closed_in_period": 1,
          "opened_in_period": 0,
          "recent_closed": [
            {
              "number": 1,
              "title": "Add multi token support for smart contracts",
              "closed_at": "2026-02-18T16:00:34Z",
              "labels": []
            }
          ]
        },
        "prs": {
          "merged_count": 2,
          "open_count": 0,
          "merged_prs": [
            {
              "number": 9,
              "title": "Remove hardcoded REV references",
              "merged_at": "2026-02-18T15:31:32Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/9",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 7,
              "title": "Add deploy expiration timestamp support",
              "merged_at": "2026-02-06T19:46:45Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/7",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 3,
          "contributors": [
            "spreston8"
          ],
          "recent": [
            {
              "sha": "7b249ad",
              "message": "Revert \"Add deploy expiration timestamp support (#7)\"",
              "author": "spreston8",
              "date": "2026-02-06T22:12:10Z"
            },
            {
              "sha": "be8f748",
              "message": "Add deploy expiration timestamp support (#7)",
              "author": "spreston8",
              "date": "2026-02-06T19:46:45Z"
            },
            {
              "sha": "bce9cb4",
              "message": "smoke_test: build release first, portable timeout for macOS",
              "author": "spreston8",
              "date": "2026-02-02T18:29:00Z"
            }
          ]
        },
        "milestones": []
      },
      {
        "repo": "IaC",
        "exists": true,
        "info": {
          "archived": false,
          "description": "Python code to deploy cloud infrastructure",
          "forks_count": 0,
          "language": "Python",
          "name": "IaC",
          "open_issues_count": 1,
          "pushed_at": "2025-07-23T18:22:14Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 1,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "f1r3drive-extension",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 0,
          "language": "Swift",
          "name": "f1r3drive-extension",
          "open_issues_count": 2,
          "pushed_at": "2025-06-24T13:19:31Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 2,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "Sankey_block_explorer",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 1,
          "language": "TypeScript",
          "name": "Sankey_block_explorer",
          "open_issues_count": 5,
          "pushed_at": "2026-01-21T19:43:35Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 5,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 1,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      }
    ]
  },
  {
    "category": "Research & Language Dev",
    "repos": [
      {
        "repo": "MeTTa",
        "exists": true,
        "info": {
          "archived": false,
          "description": "MeTTa Intermediate Language",
          "forks_count": 1,
          "language": "Scala",
          "name": "MeTTaIL",
          "open_issues_count": 12,
          "pushed_at": "2026-01-24T07:58:29Z",
          "stargazers_count": 3
        },
        "issues": {
          "open_count": 12,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "bnfc",
        "exists": true,
        "info": {
          "archived": false,
          "description": "BNF Converter",
          "forks_count": 0,
          "language": null,
          "name": "bnfc",
          "open_issues_count": 0,
          "pushed_at": "2025-06-23T19:27:15Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": "F1R3FLYFS",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 2,
          "language": "Java",
          "name": "f1r3drive",
          "open_issues_count": 5,
          "pushed_at": "2026-02-02T14:07:02Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 5,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 2,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      }
    ]
  },
  {
    "category": "Documentation & Governance",
    "repos": [
      {
        "repo": "F1R3FLY-io.github.io",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 0,
          "language": "HTML",
          "name": "F1R3FLY-io.github.io",
          "open_issues_count": 3,
          "pushed_at": "2025-08-20T20:41:19Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 3,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      },
      {
        "repo": ".github",
        "exists": true,
        "info": {
          "archived": false,
          "description": "Public contributor guidelines and templates",
          "forks_count": 0,
          "language": "Shell",
          "name": ".github",
          "open_issues_count": 0,
          "pushed_at": "2026-02-20T15:40:32Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 11,
          "contributors": [
            "jeffrey-l-turner"
          ],
          "recent": [
            {
              "sha": "de53e19",
              "message": "feat(skills): consolidate /github-activity-report into /gene...",
              "author": "jeffrey-l-turner",
              "date": "2026-02-20T15:36:21Z"
            },
            {
              "sha": "339a7c4",
              "message": "docs(infographics): add slide 08 why BFT vs CFT high-level w...",
              "author": "jeffrey-l-turner",
              "date": "2026-02-13T17:04:14Z"
            },
            {
              "sha": "336da7e",
              "message": "docs(infographics): embed logo as inline base64 data URI in ...",
              "author": "jeffrey-l-turner",
              "date": "2026-02-13T16:25:49Z"
            },
            {
              "sha": "7dcc81e",
              "message": "docs(infographics): add cloud service parallels slide 07 and...",
              "author": "jeffrey-l-turner",
              "date": "2026-02-13T16:20:52Z"
            },
            {
              "sha": "121c338",
              "message": "docs(infographics): add product offering sheet slide 06 with...",
              "author": "jeffrey-l-turner",
              "date": "2026-02-13T15:54:01Z"
            }
          ]
        },
        "milestones": []
      },
      {
        "repo": "fflip",
        "exists": true,
        "info": {
          "archived": false,
          "description": "F1R3FLY improvement proposals",
          "forks_count": 0,
          "language": null,
          "name": "fflip",
          "open_issues_count": 0,
          "pushed_at": "2025-10-27T06:54:08Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 0,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": []
      }
    ]
  }
]
```

</details>

---

_Report generated by F1R3FLY.io Status Report System_
