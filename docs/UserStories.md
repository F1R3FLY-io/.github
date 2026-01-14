---
doc_type: user_stories
version: "1.0"
last_updated: 2026-01-14
---

# User Stories

This document captures user stories that drive feature development. User stories are reverse-engineered from completed epochs and updated as new features are planned.

**Document Structure**
- Active stories: This file (`docs/UserStories.md`)
- Implementation tracking: `docs/ToDos.md` (epochs and tasks)
- Completed work: `docs/CompletedTasks.md`

**Format:** Each story follows the standard template:
> As a [persona], I want [capability] so that [benefit].

**For reference (GitHub):**
[User Stories Standard](https://gitlab.com/smart-assets.io/gitlab-profile/-/blob/master/docs/common/user-stories-standard.md)

---

## Completed Stories

<!-- Add completed stories here following the template below -->

---

## Planned Stories

Stories below are candidates for future epochs. Move to "Completed Stories" when implemented.

---

<!-- Add planned stories here following the template below -->

---

## Story Template

Use this template when adding new user stories:

```markdown
#### US-XXX: [Short Title]

> As a **[persona]**, I want **[capability]** so that **[benefit]**.

**Implemented in:** [EPOCH-ID or "Planned"]

**Acceptance Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

**Completed:** [Date or "Planned"]
```

---

## Relationship to Epochs

User stories capture the **why** (user need and benefit). Epochs capture the **what** (technical implementation tasks).

| Artifact | Purpose | Location |
|----------|---------|----------|
| User Story | Business/user need | `docs/UserStories.md` |
| Epoch | Implementation scope | `docs/ToDos.md` |
| Task | Technical work item | Nested in epoch YAML |
| Acceptance Criteria | Definition of done | In user story |

**Workflow:**
1. Identify user need -> Create user story
2. Design solution -> Create epoch with tasks
3. Implement -> Work through tasks via `/nextTask` and `/implement`
4. Complete -> Mark epoch complete, update story status

---

## References

- **Task Tracking:** `docs/ToDos.md`
- **Completed Work:** `docs/CompletedTasks.md`
