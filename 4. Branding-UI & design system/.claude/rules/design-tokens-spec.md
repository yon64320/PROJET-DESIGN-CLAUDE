---
paths: ["design-system-v1*", "*.tokens.json"]
description: Spec for semantic design tokens with W3C Design Tokens 2025.10 format and metadata requirements.
---

# Design Tokens Specification

## Principle: Semantic, Not Primitive

Every token must be **semantic** (describes its role) not **primitive** (describes its value).

| ❌ Primitive | ✅ Semantic |
|-------------|------------|
| `blue-500` | `accent-action` |
| `gray-100` | `surface-primary` |
| `16px` | `space-component` |
| `bold` | `heading-weight` |

## Required Metadata Per Token

Each token MUST include:

| Field | Purpose | Example |
|-------|---------|---------|
| `role` | What this token controls | "Primary action background" |
| `usage_context` | Where to use it | "CTA buttons, active nav items" |
| `do_not_use` | Common misuses | "Do not use for decorative borders" |
| `paired_with` | Tokens that must accompany it | "Always pair with text-on-accent" |

## W3C Design Tokens Format (2025.10)

Produce a `.tokens.json` file using W3C Community Group spec:

```json
{
  "color": {
    "surface": {
      "primary": {
        "$type": "color",
        "$value": "oklch(98% 0.005 250)",
        "$description": "Main background surface — light, neutral",
        "$extensions": {
          "role": "Primary page background",
          "usage_context": "Body, main content areas, card backgrounds",
          "do_not_use": "Overlays, elevated surfaces",
          "paired_with": ["color.text.primary", "color.border.subtle"]
        }
      }
    },
    "accent": {
      "action": {
        "$type": "color",
        "$value": "oklch(55% 0.25 265)",
        "$description": "Primary CTA and action color",
        "$extensions": {
          "role": "Call-to-action backgrounds",
          "usage_context": "Primary buttons, active states, key links",
          "do_not_use": "Large background areas, decorative elements",
          "paired_with": ["color.text.on-accent"]
        }
      }
    }
  }
}
```

## Color Space

- Use **Oklch** as primary color space (perceptually uniform, P3-ready)
- Provide sRGB fallback in `$extensions.fallback` for older browsers
- For premium sites: leverage Display P3 gamut where brand colors benefit

## Token Categories to Define

1. **Color**: surface (primary, secondary, elevated), text (primary, secondary, muted, on-accent), accent (action, hover, subtle), border (subtle, strong), status (success, error, warning, info)
2. **Typography**: font-family (heading, body, mono), font-size (scale: xs through 3xl), font-weight (named roles), line-height (tight, normal, relaxed), letter-spacing
3. **Spacing**: scale with named roles — space-section (between sections), space-component (between components), space-element (within components), space-inline (text-level)
4. **Radius**: radius-none, radius-sm, radius-md, radius-lg, radius-full
5. **Shadow**: shadow-subtle, shadow-card, shadow-elevated, shadow-overlay (by elevation role)
6. **Grid**: columns, gutter, margin per breakpoint

## Theming Support

Structure tokens for theming via aliases:

```json
{
  "theme": {
    "light": {
      "surface-primary": { "$type": "color", "$value": "{color.neutral.50}" }
    },
    "dark": {
      "surface-primary": { "$type": "color", "$value": "{color.neutral.900}" }
    }
  }
}
```

Invariant tokens (spacing, radius, typography scale) stay outside theme groups.
