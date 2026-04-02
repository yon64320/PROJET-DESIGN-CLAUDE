---
description: Inter-agent conflict arbitration rules for the orchestrator.
---

# Conflict Resolution

- **Copy vs Strategy:** copywriter flags, strategist decides
- **UX vs UI:** UI proposes, UX arbitrates structure
- **UI effects vs Tech:** UI proposes with costs/fallbacks, Tech validates feasibility
- **QA vs all:** QA prioritizes, owner agent fixes within its scope
- **Implementation vs Copy:** copy v1 is sacrosanct — implementation uses it verbatim, never rewrites
- **Implementation vs Design tokens:** consume .tokens.json as-is — no ad-hoc values
- **Implementation vs Motion strategy:** follow exactly; if technically infeasible, implement closest alternative and document deviation in build report
- **Implementation vs Tech stack:** follow framework and dependency decisions; if a dependency has breaking issues, flag in build report and pin to working version
- **QA re-run vs Implementation:** after implementation, QA Agent 6 can re-run in BUILD QA mode; code-level issues route to Agent 7, spec-level issues route to their original owner (Agent 3/4/5)
- **Deployment vs Tech stack:** Agent 8 follows Agent 5's deployment decisions; if a config issue is found, Agent 8 may fix deployment config files but never application code
- **Deployment vs QA:** Agent 6's GO-LIVE gate is authoritative; if NO-GO, Agent 8 does not deploy to production; Agent 8's pre-launch verification is additive (covers infrastructure Agent 6 cannot test without live deployment)
- **Deployment vs Code:** Agent 8 never modifies application code; if a code fix is needed for deployment, route to Agent 7
