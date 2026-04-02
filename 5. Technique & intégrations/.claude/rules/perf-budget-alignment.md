---
paths: ["tech-stack*"]
description: Performance budgets in the tech stack must exactly match the PRD (source of truth).
---

# Performance Budget Alignment

## Rule

The PRD is the source of truth for performance targets. The tech stack MUST match these values exactly.

When writing or updating the tech stack:
1. Read the PRD performance section (§9.4)
2. Copy the exact values — do not round, adjust, or "interpret"
3. If you disagree with a PRD target, FLAG it explicitly — do not silently change it

## Metrics to align

| Metric | Source | Must match |
|--------|--------|-----------|
| Lighthouse Performance | PRD §9.4 | Exact threshold |
| Lighthouse Accessibility | PRD §9.4 | Exact threshold |
| Lighthouse Best Practices | PRD §9.4 | Exact threshold |
| Lighthouse SEO | PRD §9.4 | Exact threshold |
| LCP | PRD §9.4 | Exact threshold |
| FCP | PRD §9.4 | Exact threshold |
| CLS | PRD §9.4 | Exact threshold |
| Total bundle JS | PRD §9.4 | Exact threshold |

## Cross-check with Agent 4

The design system and motion strategy may define their own perf gates (INP, CLS, animation budgets). If these DIFFER from the PRD:
- Flag the discrepancy as a QA issue
- Recommend alignment to the PRD value (more strict wins)
- Document the discrepancy in the decision log
