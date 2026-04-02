# Context Digests

Pre-digested context files for heavy agents (5, 6).

The orchestrator generates these BEFORE launching an agent, extracting only the relevant sections from upstream deliverables. This reduces the number of file reads the agent needs to perform (15+ → 1-3), saving API round-trips and reducing rate limit pressure.

## Naming convention

```
for-agent-{N}-{project-name}.md
```

## What goes in a digest

| Agent | Upstream sections to extract |
|-------|------------------------------|
| Agent 5 | PRD §9.4 (perf), motion-strategy (tier + deps + patterns), component-handoff (components + triggers), design-system (motion section), tokens.json (animation tokens) |
| Agent 6 | PRD §9.4 (perf), all deliverable versions + key sections (CTA labels, perf targets, tier references, token names) |

## How to generate

The orchestrator reads the relevant sections and assembles them into a single file. The agent's prompt should reference this file:

```
"Your context digest is at .pipeline/context-digests/for-agent-5-Studio-Kodo.md.
Read THIS FILE FIRST — it contains the pre-extracted sections from upstream deliverables."
```
