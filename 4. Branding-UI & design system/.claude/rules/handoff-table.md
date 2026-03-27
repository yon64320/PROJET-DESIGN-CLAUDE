---
paths: ["design-system-v1*", "*handoff*", "*ready-for-tech*"]
description: Structured handoff table template for agent 5 (Tech) with example and completeness checklist.
---

# Component Handoff Table

## Format

Produce one row per component. Every cell must be filled — no "TBD" or empty cells.

```markdown
| Component | States | Tokens used | Animation (easing, duration) | Responsive behavior | A11y requirements |
|-----------|--------|-------------|------------------------------|--------------------|--------------------|
```

## Column Definitions

| Column | What to include |
|--------|----------------|
| **Component** | Name + variant (e.g., "Button — primary", "Button — ghost") |
| **States** | List all applicable states from the 8 mandatory (default, hover, focused, active, disabled, loading, error, success) |
| **Tokens used** | List semantic token names: `accent-action`, `text-on-accent`, `radius-md`, `shadow-card` |
| **Animation** | Easing name + duration + property. E.g., "ease-state-change 200ms transform+opacity" |
| **Responsive** | How it changes per breakpoint: "Full-width <640px, inline >640px" |
| **A11y** | ARIA attributes, contrast ratio, focus behavior, keyboard interaction |

## Example — Button Primary

```markdown
| Button — primary | default, hover, focused, active, disabled, loading | bg: accent-action, text: text-on-accent, radius: radius-md, shadow: shadow-subtle, padding: space-element | hover: ease-state-change 150ms scale(1.02)+shadow; active: none 50ms scale(0.98); loading: ease-entrance 300ms spinner-opacity | Full-width <640px, auto-width >640px, min-height 48px always | role="button", aria-disabled, aria-busy when loading, focus-visible ring 2px accent-action, contrast ≥4.5:1 |
```

## Additional Sections After the Table

### Effects & Constraints
```markdown
| Effect | Component/Section | Perf budget | Fallback |
|--------|------------------|-------------|----------|
| Scroll reveal | Hero, proof sections | CLS ≤0.12, no LCP delay | Instant render |
| Hover depth | Cards | GPU-composited only | Static shadow |
```

### Asset List
```markdown
| Asset | Format | Sizes | Usage |
|-------|--------|-------|-------|
| Logo | SVG | — | Nav, footer |
| Hero background | WebP + AVIF | 1920w, 1280w, 640w | Hero section, with blur placeholder |
| Testimonial photos | WebP | 80×80, 160×160 | Proof section, rounded |
```

### Dark Mode Token Overrides
```markdown
| Token | Light value | Dark value |
|-------|-------------|------------|
| surface-primary | oklch(98% 0.005 250) | oklch(15% 0.01 250) |
| text-primary | oklch(20% 0.01 250) | oklch(92% 0.005 250) |
| accent-action | oklch(55% 0.25 265) | oklch(65% 0.22 265) |
```

## Completeness Checklist

Before handing off, verify:
- [ ] Every component from Section B has a row
- [ ] No empty cells in the table
- [ ] Token names match exactly those defined in the design system
- [ ] Animation easings use named functions from the animation budget
- [ ] All responsive breakpoints are logical (not arbitrary pixel values)
- [ ] A11y column includes ARIA attributes, not just "accessible"
- [ ] Dark mode overrides cover all theme-dependent tokens
- [ ] Asset formats include modern formats (WebP/AVIF) with fallbacks
