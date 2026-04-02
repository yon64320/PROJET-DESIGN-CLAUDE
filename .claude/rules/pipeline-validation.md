---
description: Orchestrator protocol for launching agents with validation gates and deliverable checks.
---

# Pipeline Validation Protocol

## Before launching agent N

1. Run `bash validate-gate.sh N <project-name>`
2. If FAILED → report missing prerequisites to the user. Do NOT launch the agent.
3. If PASSED → proceed to launch.

## Launching agent N

1. Choose the launch mechanism:
   - **Light update** (minor adjustments, < 3 files affected) → `bash run-agent.sh N "prompt"` (uses default sonnet model for agents 1-3, 6)
   - **Heavy production** (major rewrite, 3+ files) → `bash run-agent.sh N -m opus "prompt"` (force opus for quality)
2. For heavy runs, add cooldown: `bash run-agent.sh N -c 30 "prompt"` (30s rate limit protection)
3. When launching agents in parallel, limit to MAX 2 concurrent agents to avoid rate limiting.

## After agent N completes

1. Run `bash validate-deliverable.sh N <project-name>`
2. If FAILED → report issues, consider re-launching with a more specific prompt.
3. If PASSED → present summary to user, proceed to next agent.

## After full pipeline (all 6 agents)

1. Invoke the `consistency-checker` subagent to verify cross-agent coherence.
2. Present the consistency report to the user.
3. If inconsistencies found → fix in the relevant agent before proceeding.

## Rate limit management

- If an agent returns "You've hit your limit" or similar → STOP. Wait for the reset window.
- Do NOT retry immediately. Do NOT launch other agents.
- Inform the user of the wait time.
- After reset: resume from the failed agent, sequential only (no parallel).

## Parallelization rules

| Scenario | Allowed parallel | Max concurrent |
|----------|-----------------|----------------|
| Initial pipeline (from scratch) | Agents 1-3 if gates pass | 2 |
| Minor update (same tier, small changes) | Agents 1-3 | 3 |
| Major update (tier change, rewrite) | NONE — sequential only | 1 |
| Agents 4-5-6 | NEVER parallel | 1 |
