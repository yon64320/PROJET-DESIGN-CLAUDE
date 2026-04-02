---
paths: ["UX-Architecture*"]
description: Every page section must have a documented conversion job. No decorative sections.
---

# Section-Has-Job Rule

## Principle

Every section on every page must have an explicit **job** — a reason it exists in the conversion funnel.

## Valid jobs

| Job | What it does | Example section |
|-----|-------------|-----------------|
| **Clarify** | Explains the offer so the visitor understands what they're buying | "Comment ça marche" (process steps) |
| **Prove** | Provides evidence that the promise is real | Case studies, testimonials, metrics |
| **Reduce risk** | Addresses an objection or fear | FAQ, guarantees, "pour qui / pas pour qui" |
| **Convert** | Directly asks the visitor to act | CTA section, contact form, phone number |
| **Orient** | Helps the visitor navigate to the right content | Navigation, filters, sitemap links |
| **Reassure** | Builds trust through transparency | Legal mentions, privacy policy, "Projet concept" labels |

## Rule

When defining page specs, every section row must include a `Job` column.

If you cannot assign a job from the list above → the section is decorative → remove it or merge it into an adjacent section that HAS a job.

## Exception

Hero sections can combine Clarify + Convert (promise + CTA). This is the only valid multi-job section.
