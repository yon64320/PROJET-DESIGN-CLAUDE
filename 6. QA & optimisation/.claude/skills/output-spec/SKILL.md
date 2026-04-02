---
name: output-spec
description: Detailed deliverable format specifications and QA checklists for Agent 6 (QA). Invoke before writing deliverables or running audits.
version: 1.0.0
triggers:
  - output-spec
  - deliverable format
  - write deliverables
  - qa checklist
when_not_to_use: Do not invoke during exploration or planning phases — only when ready to audit or write deliverables.
---

# Deliverable Format Specifications — QA & Optimisation

## QA CHECKLIST (adapt as needed)

### A) Conversion & UX
- Primary CTA visible and consistent (per page)
- Journeys without contradictions
- Forms: justified friction, clear errors, confirmation, anti-spam

### B) Content / credibility
- Promise clear from the entry point
- Proof at risk points
- No "template" block without function
- Key mentions (process, guarantees, objection FAQ)

### C) Structural & technical SEO
- Titles and meta descriptions present
- Consistent Hn hierarchy
- Crawlable internal links
- Sitemap/robots if planned
- Indexable/non-indexable pages consistent

### D) Accessibility & motion
- Keyboard navigation, visible focus
- Form labels, accessible errors
- Contrasts: 4.5:1 text, 3:1 UI elements minimum
- 8 component states defined and implemented
- Reduced motion respected: non-essential animations disableable
- Animation budgets: micro ≤150ms, transitions 200-300ms, entrances ≤500ms
- Only transform + opacity animated

### E) Performance & technical quality
- Optimized images, reasonable lazyload
- Third-party scripts minimized
- No heavy "always on" animations
- Core Web Vitals: INP ≤200ms, CLS ≤0.12, LCP ≤2.5s
- Design tokens: .tokens.json consumed correctly, CSS custom properties match specs
- Dark mode: token overrides applied, contrast ratios maintained
- Quick audit: total weight, blocking points

### F) Tracking & data
- Conversion events present
- UTM preserved if needed
- Consent if required
- Lead pipeline verification → CRM

## Deliverables

### 1) QA REPORT (table)

| Issue | Severity (P0/P1/P2) | Impact | Evidence | Recommended fix | Owner |
|-------|---------------------|--------|----------|-----------------|-------|

### 2) GO-LIVE GATE

- List of "blockers" to fix
- List of "acceptable" items for post-launch
- Final recommendation: GO / NO-GO / GO with reservations

### 3) OPTIMIZATION BACKLOG (post-launch)

5-10 prioritized actions: copy tests, proof sections, perf, SEO.

## Output conventions

- Clear Markdown.
- End with "NEXT OWNERS": who must fix what (agent 3/4/5).
