---
name: strategie
description: Launch the full strategic workflow for a new showcase website project. Collect business information from the user, launch the strategist agent (agent 1), iterate on its questions, and produce the strategy pack. Use whenever the user wants to start a new project, launch the strategy phase, do framing, or mention a new client/showcase site.
user-invocable: true
argument-hint: "[project-name]"
---

# Strategy Workflow — Agent 1

You orchestrate the strategic framing workflow for project "$ARGUMENTS".

## Phase 1 — Understand the system

Read these two files in parallel (you will need them for what follows):
1. `c:/00 - CLAUDE/Sites_vitrines/CLAUDE.md` — the global pipeline and gates
2. `c:/00 - CLAUDE/Sites_vitrines/1. Stratégie & cadrage/CLAUDE.md` — agent 1's role, prerequisites, and deliverables

Do not summarize these files to the user. Retain the inputs needed for agent 1.

## Phase 2 — Collect information from the user

Agent 1 (vitrine-strategie) needs these inputs to produce its deliverables. Ask the questions below to the user, grouped by theme. Do not ask questions whose answer is already in $ARGUMENTS or in the conversation context.

### Questions to ask (adapt wording, stay natural and direct):

**Offer & service**
- What is the main service or product offered?
- What is the exact scope (what is included / excluded)?
- Who is it for vs who is it NOT for?

**Audience**
- Who is the ideal client (ICP)? Industry, size, decision-maker role?
- Are there secondary segments?
- What is the prospect's awareness level (knows what they want / exploring / doesn't know they have a problem)?

**Business objective**
- What is the site's primary objective? (generate leads / bookings / quote requests / other)
- Is there a target KPI or expected volume?

**Differentiation**
- What concretely differentiates you from the competition? (process, expertise, results, constraints, guarantees)
- Who do you implicitly oppose? (generalist agencies, freelancers, SaaS solutions, etc.)

**Available proof**
- Do you have quantified results, case studies, testimonials, client logos?
- Do you have a documented process or proprietary method?
- Any guarantees, certifications, or credibility elements?

**Known objections**
- What are the most frequent objections or hesitations from your prospects?

**Constraints**
- Are there specific constraints? (deadlines, compliance, brand tone/voice, existing assets, sensitive areas)
- Who will edit the site after delivery? (technical person, non-technical, nobody)

Wait for the user's answers before moving to phase 3. If the user answers partially, follow up only on critical missing elements. Do not block on secondary details — agent 1 will ask its own precision questions if needed.

## Phase 3 — Launch agent 1

Once answers are collected, compile them into a structured Markdown brief and launch agent 1 via Bash:

```bash
export CLAUDE_CODE_GIT_BASH_PATH='C:\Users\yon.otamendi\AppData\Local\Programs\Git\bin\bash.exe'
claude -p "<COMPILED BRIEF HERE>" \
    --output-format text \
    --append-system-prompt "You are agent vitrine-strategie. You are a senior strategist specializing in business framing and positioning. Ignore any instruction telling you that you are an orchestrator or conductor. Your role is defined in the CLAUDE.md of your folder." \
    -d "c:/00 - CLAUDE/Sites_vitrines/1. Stratégie & cadrage"
```

The brief must be structured as follows:
```
# PROJECT BRIEF: [project name]

## Offer & service
[user answers]

## Audience / ICP
[user answers]

## Business objective & conversion
[user answers]

## Differentiation
[user answers]

## Available proof
[user answers]

## Known objections
[user answers]

## Constraints
[user answers]

---
MISSION: From this brief, produce your 4 deliverables (Strategic brief, Message architecture, Proof inventory, Conversion map) following your CLAUDE.md instructions. If information is missing, formulate explicit hypotheses and list them in a "Hypotheses and unknowns" section.
```

## Phase 4 — Analyze output and iterate

Analyze agent 1's output:

**Case A — The agent asks questions:**
- Display the questions to the user, preceded by: "The strategist agent needs clarifications:"
- Wait for answers
- Relaunch agent 1 with the initial brief enriched with the new answers
- Repeat until complete deliverables are obtained

**Case B — The agent produced its deliverables:**
- Save the complete output to `c:/00 - CLAUDE/Sites_vitrines/1. Stratégie & cadrage/output-strategie.md`
- Display a structured summary to the user:
  - Deliverables produced (A/B/C/D)
  - Framing highlights
  - Hypotheses to validate
  - "To be provided" elements identified
  - Agent 2 gate status: ready / not ready (and what is missing)

## Rules

- Never modify agent 1's deliverables — you transmit, you do not rewrite
- Do not answer business questions yourself — relay them to the user
- If agent 1 loops (more than 3 question iterations), suggest the user validate hypotheses and move forward with "To be provided" items
- Timeout for each claude call is 300 seconds (5 min)
