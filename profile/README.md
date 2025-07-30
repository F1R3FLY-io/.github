# Project Template for Repositories

# [Project Name]
[Brief project description - 1-2 sentences explaining what this project does and its value proposition]

## 🚀 Quick Start

```bash
# Install dependencies
[package-manager] install

# Start development
[package-manager] dev

# Build project
[package-manager] build

# Run tests
[package-manager] test
```

### With Nix/Direnv (Recommended)

```bash
# Enter development shell with all dependencies
direnv allow

# Or manually with nix
nix develop

# Dependencies and environment are automatically configured
[package-manager] dev
```

## 📚 Documentation-First Approach

This project follows a documentation-first methodology optimized for both human developers and LLM-assisted development. All features begin with documentation, ensuring clear requirements before implementation.

### Core Documentation Structure

- **[📋 Requirements](docs/requirements/)** - User stories, business requirements, and acceptance criteria
  - `user-stories/` - Feature requirements from user perspective
  - `business-requirements/` - Business logic and constraints
  - `acceptance-criteria/` - Definition of done for features
  
- **[📐 Specifications](docs/specifications/)** - Technical specifications and design documents
  - `visual-design/` - UI/UX mockups, wireframes, and style guides
  - `technical/` - API specifications, data schemas, and algorithms
  - `integration/` - Third-party service integration specs
  
- **[🏗️ Architecture](docs/architecture/)** - System design and architectural decisions
  - `decisions/` - Architecture Decision Records (ADRs)
  - `diagrams/` - System component diagrams and data flows
  - `patterns/` - Established patterns and conventions
  
- **[✅ Current Status](docs/ToDos.md)** - Live project status, active tasks, and priorities

### For Contributors

- **[🤝 Contributing Guide](CONTRIBUTING.md)** - Complete workflow for development
- **[🔧 Development Setup](docs/development-setup.md)** - Environment configuration
- **[🐚 Nix/Direnv Setup](docs/nix-setup.md)** - Reproducible development environments
- **[🧪 Testing Guide](docs/testing.md)** - Testing strategies and conventions
- **[📖 API Documentation](docs/api/)** - API reference and examples

### For LLM-Assisted Development

When using AI coding assistants (Claude, GitHub Copilot, etc.), provide context from:

1. **Project Context**: `[LLM-CONTEXT].md` (e.g., CLAUDE.md, COPILOT.md)
2. **Requirements**: Relevant files from `docs/requirements/`
3. **Specifications**: Technical specs from `docs/specifications/`
4. **Architecture**: Constraints from `docs/architecture/`
5. **Current Tasks**: Priorities from `docs/ToDos.md`

## 🗂️ Project Structure

```
[project-name]/
├── docs/                    # Documentation hierarchy
│   ├── requirements/        # Business and user requirements
│   ├── specifications/      # Technical specifications
│   ├── architecture/        # System design documents
│   ├── api/                # API documentation
│   └── ToDos.md            # Current status and tasks
├── src/                    # Source code
│   ├── components/         # [Framework-specific organization]
│   ├── services/           # Business logic and services
│   ├── utils/              # Shared utilities
│   └── types/              # TypeScript types/interfaces
├── tests/                  # Test suites
│   ├── unit/              # Unit tests
│   ├── integration/       # Integration tests
│   └── e2e/               # End-to-end tests
├── scripts/               # Build and utility scripts
├── .github/               # GitHub configuration
│   └── workflows/         # CI/CD pipelines
├── [LLM-CONTEXT].md      # LLM assistant context
└── README.md             # This file
```

## 🔄 Development Workflow

1. **📖 Documentation First**
   - Start with requirements in `docs/requirements/`
   - Create/update technical specs in `docs/specifications/`
   - Document architectural decisions in `docs/architecture/decisions/`

2. **🤖 LLM Integration**
   - Provide comprehensive context from documentation
   - Reference `[LLM-CONTEXT].md` for project-specific instructions
   - Update documentation alongside code changes

3. **⚙️ Development Standards**
   - Use Nix/Direnv for consistent development environments
   - Follow test-driven development (TDD) practices
   - Maintain code coverage targets (e.g., 90%+)
   - Use conventional commits for version control
   - Implement CI/CD checks before merging

4. **📝 Continuous Documentation**
   - Keep `docs/ToDos.md` updated with current status
   - Update relevant documentation with each PR
   - Maintain README files at directory levels for complex modules

## 🛠️ Technical Stack

- **Languages**: [Primary languages used]
- **Frameworks**: [Main frameworks]
- **Testing**: [Testing frameworks]
- **Build Tools**: [Build/bundling tools]
- **Package Manager**: [npm/yarn/pnpm]
- **Version Control**: Git with [branching strategy]
- **Development Environment**: Nix flakes + Direnv for reproducible environments

## 🧪 Testing

```bash
# Run all tests
[package-manager] test

# Run specific test suites
[package-manager] test:unit
[package-manager] test:integration
[package-manager] test:e2e

# Coverage report
[package-manager] test:coverage
```

## 🚢 Deployment

[Brief deployment instructions or link to detailed deployment guide]

## 🔐 Security

- Security policies and guidelines in `SECURITY.md`
- Vulnerability reporting procedures
- Security best practices for contributors

## 📈 Performance

- Performance benchmarks and targets
- Optimization guidelines
- Monitoring and metrics

## 🤝 Contributing

Please read our [Contributing Guide](CONTRIBUTING.md) for details on:
- Code of conduct
- Development process
- Pull request process
- Coding standards
- Documentation requirements

## 📄 License

[![License: Apache 2.0](https://img.shields.io/github/license/saltstack/salt.png)](https://www.apache.org/licenses/LICENSE-2.0)

## 🙏 Acknowledgments

- [Credits and acknowledgments]
- [Third-party libraries and tools]

---

<details>
<summary>📦 Additional Resources</summary>

- [Project Website/Demo]
- [Documentation Site]
- [API Reference]
- [Community Forum/Discord]
- [Issue Tracker]

</details>

---

> **Note for F1r3fly-io Projects**: This template supports our organization's commitment to documentation-first development and LLM-enhanced workflows. Customize sections based on your project's specific needs while maintaining the core documentation structure.
