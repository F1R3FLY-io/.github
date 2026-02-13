# F1R3FLY.io Repository Navigation Guide

## Purpose

This document is the canonical repository map for the `F1R3FLY-io` organization.
It is intended for engineering, partner enablement, and documentation alignment.

Repository inventory was reconciled against live org metadata on `2026-02-13` via `gh api`.

## Canonical Naming Conventions

- Use exact repository slugs as canonical identifiers in all docs (for example: `f1r3node`, `graphl-parser`, `f1r3sky-backend`).
- Treat legacy names as deprecated documentation aliases.
- For private repositories, reference name and role only; do not include private repository URLs in partner-facing docs.

### Deprecated-to-Canonical Mapping

| Deprecated Reference | Canonical Reference |
|---|---|
| `f1r3fly` | `f1r3node` |
| `graph-to-rholang-parser` | `graphl-parser` |
| `f1r3sky-backend-rs` / `f1r3sky-backend-ts` | `f1r3sky-backend` |
| `MeTTa` | `MeTTaIL` / `mettail-rust` / `MeTTa-Compiler` |
| `F1R3FLYFS` | `f1r3drive` |

## Portfolio Summary

- Total repositories: `59`
- Public repositories: `49`
- Private repositories: `10`

## Public Repositories by Domain

### Core Platform and Protocol

