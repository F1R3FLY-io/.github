## Project Context
- This is the **F1R3FLY.io GitHub organization documentation repository** serving as a central hub for organizational knowledge
- F1R3FLY.io specializes in **high throughput transaction servers** with a focus on distributed systems and blockchain technologies
- The organization maintains multiple projects including RNode, Rholang implementations, and hyper-dimensional computing research
- Follow F1R3FLY.io's **documentation-first development methodology** for all content and features
- If the user does not provide enough information with their prompts, ask the user to clarify before executing the task
- DO NOT user emoticons in documentation or synthesized code. Keep it to text, tables, and hierachical structures. Prefer use of `.yaml` to document hierarchies

### Best Practices
- Never commit API keys, secrets, or credentials
- Review all content for sensitive information before committing
- Use environment variables for sensitive configuration
- Keep documentation access controls appropriate
- Review third-party links and resources regularly

## Security Considerations

## Common Tasks

## Development Environment

## Troubleshooting

### Common Issues

# F1R3FLY.io GitHub Documentation Repository

## Repository Architecture

### Technology Stack
- **GitHub** - Version control and collaboration platform
- **Markdown** - Documentation format
- **Git** - Version control system
- **GitHub Pages** - Static site hosting (when applicable)

### Content Structure
```
github/
├── docs/                     # Comprehensive documentation
│   ├── requirements/         # User stories, content requirements
│   ├── specifications/       # Technical specs, standards
│   ├── architecture/         # Organization structure, design decisions
│   ├── api/                 # Integration documentation
│   ├── templates/           # Document templates
│   └── governance/          # Organizational policies
├── profile/                 # GitHub organization profile
│   └── README.md           # Organization profile page
├── CLAUDE.md               # This file - AI assistant context
├── README.md               # Repository overview
└── LICENSE                 # Repository license
```

## F1R3FLY.io Organization Overview

### Core Focus Areas
- **High Throughput Transaction Servers** - Scalable distributed systems
- **Blockchain Infrastructure** - RNode platform with multi-consensus mechanisms
- **Rholang Programming Language** - Process calculus based concurrent programming
- **Hyper-Dimensional Computing** - rhoHDC encoding research
- **Developer Tools** - Language servers, parsers, and development environments

### Key Projects
1. **RNode** - Decentralized blockchain platform with four consensus mechanisms
2. **Rholang** - Concurrent programming language with formal verification
3. **rhoHDC** - Encoding of rho-calculus into hyper-dimensional computing
4. **Embers** - F1R3Sky wallets and agents
5. **Developer Tools** - Language servers, parsers, and Rust implementations

## Documentation Standards

### Documentation-First Methodology
All features and content updates must follow this process:
1. **Document Requirements** - Define purpose, audience, and acceptance criteria
2. **Create Specifications** - Technical details and implementation approach
3. **Architecture Decisions** - Document design choices and rationale
4. **Implementation** - Execute based on approved documentation
5. **Validation** - Ensure implementation matches documentation

### Documentation Structure
```
docs/
├── requirements/      # User stories, organizational requirements
├── specifications/    # Technical specs, standards, processes
├── architecture/      # Organization structure, design decisions
├── api/              # Integration documentation, protocols
├── templates/        # Document templates and examples
└── governance/       # Organizational policies, procedures
```

### Document Naming Conventions
- **Requirements**: `REQ-*` (Requirements), `US-*` (User Stories)
- **Specifications**: `SPEC-*` (Technical), `STD-*` (Standards)
- **Architecture**: `ADR-*` (Architecture Decision Records), `ORG-*` (Organizational)
- **Governance**: `POL-*` (Policies), `PROC-*` (Procedures)
- **Templates**: `TMPL-*` (Templates), `GUIDE-*` (Guidelines)

### Local Documentation Setup
```bash
# Clone the repository
git clone https://github.com/F1R3FLY-io/.github.git

# Navigate to documentation directory
cd .github

# View documentation structure
tree docs/

# Edit documentation with your preferred editor
code docs/
```

