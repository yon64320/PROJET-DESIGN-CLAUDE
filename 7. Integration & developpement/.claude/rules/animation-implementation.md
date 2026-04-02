---
description: Animation implementation must follow tier constraints and motion strategy from Agent 4.
---

# Animation Implementation

## Principle

The motion strategy (Agent 4) defines:
- The **animation tier** (1, 2, or 3) — confirmed by the user
- The **signature moments** per page
- The **easing, duration, and trigger** for each effect
- The **reduced motion** fallback behavior

The implementation agent follows these specs exactly. No creative additions.

## Tier constraints

| Tier | What is allowed | What is NOT allowed |
|------|----------------|---------------------|
| 1 | CSS transitions, CSS animations, IntersectionObserver reveals | JS animation libraries, 3D, parallax |
| 2 | Tier 1 + JS animation library (as specified), scroll-linked animations, parallax on decorative elements | 3D elements, heavy runtime |
| 3 | Tier 2 + 3D elements (lazy-loaded, with fallback) | Anything not in the motion strategy |

## Rules

- Only animate `transform` and `opacity` (composited properties, no layout triggers) unless the motion strategy explicitly allows other properties
- Respect the per-page tier if it differs from the global tier (e.g., legal pages may be Tier 1 even if global is Tier 3)
- Implement reduced motion: `prefers-reduced-motion: reduce` must disable non-essential animations, show content immediately
- Each signature moment must match the EXACT sequence (element order, delays, easing) from the motion strategy
- 3D elements (Tier 3 only): lazy-loaded, WebGL detection with fallback, skeleton/placeholder during load
- Clean up animations on page transitions if the framework supports client-side navigation

## Anti-pattern

Never add "just a little bounce" or "a subtle parallax" that isn't in the motion strategy. If it's not specified, it doesn't exist.
