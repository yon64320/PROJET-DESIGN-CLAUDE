---
description: Orchestrator protocol for launching agents — validation gates, deliverable checks, launch commands, model tiering, rate limits, monitoring, and subagents.
---

# Pipeline Validation & Launch Protocol

## Before launching agent N

1. Run `bash validate-gate.sh N <project-name>`
2. If FAILED → report missing prerequisites to the user. Do NOT launch the agent.
3. If PASSED → proceed to launch.

## Launching agent N

```bash
bash run-agent.sh <N> "your prompt"
```

**Options:**
```bash
# Override model (default: sonnet for agents 1-3/6, inherit/opus for 4-5-7-8)
bash run-agent.sh 4 -m opus "Rewrite motion strategy for Tier 3"

# Rate limit protection (30s cooldown before launch)
bash run-agent.sh 5 -c 30 "Update tech stack"

# Limit conversation turns (default: 30)
bash run-agent.sh 6 -t 20 "Quick QA update"
```

**Choosing light vs heavy:**
- **Light update** (minor adjustments, < 3 files affected) → default model
- **Heavy production** (major rewrite, 3+ files) → `bash run-agent.sh N -m opus "prompt"`
- For heavy runs, add cooldown: `-c 30` (30s rate limit protection)

## After agent N completes

1. Run `bash validate-deliverable.sh N <project-name>`
2. If FAILED → report issues, consider re-launching with a more specific prompt.
3. If PASSED → present summary to user, proceed to next agent.

## After full pipeline (all 8 agents)

1. Invoke the `consistency-checker` subagent to verify cross-agent coherence.
2. Present the consistency report to the user.
3. If inconsistencies found → fix in the relevant agent before proceeding.

## Model tiering (rate limit optimization)

| Agent | Default model | Rationale |
|-------|--------------|-----------|
| 1 (Stratégie) | sonnet | Text adjustments, no complex reasoning |
| 2 (UX) | sonnet | Annotation additions, structural |
| 3 (Copy) | sonnet | Targeted microcopy, not full rewrites |
| 4 (Design) | inherit (opus) | Multi-file reasoning, token coherence |
| 5 (Tech) | inherit (opus) | Complex technical decisions, patterns |
| 6 (QA) | sonnet | Structured audit, checklist-driven |
| 7 (Integration) | inherit (opus) | Multi-file code generation, cross-deliverable reasoning |
| 8 (Deployment) | inherit (opus) | Multi-file deployment config, cross-deliverable verification, security-critical |

Override with `-m opus` when an agent needs a full rewrite (not just an update).

## Rate limit management

- Max 2 agents in parallel (never 3+)
- For major rewrites (tier change, full pipeline): sequential only, with `-c 30` cooldown
- If rate limited: STOP everything, wait for reset, resume sequential
- Do NOT retry immediately. Do NOT launch other agents.
- Inform the user of the wait time.
- After reset: resume from the failed agent, sequential only (no parallel).

| Scenario | Allowed parallel | Max concurrent |
|----------|-----------------|----------------|
| Initial pipeline (from scratch) | Agents 1-3 if gates pass | 2 |
| Minor update (same tier, small changes) | Agents 1-3 | 3 |
| Major update (tier change, rewrite) | NONE — sequential only | 1 |
| Agents 4-5-6 | NEVER parallel | 1 |
| Agent 7 (implementation) | NEVER parallel | 1 |
| Agent 8 (deployment) | NEVER parallel | 1 |

## Monitoring

Logs and checkpoints are in `.pipeline/`:
```
.pipeline/
├── logs/          # stdout/stderr per agent
├── checkpoints/   # .started / .completed / .failed timestamps
└── context-digests/  # pre-digested context for heavy agents (5, 6, 7)
```

## Why `--append-system-prompt` is mandatory

The parent CLAUDE.md (orchestrator) is automatically loaded by child agents. Without the override, each agent identifies as orchestrator. The `--append-system-prompt` flag locks the agent's identity to its local role.

## Each agent launched this way

- Reads its own CLAUDE.md (role, rules, skills)
- Reads its `.claude/rules/` for quality gates
- Is a real Claude Code instance (can spawn its own subagents)
- Produces its deliverables as Markdown in its folder
- Returns its output to the orchestrator via stdout
- Writes checkpoint files for monitoring

## Subagents disponibles (orchestrateur)

| Subagent | Fichier | Quand l'utiliser |
|----------|---------|-----------------|
| `deliverable-validator` | `.claude/agents/deliverable-validator.md` | Après chaque agent, pour valider structure et cohérence |
| `consistency-checker` | `.claude/agents/consistency-checker.md` | Après le pipeline complet, pour vérifier la cohérence cross-agents |
| `design-critic` | `4./.claude/agents/design-critic.md` | Utilisé par l'agent 4 pour évaluer les previews HTML |
