# F1R3FLY.io GitHub Documentation Repository

AI assistant guidance for F1R3FLY.io GitHub Documentation Repository. This file follows the Agentic AI Foundation (Linux Foundation) standard for AI coding assistants.

**Full documentation:** See [CLAUDE.md](CLAUDE.md) for comprehensive project guidelines.

## Project Context
- This is the **F1R3FLY.io GitHub organization documentation repository** serving as a central hub for organizational knowledge
- F1R3FLY.io specializes in **high throughput transaction servers** with a focus on distributed systems and blockchain technologies
- The organization maintains multiple projects including RNode, Rholang implementations, and hyper-dimensional computing research
- Follow F1R3FLY.io's **documentation-first development methodology** for all content and features
- If the user does not provide enough information with their prompts, ask the user to clarify before executing the task
- DO NOT user emoticons in documentation or synthesized code. Keep it to text, tables, and hierachical structures. Prefer use of `.yaml` to document hierarchies

## Git & Hygiene
- Use the `/quick-commit` slash command for git add/commit operations; use the `/recursive-push` command for git push operations. Do not run `git add`, `git commit`, or `git push` directly unless explicitly requested.
- `git mv` is permitted but requires user confirmation.
- Never discard user changes; avoid destructive git commands.
- Keep .env files and secrets out of the repo.
- Follow existing formatting/lint/typecheck scripts before shipping significant code changes.

## Attributions
- Do not include any references to Claude co-authoring commits or code.

## Security Considerations
- Never commit API keys, secrets, or credentials
- Review all content for sensitive information before committing
- Use environment variables for sensitive configuration
- Keep documentation access controls appropriate
- Review third-party links and resources regularly

---

**Detailed guidelines:** [CLAUDE.md](CLAUDE.md)
