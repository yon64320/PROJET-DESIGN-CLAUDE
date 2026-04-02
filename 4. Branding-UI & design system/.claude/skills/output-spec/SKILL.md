---
name: output-spec
description: Detailed deliverable format specifications for Agent 4 (Design System). Invoke before writing deliverables.
version: 1.0.0
triggers:
  - output-spec
  - deliverable format
  - write deliverables
when_not_to_use: Do not invoke during exploration or planning phases — only when ready to write deliverables.
---

# Deliverable Format Specifications — Design System

## A) DESIGN BRIEF (strict structure)

1. UX & conversion objectives (what the UI must make obvious in 3 seconds)
2. UI principles (5-7 rules): hierarchy, density, rhythm, contrast, credibility
3. Visual direction: style (sober/expressive), typography (rules), color (rules), iconography, imagery
4. Credibility patterns (data-driven) — see `.claude/rules/conversion-benchmarks.md` for full data:
   - Social proof placement near CTA (+15-25% CTR benchmark)
   - Prefer video testimonials over text (+80% conversion)
   - Authentic ratings (4.2-4.5 > 5.0 for perceived trust)
   - Minimize form fields (each field reduces completion rate)
5. Responsive: mobile-first principles, logical breakpoints (no arbitrary numbers)
6. Accessibility: contrasts, focus states, keyboard navigation, forms
7. Motion (with budgets — see `.claude/rules/animation-budget.md`):
   - Micro-interactions: ≤150ms | Transitions: 200-300ms | Entrées: ≤500ms max
   - Animated properties: ONLY transform + opacity (composited, no layout cost)
   - Named easing functions per category
   - Performance gate: INP ≤200ms, CLS ≤0.12
   - Mandatory reduced motion fallback

## B) DESIGN SYSTEM v1 (tokens + components + theming)

### Tokens (semantic, not primitive)
See `.claude/rules/design-tokens-spec.md` for W3C format and structure.
- Each token: role, usage context, do_not_use, paired_with
- Color as semantic roles (surface-primary, text-on-surface, accent-action — NOT blue-500)
- Typography: scale with named roles (heading-xl, body-md, caption)
- Spacing: scale with named roles (space-section, space-component, space-element)
- Radius, shadow (by elevation role), grid
- Produce BOTH: human-readable Markdown AND .tokens.json (W3C Design Tokens 2025.10)

### Theming strategy
- Minimum: light mode + dark mode
- Token structure must support theming without value duplication
- Define which tokens change per theme, which are invariant
- Dark mode: not inverted light — redesign surfaces, adjust contrast ratios

### Components (8 mandatory states)
See `.claude/rules/component-states.md` for state definitions.
- Components: buttons, links, badges, cards, accordions/FAQ, forms, sections, nav, footer
- Each component: tokens used, animation timing, responsive behavior, a11y requirements
- Composition rules: how to assemble by page type

## C) PREMIUM EFFECTS STRATEGY + ANIMATION TIER SELECTION

### Animation tier table

| Tier | Label | JS Budget | Libraries required |
|------|-------|-----------|-------------------|
| 1 | CSS-only | 0 KB | None — CSS transitions + IntersectionObserver only |
| 2 | GSAP + Scroll + Smooth | ~28 KB gz | gsap, @gsap/ScrollTrigger, lenis |
| 3 | Tier 2 + Spline 3D | +150-300 KB lazy | gsap, lenis, @splinetool/react-spline (lazy island) |

The tier MUST be: recommended by Agent 4, validated by user, documented in motion strategy and deliverable E.

### Premium effects strategy (1 page, anti-cliché)
- Ambition level: sober / discreet premium / expressive premium → informs tier recommendation
- 3 "signature moments" maximum
- Authorized effects table — columns: Effect | Where | Easing | Duration | Properties | Purpose | Min Tier
- Forbidden effects table — columns: Effect | Reason | Alternative | Tier Override
- Effects UNLOCKED at Tier 2+: parallax (decorative only), word-split (non-critical), magnetic buttons (primary CTAs)
- Permanently FORBIDDEN: carousel/slider, glassmorphism, scroll-jacking, auto-play video with sound, custom cursor
- 3D decision framework:
  - Tier 1: excluded — depth via shadow tokens + CSS transforms only
  - Tier 2: excluded unless client product requires it
  - Tier 3: Spline 3D as lazy island — requires business justification, fallback, Lighthouse mobile ≥ 85
- Reduced motion fallback per tier

## D) COMPONENT HANDOFF TABLE

See `.claude/rules/handoff-table.md` for format.

| Component | States | Tokens used | Animation (easing, duration) | Responsive behavior | A11y requirements |

Plus: effects + constraints list, assets to produce, dark mode token overrides.

## E) SIGNATURE ANIMATION SPEC (per page)

For each page:
- Recommended tier (justify if differs from global)
- Exact animation sequence: element → effect → timing → trigger (scroll%, load, interaction)
- Scroll storyboard: at which viewport% each animation fires
- Perf budget per page: max simultaneous animations, total animation JS weight, INP/CLS/LCP targets

## Output conventions

- Deliver everything in structured Markdown.
- End with: "REQUIREMENTS FOR STACK" (technical summary: perf constraints, motion tier, animation library deps, 3D, CMS needed or not).
