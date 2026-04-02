---
paths: ["tech-stack*"]
description: Every technical choice must be documented in a decision log with alternatives and rationale.
---

# Decision Log Required

## Principle

Every technical choice in the tech stack must appear in a decision log table with:

| Column | Required | Content |
|--------|----------|---------|
| Decision | Yes | What was chosen |
| Rationale | Yes | WHY — the specific reasons for this project |
| Alternatives rejected | Yes | What else was considered |
| Risk | Yes | What could go wrong with this choice |
| Reversibility | Yes | How hard is it to change later (Low/Medium/High) |

## Decisions that MUST be logged

- Framework / meta-framework choice
- CMS choice (or decision to not use one)
- Hosting / deployment platform
- Animation library (and tier selection)
- Form handling approach
- Analytics tool
- Email / notification service
- Any third-party dependency > 10KB

## Anti-pattern

Never write "we chose X because it's the best" — that's not a rationale. State the SPECIFIC constraint that makes X better than Y for THIS project.

Example:
- ❌ "Astro is the best framework for static sites"
- ✅ "Astro ships 0KB JS by default — critical because our Tier 3 animation stack already adds 28KB eager. Next.js would add ~80KB React runtime on top."
