---
description: All code must conform to upstream deliverables from agents 1-6. No improvisation.
---

# Spec Conformance

## Principle

Every element in the codebase must trace to an upstream deliverable. The implementation agent transforms specs into code — it does not create new design, copy, or strategy.

## Rules

| Domain | Source of truth | Rule |
|--------|----------------|------|
| Text content | Copy v1 (Agent 3) | Use verbatim. Never rewrite, shorten, or "improve". If a heading is too long for the layout, the layout adapts — the copy does not. |
| Design tokens | .tokens.json (Agent 4) | Consume as-is. Generate CSS custom properties from the JSON. No ad-hoc colors, spacings, or font sizes outside the token system. |
| Component specs | Component handoff (Agent 4) | Implement all 8 states specified. Match tokens, animations, responsive breakpoints, and a11y requirements exactly. |
| Animations | Motion strategy (Agent 4) | Implement only the effects listed. Respect the confirmed tier (1/2/3). Do not add "nice to have" effects. |
| Framework & deps | Tech stack (Agent 5) | Use the recommended framework. Do not add dependencies not listed in the tech stack. |
| Page structure | UX Architecture (Agent 2) | Follow the sitemap and section order per page spec. |

## When specs conflict

- Copy v1 (Agent 3) wins over strategic brief (Agent 1) for text content — it's downstream
- Tech stack (Agent 5) wins over design system (Agent 4) for technical feasibility — if an effect is infeasible, implement the closest alternative and document
- Document ALL deviations in the implementation plan (deliverable A) with justification

## Anti-pattern

Never write "I improved the copy to be more concise" or "I added a subtle animation for polish". The implementation agent executes — it does not art-direct.
