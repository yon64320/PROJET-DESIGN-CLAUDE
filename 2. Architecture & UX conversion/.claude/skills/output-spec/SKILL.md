---
name: output-spec
description: Detailed deliverable format specifications for Agent 2 (UX Architecture). Invoke before writing deliverables.
version: 1.0.0
triggers:
  - output-spec
  - deliverable format
  - write deliverables
when_not_to_use: Do not invoke during exploration or planning phases — only when ready to write deliverables.
---

# Deliverable Format Specifications — UX Architecture

## A) SITE ARCHITECTURE (SITEMAP + NAV)

- Sitemap v1 (level 1 pages + 1 extra level max if necessary)
- Role of each page (inform / convince / convert) + KPI
- Navigation principles (what to show / what to hide / max depth)
- Mandatory support pages: contact, legal, privacy if needed (list)

## B) DECISION JOURNEYS

- Primary journey (Home → … → conversion)
- Alternative journeys (e.g., offer page → proof → conversion)
- Friction points and how to reduce them (without entering UI)

## C) PAGE SPECS v1 (strict format, per key page)

For each page (Home, Offer(s), Proof/Case, Contact/Booking, specific persuasion page if needed):

- Page intent + target audience
- Conversion objective + KPI
- Primary CTA + secondary CTA
- Message hierarchy (H1 / subhead / 3 proofs)
- Section list (order) + "job" of each section
- Required proof per section (reference to proof inventory)
- Objection FAQ (3-6)
- Structural SEO v0: Title, meta description, Hn, recommended internal links
- "Do not do" (anti-template): sections forbidden unless justified

## D) "READY FOR COPY" CHECKLIST

- Pages and sections locked
- Required proof identified
- Main objections covered
- CTA and friction validated

## Output conventions

- Produce in clear Markdown.
- End with: "PACKAGE FOR COPY/UI" = ordered list of files / sections to pass along.
