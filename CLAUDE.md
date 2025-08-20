# F1R3FLY.io GitHub Documentation Repository

## Project Context
- This is the **F1R3FLY.io GitHub organization documentation repository** serving as a central hub for organizational knowledge
- F1R3FLY.io specializes in **high throughput transaction servers** with a focus on distributed systems and blockchain technologies
- The organization maintains multiple projects including RNode, Rholang implementations, and hyper-dimensional computing research
- Follow F1R3FLY.io's **documentation-first development methodology** for all content and features
- If the user does not provide enough information with their prompts, ask the user to clarify before executing the task
- DO NOT user emoticons in documentation or synthesized code. Keep it to text, tables, and hierachical structures. Prefer use of `.yaml` to document hierarchies

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

## Development Environment

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

## Common Tasks

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

## Security Considerations

### Best Practices
- Never commit API keys, secrets, or credentials
- Review all content for sensitive information before committing
- Use environment variables for sensitive configuration
- Keep documentation access controls appropriate
- Review third-party links and resources regularly

### Information Security
- Classify documentation by sensitivity level
- Protect internal process documentation appropriately
- Ensure public documentation doesn't reveal security vulnerabilities
- Regular security review of published content

## Troubleshooting

### Common Issues

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

## Important Instructions
- Do what has been asked; nothing more, nothing less
- NEVER create files unless absolutely necessary
- ALWAYS prefer editing existing files
- NEVER proactively create documentation files unless requested
- Follow F1R3FLY.io's documentation-first methodology
- Ask for clarification when requirements are unclear
