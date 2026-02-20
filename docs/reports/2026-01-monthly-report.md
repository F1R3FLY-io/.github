---
doc_type: monthly-report
period: 2026-01
generated_at: 2026-02-20T15:48:37Z
generated_by: generate-github-status-report.sh
---

# F1R3FLY.io Monthly Status Report

**Period:** January 2026
**Generated:** 2026-02-20T15:48:37Z

---

## Executive Summary

### Key Metrics

| Metric | This Month | Previous Month | Change |
|--------|------------|----------------|--------|
| Total Commits | 189 | - | - |
| Merged PRs | 53 | - | - |
| Closed Issues | 17 | - | - |
| Open Issues | 135 | - | - |
| Active Repos | 10/25 | - | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_summary -->
January saw strong activity across the organization with 189 commits, 53 merged PRs, and 17 issues closed. The f1r3fly core platform drove the majority of work with a major Scala-to-Rust backporting push -- 34 PRs merged covering metrics, monitoring, Casper consensus, OpenAI integration, and TreeHashMap functions. The embers-frontend added a login form and OSLF hooks, while the Sankey block explorer received its initial scaffolding and security hardening. MeTTa research advanced with 12 commits on Hyper-Dimensional Computing citations and documentation. 10 of 25 tracked repositories had active development this month.
<!-- AI_NARRATIVE_END -->


---

## Core Platform

**Category Totals:** 115 commits, 34 merged PRs, 15 issues closed


### f1r3fly

No description

| Metric | Value |
|--------|-------|
| Commits | 115 |
| Merged PRs | 34 |
| Closed Issues | 15 |
| Open Issues | 50 |

