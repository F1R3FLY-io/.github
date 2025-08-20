#  F1R3FLY.io Organization Overview

**Mission**: Building next-generation scalable, verifiable, and efficient transaction processing systems through distributed computing and blockchain infrastructure.

### Key Repositories

#### Core Platform
- **[f1r3fly](https://github.com/F1R3FLY-io/f1r3fly)** ⭐ - Main transaction server (Scala/Rust)

#### Language & Tools
- **[rholang-rs](https://github.com/F1R3FLY-io/rholang-rs)** - Rholang interpreter (Rust)
- **[rholang-language-server](https://github.com/F1R3FLY-io/rholang-language-server)** - LSP-based Language Server for Rholang (Rust)
- **[graph-to-rholang-parser](https://github.com/F1R3FLY-io/graph-to-rholang-parser)** - Graph to RhoLang parser (Rust)

#### Applications
- **[embers](https://github.com/F1R3FLY-io/embers)** - F1R3Sky wallets and agents (Rust)
- **[embers-frontend](https://github.com/F1R3FLY-io/embers-frontend)** - Web interface (TypeScript)
- **[f1r3sky](https://github.com/F1R3FLY-io/f1r3sky)** - F1R3FLY BlueSky fork (TypeScript)
- **[lightning-bug](https://github.com/F1R3FLY-io/lightning-bug)** - Modern, extensible, browser-based code editor (Clojure)

#### Research & Tools
- **[MeTTa](https://github.com/F1R3FLY-io/MeTTa)** - MeTTa 2.0 language (Scala)
- **[F1r3bu1ld3r](https://github.com/F1R3FLY-io/F1r3bu1ld3r)** - Visualization tool for Infrastructure as Code

📚 **[Complete Repository Guide](https://github.com/F1R3FLY-io/F1R3FLY-io.github.io/blob/main/docs/Organization_of_Repositories.md)** - View all projects with detailed descriptions

## Quick Links

- 📋 **[Project Template](https://github.com/F1R3FLY-io/F1R3FLY-io.github.io/blob/main/docs/Project_Template.md)** - Standard template for F1R3FLY.io repositories
- 🤖 **[LLM Context](https://github.com/F1R3FLY-io/F1R3FLY-io.github.io/blob/main/CLAUDE.md)** - AI assistant instructions for this project
- 🏢 **[GitHub Organization](https://github.com/F1R3FLY-io)** - View all repositories

## Quick Start

```bash
# Install dependencies
bundle install

# Start development server
bundle exec jekyll serve

# View site at http://localhost:4000
```

### With Nix/Direnv (Recommended)

```bash
# Auto-load development environment
direnv allow

# Start server with all dependencies configured
bundle exec jekyll serve
```

## 📁 Project Structure

```
F1R3FLY-io.github.io/
├── _posts/              # Portfolio projects and articles
├── _includes/           # Reusable HTML components
├── _layouts/            # Page templates
├── _data/               # Site configuration data
├── img/                 # Images and media
├── css/                 # Stylesheets
├── js/                  # JavaScript
├── docs/                # Documentation
│   ├── ORGANIZATION_REPOS.md   # Repository navigation
│   └── Project_Template.md     # Repository template
├── CLAUDE.md           # LLM assistant context
└── README.md           # This file
```

## 🛠 Site Management

### Adding Portfolio Items

1. Create new post in `_posts/` with format: `YYYY-MM-DD-project-name.markdown`
2. Add images to `/img/portfolio/`
3. Use this front matter template:

```yaml
---
layout: default
modal-id: 1
date: 2023-06-06
img: project-image.png
thumbnail: project-thumbnail.png
alt: image-alt-text
project-date: June 2023
client: Client Name
category: Development
description: Project description
---
```

### Updating Team Members

Edit `_config.yml` people section:

```yaml
people:
- name: Team Member
  pic: 1
  position: Role
  social:
    - title: twitter
      url: #
```

### Image Guidelines

- **Portfolio**: 650x350px (main), 400x289px (thumbnail)
- **Team**: 225x225px square
- **About**: 650x350px timeline
- **Format**: JPEG for photos, PNG for graphics

## 📚 Documentation-First Methodology

F1R3FLY.io follows a documentation-first approach. All features and changes should:

1. Start with documentation in `docs/`
2. Follow the [Project Template](docs/Project_Template.md) structure
3. Include clear requirements and specifications
4. Update relevant documentation with code changes

## 🧪 Testing

```bash
# Build site
bundle exec jekyll build

# Validate HTML
bundle exec htmlproofer ./_site

# Check configuration
bundle exec jekyll doctor

# Test with drafts
bundle exec jekyll serve --drafts
```

## 🚢 Deployment

The site automatically deploys to GitHub Pages when changes are pushed to `main`:

1. Push to `main` branch
2. GitHub Actions builds the site
3. Deploys to [f1r3fly.io](https://f1r3fly.io)
4. CNAME handles custom domain

## Contributing

1. **Document First** - Start with requirements/specifications
2. **Test Locally** - Use `bundle exec jekyll serve`
3. **Optimize Assets** - Compress images before committing
4. **Follow Standards** - Use conventional commits
5. **Security** - Never commit sensitive data

## 📈 Performance Optimization

- Compress images before upload
- Use lazy loading for below-fold content
- Leverage GitHub Pages CDN
- Minify CSS/JS in production

## Security

- Report vulnerabilities to f1r3fly.ceo@gmail.com
- See `SECURITY.md` for policies
- Regular dependency updates via Dependabot

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) file for details.

## 🔗 Resources

- **Website**: [f1r3fly.io](https://f1r3fly.io)
- **Organization**: [github.com/F1R3FLY-io](https://github.com/F1R3FLY-io)
- **Email**: f1r3fly.ceo@gmail.com
- **Jekyll Docs**: [jekyllrb.com](https://jekyllrb.com/docs/)
- **Agency Theme**: [startbootstrap.com](https://startbootstrap.com/themes/agency/)

---

*Building the future of distributed computing, one transaction at a time.* 

