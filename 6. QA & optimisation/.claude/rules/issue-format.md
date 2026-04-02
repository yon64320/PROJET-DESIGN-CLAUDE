---
paths: ["qa-report*"]
description: Mandatory format for every QA issue with severity, evidence, and owner routing.
---

# Issue Format Rule

## Every issue in the QA report MUST have all 6 columns

| Column | Required content |
|--------|-----------------|
| **#** | Unique ID (e.g., A1, B3, T3-C2) |
| **Issue** | Bold title + 1-2 sentence description. Start with the observable problem, not the fix |
| **Sev.** | P0 (blocker), P1 (fix before launch), P2 (acceptable post-launch) |
| **Impact business** | WHY this matters in business terms (lost leads, broken trust, legal risk) — not just "bad UX" |
| **Evidence** | Specific reference: `filename §section` or `filename line X`. Quote the exact text that proves the issue |
| **Fix recommandé** | Concrete fix with estimated effort. Include WHO should do what |
| **Owner** | Agent 3, Agent 4, Agent 5, Agent 2, or Fondateur — never "TBD" |

## Severity definitions

| Level | Definition | Timeline |
|-------|-----------|----------|
| **P0** | Cannot launch without fixing. Legal, functional, or data blocker | Before any implementation |
| **P1** | Must fix before go-live. Significant conversion or credibility impact | Before deployment |
| **P2** | Can launch without. Improvement, not a fix | Post-launch backlog |

## Cross-agent routing rule

- Copy issues → Agent 3
- Design/token issues → Agent 4
- Technical/implementation issues → Agent 5
- Architecture/structure issues → Agent 2
- Business information needed → Fondateur
- If an issue spans agents → list primary owner first, mention secondary in the fix
