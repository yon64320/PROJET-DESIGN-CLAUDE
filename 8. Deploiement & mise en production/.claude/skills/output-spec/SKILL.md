---
name: output-spec
description: Detailed deliverable format specifications for Agent 8 (Deployment). Invoke before writing deliverables.
version: 1.0.0
triggers:
  - output-spec
  - deliverable format
  - write deliverables
when_not_to_use: Do not invoke during exploration or planning phases — only when ready to write deliverables.
---

# Deliverable Format Specifications — Deployment

## A) DEPLOYMENT PLAN (markdown, produced BEFORE any deployment action)

- Upstream audit summary (what is present, missing, ambiguous)
- Environment inventory (staging URL pattern, production URL, platform dashboard)
- Platform configuration checklist
- CI/CD pipeline design
- Environment variables inventory table: Variable | Service | Required for | How to obtain
- DNS configuration steps
- Pre-launch verification checklist (empty pass/fail columns, to be filled during verification)
- CMS seeding plan (or "N/A: static content in repo")
- Launch sequence (numbered steps)
- Rollback plan
- Risk register (ambiguities, user-dependent actions, platform-specific concerns)

## B) DEPLOYMENT CONFIGURATION (code files in the project)

- CI/CD pipeline (.github/workflows/deploy.yml or equivalent) — use `/ci-cd-pipeline`
- Platform config (vercel.json / netlify.toml / wrangler.toml) — use `/deployment-platforms`
- Environment variables template (.env.example)
- Redirect rules (if needed beyond platform config)

Note: check whether Agent 7 already created these files. If they exist and are correct, validate rather than recreate.

## C) LAUNCH REPORT (markdown, produced AFTER production deployment)

- Deployment timestamp (UTC)
- Production URL + staging URL
- Platform and environment details
- Pre-launch checklist results (pass/fail per item) — use `/launch-readiness` for template
- Post-launch checklist results (pass/fail per item)
- Lighthouse scores (production) vs perf budget targets
- Core Web Vitals (production)
- Analytics verification: script loaded, events firing
- Form verification: test submission successful
- SSL/DNS verification
- Security headers verification
- CMS seeded (if applicable) — content count, missing items
- Known issues / limitations
- Deviations from deployment plan (if any, with justification)
- Rollback instructions
- Monitoring setup summary
- "SITE IS LIVE" final status

## D) CLIENT HANDOFF DOCUMENT (markdown, produced AFTER launch)

- Project summary (what was built, for whom)
- Live URLs (production, staging if retained, CMS admin)
- Access credentials inventory (WHERE they are stored, not the credentials themselves)
- How to update content (CMS guide or code instructions, adapted to Agent 5's CMS choice)
- How deployments work (push to main → auto-deploy, or manual)
- How to rollback (platform-specific instructions)
- Monitoring dashboards (where to check errors, uptime)
- Performance baseline (Lighthouse scores at launch)
- Post-launch optimization backlog (from Agent 6)
- Maintenance recommendations (dependency updates, certificate renewals)
- Support contacts / escalation path

## Output conventions

- Deliverables A, C, and D as Markdown files in this agent's folder.
- Deliverable B as code files in the project codebase folder.
- End with: "LAUNCH HANDOFF" = summary of what was deployed, what was verified, what needs attention post-launch.