### GitHub Integration
- **Version Control**: All documentation tracked in Git
- **Collaboration**: Pull requests for documentation changes
- **Organization Profile**: Managed through `profile/README.md`
- **Templates**: Reusable templates in `docs/templates/`

## Content Management

### Organization Repositories
Reference the comprehensive repository guide:
- **[Organization of Repositories](docs/Organization_of_Repositories.md)** - Complete project overview
- **[Project Template](docs/Project_Template.md)** - Standard template for new repositories

### Documentation Categories

#### Requirements Documentation
```
docs/requirements/
├── user-stories/        # Feature requirements from user perspective
├── business-requirements/ # Business logic and constraints
└── acceptance-criteria/ # Definition of done for features
```

#### Specifications Documentation
```
docs/specifications/
├── technical/          # API specs, data schemas, algorithms
├── standards/          # Coding standards, best practices
└── processes/         # Development workflows, procedures
```

#### Architecture Documentation
```
docs/architecture/
├── decisions/         # Architecture Decision Records (ADRs)
├── diagrams/         # System component diagrams
└── patterns/         # Established patterns and conventions
```

## Repository Sections

### Organization Profile
- **[profile/README.md](profile/README.md)** - Public organization profile displayed on GitHub
- Showcases organization mission and key projects
- Links to important resources and documentation

### Documentation Hub
- **[docs/](docs/)** - Central documentation directory
- Organized by category for easy navigation
- Supports organization-wide knowledge management

### Templates and Guidelines
- **[docs/templates/](docs/templates/)** - Reusable document templates
- **[docs/governance/](docs/governance/)** - Organizational policies
- Standardized formats for consistent documentation

## Documentation Best Practices

### Markdown Standards
- **Headers**: Use proper hierarchy (H1 for titles, H2 for sections)
- **Links**: Use descriptive link text and relative paths when possible
- **Code Blocks**: Specify language for syntax highlighting
- **Images**: Include alt text and optimize file sizes
- **Tables**: Use for structured data presentation

### Version Control
- **Commit Messages**: Use conventional commits format
- **Branching**: Use feature branches for major documentation updates
- **Reviews**: Require pull request reviews for documentation changes
- **History**: Maintain clear documentation evolution history

### Creating New Documentation
1. Follow documentation-first methodology
2. Use appropriate template from `docs/templates/`
3. Place in correct category directory
4. Follow naming conventions
5. Create pull request for review

### Updating Organization Profile
1. Edit `profile/README.md` for organization profile
2. Update project links and descriptions
3. Ensure branding consistency
4. Test display on organization page

### Adding New Repository Documentation
1. Use **[Project Template](docs/Project_Template.md)** as starting point
2. Create repository-specific CLAUDE.md or equivalent
3. Document in **[Organization of Repositories](docs/Organization_of_Repositories.md)**
4. Follow established patterns and conventions

### Managing Templates
1. Update templates in `docs/templates/` directory
2. Ensure backward compatibility
3. Version control template changes
4. Communicate updates to development teams

## Testing and Validation

### Documentation Review Checklist
- [ ] Links work correctly and point to valid resources
- [ ] Markdown renders properly on GitHub
- [ ] Code examples are accurate and tested
- [ ] Images display correctly with appropriate alt text
- [ ] Information is current and accurate
- [ ] Follows organization style guidelines

### Quality Assurance
- **Accuracy**: Information is factual and up-to-date
- **Clarity**: Documentation is clear and well-structured  
- **Completeness**: All necessary information is included
- **Consistency**: Follows established patterns and conventions
- **Accessibility**: Content is accessible to all users

## Git Workflow

