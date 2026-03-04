---
doc_type: monthly-report
period: 2026-02
generated_at: 2026-03-04T17:26:41Z
generated_by: generate-github-status-report.sh
---

# F1R3FLY.io Monthly Status Report

**Period:** February 2026
**Generated:** 2026-03-04T17:26:41Z

---

## Executive Summary

### Key Metrics

| Metric | This Month | Previous Month | Change |
|--------|------------|----------------|--------|
| Total Commits | 125 | - | - |
| Merged PRs | 47 | - | - |
| Closed Issues | 21 | - | - |
| Open Issues | 147 | - | - |
| Active Repos | 8/25 | - | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_summary -->
February saw concentrated activity on Core Platform (71 commits, 28 merged PRs) and Frontend (30 commits, 17 merged PRs), with 8 of 25 repositories active. The f1r3fly/f1r3node repository dominated with consensus stability fixes (#391, #400), whitelabel rebranding to remove hardcoded REV references (#396-#398), division-by-zero crash fixes (#406-#412), and CI migration to self-hosted runners (#402-#404). Embers-frontend shipped 14 PRs focused on the OSLF editor and sidebar (#178, #189, #193), agent management improvements, typesafe i18n (#191), and demo preparation (#192). Dependency updates via Dependabot kept the embers wallet current. Five frontend repositories (f1r3sky, f1r3sky-client, f1r3sky-backend-ts, lightning-bug) remained dormant.
<!-- AI_NARRATIVE_END -->


---

## Core Platform

**Category Totals:** 71 commits, 28 merged PRs, 17 issues closed


### f1r3fly

No description

| Metric | Value |
|--------|-------|
| Commits | 71 |
| Merged PRs | 28 |
| Closed Issues | 17 |
| Open Issues | 57 |

**Merged PRs:**
- [#412](https://github.com/F1R3FLY-io/f1r3node/pull/412) - Revert "- fixed division by zero crashes; (#406)" (@NazarY-DevBrother, 2026-02-25)
- [#411](https://github.com/F1R3FLY-io/f1r3node/pull/411) - cherry-pick for division by zero crashes (@NazarY-DevBrother, 2026-02-25)
- [#408](https://github.com/F1R3FLY-io/f1r3node/pull/408) - fixed division by zero crashes for rust (@NazarY-DevBrother, 2026-02-25)
- [#406](https://github.com/F1R3FLY-io/f1r3node/pull/406) - fixed division by zero crashes (@NazarY-DevBrother, 2026-02-25)
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


**Notes:**
<!-- AI_NARRATIVE_START: f1r3fly -->
Heavy month for f1r3node with 71 commits and 28 merged PRs across Scala and Rust codebases. @spreston8 fixed consensus non-determinism and improved Proposer crash resilience (#391, #400), implemented time-based deploy expiration (#387), migrated Rust CI to self-hosted runners (#402), and cleaned up the node-cli crate and build configuration (#389, #403-#404). @AndriiS-DevBrother completed whitelabel rebranding by removing hardcoded REV/rchain references across both Scala (#397) and Rust (#398) codebases. @NazarY-DevBrother addressed division-by-zero crashes (#406, #408) with a cherry-pick cycle (#411, #412) and resolved stack overflow issues in Casper debug tests (#401). 17 issues closed, with 57 remaining open.
<!-- AI_NARRATIVE_END -->


---

## Frontend & Applications

**Category Totals:** 30 commits, 17 merged PRs, 3 issues closed


### embers

F1R3Sky wallets and agents

| Metric | Value |
|--------|-------|
| Commits | 7 |
| Merged PRs | 3 |
| Closed Issues | 0 |
| Open Issues | 14 |

**Merged PRs:**
- [#154](https://github.com/F1R3FLY-io/embers/pull/154) - Bump graphl-parser from 0.0.39 to 0.0.40 in the all group across 1 directory (@dependabot[bot], 2026-02-09)
- [#153](https://github.com/F1R3FLY-io/embers/pull/153) - Bump ruff from 0.14.14 to 0.15.0 in /packages/embers in the all group across 1 directory (@dependabot[bot], 2026-02-09)
- [#148](https://github.com/F1R3FLY-io/embers/pull/148) - Bump graphl-parser from 0.0.38 to 0.0.39 in the all group (@dependabot[bot], 2026-02-03)


**Notes:**
<!-- AI_NARRATIVE_START: embers -->
Embers activity was limited to automated dependency bumps via Dependabot: graphl-parser upgraded twice (0.0.38 to 0.0.40 in #148, #154) and ruff bumped from 0.14.14 to 0.15.0 (#153). No feature development or issue closures this period. 14 open issues remain.
<!-- AI_NARRATIVE_END -->


### embers-frontend

No description

| Metric | Value |
|--------|-------|
| Commits | 23 |
| Merged PRs | 14 |
| Closed Issues | 3 |
| Open Issues | 2 |

**Merged PRs:**
- [#193](https://github.com/F1R3FLY-io/embers-frontend/pull/193) - Oslf tree view (@OleksandrK-DevBrother, 2026-02-25)
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
The most active frontend repo with 23 commits and 14 merged PRs. @OleksandrK-DevBrother built out the OSLF (On-chain Smart Legal Form) subsystem: editor component (#178), sidebar and navigation (#189), and tree view (#193). @IhorR-DevBrother drove agent management improvements (#177, #181, #184, #185), added typesafe i18n (#191), simplified the dashboard (#190), fixed Docker configuration (#186), and prepared the demo build (#192). Three issues closed, with 2 remaining open.
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
No activity this period. 8 open issues remain from prior work on the BlueSky fork.
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
Continued stabilization of f1r3node across Scala and Rust codebases, with 57 open issues to address. The OSLF subsystem in embers-frontend is maturing and likely to see further iteration on tree view and editor features. CI infrastructure improvements (self-hosted runners) should reduce build times. The dormant f1r3sky and lightning-bug repositories may see renewed activity depending on roadmap prioritization.
<!-- AI_NARRATIVE_END -->

---

## Contributors This Month

| Contributor | Commits |
|-------------|---------|
| IhorR-DevBrother | 3 |
| spreston8 | 2 |
| AndriiS-DevBrother | 1 |
| Lucius Meredith | 1 |
| MarcinR-DevBrother | 1 |
| NazarY-DevBrother | 1 |
| OleksandrK-DevBrother | 1 |
| dependabot[bot] | 1 |
| jeffrey-l-turner | 1 |
| leithaus | 1 |

### Community Notes

<!-- AI_NARRATIVE_START: community -->
The DevBrother team drove the majority of February's output: @IhorR-DevBrother led frontend contributions (3 commit authors), @NazarY-DevBrother and @AndriiS-DevBrother tackled critical platform fixes, and @OleksandrK-DevBrother built out the OSLF editor. @spreston8 anchored core platform work with consensus, CI, and architecture improvements. @leithaus and @jeffrey-l-turner contributed across repositories. Dependabot kept dependencies current in the embers wallet.
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
          "open_issues_count": 57,
          "pushed_at": "2026-03-04T09:00:02Z",
          "stargazers_count": 14
        },
        "issues": {
          "open_count": 57,
          "closed_in_period": 17,
          "opened_in_period": 10,
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
          "merged_count": 28,
          "open_count": 25,
          "merged_prs": [
            {
              "number": 412,
              "title": "Revert \"- fixed division by zero crashes; (#406)\"",
              "merged_at": "2026-02-25T17:19:24Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/412",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 411,
              "title": "cherry-pick for division by zero crashes",
              "merged_at": "2026-02-25T17:56:09Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/411",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 408,
              "title": "fixed division by zero crashes for rust",
              "merged_at": "2026-02-25T16:56:16Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/408",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 406,
              "title": "fixed division by zero crashes",
              "merged_at": "2026-02-25T14:23:49Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/406",
              "additions": null,
              "deletions": null,
              "comments": null
            },
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
            }
          ]
        },
        "commits": {
          "count": 71,
          "contributors": [
            "AndriiS-DevBrother",
            "NazarY-DevBrother",
            "spreston8"
          ],
          "recent": [
            {
              "sha": "da4db4e",
              "message": "fixed division by zero crashes for rust (#408)",
              "author": "NazarY-DevBrother",
              "date": "2026-02-25T16:56:16Z"
            },
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
          "forks_count": 3,
          "language": "Rust",
          "name": "rholang-rs",
          "open_issues_count": 30,
          "pushed_at": "2026-03-02T20:34:16Z",
          "stargazers_count": 4
        },
        "issues": {
          "open_count": 30,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 18,
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
          "open_issues_count": 4,
          "pushed_at": "2026-03-02T19:29:49Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 4,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 3,
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
          "open_issues_count": 14,
          "pushed_at": "2026-03-02T01:19:38Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 14,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 3,
          "open_count": 4,
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
          "pushed_at": "2026-03-02T21:55:39Z",
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
          "merged_count": 14,
          "open_count": 1,
          "merged_prs": [
            {
              "number": 193,
              "title": "Oslf tree view",
              "merged_at": "2026-02-25T16:18:43Z",
              "user": "OleksandrK-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/193",
              "additions": null,
              "deletions": null,
              "comments": null
            },
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
          "count": 23,
          "contributors": [
            "IhorR-DevBrother",
            "OleksandrK-DevBrother"
          ],
          "recent": [
            {
              "sha": "e739cab",
              "message": "Oslf tree view (#193)",
              "author": "OleksandrK-DevBrother",
              "date": "2026-02-25T16:18:42Z"
            },
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
          "pushed_at": "2026-02-25T17:29:13Z",
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
          "open_issues_count": 3,
          "pushed_at": "2026-03-04T03:11:06Z",
          "stargazers_count": 2
        },
        "issues": {
          "open_count": 3,
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
          "open_count": 1,
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
          "language": "Rust",
          "name": "MeTTaIL",
          "open_issues_count": 12,
          "pushed_at": "2026-03-02T18:55:35Z",
          "stargazers_count": 4
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
          "count": 6,
          "contributors": [
            "Lucius Meredith",
            "leithaus"
          ],
          "recent": [
            {
              "sha": "8be698a",
              "message": "added conclusion",
              "author": "leithaus",
              "date": "2026-02-28T13:47:56Z"
            },
            {
              "sha": "a6a6779",
              "message": "added a bibliography; wordsmithed the final point in the Wig...",
              "author": "Lucius Meredith",
              "date": "2026-02-26T22:08:23Z"
            },
            {
              "sha": "d31e86b",
              "message": "added a bibliography; wordsmithed the final point in the Wig...",
              "author": "Lucius Meredith",
              "date": "2026-02-26T22:04:23Z"
            },
            {
              "sha": "a492b21",
              "message": "added Wigner's friend code",
              "author": "Lucius Meredith",
              "date": "2026-02-26T21:45:20Z"
            },
            {
              "sha": "9fbf6c6",
              "message": "added Wigner's friend code",
              "author": "Lucius Meredith",
              "date": "2026-02-26T21:44:41Z"
            }
          ]
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
          "pushed_at": "2026-02-21T13:51:56Z",
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
          "pushed_at": "2026-03-03T20:56:14Z",
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
          "count": 12,
          "contributors": [
            "jeffrey-l-turner"
          ],
          "recent": [
            {
              "sha": "79a0c61",
              "message": "docs(reports): add January 2026 monthly and February 2026 MT...",
              "author": "jeffrey-l-turner",
              "date": "2026-02-20T16:00:08Z"
            },
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
