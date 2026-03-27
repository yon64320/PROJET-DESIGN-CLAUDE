---
paths: ["design-system-v1*"]
description: 8 mandatory interactive states for every UI component, with visual and accessibility requirements.
---

# Component States — 8 Mandatory States

Every interactive component MUST define all 8 states. No exceptions.

## State Definitions

### 1. Default
- **Visual**: Resting appearance with full token application
- **A11y**: Must meet 4.5:1 contrast ratio for text, 3:1 for UI elements
- **Often forgotten**: Nothing — this is baseline

### 2. Hover
- **Visual**: Subtle feedback (background shift, shadow lift, underline). Change ≥1 visual property
- **A11y**: Not relied upon for functionality (no hover on touch)
- **Timing**: ≤150ms transition
- **Often forgotten**: Cursor change (pointer for clickable elements)

### 3. Focused
- **Visual**: Visible focus ring (min 2px, contrast ≥3:1 against background). Never `outline: none` without replacement
- **A11y**: WCAG 2.4.7 — focus MUST be visible. Use `:focus-visible` to avoid showing on mouse click
- **Often forgotten**: Focus ring on non-button elements (cards, links, custom controls)

### 4. Active / Pressed
- **Visual**: Immediate feedback — scale down slightly (0.97-0.98), darken background, or inset shadow
- **A11y**: `aria-pressed="true"` for toggle buttons
- **Timing**: Instant (≤50ms) — no transition delay
- **Often forgotten**: Touch feedback on mobile (active state on tap)

### 5. Disabled
- **Visual**: Reduced opacity (0.4-0.5) OR desaturated tokens. No hover/focus effects
- **A11y**: `aria-disabled="true"` (preferred over `disabled` attribute for screen reader announcement). Remove from tab order with `tabindex="-1"` only if truly non-functional
- **Often forgotten**: Cursor change to `not-allowed`. Tooltip explaining why disabled

### 6. Loading
- **Visual**: Spinner or skeleton replacing content. Preserve component dimensions (no layout shift)
- **A11y**: `aria-busy="true"`, announce loading state to screen readers via `aria-live`
- **Timing**: Show spinner only after 300ms delay (avoid flash for fast operations)
- **Often forgotten**: Disable interaction during loading to prevent double-submit

### 7. Error
- **Visual**: Red/danger border + icon + message. Color alone is NOT sufficient (use icon too)
- **A11y**: `aria-invalid="true"`, error message linked via `aria-describedby`, `role="alert"` for dynamic errors
- **Often forgotten**: Inline error positioning (below field, not in toast), clearing error on re-input

### 8. Success
- **Visual**: Green/success indicator + confirmation message. Brief animation (checkmark, ≤500ms)
- **A11y**: Success message announced via `aria-live="polite"`
- **Often forgotten**: Auto-dismiss timing, transition to next state after success

## Application Matrix

| Component | States to pay attention to |
|-----------|--------------------------|
| Button | All 8 — especially loading (prevent double-click) |
| Link | Default, hover, focused, active, visited |
| Badge | Default only (static) — unless interactive |
| Card | Default, hover, focused (if clickable) |
| Accordion | Default, hover, focused, active (expanded/collapsed) |
| Form input | All 8 — error and disabled are critical |
| Nav item | Default, hover, focused, active (current page) |

## Token Naming Convention for States

```
{component}.{property}.{state}
button.background.default → accent-action
button.background.hover → accent-action-hover
button.background.disabled → accent-action-disabled
```