### Branching Strategy
- **main**: Production branch (auto-deploys)
- **develop**: Integration branch
- **feature/***: New features
- **fix/***: Bug fixes
- **content/***: Content updates

### Commit Guidelines
- Use descriptive commit messages
- Reference issues when applicable
- Keep commits focused and atomic
- Test before committing

### File Management
- **DO NOT** commit sensitive data or credentials
- **DO NOT** commit large binary files without justification
- **DO** use .gitignore for temporary and local files
- **DO** optimize images and documents before committing

### Information Security
- Classify documentation by sensitivity level
- Protect internal process documentation appropriately
- Ensure public documentation doesn't reveal security vulnerabilities
- Regular security review of published content

#### Git Repository Issues
```bash
# Check repository status
git status

# View commit history
git log --oneline

# Fix merge conflicts
git diff
```

#### Markdown Rendering Issues
```bash
# Preview locally using your editor's markdown preview
# or use online tools like:
# - GitHub's markdown preview
# - markdownlivepreview.com
```

#### Link and Reference Issues
- Check relative paths are correct
- Verify external links are still valid
- Ensure internal references point to existing files
- Test all links periodically

## Resources

### F1R3FLY.io Links
- **Website**: [f1r3fly.io](https://f1r3fly.io)
- **GitHub**: [github.com/F1R3FLY-io](https://github.com/F1R3FLY-io)
- **Contact**: f1r3fly.ceo@gmail.com

### Documentation Resources
- [GitHub Markdown Guide](https://docs.github.com/en/get-started/writing-on-github)
- [Git Documentation](https://git-scm.com/doc)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Documentation Best Practices](https://documentation.divio.com/)

## Project Principles

### Core Values
- **Documentation-First**: Every change starts with documentation
- **Transparency**: Open source and community-driven
- **Performance**: Optimize for speed and efficiency
- **Security**: Protect user data and maintain trust
- **Innovation**: Push boundaries in distributed computing

### Quality Standards
- **Code Quality**: Clean, maintainable, documented
- **Content Quality**: Accurate, engaging, valuable
- **Design Quality**: Consistent, accessible, responsive
- **Performance Quality**: Fast, efficient, scalable

## Git & Hygiene

- Use the `/quick-commit` slash command for git add/commit operations; use the `/recursive-push` command for git push operations. Do not run `git add`, `git commit`, or `git push` directly unless explicitly requested.
- `git mv` is permitted but requires user confirmation.
- Never discard user changes; avoid destructive git commands.
- Keep .env files and secrets out of the repo.
- Follow existing formatting/lint/typecheck scripts before shipping significant code changes.

## Attributions

- Do not include any references to Claude co-authoring commits or code.

## Important Instructions
- Do what has been asked; nothing more, nothing less
- NEVER create files unless absolutely necessary
- ALWAYS prefer editing existing files
- NEVER proactively create documentation files unless requested
- Follow F1R3FLY.io's documentation-first methodology
- Ask for clarification when requirements are unclear

### Key Principles

1. **Stigmergic Collaboration**: Coordinate with other agents through shared `.md` files
2. **Document-First**: Create design docs and specifications BEFORE implementation
3. **Signal vs. Slop**: Maximize code that solves problems; avoid over-engineering
4. **Acceptance Criteria**: Define measurable success criteria in task definitions

### Standard Document Structure

| Document | Purpose | Location |
|----------|---------|----------|
| User Stories | Business needs and acceptance criteria | `docs/UserStories.md` |
| Tasks/Epochs | Implementation tracking | `docs/ToDos.md` |
| Completed Work | Historical reference | `docs/CompletedTasks.md` |
| Backlog | Deferred items | `docs/Backlog.md` |
| Work Logs | Session progress | `docs/work-logs/*.md` |
| Discoveries | Shared findings | `docs/discoveries/*.md` |

### Before Starting Work

1. **Read `docs/ToDos.md`** to check task status and claims
2. **Check `docs/work-logs/`** for existing progress on related tasks
3. **Review `docs/discoveries/`** for relevant context from other agents

### When Claiming a Task

Update the task in `docs/ToDos.md`:

```yaml
---
id: TASK-001
status: in_progress          # Changed from 'pending'
claimed_by: claude-session-a1b2c3  # See Implementer Identification format
claimed_at: 2025-01-15T10:00:00Z
# Other valid claimed_by formats:
#   human-jeff@example.com        # Human (git config --get user.email)
#   design-sprint/researcher      # Agent team member ({team}/{name})
---
```

### During Work

1. **Create work log** at `docs/work-logs/task-{id}-{timestamp}.md`
2. **Document discoveries** in `docs/discoveries/` for other agents
3. **Update blockers** if you encounter dependencies

### Before Pausing/Completing

Update your work log with handoff notes:

```yaml
---
handoff_status: ready | paused | blocked
next_steps:
  - What remains to be done
---
```

### Configuration File Conventions

When creating or modifying configuration files, follow these conventions to respect existing project preferences:

**JSON Format Preference Order:**

1. **Check for existing files first**: Before creating any `.json` file, check if `.jsonc` or `.json5` variants exist
2. **Prefer existing format**: If `config.jsonc` or `config.json5` exists, use that format instead of creating `config.json`
3. **Default to JSONC**: When creating new config files, prefer `.jsonc` (JSON with Comments) for better maintainability

**Why This Matters:**
- Projects may have established preferences for comment-supporting JSON formats
- Creating duplicate configs (e.g., both `biome.json` and `biome.jsonc`) causes confusion
- JSONC allows inline documentation which improves maintainability

**Examples:**

| If exists... | Don't create... | Instead... |
|--------------|-----------------|------------|
| `biome.jsonc` | `biome.json` | Edit the existing `biome.jsonc` |
| `tsconfig.json5` | `tsconfig.json` | Edit the existing `tsconfig.json5` |
| `eslint.config.jsonc` | `eslint.config.json` | Edit the existing file |
| Nothing | - | Create new file as `.jsonc` when comments are useful |

**File Discovery Pattern:**

Before creating any config file, check for variants:
```bash
# Check for config variants (example for biome)
ls biome.json biome.jsonc biome.json5 2>/dev/null
```

This applies to all slash commands and scripts that create configuration files.

#### Git Operations
- `/quick-commit` - Stage and commit changes (required in safe mode)
- `/recursive-push` - Push across repositories

#### Task Management
- `/nextTask` - Find and select next task to work on
- `/implement` - Begin implementation of a task
- `/epoch-review` - Preview and summarize epochs
- `/epoch-hygiene` - Archive completed epochs

#### Workspace Sync
- `/harmonize` - Sync workspace policies into this repo
- `/multi-repo-sync` - Workspace-wide sync orchestration

[OPTIONAL_COMMANDS]

### PII Guidelines for Contributors

**CRITICAL - Before submitting any contribution:**

Contributors MUST ensure their code, commits, and documentation do NOT contain PII:

**Check before committing:**
- [ ] No absolute file paths with usernames in code or documentation
- [ ] No personal email addresses in code (use generic examples like `user@example.com`)
- [ ] No real user data in tests or examples (use synthetic/fake data only)
- [ ] No PII in log statements (sanitize or use user IDs instead)
- [ ] No PII in error messages or stack traces
- [ ] No PII in code comments or documentation
- [ ] No credentials, tokens, or secrets in code (use environment variables)
- [ ] No IP addresses, MAC addresses, or device identifiers in examples

**If you accidentally committed PII:**
1. **DO NOT** push to remote repository
2. Use `git reset` to remove the commit
3. If already pushed, contact maintainers immediately
4. Repository history may need to be rewritten to remove PII

**Use these instead:**
- File paths: Use relative paths or generic placeholders (`[WORKSPACE_ROOT]/project/`)
- Email addresses: Use `user@example.com`, `admin@example.com`
- Names: Use `John Doe`, `Jane Smith`, `User123`
- Phone numbers: Use `+1-555-0100` (officially reserved for examples)
- IP addresses: Use reserved ranges (`192.0.2.1`, `198.51.100.1`, `203.0.113.1`)
- Dates: Use recent but generic dates, not specific personal dates

**For test data:**
- Use test data generators that create realistic but fake data
- Use well-known test fixtures (e.g., `test@example.com`)
- Never use production or real user data in development/testing

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.
Before making any code changes, first state: (1) which files you plan to modify, (2) what approach you'll take, (3) any assumptions you're making. Wait for my confirmation before proceeding. For simple single-file edits, a one-line summary is sufficient.
