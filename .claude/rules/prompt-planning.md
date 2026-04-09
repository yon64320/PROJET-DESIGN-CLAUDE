---
description: Mandatory prompt planning process before launching any pipeline agent.
---

# Prompt Planning

**CRITICAL**: Before launching any pipeline agent (1-8), follow this process. No shortcuts.

## Step 1 — Pre-digest

Run `bash prepare-agent-context.sh N` to generate `.pipeline/context-digests/agent-N.md`.
Read the digest. It contains: role, output format, quality rules, available skills.

## Step 2 — Identify project inputs

List ALL upstream deliverables the agent needs (absolute paths).
Verify each file exists. If missing → do NOT launch, report to user.

## Step 3 — Assemble prompt using this template

```
## Rôle
[From digest: identity line + "Tu n'es PAS un orchestrateur."]

## Inputs à lire
[Project-specific: numbered list of absolute file paths, reading order matters]

## Output
[From digest: exact output file path(s) with project suffix]

## Structure du livrable
[From digest: output-spec sections, adapted with project details]

## Règles
[From digest: quality rules — anti-generic, proof-or-mechanism, etc.]

## Contexte projet
[Project-specific: key business constraints, decisions already made, things to NOT do]

## Ne fais PAS
[From digest: explicit prohibitions + "Ne pose pas de questions"]
```

## Step 4 — Self-validate

Before launching, verify:
- [ ] Role identity is explicit (agent name + what it is NOT)
- [ ] ALL input files listed with absolute paths
- [ ] Output file path includes project suffix
- [ ] Output format matches the agent's output-spec
- [ ] Quality rules from the digest are included
- [ ] Project-specific constraints are present (pricing, tone, exclusions, etc.)
- [ ] Explicit prohibitions section exists

**NEVER** launch an agent with a generic prompt. Every prompt must be project-specific.

## Step 5 — Launch with monitor

Launch Agent + monitoring script per `.claude/rules/agent-monitoring.md`.
