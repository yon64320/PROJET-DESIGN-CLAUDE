---
description: Build output must meet performance budgets defined in the tech stack deliverable.
---

# Performance Budget Check

## Principle

The tech stack deliverable (Agent 5) defines performance gates. The implementation must meet them. No exceptions without documented justification.

## Process

After every build:
1. Check the bundle output (JS, CSS, images)
2. Compare against the perf budgets from the tech stack deliverable
3. If a budget is exceeded, document in the build report with:
   - What exceeded the budget
   - By how much
   - Why (which spec requirement caused it)
   - Proposed mitigation (lazy loading, code splitting, etc.)

## Common gates (from tech stack deliverable — exact values may vary per project)

| Metric | Typical target |
|--------|---------------|
| Lighthouse Performance | > 90 |
| Lighthouse Accessibility | > 95 |
| LCP | < 2.5s |
| CLS | < 0.1 |
| INP | < 200ms |

These values come from the TECH STACK DELIVERABLE for each specific project. Do not hardcode — always read the project's values.

## Image optimization

- Use modern formats (WebP/AVIF) with fallbacks when the tech stack specifies it
- Lazy load below-the-fold images
- Provide responsive srcset when appropriate
- Placeholder images: use aspect-ratio containers to prevent CLS
