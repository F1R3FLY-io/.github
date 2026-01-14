---
doc_type: monthly-report
period: 2026-01
generated_at: 2026-01-14T21:21:58Z
generated_by: generate-monthly-report.sh
---

# F1R3FLY.io Monthly Status Report

**Period:** January 2026 (Month-to-Date)
**Generated:** 2026-01-14T21:21:58Z

---

## Executive Summary

### Key Metrics

| Metric | This Month | Previous Month | Change |
|--------|------------|----------------|--------|
| Total Commits | 54 | - | - |
| Merged PRs | 19 | - | - |
| Closed Issues | 7 | - | - |
| Open Issues | 136 | - | - |
| Active Repos | 7/25 | - | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_summary -->
Key accomplishments in the first two weeks of January 2026:
- **Rust node development accelerating** - 32 commits to f1r3node with focus on build performance, code cleanup, and CI improvements
- **Integration test migration** - Tests successfully migrated to new F1R3FLY Python client library
- **Stability improvements** - Fixed race conditions, flaky tests, and peer discovery configuration issues
- **7 bugs closed** including diagnostics test errors, Casper-related issues, and node status handling
- Active development across 7 repositories with strong DevBrother team contributions
<!-- AI_NARRATIVE_END -->


---

## Core Platform

**Category Totals:** 32 commits, 10 merged PRs, 7 issues closed


### f1r3fly

No description

| Metric | Value |
|--------|-------|
| Commits | 32 |
| Merged PRs | 10 |
| Closed Issues | 7 |
| Open Issues | 53 |

