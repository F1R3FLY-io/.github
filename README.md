# F1R3FLY.io Organization Documentation

Central hub for F1R3FLY.io's organizational documentation, templates, and governance. This repository serves as the single source of truth for organization-wide knowledge management and project standards.

**Quick Navigation**: [Documentation Index](docs/Documentation_Index.md) | [Repository Guide](docs/Organization_of_Repositories.md) | [FIPs](https://github.com/F1R3FLY-io/fflip) | [Project Template](docs/Project_Template.md)

## Quick Start

```bash
# Clone the documentation repository
git clone https://github.com/F1R3FLY-io/.github.git

# Navigate to documentation
cd .github

# View documentation structure
tree docs/

# Edit with your preferred editor
code docs/
```

## Status Reports

Generate status reports across all F1R3FLY.io repositories.

**Prerequisites:** `brew install gh jq && gh auth login`

**Generate reports:**
```bash
./scripts/generate-github-status-report.sh              # Monthly (previous month)
./scripts/generate-github-status-report.sh --daily      # Daily (yesterday)
./scripts/generate-github-status-report.sh --mtd        # Month-to-date
./scripts/generate-github-status-report.sh --annual     # Annual (previous year)
./scripts/generate-github-status-report.sh --dry-run    # Preview only
```

**With Claude Code:** Use `/generate-github-status` to generate reports interactively. To enable:

```bash
$ ln -s "$(pwd)/prompts/generate-github-status.md" ~/.claude/commands/
$ claude # or --continue to restart with /slash command
```

Reports are saved to `docs/reports/` with metrics, PR lists, milestones, and contributor data.

**Sample report:** [2026-01 MTD Sample Report](docs/reports/2026-01-mtd-sample-report.md)

## Explainer Viewer Scaffold

This repository now includes a Vite + TypeScript scaffold for a SMIL/SVG explainer viewer with:

- SVG playback controls (play/pause, seek, keyboard transport)
- speed profiles (`0.10x`, `0.25x`, `1x`, `1.5x`, `2x`)
- stage-by-speed narration model (different stage counts per speed)
- optional ElevenLabs narration hooks via environment variables
- GitHub Pages deployment workflow

### Local run

```bash
pnpm install
pnpm run dev
```

### Build

```bash
pnpm run build
```

### Unit tests

```bash
pnpm run test
```

### Pre-push hook setup

```bash
./scripts/setup-hooks.sh
```

Optional copy mode:

```bash
./scripts/setup-hooks.sh --copy
```

The hook runs:

- `pnpm run typecheck`
- `pnpm run test`
- `pnpm run build` (skipped with `QUICK=1`)

### Files to edit in follow-up steps

- `docs/images/F1r3fly_explainer.svg` (SMIL animation asset, not yet created)
- `docs/images/F1r3fly_explainer.jsonc` (runtime stage and narration data)
- `docs/images/F1r3fly_explainer.md` (editable narrative draft source)

### Optional TTS setup

Set these in `.env`:

```bash
VITE_EL_TTS=your_elevenlabs_api_key
VITE_EL_VOICE=your_elevenlabs_voice_id
```

## 📚 Documentation Hub

### Core Documentation Resources

- **[📖 Documentation Index](./docs/Documentation_Index.md)** - Complete guide to all documentation, organized by role and category
- **[📂 Repository Guide](./docs/Organization_of_Repositories.md)** - Navigate all F1R3FLY.io projects by category
- **[📋 Project Template](./docs/Project_Template.md)** - Standard template for new repositories
- **[🔧 FIP Process](https://github.com/F1R3FLY-io/fflip)** - F1R3FLY.io Improvement Proposals

### Standards & Specifications

- **[🔗 Cross-Project Dependencies](./docs/Cross_Project_Dependencies.md)** - Ecosystem dependency mapping
- **[📐 API Documentation Standards](./docs/specifications/api/API_Documentation_Standards.md)** - REST, gRPC, GraphQL standards
- **[🧪 Testing Standards](./docs/specifications/testing/Testing_Standards.md)** - Comprehensive testing requirements
- **[🔐 Security Standards](./docs/specifications/security/Security_Standards.md)** - Security requirements and best practices
- **[🚀 Deployment Standards](./docs/deployment/Deployment_Standards.md)** - Infrastructure and deployment requirements

### For Contributors

```bash
# Create new documentation branch
git checkout -b docs/your-feature

# Make documentation changes
# Follow the documentation-first methodology

# Submit pull request for review
git add . && git commit -m "docs: add new feature documentation"
git push origin docs/your-feature
```

## F1R3FLY.io Documentation Hub

This repository follows F1R3FLY.io's documentation-first methodology, serving as the central knowledge base for the entire organization. All organizational changes, new projects, and processes begin with documentation.

### Key Repositories

#### Core Platform
- **[f1r3node](https://github.com/F1R3FLY-io/f1r3node)** - Core transaction node repository
- **[f1r3node-rust](https://github.com/F1R3FLY-io/f1r3node-rust)** - Standalone Rust workspace and Docker/shard setup for the pure-Rust node
- **[rust-client](https://github.com/F1R3FLY-io/rust-client)** - Rust client SDK for deploys, status, and network interaction

#### Language & Tools
- **[rholang-rs](https://github.com/F1R3FLY-io/rholang-rs)** - Rholang interpreter (Rust)
- **[rholang-language-server](https://github.com/F1R3FLY-io/rholang-language-server)** - LSP-based Language Server for Rholang (Rust)
- **[graphl-parser](https://github.com/F1R3FLY-io/graphl-parser)** - Graph to Rholang parser
- **[MeTTaIL](https://github.com/F1R3FLY-io/MeTTaIL)** - MeTTa intermediate language

#### Applications & Use Cases
- **[embers](https://github.com/F1R3FLY-io/embers)** - F1R3Sky wallets and agents (Rust)
- **[embers-frontend](https://github.com/F1R3FLY-io/embers-frontend)** - Web interface (TypeScript)
- **[f1r3sky](https://github.com/F1R3FLY-io/f1r3sky)** - F1R3FLY BlueSky fork (TypeScript)
- **[f1r3drive](https://github.com/F1R3FLY-io/f1r3drive)** - Canonical file system project using a FUSE-based interface on top of F1R3FLY shards
- **[F1R3Games](https://github.com/F1R3FLY-io/F1R3Games)** - Collective-intelligence games portfolio
- **[CatchingF1R3](https://github.com/F1R3FLY-io/CatchingF1R3)** - Decentralized voting application
- **[F1R3Fi](https://github.com/F1R3FLY-io/F1R3Fi)** - DeFi and financial engineering exploration
- **[lightning-bug](https://github.com/F1R3FLY-io/lightning-bug)** - Modern, extensible, browser-based code editor (Clojure)

#### Research & Publications
- **[rhoHDC](https://github.com/F1R3FLY-io/rhoHDC)** - rho-calculus and hyper-dimensional computing research
- **[publications](https://github.com/F1R3FLY-io/publications)** - Books, papers, and publication assets
- **[F1r3bu1ld3r](https://github.com/F1R3FLY-io/F1r3bu1ld3r)** - Visualization tool for Infrastructure as Code

**[Complete Repository Guide](https://github.com/F1R3FLY-io/.github/blob/master/docs/Organization_of_Repositories.md)** - View all projects with detailed descriptions

## Quick Links

- **[Project Template](https://github.com/F1R3FLY-io/.github/blob/master/docs/Project_Template.md)** - Standard template for F1R3FLY.io repositories
- **[LLM Context](CLAUDE.md)** - AI assistant instructions for this project
- **[GitHub Organization](https://github.com/F1R3FLY-io)** - View all repositories

### Organization Structure

- Repository Guide: Complete overview of all F1R3FLY.io projects
- Project Template: Standard template for new repositories  
- Organization Profile: Public GitHub organization profile

### Documentation Categories

```yaml
requirements:
  user_stories: "Feature requirements from stakeholder perspective"
  business_requirements: "Business logic and organizational constraints"
  acceptance_criteria: "Definition of done for organizational features"

specifications:
  technical: "API specifications, data schemas, and technical standards"
  standards: "Coding standards and best practices"
  processes: "Development workflows and procedures"

architecture:
  decisions: "Architecture Decision Records (ADRs)"
  diagrams: "System component diagrams and organizational structure"
  patterns: "Established patterns and conventions"

templates: "Reusable document templates"
governance: "Organizational policies and procedures"
```

### For Contributors

- Contributing Guide: Complete workflow for documentation contributions
- Documentation Standards: Guidelines for creating and maintaining documentation
- GitHub Setup: Organization GitHub configuration

### For LLM-Assisted Development

When using AI coding assistants across F1R3FLY.io projects, reference:

1. Organization Context: CLAUDE.md in this repository
2. Project Context: Individual project CLAUDE.md files
3. Standards: Documentation from docs/specifications/standards/
4. Templates: Resources from docs/templates/
5. Architecture: Constraints from docs/architecture/

## Repository Structure

```yaml
github:
  docs:
    requirements: "Organizational requirements and user stories"
    specifications: "Technical standards and processes"
    architecture: "Organization structure and design decisions"
    api: "Integration documentation and protocols"
    templates: "Document templates and examples"
    governance: "Organizational policies and procedures"
  profile:
    README.md: "Public organization profile page"
  github_config:
    workflows: "Organization-wide CI/CD templates"
  CLAUDE.md: "AI assistant context for organization"
  README.md: "This file - repository overview"
  LICENSE: "Repository license"
```

## Documentation Workflow

### Process Steps

```yaml
documentation_first:
  step_1: "Start with organizational requirements in docs/requirements/"
  step_2: "Create/update standards and processes in docs/specifications/"
  step_3: "Document architectural decisions in docs/architecture/decisions/"

organization_wide_llm_integration:
  context_source: "Provide comprehensive context from CLAUDE.md"
  project_context: "Reference project-specific CLAUDE.md files in individual repositories"
  maintenance: "Update documentation alongside organizational changes"

documentation_standards:
  methodology: "Follow documentation-first methodology for all changes"
  commits: "Use conventional commits for documentation changes"
  reviews: "Require pull request reviews for documentation updates"
  consistency: "Maintain consistency across all F1R3FLY.io projects"

continuous_knowledge_management:
  accuracy: "Keep organizational documentation updated and accurate"
  templates: "Update relevant templates with organizational changes"
  cross_references: "Maintain cross-references between projects and documentation"
```

## F1R3FLY.io Technology Ecosystem

### Core Technologies

```yaml
blockchain: "RNode platform with multi-consensus mechanisms"
languages: "Scala, Rust, TypeScript, Python, Clojure, Swift, Java"
distributed_systems: "High-throughput transaction processing"
smart_contracts: "Rholang concurrent programming language"
```

### Development Tools

```yaml
language_servers: "Rholang LSP for IDE support"
build_systems: "Various per-language (sbt, Cargo, npm, Gradle)"
version_control: "Git with documentation-first branching"
documentation: "Markdown with GitHub integration"
```

## Key F1R3FLY.io Projects

```yaml
core_platform:
  f1r3node:
    url: "https://github.com/F1R3FLY-io/f1r3node"
    description: "Core transaction node repository"
  f1r3node_rust:
    url: "https://github.com/F1R3FLY-io/f1r3node-rust"
    description: "Standalone Rust workspace and Docker/shard setup for the node"
  rholang_rs:
    url: "https://github.com/F1R3FLY-io/rholang-rs"
    description: "Rust Rholang implementation"

user_applications:
  embers:
    url: "https://github.com/F1R3FLY-io/embers"
    description: "F1R3Sky wallets and agents"
  f1r3sky:
    url: "https://github.com/F1R3FLY-io/f1r3sky"
    description: "Decentralized social platform"
  f1r3drive:
    url: "https://github.com/F1R3FLY-io/f1r3drive"
    description: "FUSE-based file system use case on top of F1R3FLY shards"
  F1R3Games:
    url: "https://github.com/F1R3FLY-io/F1R3Games"
    description: "Collective-intelligence games portfolio"

developer_tools:
  rholang_language_server:
    url: "https://github.com/F1R3FLY-io/rholang-language-server"
    description: "LSP for Rholang"
  graphl_parser:
    url: "https://github.com/F1R3FLY-io/graphl-parser"
    description: "Graph to Rholang parser"
  F1r3bu1ld3r:
    url: "https://github.com/F1R3FLY-io/F1r3bu1ld3r"
    description: "Infrastructure visualization"

research_innovation:
  MeTTaIL:
    url: "https://github.com/F1R3FLY-io/MeTTaIL"
    description: "MeTTa intermediate language"
  rhoHDC:
    url: "https://github.com/F1R3FLY-io/rhoHDC"
    description: "rho-calculus and hyper-dimensional computing"
  publications:
    url: "https://github.com/F1R3FLY-io/publications"
    description: "Books, papers, and publication assets"
```

## Documentation Resources

### Organization Documentation

```yaml
public_portal:
  url: "https://github.com/F1R3FLY-io/.github"
  description: "Public documentation portal"

organization_guide:
  url: "https://github.com/F1R3FLY-io/.github/blob/master/docs/Organization_of_Repositories.md"
  description: "Complete project overview"

project_template:
  url: "https://github.com/F1R3FLY-io/.github/blob/master/docs/Project_Template.md"
  description: "Standard repository template"
```

### Governance

```yaml
improvement_proposals:
  url: "https://github.com/F1R3FLY-io/fflip"
  description: "F1R3FLY improvement proposals"

security: "Organization-wide security policies and procedures"
standards: "Coding standards and best practices across projects"
```

## Contributing to F1R3FLY.io

### Documentation Contributions

```yaml
documentation_first: "All changes start with documentation"
follow_templates: "Use templates from docs/templates/"
review_process: "All documentation requires pull request review"
consistency: "Maintain organization-wide standards"
```

### Getting Started

- Contributing Guide: Complete workflow for documentation contributions
- Documentation Standards: Guidelines for creating and maintaining documentation
- Project Requirements: Check individual project repositories for specific requirements
- Project Template: Standard template for new repositories

### Process Overview

```yaml
step_1: "Document Requirements - Define purpose and acceptance criteria"
step_2: "Create Specifications - Technical details and implementation approach"
step_3: "Architecture Decisions - Document design choices and rationale"
step_4: "Implementation - Execute based on approved documentation"
step_5: "Validation - Ensure implementation matches documentation"
```

## License

[![License: Apache 2.0](https://img.shields.io/github/license/saltstack/salt.png)](https://www.apache.org/licenses/LICENSE-2.0)

## Acknowledgments

F1R3FLY.io is committed to advancing distributed computing and blockchain technology through:

```yaml
principles:
  - "Open source collaboration and transparency"
  - "Documentation-first development methodology"
  - "Innovation in concurrent programming languages"
  - "High-performance transaction processing systems"
```

## F1R3FLY.io Resources

```yaml
organization_website: "https://f1r3fly.io"
documentation_portal: "https://github.com/F1R3FLY-io/.github"
repository_guide: "https://github.com/F1R3FLY-io/.github/blob/master/docs/Organization_of_Repositories.md"
improvement_proposals: "https://github.com/F1R3FLY-io/fflip"
contact: "f1r3fly.ceo@gmail.com"
```

---

F1R3FLY.io Organization Hub: This repository serves as the central documentation and governance hub for the F1R3FLY.io organization. All organizational knowledge, standards, and templates are maintained here to support our distributed development ecosystem.