**Merged PRs:**
- [#374](https://github.com/F1R3FLY-io/f1r3node/pull/374) - RUST - Port all Scala metrics to Rust (@AndriiS-DevBrother, 2026-01-28)
- [#372](https://github.com/F1R3FLY-io/f1r3node/pull/372) - RUST - Port Prometheus/Grafana monitoring from Scala PR #173 (@AndriiS-DevBrother, 2026-01-29)
- [#368](https://github.com/F1R3FLY-io/f1r3node/pull/368) - SCALA - refactor: Remove non-functional StateSnapshotCache from PR #244 (@spreston8, 2026-01-28)
- [#364](https://github.com/F1R3FLY-io/f1r3node/pull/364) - RUST: Backport PRs 292, 344, 345 - Finalizer fix and new tests (@spreston8, 2026-01-30)
- [#361](https://github.com/F1R3FLY-io/f1r3node/pull/361) - SCALA - fix: Add stackPubKey to systemPublicKeys (@spreston8, 2026-01-26)
- [#360](https://github.com/F1R3FLY-io/f1r3node/pull/360) - added getOrElse[187] function and delete[196] functions in TreeHashMap, backport from Scala to Rust;  (@NazarY-DevBrother, 2026-01-26)
- [#359](https://github.com/F1R3FLY-io/f1r3node/pull/359) - SCALA - fix: LimitedParentDepthSpec tests were not executing (@spreston8, 2026-01-26)
- [#358](https://github.com/F1R3FLY-io/f1r3node/pull/358) - added rho:deploy:data system channel, backport from Scala to Rust;  (@NazarY-DevBrother, 2026-01-26)
- [#357](https://github.com/F1R3FLY-io/f1r3node/pull/357) - SCALA - Add test log artifact uploads on CI failure (@spreston8, 2026-01-26)
- [#356](https://github.com/F1R3FLY-io/f1r3node/pull/356) - added stack logic into registry, backport from Scala to Rust; (@NazarY-DevBrother, 2026-01-26)
- [#355](https://github.com/F1R3FLY-io/f1r3node/pull/355) - RUST - Port OpenAI integration from Scala (Issue #127) (@AndriiS-DevBrother, 2026-01-29)
- [#354](https://github.com/F1R3FLY-io/f1r3node/pull/354) - Port abort system process from Scala (@AndriiS-DevBrother, 2026-01-26)
- [#352](https://github.com/F1R3FLY-io/f1r3node/pull/352) - RUST - feat: Backport PR #288 - Remove GHOST filtering of block parents in Casper (@spreston8, 2026-01-28)
- [#348](https://github.com/F1R3FLY-io/f1r3node/pull/348) - RUST - fix: disable static OpenSSL linking on all platforms (@spreston8, 2026-01-20)
- [#347](https://github.com/F1R3FLY-io/f1r3node/pull/347) - fix race condition problems; (@NazarY-DevBrother, 2026-01-22)


**Notes:**
<!-- AI_NARRATIVE_START: f1r3fly -->
Intensive Scala-to-Rust backporting dominated January with 115 commits and 34 merged PRs. Key work included porting Prometheus/Grafana monitoring (#372), all Scala metrics (#374), OpenAI integration (#355), and TreeHashMap functions (#360). Several critical bugs were resolved: a race condition fix (#347), Casper finalization non-determinism (#343, #364), and static OpenSSL linking (#348). CI reliability improved with test log artifact uploads (#357) and fixes to non-executing tests (#359). Contributors @spreston8, @AndriiS-DevBrother, and @NazarY-DevBrother drove the bulk of this work, with 15 issues closed including long-standing bugs around resource availability and CPU/RAM usage.
<!-- AI_NARRATIVE_END -->


---

## Frontend & Applications

**Category Totals:** 31 commits, 13 merged PRs, 2 issues closed


### embers

F1R3Sky wallets and agents

| Metric | Value |
|--------|-------|
| Commits | 18 |
| Merged PRs | 5 |
| Closed Issues | 2 |
| Open Issues | 12 |

**Merged PRs:**
- [#144](https://github.com/F1R3FLY-io/embers/pull/144) - Bump rust from 1.92-slim-bookworm to 1.93-slim-bookworm in /docker (@dependabot[bot], 2026-01-26)
- [#143](https://github.com/F1R3FLY-io/embers/pull/143) - Bump the all group with 2 updates (@dependabot[bot], 2026-01-19)
- [#139](https://github.com/F1R3FLY-io/embers/pull/139) - Bump rsa from 0.9.9 to 0.9.10 (@dependabot[bot], 2026-01-07)
- [#138](https://github.com/F1R3FLY-io/embers/pull/138) - Bump the all group with 4 updates (@dependabot[bot], 2026-01-05)
- [#136](https://github.com/F1R3FLY-io/embers/pull/136) - Bump the all group with 7 updates (@dependabot[bot], 2026-01-02)


**Notes:**
<!-- AI_NARRATIVE_START: embers -->
Embers saw 18 commits primarily focused on dependency maintenance via dependabot (Rust 1.93, RSA 0.9.10, and group updates across 5 merged PRs). @IhorR-DevBrother refactored CRUD contracts, fixed an askama warning, and bumped dependencies. Two issues were closed: boost settings sync across networks (#119) and agent teams GC stage (#91). The "choreographer" milestone reached 100% completion.
<!-- AI_NARRATIVE_END -->


### embers-frontend

No description

| Metric | Value |
|--------|-------|
| Commits | 12 |
| Merged PRs | 7 |
| Closed Issues | 0 |
| Open Issues | 2 |

**Merged PRs:**
- [#174](https://github.com/F1R3FLY-io/embers-frontend/pull/174) - add login form (@IhorR-DevBrother, 2026-01-28)
- [#173](https://github.com/F1R3FLY-io/embers-frontend/pull/173) - Automated client update (@IhorR-DevBrother, 2026-01-21)
- [#172](https://github.com/F1R3FLY-io/embers-frontend/pull/172) - Automated client update (@IhorR-DevBrother, 2026-01-20)
- [#168](https://github.com/F1R3FLY-io/embers-frontend/pull/168) - add oslf hooks (@IhorR-DevBrother, 2026-01-19)
- [#167](https://github.com/F1R3FLY-io/embers-frontend/pull/167) - Automated client update (@IhorR-DevBrother, 2026-01-19)
- [#165](https://github.com/F1R3FLY-io/embers-frontend/pull/165) - Agent Teams multiple bugfixes (@OleksandrK-DevBrother, 2026-01-15)
- [#160](https://github.com/F1R3FLY-io/embers-frontend/pull/160) - bump deps (@IhorR-DevBrother, 2026-01-02)


**Notes:**
<!-- AI_NARRATIVE_START: embers-frontend -->
Active month with 12 commits and 7 merged PRs. @IhorR-DevBrother added a login form (#174), OSLF hooks (#168), and multiple automated client updates. @OleksandrK-DevBrother contributed Agent Teams bugfixes (#165). Dependencies were bumped at the start of the month (#160).
<!-- AI_NARRATIVE_END -->


### f1r3sky

F1R3FLY BlueSky fork

| Metric | Value |
|--------|-------|
| Commits | 1 |
| Merged PRs | 1 |
| Closed Issues | 0 |
| Open Issues | 8 |

**Merged PRs:**
- [#30](https://github.com/F1R3FLY-io/f1r3sky/pull/30) - fix sync bug (@IhorR-DevBrother, 2026-01-14)


**Notes:**
<!-- AI_NARRATIVE_START: f1r3sky -->
Minimal activity this month with a single sync bug fix (#30) merged by @IhorR-DevBrother. Two new issues were opened, indicating upcoming feature planning.
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
No activity this period. Last push was June 2025.
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
No activity this period. Last push was November 2025.
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
No activity this period. Last push was October 2025.
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
The Scala-to-Rust backport effort on f1r3fly continues with 18 open PRs covering caching, mergeable channels, and status reporting. The rholang-rs repo has 17 open PRs queued for review including the f1r3node dependencies pathmap work. Embers-frontend development is active with ongoing client updates. The Sankey block explorer has an open PR for further development. F1R3FLYFS has 2 open PRs pending review.
<!-- AI_NARRATIVE_END -->

---

## Contributors This Month

| Contributor | Commits |
|-------------|---------|
| IhorR-DevBrother | 4 |
| dependabot[bot] | 2 |
| jeffrey-l-turner | 2 |
| spreston8 | 2 |
| AndriiS-DevBrother | 1 |
| HeorhiiC-DevBrother | 1 |
| NazarY-DevBrother | 1 |
| OleksandrK-DevBrother | 1 |
| YuriiO-DevBrother | 1 |
| leithaus | 1 |

### Community Notes

<!-- AI_NARRATIVE_START: community -->
10 contributors were active this month. The DevBrother team drove the majority of work: @IhorR-DevBrother (4 repos: embers, embers-frontend, f1r3sky, graph-to-rholang-parser), @spreston8 (f1r3fly core platform and rust-client), @AndriiS-DevBrother (f1r3fly Rust porting), @NazarY-DevBrother (f1r3fly backports), @OleksandrK-DevBrother (embers-frontend bugfixes), @HeorhiiC-DevBrother and @YuriiO-DevBrother (f1r3fly contributions). @leithaus advanced MeTTa research with HDC documentation. @jeffrey-l-turner contributed to Sankey block explorer scaffolding and .github repo maintenance. @SerhiiK-DevBrother contributed the rholang-rs pathmap fix.
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
          "closed_in_period": 15,
          "opened_in_period": 12,
          "recent_closed": [
            {
              "number": 343,
              "title": "Finalization non-determinism in multi-parent DAG (introduced in PR #288)",
              "closed_at": "2026-01-21T19:03:40Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 317,
              "title": "[x2] Processing transactions question",
              "closed_at": "2026-01-26T17:06:02Z",
              "labels": [
                "question"
              ]
            },
            {
              "number": 312,
              "title": "Rust diagnostics test error",
              "closed_at": "2026-01-14T14:53:43Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 308,
              "title": "RUST: Casper unit tests non-ditirministic failure",
              "closed_at": "2026-01-27T03:53:42Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 296,
              "title": "Intermittent failure of ExploratoryDeployAPITest",
              "closed_at": "2026-01-21T19:03:48Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 274,
              "title": "Back port test changes from PR #273",
              "closed_at": "2026-01-26T17:18:28Z",
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
            }
          ]
        },
        "prs": {
          "merged_count": 34,
          "open_count": 18,
          "merged_prs": [
            {
              "number": 374,
              "title": "RUST - Port all Scala metrics to Rust",
              "merged_at": "2026-01-28T20:02:27Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/374",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 372,
              "title": "RUST - Port Prometheus/Grafana monitoring from Scala PR #173",
              "merged_at": "2026-01-29T18:18:35Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/372",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 368,
              "title": "SCALA - refactor: Remove non-functional StateSnapshotCache from PR #244",
              "merged_at": "2026-01-28T18:16:59Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/368",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 364,
              "title": "RUST: Backport PRs 292, 344, 345 - Finalizer fix and new tests",
              "merged_at": "2026-01-30T14:38:58Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/364",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 361,
              "title": "SCALA - fix: Add stackPubKey to systemPublicKeys",
              "merged_at": "2026-01-26T19:01:41Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/361",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 360,
              "title": "added getOrElse[187] function and delete[196] functions in TreeHashMap, backport from Scala to Rust; ",
              "merged_at": "2026-01-26T18:53:22Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/360",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 359,
              "title": "SCALA - fix: LimitedParentDepthSpec tests were not executing",
              "merged_at": "2026-01-26T19:08:02Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/359",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 358,
              "title": "added rho:deploy:data system channel, backport from Scala to Rust; ",
              "merged_at": "2026-01-26T18:01:56Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/358",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 357,
              "title": "SCALA - Add test log artifact uploads on CI failure",
              "merged_at": "2026-01-26T17:40:20Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/357",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 356,
              "title": "added stack logic into registry, backport from Scala to Rust;",
              "merged_at": "2026-01-26T18:01:18Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/356",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 355,
              "title": "RUST - Port OpenAI integration from Scala (Issue #127)",
              "merged_at": "2026-01-29T11:13:44Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/355",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 354,
              "title": "Port abort system process from Scala",
              "merged_at": "2026-01-26T20:41:04Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/354",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 352,
              "title": "RUST - feat: Backport PR #288 - Remove GHOST filtering of block parents in Casper",
              "merged_at": "2026-01-28T20:31:09Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/352",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 348,
              "title": "RUST - fix: disable static OpenSSL linking on all platforms",
              "merged_at": "2026-01-20T20:35:01Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/348",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 347,
              "title": "fix race condition problems;",
              "merged_at": "2026-01-22T13:08:13Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/347",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 115,
          "contributors": [
            "AndriiS-DevBrother",
            "HeorhiiC-DevBrother",
            "NazarY-DevBrother",
            "YuriiO-DevBrother",
            "spreston8"
          ],
          "recent": [
            {
              "sha": "0c43d8c",
              "message": "Merge branch 'rust/dev' into rust/backport-pr261-pr320-statu...",
              "author": "spreston8",
              "date": "2026-01-31T23:55:55Z"
            },
            {
              "sha": "ab75972",
              "message": "Merge branch 'rust/dev' into rust/backport-pr243-244-caching...",
              "author": "spreston8",
              "date": "2026-01-31T23:55:01Z"
            },
            {
              "sha": "6edbe8e",
              "message": "Merge branch 'rust/dev' into rust/backport-pr218-mergeable-c...",
              "author": "spreston8",
              "date": "2026-01-31T23:53:05Z"
            },
            {
              "sha": "ced3b59",
              "message": "Merge branch 'rust/dev' into rust/backport-pr199-205-231-252...",
              "author": "spreston8",
              "date": "2026-01-31T23:52:23Z"
            },
            {
              "sha": "ecf228b",
              "message": "Merge pull request #364 from F1R3FLY-io/rust/backport-pr292-...",
              "author": "spreston8",
              "date": "2026-01-30T14:38:58Z"
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
          "opened_in_period": 3,
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
          "merged_count": 4,
          "open_count": 2,
          "merged_prs": [
            {
              "number": 54,
              "title": "Bump the all group in /js-package with 2 updates",
              "merged_at": "2026-01-27T09:56:26Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/graphl-parser/pull/54",
              "additions": null,
              "deletions": null,
              "comments": null
            },
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
          "count": 12,
          "contributors": [
            "IhorR-DevBrother",
            "dependabot[bot]"
          ],
          "recent": [
            {
              "sha": "d2e59e5",
              "message": "Apply package.json changes for js bindings",
              "author": "IhorR-DevBrother",
              "date": "2026-01-27T10:05:31Z"
            },
            {
              "sha": "363f2c5",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-01-27T09:58:20Z"
            },
            {
              "sha": "72b469b",
              "message": "Bump the all group in /js-package with 2 updates (#54)",
              "author": "dependabot[bot]",
              "date": "2026-01-27T09:56:26Z"
            },
            {
              "sha": "c9e3d4b",
              "message": "Apply package.json changes for js bindings",
              "author": "IhorR-DevBrother",
              "date": "2026-01-20T10:50:07Z"
            },
            {
              "sha": "68497fb",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-01-20T10:47:32Z"
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
          "closed_in_period": 2,
          "opened_in_period": 1,
          "recent_closed": [
            {
              "number": 119,
              "title": "boost settings are not synced across networks",
              "closed_at": "2026-01-16T12:02:44Z",
              "labels": []
            },
            {
              "number": 91,
              "title": "add GC stage for agents teams",
              "closed_at": "2026-01-16T12:03:00Z",
              "labels": []
            }
          ]
        },
        "prs": {
          "merged_count": 5,
          "open_count": 2,
          "merged_prs": [
            {
              "number": 144,
              "title": "Bump rust from 1.92-slim-bookworm to 1.93-slim-bookworm in /docker",
              "merged_at": "2026-01-26T09:48:56Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/144",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 143,
              "title": "Bump the all group with 2 updates",
              "merged_at": "2026-01-19T12:42:49Z",
              "user": "dependabot[bot]",
              "url": "https://github.com/F1R3FLY-io/embers/pull/143",
              "additions": null,
              "deletions": null,
              "comments": null
            },
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
          "count": 18,
          "contributors": [
            "IhorR-DevBrother",
            "dependabot[bot]"
          ],
          "recent": [
            {
              "sha": "0af16db",
              "message": "fix askama warning",
              "author": "IhorR-DevBrother",
              "date": "2026-01-30T09:45:42Z"
            },
            {
              "sha": "9adf3c2",
              "message": "bump deps",
              "author": "IhorR-DevBrother",
              "date": "2026-01-26T09:55:43Z"
            },
            {
              "sha": "8ee2fed",
              "message": "Bump rust from 1.92-slim-bookworm to 1.93-slim-bookworm in /...",
              "author": "dependabot[bot]",
              "date": "2026-01-26T09:48:56Z"
            },
            {
              "sha": "b55426e",
              "message": "refactor crud contracts",
              "author": "IhorR-DevBrother",
              "date": "2026-01-21T13:44:32Z"
            },
            {
              "sha": "cedd12d",
              "message": "rename stuff",
              "author": "IhorR-DevBrother",
              "date": "2026-01-20T14:52:43Z"
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
          "closed_in_period": 0,
          "opened_in_period": 1,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 7,
          "open_count": 1,
          "merged_prs": [
            {
              "number": 174,
              "title": "add login form",
              "merged_at": "2026-01-28T13:37:48Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/174",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 173,
              "title": "Automated client update",
              "merged_at": "2026-01-21T13:58:42Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/173",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 172,
              "title": "Automated client update",
              "merged_at": "2026-01-20T16:04:04Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/172",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 168,
              "title": "add oslf hooks",
              "merged_at": "2026-01-19T12:06:13Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/168",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 167,
              "title": "Automated client update",
              "merged_at": "2026-01-19T09:18:09Z",
              "user": "IhorR-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/167",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 165,
              "title": "Agent Teams multiple bugfixes",
              "merged_at": "2026-01-15T15:32:15Z",
              "user": "OleksandrK-DevBrother",
              "url": "https://github.com/F1R3FLY-io/embers-frontend/pull/165",
              "additions": null,
              "deletions": null,
              "comments": null
            },
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
          "count": 12,
          "contributors": [
            "IhorR-DevBrother",
            "OleksandrK-DevBrother"
          ],
          "recent": [
            {
              "sha": "8f425c3",
              "message": "Apply package.json changes",
              "author": "IhorR-DevBrother",
              "date": "2026-01-28T13:40:36Z"
            },
            {
              "sha": "0b27f19",
              "message": "add login form (#174)",
              "author": "IhorR-DevBrother",
              "date": "2026-01-28T13:37:48Z"
            },
            {
              "sha": "c3ce9ca",
              "message": "Apply package.json changes",
              "author": "IhorR-DevBrother",
              "date": "2026-01-21T14:00:05Z"
            },
            {
              "sha": "5c36451",
              "message": "Automated client update (#173)",
              "author": "IhorR-DevBrother",
              "date": "2026-01-21T13:58:42Z"
            },
            {
              "sha": "7ca55e5",
              "message": "Apply package.json changes",
              "author": "IhorR-DevBrother",
              "date": "2026-01-20T16:05:45Z"
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
          "opened_in_period": 2,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 1,
          "open_count": 1,
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
          "forks_count": 4,
          "language": "Rust",
          "name": "rust-client",
          "open_issues_count": 2,
          "pushed_at": "2026-02-18T15:31:32Z",
          "stargazers_count": 2
        },
        "issues": {
          "open_count": 2,
          "closed_in_period": 0,
          "opened_in_period": 1,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 1,
          "open_count": 0,
          "merged_prs": [
            {
              "number": 6,
              "title": "Add block-transfers command and improve transfer status reporting",
              "merged_at": "2026-01-19T17:30:11Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/6",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 4,
          "contributors": [
            "spreston8"
          ],
          "recent": [
            {
              "sha": "7c2f469",
              "message": "Add smoke test script and update documentation",
              "author": "spreston8",
              "date": "2026-01-28T06:23:08Z"
            },
            {
              "sha": "2795221",
              "message": "Merge pull request #6 from F1R3FLY-io/feature/block-transfer...",
              "author": "spreston8",
              "date": "2026-01-19T17:30:11Z"
            },
            {
              "sha": "10c5176",
              "message": "Change block-transfers block_hash to positional argument",
              "author": "spreston8",
              "date": "2026-01-18T04:04:59Z"
            },
            {
              "sha": "8b1ebe7",
              "message": "Add block-transfers command and improve transfer status repo...",
              "author": "spreston8",
              "date": "2026-01-14T04:55:58Z"
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
          "count": 5,
          "contributors": [
            "jeffrey-l-turner"
          ],
          "recent": [
            {
              "sha": "44c8135",
              "message": "fix(tests): add React Router v7 future flags to RouterProvid...",
              "author": "jeffrey-l-turner",
              "date": "2026-01-21T19:35:13Z"
            },
            {
              "sha": "c787adb",
              "message": "chore: add husky pre-commit/pre-push hooks and fix lint erro...",
              "author": "jeffrey-l-turner",
              "date": "2026-01-21T19:21:43Z"
            },
            {
              "sha": "d7a06d4",
              "message": "fix(security): override esbuild to 0.25.0 to fix GHSA-67mh-4...",
              "author": "jeffrey-l-turner",
              "date": "2026-01-21T19:13:32Z"
            },
            {
              "sha": "e31df76",
              "message": "chore: add project scaffolding from policy harmonization",
              "author": "jeffrey-l-turner",
              "date": "2026-01-20T23:06:28Z"
            },
            {
              "sha": "0647284",
              "message": "chore: update CLAUDE.md instructions and upgrade dependencie...",
              "author": "jeffrey-l-turner",
              "date": "2026-01-20T23:05:28Z"
            }
          ]
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
          "count": 12,
          "contributors": [
            "leithaus"
          ],
          "recent": [
            {
              "sha": "3c953e2",
              "message": "fixed a couple of typos",
              "author": "leithaus",
              "date": "2026-01-24T07:58:24Z"
            },
            {
              "sha": "3ab0a0f",
              "message": "cited Kanerva and Non-negative matrix results",
              "author": "leithaus",
              "date": "2026-01-24T07:19:39Z"
            },
            {
              "sha": "a58f9f5",
              "message": "cited functions as processes",
              "author": "leithaus",
              "date": "2026-01-24T06:47:50Z"
            },
            {
              "sha": "a3d4f63",
              "message": "cited MeTTaIL repo",
              "author": "leithaus",
              "date": "2026-01-24T06:39:38Z"
            },
            {
              "sha": "9b9ca19",
              "message": "added citations",
              "author": "leithaus",
              "date": "2026-01-24T06:28:45Z"
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
          "count": 10,
          "contributors": [
            "jeffrey-l-turner"
          ],
          "recent": [
            {
              "sha": "89bc4b0",
              "message": "chore(gitignore): add .grepai/ directory to ignore list",
              "author": "jeffrey-l-turner",
              "date": "2026-01-23T15:35:49Z"
            },
            {
              "sha": "a6fa068",
              "message": "refactor(report): rename script and fix report type titles",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T23:19:34Z"
            },
            {
              "sha": "a376b18",
              "message": "docs(report): add sample MTD report and wizard instructions",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T21:28:52Z"
            },
            {
              "sha": "cd79770",
              "message": "fix(report): redirect log output to stderr to prevent JSON c...",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T21:15:20Z"
            },
            {
              "sha": "e60c929",
              "message": "docs: simplify Status Reports section in README",
              "author": "jeffrey-l-turner",
              "date": "2026-01-14T19:58:42Z"
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
