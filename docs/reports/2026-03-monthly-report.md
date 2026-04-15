---
doc_type: monthly-report
period: 2026-03
generated_at: 2026-04-15T23:12:54Z
generated_by: generate-github-status-report.sh
---

# F1R3FLY.io Monthly Status Report

**Period:** March 2026
**Generated:** 2026-04-15T23:12:54Z

---

## Executive Summary

### Key Metrics

| Metric | This Month | Previous Month | Change |
|--------|------------|----------------|--------|
| Total Commits | 234 | - | - |
| Merged PRs | 52 | - | - |
| Closed Issues | 16 | - | - |
| Open Issues | 142 | - | - |
| Active Repos | 8/25 | - | - |

### Highlights

<!-- AI_NARRATIVE_START: executive_summary -->
March was a consensus-stability and release-tooling month on f1r3node, which drove 166 of the 234 org-wide commits and 37 of the 52 merged PRs. Highlights: shard recovery and replay determinism fix for duplicate channel sends (#461), auto-versioning plus changelog and release tagging landed for both Rust (#455) and Scala (#454) builds, CI migrated from self-hosted to GitHub-hosted runners (#458), and the garbage collector now gracefully skips cycles instead of crashing (#450). Frontend and application repos (embers, embers-frontend, f1r3sky, lightning-bug) had zero commits for the period, concentrating attention on core platform work.
<!-- AI_NARRATIVE_END -->


---

## Core Platform

**Category Totals:** 166 commits, 37 merged PRs, 14 issues closed


### f1r3fly

No description

| Metric | Value |
|--------|-------|
| Commits | 166 |
| Merged PRs | 37 |
| Closed Issues | 14 |
| Open Issues | 50 |

**Merged PRs:**
- [#465](https://github.com/F1R3FLY-io/f1r3node/pull/465) - ci: explicitly list integration test files (Scala) (@spreston8, 2026-03-31)
- [#461](https://github.com/F1R3FLY-io/f1r3node/pull/461) - fix: shard recovery and replay determinism for duplicate channel sends (@spreston8, 2026-03-30)
- [#460](https://github.com/F1R3FLY-io/f1r3node/pull/460) - fix: update fault-tolerance-threshold defaults and add consensus config guide (@spreston8, 2026-03-31)
- [#458](https://github.com/F1R3FLY-io/f1r3node/pull/458) - ci: migrate Rust CI to GitHub-hosted runners (@spreston8, 2026-03-30)
- [#456](https://github.com/F1R3FLY-io/f1r3node/pull/456) - refactor: separate produce error handling from NonDeterministicProcessFailure (Rust) (@NazarY-DevBrother, 2026-03-31)
- [#455](https://github.com/F1R3FLY-io/f1r3node/pull/455) - feat: auto-versioning, changelog, and release tagging (Rust) (@spreston8, 2026-03-26)
- [#454](https://github.com/F1R3FLY-io/f1r3node/pull/454) - feat: auto-versioning, changelog, and release tagging (Scala) (@spreston8, 2026-03-26)
- [#453](https://github.com/F1R3FLY-io/f1r3node/pull/453) - refactor: separate produce error handling from NonDeterministicProces… (@NazarY-DevBrother, 2026-03-26)
- [#451](https://github.com/F1R3FLY-io/f1r3node/pull/451) - Merge dev into main (@spreston8, 2026-03-23)
- [#450](https://github.com/F1R3FLY-io/f1r3node/pull/450) - fix: GC gracefully skips the cycle instead of crashing (@NazarY-DevBrother, 2026-03-23)
- [#448](https://github.com/F1R3FLY-io/f1r3node/pull/448) - Refactor: replace Scala config overlays with CLI flags, align defaults.conf (@spreston8, 2026-03-26)
- [#447](https://github.com/F1R3FLY-io/f1r3node/pull/447) - Refactor: replace config overlays with CLI flags, align defaults.conf (@spreston8, 2026-03-26)
- [#446](https://github.com/F1R3FLY-io/f1r3node/pull/446) - Merge rust/dev into rust/main (@spreston8, 2026-03-21)
- [#445](https://github.com/F1R3FLY-io/f1r3node/pull/445) - Merge dev into main (@spreston8, 2026-03-21)
- [#444](https://github.com/F1R3FLY-io/f1r3node/pull/444) - feat: add --ceremony-master-mode and --enable/disable-mergeable-channel-gc CLI flags (@spreston8, 2026-03-21)


**Notes:**
<!-- AI_NARRATIVE_START: f1r3fly -->
Heavy infrastructure and reliability month: @spreston8 shipped auto-versioning, changelog, and release tagging across both Rust (#455) and Scala (#454) toolchains, migrated Rust CI to GitHub-hosted runners (#458), and replaced Scala config overlays with CLI flags (#447, #448). Consensus-critical fixes include shard recovery and replay determinism for duplicate channel sends (#461) and graceful GC cycle handling (#450, @NazarY-DevBrother). New CLI flags `--ceremony-master-mode` and `--enable/disable-mergeable-channel-gc` landed in #444. @NazarY-DevBrother also refactored produce error handling out of `NonDeterministicProcessFailure` in both Rust (#456) and Scala (#453).
<!-- AI_NARRATIVE_END -->


---

## Frontend & Applications

**Category Totals:** 0 commits, 0 merged PRs, 0 issues closed


### embers

F1R3Sky wallets and agents

| Metric | Value |
|--------|-------|
| Commits | 0 |
| Merged PRs | 0 |
| Closed Issues | 0 |
| Open Issues | 20 |

**Merged PRs:**
_No PRs merged this period_
_No activity this period_

**Notes:**
<!-- AI_NARRATIVE_START: embers -->
No commits or merged PRs this period. 20 issues remain open; wallet and agent work paused while core-platform consensus work took priority.
<!-- AI_NARRATIVE_END -->


### embers-frontend

No description

| Metric | Value |
|--------|-------|
| Commits | 0 |
| Merged PRs | 0 |
| Closed Issues | 0 |
| Open Issues | 4 |

**Merged PRs:**
_No PRs merged this period_
_No activity this period_

**Notes:**
<!-- AI_NARRATIVE_START: embers-frontend -->
No activity this period. 4 open issues carry over.
<!-- AI_NARRATIVE_END -->


### f1r3sky

F1R3FLY BlueSky fork

| Metric | Value |
|--------|-------|
| Commits | 0 |
| Merged PRs | 0 |
| Closed Issues | 0 |
| Open Issues | 9 |

**Merged PRs:**
_No PRs merged this period_
_No activity this period_

**Notes:**
<!-- AI_NARRATIVE_START: f1r3sky -->
No activity this period. 9 open issues represent deferred decentralized-social work.
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
Dormant this period with no open issues or merged PRs.
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
Dormant this period with no open issues or merged PRs.
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
Dormant this period. The browser-based editor had no commits or merged PRs.
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
No open GitHub Milestones were detected this period across the 25 tracked repositories, which is itself a planning signal: milestone adoption per the new [roadmap-release-normalization-standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/roadmap-release-normalization-standard.md) should be a Q2 focus. Expected near-term threads: continued consensus-stability iteration on f1r3node (replay determinism and mergeable-channel GC), a first tagged release under the new auto-versioning pipeline (validating #454 and #455 end-to-end), and resumption of frontend-application work (embers, f1r3sky) whose 33 open issues have carried across multiple periods.
<!-- AI_NARRATIVE_END -->

---

## Contributors This Month

| Contributor | Commits |
|-------------|---------|
| machieke | 3 |
| spreston8 | 3 |
| AndriiS-DevBrother | 2 |
| jeffrey-l-turner | 2 |
| Lucius Meredith | 1 |
| NazarY-DevBrother | 1 |
| a-k-l-sdao | 1 |
| berecik | 1 |
| github-actions[bot] | 1 |
| leithaus | 1 |

### Community Notes

<!-- AI_NARRATIVE_START: community -->
Thanks to the 10 contributors active this month. @machieke and @spreston8 tied for the lead at 3 commits each, with @AndriiS-DevBrother and @jeffrey-l-turner close behind at 2. @NazarY-DevBrother shipped the GC-cycle fix (#450) and the produce-error-handling refactors (#453, #456). Founders @leithaus and Lucius Meredith also committed this period.
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
          "forks_count": 15,
          "language": "Rust",
          "name": "f1r3node",
          "open_issues_count": 50,
          "pushed_at": "2026-04-14T20:03:33Z",
          "stargazers_count": 14
        },
        "issues": {
          "open_count": 50,
          "closed_in_period": 14,
          "opened_in_period": 9,
          "recent_closed": [
            {
              "number": 442,
              "title": "Add CLI flags for ceremony-master-mode, enable-mergeable-channel-gc, and heartbeat-disabled (Scala)",
              "closed_at": "2026-03-21T04:50:35Z",
              "labels": []
            },
            {
              "number": 441,
              "title": "Scala node crashes with enable-mergeable-channel-gc during genesis ceremony",
              "closed_at": "2026-03-24T15:03:44Z",
              "labels": []
            },
            {
              "number": 440,
              "title": "refactor: separate produce error handling from NonDeterministicProcessFailure",
              "closed_at": "2026-03-31T15:08:31Z",
              "labels": []
            },
            {
              "number": 413,
              "title": "Rholang arithmetic: silent integer overflow produces incorrect results",
              "closed_at": "2026-03-04T14:33:13Z",
              "labels": []
            },
            {
              "number": 395,
              "title": "Investigate memory usage and potential leaks in Rust node",
              "closed_at": "2026-03-09T22:48:14Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 394,
              "title": "Investigate memory usage and potential leaks in Scala node",
              "closed_at": "2026-03-17T16:17:31Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 392,
              "title": "Add minimal deploy lookup endpoint to reduce payload size",
              "closed_at": "2026-03-17T18:22:56Z",
              "labels": [
                "enhancement"
              ]
            },
            {
              "number": 346,
              "title": "RUST: Master Backport Tracking - Scala PRs to Rust",
              "closed_at": "2026-03-12T00:28:13Z",
              "labels": []
            },
            {
              "number": 266,
              "title": "Incorrect `secp256k1Verify` usage crashed node",
              "closed_at": "2026-03-05T16:46:03Z",
              "labels": [
                "bug"
              ]
            },
            {
              "number": 260,
              "title": "Casper: Different times for availability",
              "closed_at": "2026-03-18T16:12:24Z",
              "labels": [
                "question"
              ]
            }
          ]
        },
        "prs": {
          "merged_count": 37,
          "open_count": 23,
          "merged_prs": [
            {
              "number": 465,
              "title": "ci: explicitly list integration test files (Scala)",
              "merged_at": "2026-03-31T23:00:11Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/465",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 461,
              "title": "fix: shard recovery and replay determinism for duplicate channel sends",
              "merged_at": "2026-03-30T18:27:34Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/461",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 460,
              "title": "fix: update fault-tolerance-threshold defaults and add consensus config guide",
              "merged_at": "2026-03-31T00:11:07Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/460",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 458,
              "title": "ci: migrate Rust CI to GitHub-hosted runners",
              "merged_at": "2026-03-30T04:05:22Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/458",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 456,
              "title": "refactor: separate produce error handling from NonDeterministicProcessFailure (Rust)",
              "merged_at": "2026-03-31T15:08:29Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/456",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 455,
              "title": "feat: auto-versioning, changelog, and release tagging (Rust)",
              "merged_at": "2026-03-26T03:16:25Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/455",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 454,
              "title": "feat: auto-versioning, changelog, and release tagging (Scala)",
              "merged_at": "2026-03-26T03:16:33Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/454",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 453,
              "title": "refactor: separate produce error handling from NonDeterministicProces…",
              "merged_at": "2026-03-26T12:22:22Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/453",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 451,
              "title": "Merge dev into main",
              "merged_at": "2026-03-23T22:52:02Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/451",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 450,
              "title": "fix: GC gracefully skips the cycle instead of crashing",
              "merged_at": "2026-03-23T20:55:29Z",
              "user": "NazarY-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/450",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 448,
              "title": "Refactor: replace Scala config overlays with CLI flags, align defaults.conf",
              "merged_at": "2026-03-26T06:06:12Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/448",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 447,
              "title": "Refactor: replace config overlays with CLI flags, align defaults.conf",
              "merged_at": "2026-03-26T06:05:49Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/447",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 446,
              "title": "Merge rust/dev into rust/main",
              "merged_at": "2026-03-21T18:44:54Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/446",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 445,
              "title": "Merge dev into main",
              "merged_at": "2026-03-21T18:44:21Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/445",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 444,
              "title": "feat: add --ceremony-master-mode and --enable/disable-mergeable-channel-gc CLI flags",
              "merged_at": "2026-03-21T04:46:56Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/pull/444",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 166,
          "contributors": [
            "NazarY-DevBrother",
            "a-k-l-sdao",
            "github-actions[bot]",
            "machieke",
            "spreston8"
          ],
          "recent": [
            {
              "sha": "47db2d2",
              "message": "fix(ci): PR links in changelog, extract release notes, skip ...",
              "author": "spreston8",
              "date": "2026-03-31T20:51:25Z"
            },
            {
              "sha": "291abc5",
              "message": "ci: add concurrency block to cancel outdated workflow runs",
              "author": "spreston8",
              "date": "2026-03-31T19:22:49Z"
            },
            {
              "sha": "01b3281",
              "message": "chore(release): rust v0.4.8",
              "author": "github-actions[bot]",
              "date": "2026-03-31T15:09:02Z"
            },
            {
              "sha": "49b0995",
              "message": "refactor: separate produce error handling from NonDeterminis...",
              "author": "NazarY-DevBrother",
              "date": "2026-03-31T15:08:28Z"
            },
            {
              "sha": "34ca56e",
              "message": "fix: remove unused rand imports",
              "author": "spreston8",
              "date": "2026-03-31T07:33:45Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": "2026-04-09T06:47:22Z",
          "latest_tag": "rust-v0.4.11",
          "recent": [
            {
              "body_empty": false,
              "draft": false,
              "name": "rust-v0.4.11",
              "prerelease": true,
              "published_at": "2026-04-09T06:47:22Z",
              "semver_ok": false,
              "tag_name": "rust-v0.4.11",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.11"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "rust-v0.4.10",
              "prerelease": true,
              "published_at": "2026-04-06T05:44:04Z",
              "semver_ok": false,
              "tag_name": "rust-v0.4.10",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.10"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "scala-v0.4.8",
              "prerelease": true,
              "published_at": "2026-04-02T22:35:17Z",
              "semver_ok": false,
              "tag_name": "scala-v0.4.8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/scala-v0.4.8"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "rust-v0.4.9",
              "prerelease": true,
              "published_at": "2026-04-01T06:49:38Z",
              "semver_ok": false,
              "tag_name": "rust-v0.4.9",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.9"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "scala-v0.4.7",
              "prerelease": true,
              "published_at": "2026-03-31T23:57:13Z",
              "semver_ok": false,
              "tag_name": "scala-v0.4.7",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/scala-v0.4.7"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "scala-v0.4.6",
              "prerelease": true,
              "published_at": "2026-03-31T01:37:02Z",
              "semver_ok": false,
              "tag_name": "scala-v0.4.6",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/scala-v0.4.6"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "rust-v0.4.8",
              "prerelease": true,
              "published_at": "2026-03-31T22:45:58Z",
              "semver_ok": false,
              "tag_name": "rust-v0.4.8",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.8"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "rust-v0.4.7",
              "prerelease": true,
              "published_at": "2026-03-30T23:07:31Z",
              "semver_ok": false,
              "tag_name": "rust-v0.4.7",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.7"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "rust-v0.4.6",
              "prerelease": true,
              "published_at": "2026-03-30T04:33:13Z",
              "semver_ok": false,
              "tag_name": "rust-v0.4.6",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/rust-v0.4.6"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "scala-v0.4.5",
              "prerelease": true,
              "published_at": "2026-03-29T23:03:57Z",
              "semver_ok": false,
              "tag_name": "scala-v0.4.5",
              "url": "https://github.com/F1R3FLY-io/f1r3node/releases/tag/scala-v0.4.5"
            }
          ],
          "total_count": 23
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "open_issues_count": 25,
          "pushed_at": "2026-03-16T17:53:49Z",
          "stargazers_count": 4
        },
        "issues": {
          "open_count": 25,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 6,
          "open_count": 13,
          "merged_prs": [
            {
              "number": 90,
              "title": "feat: add extended numeric types (Float, BigInt, BigRat, FixedPoint)",
              "merged_at": "2026-03-16T17:53:45Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rholang-rs/pull/90",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 89,
              "title": "feature/numeric types",
              "merged_at": "2026-03-07T00:18:02Z",
              "user": "machieke",
              "url": "https://github.com/F1R3FLY-io/rholang-rs/pull/89",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 71,
              "title": "Rholang wasm",
              "merged_at": "2026-03-10T16:56:38Z",
              "user": "berecik",
              "url": "https://github.com/F1R3FLY-io/rholang-rs/pull/71",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 55,
              "title": "F1r3node dependencies",
              "merged_at": "2026-03-06T03:43:36Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rholang-rs/pull/55",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 48,
              "title": "PathMap AST type",
              "merged_at": "2026-03-06T03:43:38Z",
              "user": "SerhiiL-DevBrother",
              "url": "https://github.com/F1R3FLY-io/rholang-rs/pull/48",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 43,
              "title": "Interactive Rholang shell with multiline input, async execution, process management, and built-in semantic validators",
              "merged_at": "2026-03-10T16:56:40Z",
              "user": "berecik",
              "url": "https://github.com/F1R3FLY-io/rholang-rs/pull/43",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 23,
          "contributors": [
            "berecik",
            "machieke",
            "spreston8"
          ],
          "recent": [
            {
              "sha": "d25f953",
              "message": "Merge pull request #90 from F1R3FLY-io/feat/numeric-types",
              "author": "spreston8",
              "date": "2026-03-16T17:53:45Z"
            },
            {
              "sha": "037eeba",
              "message": "fix: address review feedback on numeric types",
              "author": "spreston8",
              "date": "2026-03-13T02:34:53Z"
            },
            {
              "sha": "09de1a0",
              "message": "feat: add extended numeric types (Float, BigInt, BigRat, Fix...",
              "author": "spreston8",
              "date": "2026-03-11T04:45:55Z"
            },
            {
              "sha": "1f70db5",
              "message": "Merge pull request #71 from F1R3FLY-io/rholang-wasm",
              "author": "berecik",
              "date": "2026-03-10T16:56:37Z"
            },
            {
              "sha": "0dd1d07",
              "message": "Merge master into rholang-rspace-exec and resolve conflicts",
              "author": "berecik",
              "date": "2026-03-09T18:00:15Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": "2025-11-02T12:33:05Z",
          "latest_tag": "v0.1.0",
          "recent": [
            {
              "body_empty": true,
              "draft": false,
              "name": "v0.1.0",
              "prerelease": false,
              "published_at": "2025-11-02T12:33:05Z",
              "semver_ok": true,
              "tag_name": "v0.1.0",
              "url": "https://github.com/F1R3FLY-io/rholang-language-server/releases/tag/v0.1.0"
            }
          ],
          "total_count": 1
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "pushed_at": "2026-03-23T18:01:42Z",
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
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "open_issues_count": 20,
          "pushed_at": "2026-04-14T03:23:49Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 20,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 0,
          "open_count": 10,
          "merged_prs": []
        },
        "commits": {
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": [
          {
            "closed_at": null,
            "closed_issues": 1,
            "created_at": "2025-05-23T11:54:54Z",
            "description": "",
            "due_on": null,
            "open_issues": 0,
            "progress": 100,
            "state": "open",
            "title": "choreographer",
            "url": "https://github.com/F1R3FLY-io/embers/milestone/1"
          }
        ],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "pushed_at": "2026-04-01T14:33:15Z",
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
          "count": 0,
          "contributors": [],
          "recent": []
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "open_issues_count": 9,
          "pushed_at": "2026-03-18T22:03:37Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 9,
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": true,
          "path": "docs/roadmap.md",
          "updated": null,
          "parse_error": null
        }
      },
      {
        "repo": "rust-client",
        "exists": true,
        "info": {
          "archived": false,
          "description": null,
          "forks_count": 5,
          "language": "Rust",
          "name": "rust-client",
          "open_issues_count": 0,
          "pushed_at": "2026-04-13T21:46:32Z",
          "stargazers_count": 2
        },
        "issues": {
          "open_count": 0,
          "closed_in_period": 2,
          "opened_in_period": 0,
          "recent_closed": [
            {
              "number": 8,
              "title": "Lib only crate",
              "closed_at": "2026-03-11T13:41:54Z",
              "labels": []
            },
            {
              "number": 3,
              "title": "`epoch-rewards` command returns \"Complex expression\" instead of parsed data",
              "closed_at": "2026-03-10T18:03:31Z",
              "labels": []
            }
          ]
        },
        "prs": {
          "merged_count": 5,
          "open_count": 0,
          "merged_prs": [
            {
              "number": 15,
              "title": "ci: add build, test, and release workflows",
              "merged_at": "2026-03-30T03:52:10Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/15",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 14,
              "title": "Merge dev into main — Jan-Mar 2026 changes",
              "merged_at": "2026-03-14T01:01:10Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/14",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 13,
              "title": "fix: parse epoch-rewards response via HTTP API",
              "merged_at": "2026-03-10T18:03:04Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/13",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 12,
              "title": "Improve tip sampling and skip recoverable propose errors",
              "merged_at": "2026-03-09T22:44:10Z",
              "user": "machieke",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/12",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 10,
              "title": "Add library crate support with feature-gated CLI",
              "merged_at": "2026-03-05T14:57:53Z",
              "user": "spreston8",
              "url": "https://github.com/F1R3FLY-io/rust-client/pull/10",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 17,
          "contributors": [
            "machieke",
            "spreston8"
          ],
          "recent": [
            {
              "sha": "19d7cce",
              "message": "Merge branch 'dev'",
              "author": "spreston8",
              "date": "2026-03-17T05:12:31Z"
            },
            {
              "sha": "ba4a43a",
              "message": "Update f1r3node to e545187 (fix dhall-kubernetes submodule)",
              "author": "spreston8",
              "date": "2026-03-17T05:12:13Z"
            },
            {
              "sha": "9782461",
              "message": "Merge pull request #14 from F1R3FLY-io/dev",
              "author": "spreston8",
              "date": "2026-03-14T01:01:10Z"
            },
            {
              "sha": "1aad5b0",
              "message": "Merge origin/main into dev — resolve conflicts keeping dev",
              "author": "spreston8",
              "date": "2026-03-14T00:59:19Z"
            },
            {
              "sha": "c127cd2",
              "message": "docs: add API changelog for Jan-Mar 2026",
              "author": "spreston8",
              "date": "2026-03-14T00:54:20Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": "2026-04-10T02:06:16Z",
          "latest_tag": "v0.1.2",
          "recent": [
            {
              "body_empty": false,
              "draft": false,
              "name": "v0.1.2",
              "prerelease": true,
              "published_at": "2026-04-10T02:06:16Z",
              "semver_ok": true,
              "tag_name": "v0.1.2",
              "url": "https://github.com/F1R3FLY-io/rust-client/releases/tag/v0.1.2"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "v0.1.1",
              "prerelease": true,
              "published_at": "2026-03-30T04:11:38Z",
              "semver_ok": true,
              "tag_name": "v0.1.1",
              "url": "https://github.com/F1R3FLY-io/rust-client/releases/tag/v0.1.1"
            }
          ],
          "total_count": 2
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "pushed_at": "2026-03-24T13:19:36Z",
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
          "count": 5,
          "contributors": [
            "AndriiS-DevBrother"
          ],
          "recent": [
            {
              "sha": "2aaa5df",
              "message": "docs: add features and architecture documentation",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-24T13:19:24Z"
            },
            {
              "sha": "ff42cdc",
              "message": "chore: bump version to 0.1.1 for release",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-24T12:43:52Z"
            },
            {
              "sha": "2b9a4d2",
              "message": "fix: bypass macOS sandbox restrictions for mount detection",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-24T12:16:11Z"
            },
            {
              "sha": "10d0de5",
              "message": "fix: detect new MacFUSE mounts after F1R3Drive restart",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-23T18:09:19Z"
            },
            {
              "sha": "85f8fbe",
              "message": "feat: add .token file badge in Finder and custom UTI registr...",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-22T19:56:10Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": "2026-03-24T12:48:16Z",
          "latest_tag": "v0.1.1",
          "recent": [
            {
              "body_empty": false,
              "draft": false,
              "name": "F1r3drive Extensions v0.1.1",
              "prerelease": false,
              "published_at": "2026-03-24T12:48:16Z",
              "semver_ok": true,
              "tag_name": "v0.1.1",
              "url": "https://github.com/F1R3FLY-io/f1r3drive-extension/releases/tag/v0.1.1"
            },
            {
              "body_empty": false,
              "draft": false,
              "name": "F1r3drive Extensions v0.1.0",
              "prerelease": false,
              "published_at": "2025-06-13T11:37:05Z",
              "semver_ok": true,
              "tag_name": "v0.1.0",
              "url": "https://github.com/F1R3FLY-io/f1r3drive-extension/releases/tag/v0.1.0"
            }
          ],
          "total_count": 2
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "pushed_at": "2026-03-30T22:06:38Z",
          "stargazers_count": 5
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
          "count": 5,
          "contributors": [
            "Lucius Meredith",
            "leithaus"
          ],
          "recent": [
            {
              "sha": "3343fbe",
              "message": "fixing overzealous commit",
              "author": "Lucius Meredith",
              "date": "2026-03-02T18:55:27Z"
            },
            {
              "sha": "62892a1",
              "message": "small fix to mq-calculus paper; added MeTTaIL2Matrix for com...",
              "author": "Lucius Meredith",
              "date": "2026-03-02T18:54:45Z"
            },
            {
              "sha": "47b9e01",
              "message": "transcript of interaction with Claude",
              "author": "leithaus",
              "date": "2026-03-01T07:43:42Z"
            },
            {
              "sha": "7a498f9",
              "message": "added fuzzer prototype",
              "author": "leithaus",
              "date": "2026-03-01T07:41:25Z"
            },
            {
              "sha": "36b18b6",
              "message": "prototype of Gillespie style simulator",
              "author": "leithaus",
              "date": "2026-03-01T07:25:23Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "open_issues_count": 6,
          "pushed_at": "2026-03-30T17:31:02Z",
          "stargazers_count": 0
        },
        "issues": {
          "open_count": 6,
          "closed_in_period": 0,
          "opened_in_period": 0,
          "recent_closed": []
        },
        "prs": {
          "merged_count": 4,
          "open_count": 3,
          "merged_prs": [
            {
              "number": 44,
              "title": "feat: CLI enhancements and Finder visibility",
              "merged_at": "2026-03-24T13:32:02Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3drive/pull/44",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 43,
              "title": "fix: use Rust node and Heartbeat mode in e2e test",
              "merged_at": "2026-03-23T18:00:11Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3drive/pull/43",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 42,
              "title": "Feature/integration updates merge with main",
              "merged_at": "2026-03-30T14:47:24Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3drive/pull/42",
              "additions": null,
              "deletions": null,
              "comments": null
            },
            {
              "number": 41,
              "title": "Whitelabeled Rholang, Docker volume fix, Heartbeat-based E2E tests",
              "merged_at": "2026-03-20T09:00:20Z",
              "user": "AndriiS-DevBrother",
              "url": "https://github.com/F1R3FLY-io/f1r3drive/pull/41",
              "additions": null,
              "deletions": null,
              "comments": null
            }
          ]
        },
        "commits": {
          "count": 5,
          "contributors": [
            "AndriiS-DevBrother"
          ],
          "recent": [
            {
              "sha": "032e3ff",
              "message": "fix: use Rust node and Heartbeat mode in e2e test (#43)",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-23T18:00:11Z"
            },
            {
              "sha": "104fb46",
              "message": "Merge pull request #41 from F1R3FLY-io/andriis/whitelabled-f...",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-20T09:00:20Z"
            },
            {
              "sha": "7642f9c",
              "message": "use Heartbeat instead of Autoprpose",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-18T16:10:47Z"
            },
            {
              "sha": "09103bc",
              "message": "fix Volumes binding with Docker Engine at MacOS",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-18T11:35:16Z"
            },
            {
              "sha": "6e0dce6",
              "message": "fix: remove REV* usages in rholang",
              "author": "AndriiS-DevBrother",
              "date": "2026-03-17T15:48:56Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": "2025-06-18T15:21:30Z",
          "latest_tag": "v0.1.0",
          "recent": [
            {
              "body_empty": false,
              "draft": false,
              "name": "v0.1.0",
              "prerelease": false,
              "published_at": "2025-06-18T15:21:30Z",
              "semver_ok": true,
              "tag_name": "v0.1.0",
              "url": "https://github.com/F1R3FLY-io/f1r3drive/releases/tag/v0.1.0"
            }
          ],
          "total_count": 1
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "pushed_at": "2026-03-30T19:57:06Z",
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
          "count": 1,
          "contributors": [
            "jeffrey-l-turner"
          ],
          "recent": [
            {
              "sha": "01dbf85",
              "message": "Delete CNAME",
              "author": "jeffrey-l-turner",
              "date": "2026-03-30T19:57:06Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
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
          "pushed_at": "2026-04-15T23:06:49Z",
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
              "sha": "e7410a0",
              "message": "fix(board-report): resolve jq/grep argjson errors and regene...",
              "author": "jeffrey-l-turner",
              "date": "2026-03-20T04:06:45Z"
            },
            {
              "sha": "b182ae8",
              "message": "feat(board-report): add Milestone Analysis section with deli...",
              "author": "jeffrey-l-turner",
              "date": "2026-03-20T03:50:02Z"
            },
            {
              "sha": "6bf27d7",
              "message": "docs: surface system-integration and shardctl CLI across org...",
              "author": "jeffrey-l-turner",
              "date": "2026-03-19T18:55:07Z"
            },
            {
              "sha": "d8dcd8f",
              "message": "docs: reconcile repository inventory and dependency maps aga...",
              "author": "jeffrey-l-turner",
              "date": "2026-03-19T16:46:31Z"
            },
            {
              "sha": "ffa59e7",
              "message": "ci: restrict broken-link checks to master and fix landing pa...",
              "author": "jeffrey-l-turner",
              "date": "2026-03-11T17:27:39Z"
            }
          ]
        },
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": true,
          "path": "docs/roadmap.md",
          "updated": "YYYY-MM-DD",
          "parse_error": null
        }
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
        "milestones": [],
        "tracking_signals": {
          "labeled_tracking_issues": 0,
          "project_boards": 0
        },
        "releases": {
          "latest_published_at": null,
          "latest_tag": null,
          "recent": [],
          "total_count": 0
        },
        "roadmap": {
          "present": false,
          "path": null,
          "updated": null,
          "parse_error": null
        }
      }
    ]
  }
]
```

</details>

---

_Report generated by F1R3FLY.io Status Report System_
