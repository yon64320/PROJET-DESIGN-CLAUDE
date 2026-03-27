---
paths: ["design-brief*", "design-system-v1*", "effects-strategy*"]
description: Animation timing budgets, easing functions, and Core Web Vitals performance constraints.
---

# Animation Budget

## Timing by Category

| Category | Duration | Easing | CSS Properties | Example |
|----------|----------|--------|---------------|---------|
| Micro-interaction | 50–150ms | `ease-out` | transform, opacity | Button press, toggle switch |
| State transition | 150–300ms | `ease-in-out` | transform, opacity, background-color | Hover effects, tab switch |
| Content entrance | 200–500ms | `ease-out` | transform, opacity | Scroll reveal, page load |
| Content exit | 150–300ms | `ease-in` | transform, opacity | Modal close, dismiss |
| Layout change | 200–400ms | `ease-in-out` | transform | Accordion expand, menu open |
| Loading skeleton | 1500–2500ms | `ease-in-out` | opacity | Skeleton pulse |

**Hard rule**: Nothing exceeds 500ms. Users perceive >400ms as sluggish.

## Named Easing Functions

Define these in the design system so developers don't guess:

| Name | Value | Use for |
|------|-------|---------|
| `ease-entrance` | `cubic-bezier(0, 0, 0.2, 1)` | Elements appearing |
| `ease-exit` | `cubic-bezier(0.4, 0, 1, 1)` | Elements disappearing |
| `ease-state-change` | `cubic-bezier(0.4, 0, 0.2, 1)` | Hover, focus, toggle |
| `ease-bounce` | `cubic-bezier(0.34, 1.56, 0.64, 1)` | Playful micro-interactions (use sparingly) |
| `ease-spring` | `linear(0, 0.95 35%, 1.02 65%, 0.99 80%, 1)` | Natural physics feel |

## Composited Properties Only

**Free (GPU-composited, no layout/paint cost):**
- `transform` (translate, scale, rotate)
- `opacity`

**Expensive (trigger layout/paint — avoid animating):**
- `width`, `height`, `margin`, `padding`, `top/left/right/bottom`
- `border-width`, `font-size`, `box-shadow` (animate shadow via opacity on pseudo-element instead)
- `background-color` (acceptable for small elements like buttons, not large surfaces)

## Core Web Vitals Gates

| Metric | Budget | What breaks it |
|--------|--------|----------------|
| INP | ≤200ms | Blocking JS during animation, heavy event handlers |
| CLS | ≤0.12 | Animated elements that shift surrounding content |
| LCP | ≤2.5s | Hero animations that delay largest paint |

## Reduced Motion

When `prefers-reduced-motion: reduce` is active:

| What happens | Details |
|-------------|---------|
| **Remove** | Scroll-triggered animations, parallax, auto-playing motion |
| **Keep** | State transitions (hover, focus), loading indicators, essential feedback |
| **Replace** | Entrance animations → instant opacity fade (100ms) |

Always specify in the design system: for each animation, what happens under reduced motion.

## Budget Per Page

- Maximum **5 animated elements** visible simultaneously
- Hero section: max **1 animation** (entrance or background, not both)
- Total animation JS: ≤15KB gzipped (if using a library)
- Prefer CSS animations over JS — CSS is off-main-thread
