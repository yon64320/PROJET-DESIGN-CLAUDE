---
paths: ["copy-v1*"]
description: Checklist of mandatory microcopy for all interactive states and edge cases.
---

# Microcopy Completeness Checklist

## Mandatory microcopy (must exist in the copy deliverable)

### Forms
- [ ] Empty state for each input (placeholder text)
- [ ] Error message for each validation rule (required, format, length)
- [ ] Success message after form submission
- [ ] Loading state text (if submission takes > 1s)
- [ ] Progress indicator labels (step X of Y)

### Navigation
- [ ] 404 page (headline + CTA back to safety)
- [ ] Skip-to-content link text
- [ ] Mobile menu toggle label (aria-label)
- [ ] Dark mode toggle label (aria-label)

### Interactive elements
- [ ] Loading states for async content (skeleton text, sr-only)
- [ ] Fallback text for media that fails to load (images, 3D, video)
- [ ] Empty state for lists/grids with no content yet

### Tier 3 specific (if applicable)
- [ ] Spline 3D loading state
- [ ] Spline 3D WebGL fallback message
- [ ] Spline 3D fallback image alt text
- [ ] Reduced motion toggle label and states
- [ ] Interaction hints for 3D elements (desktop vs mobile)

## Rule

Before marking copy as complete, verify every checkbox above. Missing microcopy = incomplete deliverable.
