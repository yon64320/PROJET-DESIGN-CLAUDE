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

## Mapping Skills → Agents (justifications détaillées)

### Agent 1 — Stratégie & cadrage

**Ce que le CLAUDE.md couvre bien** : Structure de livrables très détaillée (brief stratégique, architecture de message, inventaire de preuves, carte de conversion), règles anti-générique fortes, accès WebSearch/WebFetch pour la veille concurrentielle.

**Ce qui manque** : Aucun framework de psychologie de persuasion. L'agent sait QUOI produire (promise, preuves, objections) mais pas POURQUOI certains positionnements convertissent mieux que d'autres. Il n'a aucune référence de biais cognitifs, de modèles mentaux type JTBD ou Value Proposition Canvas.

| Skill assigné | Pourquoi |
|---------------|----------|
| `marketing-psychology` | Apporte 50+ modèles mentaux (JTBD, First Principles, Pareto, loss aversion, anchoring, social proof). Permet à l'agent de justifier ses choix de positionnement par la psychologie comportementale au lieu de se baser uniquement sur l'intuition. Exemple concret : quand l'agent construit la "conversion map", il peut maintenant invoquer le framing effect pour recommander comment présenter une offre vs la concurrence. |

**Skill exclu et pourquoi** : `copywriting` — hors scope, l'agent 1 ne rédige pas de contenu. `seo-audit` — domaine des agents 3/6.

---

### Agent 2 — Architecture & UX conversion

**Ce que le CLAUDE.md couvre bien** : Excellent format de page specs avec "job par section", pensée par parcours utilisateur (journeys) avec friction mapping, conscience SEO structurelle, règles anti-template.

**Ce qui manque** : Zéro référence d'accessibilité structurelle (hiérarchie Hn, landmarks ARIA, skip links). Pas de patterns responsive pour les décisions d'IA (comment la nav se comporte en mobile, priorisation de contenu sur petit écran). Pas de benchmarks de funnels de conversion.

| Skill assigné | Pourquoi |
|---------------|----------|
| `web-design-guidelines` | 100+ règles couvrant accessibilité, performance et UX, maintenu par Vercel (199K installs). Comble le trou béant sur l'accessibilité structurelle : quand l'agent conçoit le sitemap et les page specs, il peut maintenant vérifier que la structure respecte les landmarks, la hiérarchie de heading, et la navigation clavier. Sans ce skill, l'agent produit une IA qui marche visuellement mais qui peut être inaccessible. |
| `marketing-psychology` | Les modèles mentaux aident à mieux ordonner les sections dans les page specs et gérer la friction des parcours. Exemple : le peak-end rule pour décider où placer le témoignage le plus fort dans un parcours, ou le cognitive load theory pour limiter les choix dans une navigation. |

**Skill exclu et pourquoi** : `ui-ux-pro-max` — trop orienté UI visuel (palettes, fonts), or l'agent 2 interdit explicitement l'art direction. `responsive-design` / `frontend-design` — orientés code/implémentation CSS, hors scope.

---

### Agent 3 — Contenu & copywriting

**Ce que le CLAUDE.md couvre bien** : Les règles anti-générique les plus détaillées du pipeline (test de spécificité : "si on remplace le nom de l'entreprise et que ça marche encore, c'est nul"), bonne structure SEO (Title, meta, Hn), couverture microcopy.

**Ce qui manque** : Aucune méthodologie structurée de copywriting. L'agent a d'excellentes règles de validation (comment vérifier que le copy est bon) mais pas de frameworks de production (comment écrire un bon headline, comment séquencer un argument, quelles formules de CTA). Pas de référence psychologie de persuasion pour le framing des arguments.

| Skill assigné | Pourquoi |
|---------------|----------|
| `copywriting` | **Meilleur score du plan (56/60).** Apporte les frameworks pré-rédaction (PAS, AIDA, BAB), les formules par type de page (homepage hero, feature block, pricing, FAQ), les patterns CTA, et les quality checks. Le CLAUDE.md dit "chaque section doit avoir un job" mais ne dit pas COMMENT écrire pour que ce job soit accompli. Ce skill comble exactement ce manque méthodologique. |
| `marketing-psychology` | La psychologie de persuasion est le socle théorique du copy de conversion. Le CLAUDE.md dit "chaque claim doit avoir une preuve" mais ne fournit pas le POURQUOI du séquencement (pourquoi mettre la preuve sociale avant le prix ? → anchoring + social proof). Ce skill transforme le copywriter de "rédacteur qui suit des règles" en "stratège de la persuasion". |
| `seo-audit` | Renforce le livrable "SEO v0" avec une validation structurée (crawlability, qualité contenu E-E-A-T, maillage interne). Le CLAUDE.md couvre Title/meta/Hn mais pas les aspects techniques (canonicals, indexation, rich snippets). L'agent peut maintenant produire un SEO v0 plus complet. |

