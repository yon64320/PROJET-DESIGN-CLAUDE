---
name: output-spec
description: Detailed deliverable format specifications for Agent 7 (Integration). Invoke before writing deliverables.
version: 1.0.0
triggers:
  - output-spec
  - deliverable format
  - write deliverables
when_not_to_use: Do not invoke during exploration or planning phases — only when ready to write deliverables.
---

# Deliverable Format Specifications — Integration

## A) IMPLEMENTATION PLAN (markdown, produced BEFORE any code)

- Page inventory with source spec references
- Component inventory with states, tokens, animations
- Animation inventory with per-page effects and tier
- Integration inventory (forms, analytics, CMS, third-party)
- Build order (dependency graph): foundation → components → pages → animations → integrations
- Risk register (ambiguities, spec conflicts, decisions made)

## B) WORKING CODEBASE

All source files per Agent 5's repo structure. Must satisfy:
- Builds without errors
- Meets perf budgets from tech stack deliverable
- All copy matches copy v1 verbatim
- All tokens consumed from .tokens.json (no ad-hoc values)
- All animations match motion strategy (tier respected)
- All components match handoff (states, responsive, a11y)

### Build order detail

1. **Foundation**: project scaffold per Agent 5 repo structure, CSS custom properties from .tokens.json, global styles, base layout
2. **Shared components**: per component handoff table (states, tokens, responsive, a11y)
3. **Pages**: per UX architecture (structure) + copy v1 (content), one page at a time
4. **Animations**: per motion strategy, respecting confirmed tier
5. **Integrations**: forms, analytics events, CMS setup per Agent 5's plan
6. **Theming**: dark mode per token overrides, reduced motion fallbacks
7. **SEO**: meta tags, Schema.org, sitemap, robots.txt per copy v1 + tech stack

## C) BUILD REPORT (markdown, produced AFTER build)

- Build status: success / failure (with errors if any)
- Pages built: count and list
- Components built: count and list
- Animation tier implemented + effects count
- Bundle analysis: JS (eager/lazy), CSS, images — compared to perf budgets
- Spec conformance: deviations documented (if any, with justification)
- Known issues / limitations
- "READY FOR QA" checklist

## Output conventions

- Deliverables A and C as Markdown files in this agent's folder.
- Deliverable B as actual code files in the project code folder.
- End with: "IMPLEMENTATION HANDOFF" = summary of what was built, what deviates from spec, what needs QA attention.