**Merged PRs:**
- [#323](https://github.com/F1R3FLY-io/f1r3node/pull/323) - Improve Rust build performance (@spreston8, 2026-01-14)
- [#322](https://github.com/F1R3FLY-io/f1r3node/pull/322) - fix: serialize metrics tests to prevent flaky failures #312 (@AndriiS-DevBrother, 2026-01-14)
- [#320](https://github.com/F1R3FLY-io/f1r3node/pull/320) - Fix #120: Make peer discovery configuration intervals configurable and clear Kademlia aggressively. (@nashef, 2026-01-13)
- [#318](https://github.com/F1R3FLY-io/f1r3node/pull/318) - New parser pathmap fix (@HeorhiiC-DevBrother, 2026-01-14)
- [#313](https://github.com/F1R3FLY-io/f1r3node/pull/313) - hotfix for race-condition problem (@NazarY-DevBrother, 2026-01-09)
- [#310](https://github.com/F1R3FLY-io/f1r3node/pull/310) - clean rust code base (@NazarY-DevBrother, 2026-01-14)
- [#309](https://github.com/F1R3FLY-io/f1r3node/pull/309) - refactor: Migrate integration tests to the new F1R3FLY Python client library (@AndriiS-DevBrother, 2026-01-07)
- [#307](https://github.com/F1R3FLY-io/f1r3node/pull/307) - feat: Updated the github workflows to support only Rust related build (@YuriiO-DevBrother, 2026-01-12)
- [#304](https://github.com/F1R3FLY-io/f1r3node/pull/304) - fix: Fixed all integration tests for the Rust node which are also passing for the Scala one (@YuriiO-DevBrother, 2026-01-05)
- [#299](https://github.com/F1R3FLY-io/f1r3node/pull/299) - clean casper build (@NazarY-DevBrother, 2026-01-05)


**Notes:**
<!-- AI_NARRATIVE_START: f1r3fly -->
The f1r3node continues intensive Rust migration with significant progress this period. Key developments include improved Rust build performance, migration of integration tests to the new Python client library, and CI workflow updates to support Rust-only builds. Notable fixes addressed race conditions in tests, flaky metrics test failures, and peer discovery configuration. The codebase cleanup effort removed legacy code and tightened CI checks to prevent regressions.
<!-- AI_NARRATIVE_END -->


---

## Frontend & Applications

**Category Totals:** 9 commits, 5 merged PRs, 0 issues closed


### embers

F1R3Sky wallets and agents

| Metric | Value |
|--------|-------|
| Commits | 6 |
| Merged PRs | 3 |
| Closed Issues | 0 |
| Open Issues | 12 |

**Merged PRs:**
- [#139](https://github.com/F1R3FLY-io/embers/pull/139) - Bump rsa from 0.9.9 to 0.9.10 (@dependabot[bot], 2026-01-07)
- [#138](https://github.com/F1R3FLY-io/embers/pull/138) - Bump the all group with 4 updates (@dependabot[bot], 2026-01-05)
- [#136](https://github.com/F1R3FLY-io/embers/pull/136) - Bump the all group with 7 updates (@dependabot[bot], 2026-01-02)


**Notes:**
<!-- AI_NARRATIVE_START: embers -->
Routine dependency maintenance via Dependabot, including security update for the RSA library (0.9.9 to 0.9.10). Manual dependency bumps also applied to keep the project current.
<!-- AI_NARRATIVE_END -->


### embers-frontend

No description

| Metric | Value |
|--------|-------|
| Commits | 2 |
| Merged PRs | 1 |
| Closed Issues | 0 |
| Open Issues | 4 |

**Merged PRs:**
- [#160](https://github.com/F1R3FLY-io/embers-frontend/pull/160) - bump deps (@IhorR-DevBrother, 2026-01-02)


**Notes:**
<!-- AI_NARRATIVE_START: embers-frontend -->
Standard dependency updates to keep the TypeScript frontend current.
<!-- AI_NARRATIVE_END -->


### f1r3sky

F1R3FLY BlueSky fork

| Metric | Value |
|--------|-------|
| Commits | 1 |
| Merged PRs | 1 |
| Closed Issues | 0 |
| Open Issues | 6 |

**Merged PRs:**
- [#30](https://github.com/F1R3FLY-io/f1r3sky/pull/30) - fix sync bug (@IhorR-DevBrother, 2026-01-14)


**Notes:**
<!-- AI_NARRATIVE_START: f1r3sky -->
Sync bug fix merged to improve data synchronization reliability in the BlueSky fork.
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
No activity this period. Development focus is on other F1R3Sky components.
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
Continuing priorities for the remainder of January 2026:
- **Complete Rust node stabilization** - Address remaining 53 open issues in f1r3node
- **Integration test coverage** - Continue migration to Python client library
- **rholang-rs development** - Address 17 open PRs and 27 open issues
- **F1R3Sky sync improvements** - Follow up on sync bug fix with additional stability work
<!-- AI_NARRATIVE_END -->

---

## Contributors This Month

| Contributor | Commits |
|-------------|---------|
| IhorR-DevBrother | 4 |
| dependabot[bot] | 2 |
| AndriiS-DevBrother | 1 |
| NazarY-DevBrother | 1 |
| YuriiO-DevBrother | 1 |
| jeffrey-l-turner | 1 |
| spreston8 | 1 |

### Community Notes

<!-- AI_NARRATIVE_START: community -->
Strong contributions from the DevBrother team this period, with IhorR-DevBrother, AndriiS-DevBrother, NazarY-DevBrother, and YuriiO-DevBrother driving development across multiple repositories. Core maintainers spreston8 and nashef continue to guide architecture decisions and code quality.
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
          "forks_count": 12,
          "language": "Rust",
          "name": "f1r3node",
          "open_issues_count": 53,
          "pushed_at": "2026-01-14T21:17:07Z",
          "stargazers_count": 14
        },
        "issues": {
          "open_count": 53,
          "closed_in_period": 7,
          "opened_in_period": 6,
          "recent_closed": [
            {
              "number": 312,
              "title": "Rust diagnostics test error",
              "closed_at": "2026-01-14T14:53:43Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 272,
              "title": "RUST: IO/OS problem blocks CI",
              "closed_at": "2026-01-05T09:36:16Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 271,
              "title": "RUST: Casper tests log restrictions",
              "closed_at": "2026-01-05T09:39:40Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 258,
              "title": "RUST tests: Resource temporarily unavailable problem under Casper",
              "closed_at": "2026-01-05T09:36:07Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 166,
              "title": "High CPU and RAM usage in Scala node image",
              "closed_at": "2026-01-12T10:44:23Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 131,
              "title": "Clarification on tokenomic & bridging mechanics",
              "closed_at": "2026-01-12T10:42:41Z",
              "labels": [
                "question"
              ]
            },
            {
              "number": 120,
              "title": "Node status command does not account for inactive / stopped nodes",
              "closed_at": "2026-01-13T18:33:31Z",
              "labels": [
                "bug"
              ]
            }
          ]
        },
        "prs": {
          "merged_count": 10,
          "open_count": 12,
          "merged_prs": [
            {
              "number": 323,
              "title": "Improve Rust build performance",
              "merged_at": "2026-01-14T17:23:34Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/323",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 322,
              "title": "fix: serialize metrics tests to prevent flaky failures #312",
              "merged_at": "2026-01-14T14:53:42Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/322",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 320,
              "title": "Fix #120: Make peer discovery configuration intervals configurable and clear Kademlia aggressively.",
              "merged_at": "2026-01-13T20:59:21Z",
              "user": "nashef",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/320",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 318,
              "title": "New parser pathmap fix",
              "merged_at": "2026-01-14T14:17:13Z",
              "user": "HeorhiiC-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/318",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 313,
              "title": "hotfix for race-condition problem",
              "merged_at": "2026-01-09T14:16:01Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/313",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 310,
              "title": "clean rust code base",
              "merged_at": "2026-01-14T12:47:12Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/310",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 309,
              "title": "refactor: Migrate integration tests to the new F1R3FLY Python client library",
              "merged_at": "2026-01-07T18:17:37Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/309",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 307,
              "title": "feat: Updated the github workflows to support only Rust related build",
              "merged_at": "2026-01-12T17:10:02Z",
              "user": "YuriiO-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/307",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 304,
              "title": "fix: Fixed all integration tests for the Rust node which are also passing for the Scala one",
              "merged_at": "2026-01-05T17:49:45Z",
              "user": "YuriiO-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/304",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 299,
              "title": "clean casper build",
              "merged_at": "2026-01-05T16:46:16Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/299",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 32,
          "contributors": [
            "AndriiS-DevBrother",
            "NazarY-DevBrother",
            "YuriiO-DevBrother",
            "spreston8"
          ],
          "recent": [
            {
              "sha": "775d963",
              "message": "Fix Docker cross-compilation: configure pkg-config for targe...",
              "author": "spreston8",
              "date": "2026-01-14T21:16:59Z"
            },
            {
              "sha": "d81783c",
              "message": "Export ByteString type from models crate for external consum...",
              "author": "spreston8",
              "date": "2026-01-14T20:07:57Z"
            },
            {
              "sha": "92a00b4",
              "message": "Merge pull request #323 from F1R3FLY-io/rust/improve-build-p...",
              "author": "spreston8",
              "date": "2026-01-14T17:23:34Z"
            },
            {
              "sha": "7b8d743",
              "message": "fix: serialize metrics tests to prevent flaky failures (#322...",
              "author": "AndriiS-DevBrother",
              "date": "2026-01-14T14:53:42Z"
            },
            {
              "sha": "b7f5f69",
              "message": "- clean rust codebase and updated CI to avoid bad code in a ...",
              "author": "NazarY-DevBrother",
              "date": "2026-01-14T12:47:12Z"
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
          "open_issues_count": 27,
          "pushed_at": "2026-01-14T18:51:17Z",
          "stargazers_count": 3
        },
        "issues": {
          "open_count": 27,
          "closed_in_period": 0,
          "opened_in_period": 1,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 1,
          "open_count": 17,
          "merged_prs": [
            {
              "number": 82,
              "title": "F1r3node dependencies pathmap fix",
              "merged_at": "2026-01-14T16:53:22Z",
              "user": "SerhiiK-DevBrother",
              "url": "https://github.com/F1R3FLY-io/rholang-rs/pull/82",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
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
          "open_issues_count": 1,
          "pushed_at": "2026-01-13T15:35:38Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 1,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 3,
          "open_count": 0,
          "merged_prs": [
            {
              "number": 50,
              "title": "Bump the all group in /js-package with 2 updates",
              "merged_at": "2026-01-13T15:33:05Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/graphl-parser/pull/50",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 49,
              "title": "Bump cc from 1.2.51 to 1.2.52 in the all group",
              "merged_at": "2026-01-13T15:33:13Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/graphl-parser/pull/49",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 48,
              "title": "Bump cc from 1.2.49 to 1.2.50 in the all group",
              "merged_at": "2026-01-02T08:56:04Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/graphl-parser/pull/48",
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
              "sha": "0137d4e",
              "message": "Apply package.json changes for js bindings",
              "author": "IhorR-DevBrother",
              "date": "2026-01-13T15:35:20Z"
            },
            {
              "sha": "dce74e5",
              "message": "Bump cc from 1.2.51 to 1.2.52 in the all group (#49)",
              "author": "dependabot[bot]",
              "date": "2026-01-13T15:33:13Z"
            },
            {
              "sha": "cbb6eab",
              "message": "Bump the all group in /js-package with 2 updates (#50)",
              "author": "dependabot[bot]",
              "date": "2026-01-13T15:33:05Z"
            },
            {
              "sha": "9a5d7f6",
              "message": "Apply package.json changes for js bindings",
              "author": "IhorR-DevBrother",
              "date": "2026-01-02T12:55:26Z"
            },
            {
              "sha": "1c121dc",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-01-02T12:53:39Z"
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
          "pushed_at": "2026-01-12T12:38:06Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 12,
          "closed_in_period": 0,
          "opened_in_period": 1,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 3,
          "open_count": 0,
          "merged_prs": [
            {
              "number": 139,
              "title": "Bump rsa from 0.9.9 to 0.9.10",
              "merged_at": "2026-01-07T10:31:51Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/139",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 138,
              "title": "Bump the all group with 4 updates",
              "merged_at": "2026-01-05T11:00:08Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/138",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 136,
              "title": "Bump the all group with 7 updates",
              "merged_at": "2026-01-02T08:55:54Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/136",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 6,
          "contributors": [
            "IhorR-DevBrother",
            "dependabot[bot]"
          ],
          "recent": [
            {
              "sha": "27fd8a7",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-01-12T12:36:21Z"
            },
            {
              "sha": "77d0fd7",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-01-12T12:31:20Z"
            },
            {
              "sha": "652dc18",
              "message": "Bump rsa from 0.9.9 to 0.9.10 (#139)",
              "author": "dependabot[bot]",
              "date": "2026-01-07T10:31:51Z"
            },
            {
              "sha": "039b333",
              "message": "Bump the all group with 4 updates (#138)",
              "author": "dependabot[bot]",
              "date": "2026-01-05T11:00:08Z"
            },
            {
              "sha": "e928867",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-01-02T13:06:51Z"
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
          "open_issues_count": 4,
          "pushed_at": "2026-01-12T14:31:23Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 4,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 1,
          "open_count": 1,
          "merged_prs": [
            {
              "number": 160,
              "title": "bump deps",
              "merged_at": "2026-01-02T13:17:04Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/160",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 2,
          "contributors": [
            "IhorR-DevBrother"
          ],
          "recent": [
            {
              "sha": "77d9d7c",
              "message": "Apply package.json changes",
              "author": "IhorR-DevBrother",
              "date": "2026-01-02T13:18:34Z"
            },
            {
              "sha": "bbbcd7c",
              "message": "bump deps (#160)",
              "author": "IhorR-DevBrother",
              "date": "2026-01-02T13:17:04Z"
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
          "open_issues_count": 6,
          "pushed_at": "2026-01-14T12:36:10Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 6,
          "closed_in_period": 0,
          "opened_in_period": 2,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 1,
          "open_count": 0,
          "merged_prs": [
            {
              "number": 30,
              "title": "fix sync bug",
              "merged_at": "2026-01-14T12:36:08Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3sky/pull/30",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 1,
          "contributors": [
            "IhorR-DevBrother"
          ],
          "recent": [
            {
              "sha": "57dcae5",
              "message": "fix sync bug (#30)",
              "author": "IhorR-DevBrother",
              "date": "2026-01-14T12:36:08Z"
            }
          ]
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
          "forks_count": 3,
          "language": "Rust",
          "name": "rust-client",
          "open_issues_count": 4,
          "pushed_at": "2026-01-14T20:10:04Z",
          "stargazers_count": 2
        },
        "issues": {
          "open_count": 4,
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
          "pushed_at": "2025-10-03T14:42:01Z",
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
          "pushed_at": "2025-09-29T08:55:34Z",
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
          "pushed_at": "2025-12-15T14:11:55Z",
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
          "pushed_at": "2026-01-14T19:58:54Z",
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
          "count": 6,
          "contributors": [
            "jeffrey-l-turner"
          ],
          "recent": [
            {
              "sha": "e60c929",
              "message": "docs: simplify Status Reports section in README",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T19:58:42Z"
            },
            {
              "sha": "6b19a0e",
              "message": "feat: rename /monthly-report to /github-activity-report and ...",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T19:56:39Z"
            },
            {
              "sha": "8728f11",
              "message": "docs: simplify Status Reports section in README",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T19:27:02Z"
            },
            {
              "sha": "3bd0b19",
              "message": "feat: add /monthly-report slash command for this repo",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T19:24:58Z"
            },
            {
              "sha": "142ad24",
              "message": "feat: add F1R3FLY.io status report generation system",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T19:10:45Z"
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

_Report generated by F1R3FLY.io Monthly Status Report System_
