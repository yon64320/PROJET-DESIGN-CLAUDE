# Session — Installation des Skills.sh pour le Pipeline 6 Agents

**Date** : 2026-03-26
**Durée** : ~15 minutes
**Objectif** : Installer les skills skills.sh identifiés dans le plan d'optimisation pour renforcer chaque agent du pipeline sur ses points faibles.

---

## Résultat

**10 skills installés avec succès** au niveau projet (`.claude/skills/`), en plus du skill `strategie` déjà existant.

| # | Skill | Source | Priorité | Statut |
|---|-------|--------|----------|--------|
| 1 | `marketing-psychology` | coreyhaines31/marketingskills | ESSENTIEL | Installé |
| 2 | `copywriting` | coreyhaines31/marketingskills | ESSENTIEL | Installé |
| 3 | `seo-audit` | coreyhaines31/marketingskills | ESSENTIEL | Installé |
| 4 | `analytics-tracking` | coreyhaines31/marketingskills | RECOMMANDÉ | Installé |
| 5 | `performance` | addyosmani/web-quality-skills | ESSENTIEL | Installé |
| 6 | `audit-website` | squirrelscan/skills | ESSENTIEL | Installé |
| 7 | `ui-ux-pro-max` | nextlevelbuilder/ui-ux-pro-max-skill | ESSENTIEL | Installé |
| 8 | `accessibility-compliance` | wshobson/agents | ESSENTIEL | Installé |
| 9 | `web-design-guidelines` | vercel-labs/agent-skills | RECOMMANDÉ | Installé |
| 10 | `theme-factory` | anthropics/skills | RECOMMANDÉ | Installé |
| 11 | `conversion-optimization-expert` | sitechfromgeorgia/georgian-distribution-system | NICE-TO-HAVE | **Échec** — repo privé/inaccessible |

---

## Mapping Skills → Agents

| Agent | Skills qui le renforcent |
|-------|--------------------------|
| **1 — Stratégie** | marketing-psychology |
| **2 — UX Architecture** | web-design-guidelines, marketing-psychology |
| **3 — Copywriting** | copywriting, marketing-psychology, seo-audit |
| **4 — UI/Design System** | ui-ux-pro-max, accessibility-compliance, theme-factory, web-design-guidelines |
| **5 — Tech Stack** | performance, analytics-tracking |
| **6 — QA** | audit-website, seo-audit, performance, accessibility-compliance |

---

## Évaluations de sécurité (par skills.sh)

| Skill | Gen | Socket | Snyk |
|-------|-----|--------|------|
| marketing-psychology | Safe | 0 alerts | Low Risk |
| copywriting | Safe | 0 alerts | Low Risk |
| seo-audit | Safe | 0 alerts | Med Risk |
| analytics-tracking | Safe | 0 alerts | Low Risk |
| performance | Safe | 0 alerts | Low Risk |
| audit-website | Safe | 0 alerts | Med Risk |
| ui-ux-pro-max | High Risk | 0 alerts | Low Risk |
| accessibility-compliance | Safe | 0 alerts | Low Risk |
| web-design-guidelines | Safe | 0 alerts | Med Risk |
| theme-factory | Safe | 0 alerts | Low Risk |

> **Note** : `ui-ux-pro-max` est marqué "High Risk" par le scanner Gen (contenu volumineux avec beaucoup de ressources embarquées). Aucune alerte Socket ni Snyk.

---

## Commandes exécutées

```bash
# Priorité 1 — Essentiels
npx skills add coreyhaines31/marketingskills -s marketing-psychology copywriting seo-audit analytics-tracking -a claude-code -y
npx skills add addyosmani/web-quality-skills -s performance -a claude-code -y
npx skills add squirrelscan/skills -s audit-website -a claude-code -y
npx skills add nextlevelbuilder/ui-ux-pro-max-skill -s ui-ux-pro-max -a claude-code -y
npx skills add wshobson/agents -s accessibility-compliance -a claude-code -y

# Priorité 2 — Recommandés
npx skills add vercel-labs/agent-skills -s web-design-guidelines -a claude-code -y
npx skills add anthropics/skills -s theme-factory -a claude-code -y

# Priorité 3 — Nice-to-have (échec)
npx skills add sitechfromgeorgia/georgian-distribution-system -s conversion-optimization-expert -a claude-code -y
# → Échec : repo privé ou inaccessible
```

---

## Prochaines étapes

1. **Test d'identité** : Relancer chaque agent pour vérifier qu'il ne confond pas son rôle avec les skills chargés
2. **Test de priorité CLAUDE.md** : Vérifier que les règles anti-générique (agent 3) et no-code (agent 4) prennent le dessus sur les skills
3. **Test de qualité** : Comparer les livrables d'un projet test avec/sans skills
4. **Remplacement `conversion-optimization-expert`** : Chercher une alternative accessible ou contacter le mainteneur du repo
