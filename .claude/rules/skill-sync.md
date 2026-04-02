---
description: Rules for keeping agent CLAUDE.md files, skills, and deliverable contracts in sync when configuration changes.
---

# Agent Configuration Sync Rule

When a CLAUDE.md is updated (gates, deliverables, contracts), apply this rule:

| Change type | Action required |
|-------------|----------------|
| New deliverable in agent N | Update contract N→N+1 in `gates-and-contracts.md` |
| New gate prerequisite in agent N | Update Gate N in `gates-and-contracts.md` |
| New skill installed in agent folder | Update "SKILLS DISPONIBLES" table in that agent's CLAUDE.md |
| New skill created from scratch | Use `/skill-creator` — never write SKILL.md manually without it |
| Skill updated | Bump version in SKILL.md frontmatter, update table description if trigger/usage changed |

## Skill frontmatter requirements (mandatory)

- `name`: kebab-case, unique per folder
- `description`: one sentence, start with action verb (e.g., "Provides…", "Generates…")
- `triggers`: list of exact phrases that should invoke this skill
- `when_not_to_use`: prevents false positives

## Never

- Install a skill in an agent folder without updating that agent's SKILLS DISPONIBLES table
- Duplicate a skill across multiple agent folders if it's already in the global `~/.claude/skills/`
- Silently rename a skill without updating all CLAUDE.md tables that reference it
