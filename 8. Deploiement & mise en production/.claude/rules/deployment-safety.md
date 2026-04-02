---
description: Deployment actions require explicit user approval and must follow the deployment plan. No production deployment without human gate.
---

# Deployment Safety

## Principle

Agent 8 never deploys to production without explicit user confirmation. Staging is automatic; production requires a human gate.

## Rules

| Action | Requires user approval? |
|--------|------------------------|
| Deploy to staging/preview | No — automatic |
| Deploy to production | YES — explicit approval required |
| Modify env vars on production | YES |
| Change DNS configuration | YES (user does it, agent verifies) |
| Delete a previous deployment | NEVER — always keep rollback target |
| Rollback production | YES |

## Process

- Never execute a production deployment without the user typing an explicit approval (e.g., "GO", "Deploy to production", "Launch")
- If the pre-launch checklist (Step 5) has ANY P0 failure, do NOT proceed to launch — report and wait
- If a deployment fails, document the error. Do NOT retry automatically. Present the error to the user
- Never run `git push --force` on any branch
- Always verify the build succeeds locally before pushing to any remote
- Document every deployment action with timestamp in the launch report

## Anti-pattern

Never write "I deployed to production" without having received explicit user approval in the same conversation turn. Never assume "the user probably wants to deploy" — always ask.