**Skill exclu et pourquoi** : `analytics-tracking` — hors scope agent 3 (domaine agent 5). `on-page-seo-auditor` — redondant avec `seo-audit`.

---

### Agent 4 — UI/Design System

**Ce que le CLAUDE.md couvre bien** : Structure de livrables très détaillée (design brief, tokens, effects strategy), excellent framework d'effets premium (moments signature, arbre décisionnel 3D, reduced motion), règles anti-cliché visuels.

**Ce qui manque** : Le CLAUDE.md définit la STRUCTURE des tokens (comment organiser les couleurs, typos, spacings) mais pas les OPTIONS concrètes. Aucune palette de couleurs de référence, aucun système typographique, pas de font pairings. Pas de standards WCAG chiffrés (ratios de contraste exacts, tailles touch targets). L'agent sait qu'il faut "des contrastes acceptables" mais pas que le ratio minimum est 4.5:1 pour le texte normal.

| Skill assigné | Pourquoi |
|---------------|----------|
| `ui-ux-pro-max` | 161 palettes couleur, 57 font pairings (Google Fonts), 99 UX guidelines, 161 product types. Le CLAUDE.md demande à l'agent de produire un design system avec des tokens couleur/typo mais ne lui donne AUCUN matériau de référence. Sans ce skill, l'agent invente des palettes à partir de rien. Avec, il peut s'appuyer sur des combinaisons testées et adaptées par type de produit. |
| `accessibility-compliance` | WCAG 2.2 complet (niveaux A/AA/AAA). Ratios de contraste chiffrés (4.5:1 texte normal, 3:1 texte large), tailles touch targets (44×44px minimum), patterns ARIA, navigation clavier, support lecteurs d'écran. Le CLAUDE.md mentionne "contrastes" et "focus states" mais sans aucun standard chiffré — l'agent n'avait aucun moyen de vérifier objectivement si ses choix étaient accessibles. |
| `theme-factory` | 10 thèmes professionnels prêts à l'emploi (couleurs + fonts + principes). Complète `ui-ux-pro-max` avec la qualité Anthropic. Utile comme point de départ rapide quand le client n'a pas de charte existante. |
| `web-design-guidelines` | Ajoute des règles de design "performance-aware" (poids des assets, lazy loading, format d'images). L'agent 4 spécifie des effets visuels (3D, parallax, animations) mais n'avait aucune conscience de leur coût en performance. Ce skill l'aide à anticiper les contraintes techniques avant le passage à l'agent 5. |

**Skill exclu et pourquoi** : `frontend-design` — orienté code CSS/Tailwind. L'agent 4 ne code PAS (règle explicite dans son CLAUDE.md : `disallowedTools: Bash`). L'installer créerait un risque de confusion de scope majeur. `motion/jezweb` — Framer Motion code-level, même problème.

---

### Agent 5 — Technique & intégrations

**Ce que le CLAUDE.md couvre bien** : Excellente méthodologie de decision framework (comparaison Astro/Next.js/Nuxt/Webflow), principe anti-surcomplexité ("pas de Next.js si un site Astro suffit"), distinction claire frontend/backend/CMS/hosting, WebSearch/WebFetch pour la recherche.

**Ce qui manque** : Pas de chiffres de référence pour les budgets performance (quels sont les seuils Core Web Vitals ?). Pas de guide d'implémentation analytics structuré (nommage événements GA4, patterns consent mode, stratégie UTM).

> **Contrainte critique** : L'agent 5 doit rester **framework-agnostique** — son CLAUDE.md compare les frameworks sans en privilégier aucun. Installer un skill spécifique (Astro, Next.js, Tailwind) biaiserait ses recommandations.

| Skill assigné | Pourquoi |
|---------------|----------|
| `performance` | Maintenu par Addy Osmani (Chrome team). Fournit les audits Lighthouse, les seuils Core Web Vitals (LCP < 2.5s, FID < 100ms, CLS < 0.1), l'identification de bottlenecks. Directement actionnable pour définir les budgets perf dans le tech execution brief. **Framework-agnostique** — mesure la perf indépendamment du stack choisi. |
| `analytics-tracking` | GA4, GTM, nommage d'événements, stratégie UTM, privacy/consent mode. Comble la section analytics du plan d'intégrations que l'agent 5 doit produire. Sans ce skill, l'agent écrit "intégrer GA4" sans spécifier le data layer, les conventions de nommage, ni le consent flow. **Framework-agnostique** également. |

**Skill exclu et pourquoi** : `astro` — biaiserait vers Astro alors que l'agent doit rester neutre. `vercel-react-best-practices` — React-spécifique. `tailwind-v4-shadcn` — détail d'implémentation CSS, pas le rôle de l'agent 5 (il choisit le stack, il n'implémente pas).

---

### Agent 6 — QA & optimisation