- [`f1r3node`](https://github.com/F1R3FLY-io/f1r3node): core transaction server and node implementation.
- [`f1r3node-rust`](https://github.com/F1R3FLY-io/f1r3node-rust): shard/docker monorepo for node deployment.
- [`pyf1r3fly`](https://github.com/F1R3FLY-io/pyf1r3fly): Python interface for node integration.
- [`rust-client`](https://github.com/F1R3FLY-io/rust-client): Rust client SDK.
- [`f1r3fly-rgb-lightning-node`](https://github.com/F1R3FLY-io/f1r3fly-rgb-lightning-node): RGB/lightning integration node work.
- [`rust-lightning`](https://github.com/F1R3FLY-io/rust-lightning): Rust lightning integration code.

### Language, Semantics, and Developer Tooling

- [`rholang-rs`](https://github.com/F1R3FLY-io/rholang-rs): Rust Rholang implementation.
- [`rholang`](https://github.com/F1R3FLY-io/rholang): core Rholang language repo.
- [`graphl-parser`](https://github.com/F1R3FLY-io/graphl-parser): graph-to-Rholang parser implementation.
- [`rholang-language-server`](https://github.com/F1R3FLY-io/rholang-language-server): LSP server for Rholang.
- [`rholang-vscode-client`](https://github.com/F1R3FLY-io/rholang-vscode-client): VS Code client extension.
- [`rholang-nvim`](https://github.com/F1R3FLY-io/rholang-nvim): Neovim client.
- [`rholang-emacs-client`](https://github.com/F1R3FLY-io/rholang-emacs-client): Emacs client.
- [`rholang-dev`](https://github.com/F1R3FLY-io/rholang-dev): developer-facing pages/resources.
- [`OSLF`](https://github.com/F1R3FLY-io/OSLF): formal semantics/generator work for MeTTaIL.
- [`OSLF-editor`](https://github.com/F1R3FLY-io/OSLF-editor): editor tooling for OSLF.
- [`MeTTaIL`](https://github.com/F1R3FLY-io/MeTTaIL): MeTTa intermediate language.
- [`mettail-rust`](https://github.com/F1R3FLY-io/mettail-rust): Rust implementation work around MeTTaIL.
- [`MeTTa-Compiler`](https://github.com/F1R3FLY-io/MeTTa-Compiler): compiler from MeTTa to MeTTaIL.
- [`MeTTaCycleYellowPaper`](https://github.com/F1R3FLY-io/MeTTaCycleYellowPaper): platform/yellow-paper specification.
- [`bnfc`](https://github.com/F1R3FLY-io/bnfc): grammar tooling.
- [`rhoHDC`](https://github.com/F1R3FLY-io/rhoHDC): rho-calculus and hyper-dimensional computing.
- [`itm`](https://github.com/F1R3FLY-io/itm): interacting trie maps.
- [`hypercube`](https://github.com/F1R3FLY-io/hypercube): hypercube experiments.
- [`Hypervector`](https://github.com/F1R3FLY-io/Hypervector): hypervector experiments.

### Applications and User Experience

- [`embers`](https://github.com/F1R3FLY-io/embers): wallets and agents backend.
- [`embers-frontend`](https://github.com/F1R3FLY-io/embers-frontend): web UI for embers.
- [`f1r3sky`](https://github.com/F1R3FLY-io/f1r3sky): social platform fork/application.
- [`f1r3sky-backend`](https://github.com/F1R3FLY-io/f1r3sky-backend): backend services for `f1r3sky`.
- [`f1r3sky-client`](https://github.com/F1R3FLY-io/f1r3sky-client): client app for web/mobile.
- [`f1r3sky-demo-scripts`](https://github.com/F1R3FLY-io/f1r3sky-demo-scripts): demo/testing scripts.
- [`demo-f1r3sky-game`](https://github.com/F1R3FLY-io/demo-f1r3sky-game): demo game integration.
- [`f1r3wallet`](https://github.com/F1R3FLY-io/f1r3wallet): basic wallet app.
- [`f1r3bot`](https://github.com/F1R3FLY-io/f1r3bot): Discord integration bot.
- [`lightning-bug`](https://github.com/F1R3FLY-io/lightning-bug): browser-based code editor.
- [`newspeak`](https://github.com/F1R3FLY-io/newspeak): federated chat research/app work.

### Infrastructure, Operations, and Visualization

- [`IaC`](https://github.com/F1R3FLY-io/IaC): infrastructure automation (Python).
- [`F1r3bu1ld3r`](https://github.com/F1R3FLY-io/F1r3bu1ld3r): visualization-assisted infrastructure tooling.
- [`system-integration`](https://github.com/F1R3FLY-io/system-integration): cross-project integration code.
- [`Sankey_block_explorer`](https://github.com/F1R3FLY-io/Sankey_block_explorer): block explorer and visualization.
- [`f1r3drive`](https://github.com/F1R3FLY-io/f1r3drive): drive/storage integration work.
- [`f1r3drive-extension`](https://github.com/F1R3FLY-io/f1r3drive-extension): extension integration for `f1r3drive`.

### Governance, Documentation, and Process

- [`F1R3FLY-io.github.io`](https://github.com/F1R3FLY-io/F1R3FLY-io.github.io): organization docs/website content.
- [`f1r3fly-io-website`](https://github.com/F1R3FLY-io/f1r3fly-io-website): website source code.
- [`.github`](https://github.com/F1R3FLY-io/.github): organization templates and contributor guidelines.
- [`fflip`](https://github.com/F1R3FLY-io/fflip): F1R3FLY improvement proposal workflow.
- [`FIPS`](https://github.com/F1R3FLY-io/FIPS): improvement process submissions.
- [`devin-onboarding-task-tracker`](https://github.com/F1R3FLY-io/devin-onboarding-task-tracker): onboarding/task-tracker sample project.
- [`MacroLoop`](https://github.com/F1R3FLY-io/MacroLoop): macroloop fork repo.

## Private Repositories (No URL References)

- `Branding`: digital brand assets.
- `CorporateDocuments`: official corporate documents.
- `dev.github.io`: internal developer pages.
- `f1r3fly-rgb`: private RGB fork for Rholang integration.
- `f1r3fly-rgb-wallet`: private RGB wallet implementation.
- `F1R3FLY.ai`: private delivery vehicle for OSLF initiatives.
- `Rholang-RGB`: private financial-scope repository.
- `Singularity-Scale`: SingularityNET-related monorepo.
- `skein`: private virtual instrument repository.
- `SNETPackages`: private dependencies for SingularityNET projects.

## Suggested Entry Points by Role

### System Integrators and Partners

1. Start with `f1r3node`, `rholang-rs`, and `OSLF` to understand platform and correctness model.
2. Review `F1r3bu1ld3r`, `IaC`, and `system-integration` for deployment and integration pathways.
3. Explore `embers`, `f1r3sky`, and `f1r3drive` as application and service exemplars.

### Language/Tooling Engineers

1. Start with `rholang-rs`, `rholang-language-server`, and `graphl-parser`.
2. Extend into `MeTTaIL`, `mettail-rust`, and `MeTTa-Compiler`.

### Product and Program Owners

1. Use `FIPS` and `fflip` for governance and roadmap process.
2. Use `.github` and this document as canonical naming references for planning artifacts.

## Maintenance Notes

- Update this guide whenever repositories are renamed, merged, or retired.
- Before publishing partner-facing materials, verify repo names against live metadata:

```bash
gh api '/orgs/F1R3FLY-io/repos?per_page=100&type=all'
```
