---
name: output-spec
description: Detailed deliverable format specifications for Agent 5 (Tech Stack). Invoke before writing deliverables.
version: 1.0.0
triggers:
  - output-spec
  - deliverable format
  - write deliverables
when_not_to_use: Do not invoke during exploration or planning phases — only when ready to write deliverables.
---

# Deliverable Format Specifications — Tech Stack

## A) TECH REQUIREMENTS SUMMARY (1 page)

- Page types: static vs dynamic
- Interactivity: low / medium / high (why)
- Editing: none / markdown / CMS (who, what, frequency)
- Premium effects: level, dependencies, perf constraints (INP ≤200ms, CLS ≤0.12, LCP ≤2.5s)
- Animation tier: Tier 1 / 2 / 3 — JS budget (0 KB / ~28 KB gz / ~28 KB + 150-300 KB lazy), library dependencies
- Design tokens: consume .tokens.json (W3C format) for CSS custom properties generation
- Theming: light/dark mode support based on token overrides from Agent 4
- Integrations: forms, CRM, calendar, analytics, email
- Constraints: compliance, security, budget, deadlines, team

## B) FRONTEND DECISION FRAMEWORK (comparison)

Compare at least: Astro, Next.js, Nuxt, Webflow (+ custom), static/Jamstack approach.
For each: strengths, limits, complexity, good use cases, risk of over-hydration/JS, animation library compatibility (how each framework handles GSAP islands / Lenis / Spline at the selected tier).
Conclude with recommended choice + "if… then…" conditions.

## C) BACKEND DECISION FRAMEWORK

Options: no dedicated backend / lightweight integrated backend / headless CMS / BaaS / custom backend / automations.
Explain: when minimal backend suffices, when to avoid dedicated backend, signals of over-engineering.

## D) CMS & CONTENT MODEL

- When headless vs classic vs markdown
- Governance: editable fields vs locked structure
- Minimal content model (types, fields), oriented toward pages and components

## E) INTEGRATIONS PLAN

- Forms: anti-spam, routing, storage, notifications
- CRM: field mapping, tags, sources
- Analytics: conversion events, consent, UTM
- Booking: rules (qualification, friction)

## F) TECH EXECUTION BRIEF (ready for implementation)

- Rendering architecture (SSG/SSR/hybrid) per page type
- Recommended repo structure
- Perf budgets (images, third-party scripts, JS)
- Minimum technical SEO (sitemap, robots, crawlable links)
- Deployment: environments, previews, rollback
- Risks + mitigations
- Animation implementation patterns (based on confirmed tier):
  - Tier 1: IntersectionObserver scroll-reveal, CSS easing custom properties
  - Tier 2: GSAP init in Astro island, ScrollTrigger cleanup on View Transitions, Lenis + ScrollTrigger sync
  - Tier 3: Spline React island with lazy load + WebGL detection + fallback, bundle isolation

## Output conventions

- Clear Markdown.
- End with: "READY TO CODE CHECKLIST" = what must be validated before opening a code editor.