**Ce que le CLAUDE.md couvre bien** : Checklist complète couvrant tous les domaines (conversion, contenu, SEO, accessibilité, perf, tracking), classification de sévérité (P0/P1/P2), attribution owner par issue, deux modes de travail (QA livrables vs QA build), décision GO/NO-GO.

**Ce qui manque** : La checklist est manuelle et basée sur le jugement de l'agent. Pas de méthodologie d'audit automatisé (Lighthouse, axe-core). Pas de règles WCAG spécifiques chiffrées. Pas d'audit SEO structuré au-delà des vérifications de base. Pas de benchmarks performance — l'agent vérifie "la perf est OK" mais sans savoir ce que "OK" veut dire en chiffres.

| Skill assigné | Pourquoi |
|---------------|----------|
| `audit-website` | **230+ règles d'audit** couvrant SEO, performance, sécurité, technique, contenu. Transforme l'agent de "checklist manuelle basée sur le jugement" à "audit structuré par règles mesurables". En mode QA build (site live), l'agent peut maintenant lancer un scan complet au lieu de vérifier visuellement chaque point. |
| `seo-audit` | Audit SEO en 5 priorités (crawlability, SEO technique, on-page, qualité contenu E-E-A-T, autorité). Renforce la section C (SEO) de la checklist QA avec une méthodologie structurée. Sans ce skill, l'agent vérifie "les meta sont présentes" ; avec, il vérifie aussi la qualité E-E-A-T, les canonicals, le maillage interne, la crawlability. |
| `performance` | Fournit les benchmarks Core Web Vitals et la méthodologie Lighthouse. Directement actionnable en mode QA build pour mesurer objectivement les performances. L'agent peut maintenant dire "LCP = 3.2s, au-dessus du seuil de 2.5s → P1" au lieu de "le site semble un peu lent". |
| `accessibility-compliance` | Règles WCAG 2.2 pour renforcer la section D (accessibilité) de la checklist. Le CLAUDE.md dit "contrastes acceptables" et "navigation clavier" mais sans standards précis. Ce skill donne les chiffres : ratio 4.5:1 minimum, touch target 44×44px, patterns ARIA requis. |

**Skill exclu et pourquoi** : `playwright-generate-test` — overkill, l'agent fait de la QA manuelle/livrable, pas du test automation E2E. `on-page-seo-auditor` — redondant avec `seo-audit` + `audit-website` déjà installés.

---

## Logique transversale : pourquoi certains skills sont partagés

Cinq skills bénéficient à plusieurs agents. Ce n'est pas un hasard — ils couvrent des préoccupations **cross-cutting** qui traversent le pipeline :

| Skill partagé | Pourquoi il traverse les agents |
|---------------|--------------------------------|
| `marketing-psychology` | La psychologie de persuasion intervient à 3 niveaux : le positionnement stratégique (agent 1), l'ordonnancement des parcours (agent 2), et le framing du copy (agent 3). Chaque agent l'utilise différemment mais tous ont besoin du même socle théorique. |
| `web-design-guidelines` | L'accessibilité et la qualité web ne sont pas que des problèmes d'UI. La structure IA (agent 2) doit respecter les landmarks et la hiérarchie Hn. L'UI (agent 4) doit respecter les contrastes et touch targets. C'est une préoccupation structurelle autant que visuelle. |
| `accessibility-compliance` | L'accessibilité se spécifie à l'étape design (agent 4 : ratios de contraste, tailles, patterns ARIA) et se valide à l'étape QA (agent 6 : audit de conformité WCAG). Les deux agents ont besoin des mêmes standards mais pour des usages différents (production vs validation). |
| `seo-audit` | Le SEO se produit à l'étape copy (agent 3 : SEO v0 on-page) et se valide à l'étape QA (agent 6 : audit technique SEO). Même logique que l'accessibilité : production vs validation. |
| `performance` | Les budgets perf se définissent à l'étape tech (agent 5 : "LCP < 2.5s pour chaque page") et se mesurent à l'étape QA (agent 6 : "LCP mesuré = 3.1s → P1"). |

## Pourquoi tout installer au niveau projet (et pas par agent)

Les skills sont installés dans `.claude/skills/` (niveau projet) plutôt que dans chaque dossier agent. Raisons :

1. **Les SKILL.md sont légers** (1-5KB chacun) — impact négligeable sur la fenêtre de contexte
2. **L'identité de chaque agent est verrouillée** via `--append-system-prompt` dans le script de lancement — un agent ne confondra pas son rôle avec un skill hors scope
3. **Les skills non pertinents ne sont simplement pas invoqués** — le copywriting skill ne sera pas déclenché par l'agent tech s'il ne fait pas de rédaction
4. **Maintenance simplifiée** — un seul endroit à mettre à jour (`npx skills update`) au lieu de 6 copies

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
