---
description: Mandatory gates, deliverable contracts, and authorized parallelizations for the 8-agent pipeline.
---

# Gates, Contracts & Parallelizations

## Mandatory gates

Before launching an agent, verify its prerequisites are met:

**Gate 2 (UX)**: conversion objective defined, promise v1, proof inventory (even incomplete), primary CTA
**Gate 3 (Copy)**: stable page specs v1, message architecture, proof inventory
**Gate 4 (UI)**: stable copy v1, proof identified, brand constraints
**Gate 5 (Tech)**: design brief + effects strategy + component handoff table + .tokens.json + dark mode overrides, editing needs clarified, integrations listed, **animation tier (1/2/3) confirmed by user**
**Gate 6 (QA)**: tech execution brief, tracking plan, build or complete deliverables
**Gate 7 (Integration)**: ALL 6 agent deliverables present and valid (pack-strategie, UX-Architecture, copy-v1, design-system-v1, tokens.json, component-handoff, motion-strategy, tech-stack-v1, qa-report-v1), animation tier confirmed in motion strategy, project-brief-\<project\>.md produced by orchestrator
**Gate 8 (Deployment)**: build-report confirms build success (READY FOR QA), tech-stack deployment section present and finalized, QA report status is GO or GO WITH RESERVATIONS (no open P0s), copy-v1 available for meta verification and CMS seeding

If a prerequisite is missing: flag it to the user, do not launch the agent.

## Deliverable contracts (what flows between agents)

1 → 2,3: Strategic brief, message architecture, proof inventory, conversion map
2 → 3,4: Sitemap, page specs v1, journeys
3 → 4,5: Copy v1, microcopy, asset constraints, on-page SEO v0
4 → 5: Design brief, design system v1 (semantic tokens + .tokens.json W3C), component handoff table (states/tokens/animation/responsive/a11y per component), motion/effects strategy (with budgets), dark mode token overrides, perf constraints, **animation tier recommendation (1/2/3)**, tiered motion strategy, animation-dependencies list (libraries + JS budgets per tier), signature animation spec per page
5 → 6: Tech execution brief, stack decision log, integrations plan, tracking plan
6 → 3,4,5: Prioritized QA report (each issue routed to its owner)
6 → 7: QA report v1 (validated deliverables, go-live prerequisites), all upstream deliverables (1-5) available
Orchestrator → 7: project-brief-\<project\>.md (cross-agent synthesis: key decisions, constraints, file map — ~100-120 lines)
7 → 8: Build report (build status, pages, known issues), implementation plan (integration inventory), working codebase
7 → 6 (optional re-run): Built site for live QA in BUILD QA mode
5 → 8: Tech stack section deployment (platform, build, env vars, domain, headers), decision log (hosting choice)
6 → 8: QA report GO-LIVE gate (GO/NO-GO + open issues), optimization backlog (for handoff)
3 → 8: Copy v1 meta section (titles, descriptions) + legal pages (compliance verification)
8 → (final): Live production site, deployment config, launch report, client handoff document
8 → 7 (optional): Production issues requiring code changes
8 → 6 (optional): Post-deployment QA findings for re-audit

## Authorized parallelizations

- Proof inventory (agent 1) can start during IA (agent 2) if the promise is defined
- Agent 5 can begin a requirements pre-audit during agent 4, without locking the stack

Any other parallelization requires user approval.
