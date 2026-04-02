---
description: Environment variables and secrets must never be committed to the repository. Security is non-negotiable.
---

# Environment Security

## Principle

Agent 8 handles sensitive configuration (API keys, tokens, deployment secrets). Security is non-negotiable.

## Rules

- NEVER write actual secret values in any file — only templates (.env.example) with descriptions
- NEVER commit .env files to git. Verify .gitignore includes `.env*` patterns
- When documenting environment variables, use the format: `VARIABLE_NAME=<description of what goes here and where to get it>`
- API keys, tokens, and passwords must be set through the platform's environment variable UI, never in code
- The client handoff document must reference WHERE credentials are stored, never WHAT they are
- CSP (Content-Security-Policy) headers must be restrictive by default — only allow domains actually used
- Security headers from Agent 5's tech stack are the minimum. Agent 8 can make them stricter, never looser.

## Anti-pattern

Never write `RESEND_API_KEY=re_abc123xyz` anywhere. Always write `RESEND_API_KEY=<your Resend API key from https://resend.com/api-keys>`.
