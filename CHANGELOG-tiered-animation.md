# CHANGELOG — Tiered Animation System in Pipeline

> **Date :** 2026-04-01
> **Branch :** main
> **Auteur :** Orchestrator session (Claude Sonnet 4.6)
> **Type :** Workflow-only — aucun code de site modifié

---

## Contexte

Ce changelog documente l'implémentation du système d'animation à 3 tiers dans le pipeline de production de sites vitrines. L'objectif était de rendre la stratégie d'animation **explicite, scalable et transmissible** entre les agents 4 (Design) et 5 (Tech), sans toucher à aucun code de site.

### Problème résolu

Avant ce commit, le pipeline avait une seule stratégie d'animation implicite (CSS-only pour Studio Kodo) sans framework de décision pour d'autres projets. L'agent 5 ne savait pas s'il devait inclure GSAP/Lenis dans le stack ou pas — cette décision n'était pas dans le contrat 4→5.

### Solution

Système à 3 tiers avec sélection obligatoire avant le passage Agent 4 → Agent 5 :
- **Tier 1** : CSS-only, 0KB JS — défaut pour projets sobres/perf-first
- **Tier 2** : GSAP + ScrollTrigger + Lenis (~28KB gz) — projets expressifs
- **Tier 3** : Tier 2 + Spline 3D (+150–300KB lazy) — projets signature avec justification 3D

---

## Étape 0 — Restore studio-kodo/

**Action :** Suppression des artefacts npm ajoutés lors d'une session précédente.

| Fichier | Action |
|---------|--------|
| `studio-kodo/node_modules/` | `trash` (envoyé à la corbeille Windows) |
| `studio-kodo/package-lock.json` | `trash` (envoyé à la corbeille Windows) |

**Note :** `studio-kodo/` est entièrement untracked — `git checkout` ne s'appliquait pas. Seuls les artefacts npm ont été supprimés.

---

## Étape 1 — Agent 4 CLAUDE.md

**Fichier :** `4. Branding-UI & design system/CLAUDE.md`

### Modifications section C

**Avant :** Section C nommée "PREMIUM EFFECTS STRATEGY" avec liste flat d'éléments à produire, 3D comme décision binaire, pas de notion de tier.

**Après :** Section C renommée "PREMIUM EFFECTS STRATEGY + ANIMATION TIER SELECTION"

Ajouts :
- **Tableau de sélection de tier** (1/2/3) avec label, JS budget, libraries requises
- **3 règles de gouvernance du tier** : recommandé par Agent 4, validé utilisateur, documenté dans la motion strategy
- **Colonnes REQUISES** dans les tableaux : "Min Tier" (effets autorisés) + "Tier Override" (effets interdits)
- **Effets déverrouillés Tier 2+** : parallax sur décoratifs, word-split text, magnetic buttons CTAs
- **Interdictions permanentes tous tiers** : carousel, glassmorphism, scroll-jacking, auto-play vidéo, custom cursor
- **3D comme framework de décision** (3 cas : Tier 1 / Tier 2 / Tier 3) au lieu du "non catégorique"

### Nouveau livrable E

**Signature Animation Spec (par page)** — pour chaque page :
- Tier recommandé (avec justification si différent du tier global)
- Séquence d'animation exacte (élément → effet → timing → trigger)
- Scroll storyboard (à quel % de viewport chaque animation se déclenche)
- Budget perf par page (INP/CLS/LCP, animations simultanées max, JS weight)

### Section SKILLS DISPONIBLES

Ajout de 6 nouveaux skills :

| Skill | Source |
|-------|--------|
| `/gsap-core` | greensock/gsap-skills |
| `/gsap-scrolltrigger` | greensock/gsap-skills |
| `/gsap-timeline` | greensock/gsap-skills |
| `/modern-web-design` | freshtechbro/claudedesignskills |
| `/spline-interactive` | freshtechbro/claudedesignskills |
| `/lightweight-3d-effects` | freshtechbro/claudedesignskills |

---

## Étape 2 — motion-strategy-Studio-Kodo.md v2

**Fichier :** `4. Branding-UI & design system/motion-strategy-Studio-Kodo.md`

**Réécriture complète de v1.0 → v2.0**

### Changements majeurs

| Section | v1 | v2 |
|---------|----|----|
| **Header** | v1.0, pas de tier | v2.0, tier sélectionné explicitement (Tier 1) |
| **Section 0** | Philosophy seule | Philosophy + tableau de sélection de tier + justification Tier 1 pour Studio Kodo |
| **Section 2** | Tableau 19 effets sans colonne tier | Tableau 24 effets avec colonne **Min Tier** + 5 nouveaux effets Tier 2/3 |
| **Section 3** | Tableau 13 effets interdits sans tier override | Tableau 13 effets avec colonne **Tier Override** (ex : parallax → autorisé Tier 2 décoratifs) |
| **Section 4** | 3D : "AUCUN 3D réel" décision unique | 3D : framework 3 cas (Tier 1/2/3) avec conditions Spline lazy island |
| **Section 6** | Budget global | Budget global + **tableau de budgets par tier** |
| **Section 7** | CSS-only uniquement + "pas de librairies" | CSS-only (Tier 1) + **patterns Tier 2** (GSAP init, Lenis sync, ScrollTrigger cleanup View Transitions) + **patterns Tier 3** (Spline island WebGL detection + fallback) |

### Nouveaux effets ajoutés (Tier 2/3)

| # | Effet | Min Tier |
|---|-------|----------|
| 20 | Parallax décoration | 2 |
| 21 | Word-split text | 2 |
| 22 | Magnetic button | 2 |
| 23 | Smooth scroll (Lenis) | 2 |
| 24 | Spline 3D island | 3 |

---

## Étape 3 — Agent 5 CLAUDE.md

**Fichier :** `5. Technique & intégrations/CLAUDE.md`

### Gate

Ajout du prérequis : `animation tier selection (1/2/3) confirmed by user`

### Livrable A (Tech Requirements Summary)

Ajout d'une ligne dédiée :
```
Animation tier: Tier 1/2/3 — JS budget + library dependencies
```

### Livrable B (Frontend Decision Framework)

Ajout de l'axe de comparaison : **animation library compatibility** (comment chaque framework gère GSAP islands / Lenis / Spline au tier sélectionné)

### Livrable F (Tech Execution Brief)

Ajout de la section **Animation implementation patterns** :
- Tier 1 : IntersectionObserver + CSS custom properties
- Tier 2 : GSAP init island, ScrollTrigger cleanup `astro:before-swap`, Lenis sync
- Tier 3 : Spline island lazy + WebGL detection + fallback + bundle isolation

### Section SKILLS DISPONIBLES

Ajout de 13 nouveaux skills :

| Skill | Source |
|-------|--------|
| `/astro-gsap-patterns` | Custom (créé dans cette session) |
| `/gsap-core` à `/gsap-plugins` (8 skills) | greensock/gsap-skills |
| `/subagent-driven-development` | obra/superpowers |
| `/writing-plans` | obra/superpowers |
| `/test-driven-development` | obra/superpowers |

---

## Étape 4 — Orchestrator CLAUDE.md (racine)

**Fichier :** `CLAUDE.md`

### Gate 5 mis à jour

```
Avant : ...editing needs clarified, integrations listed
Après : ...editing needs clarified, integrations listed, animation tier (1/2/3) confirmed by user
```

### Contrat 4→5 étendu

```
Avant : ...motion/effects strategy (with budgets), dark mode token overrides, perf constraints
Après : ...motion/effects strategy, dark mode token overrides, perf constraints,
        animation tier recommendation (1/2/3), tiered motion strategy,
        animation-dependencies list (libraries + JS budgets per tier),
        signature animation spec per page
```

### Nouvelle section : Agent Configuration Sync Rule

Règles de synchronisation CLAUDE.md ↔ Skills :
- Quand mettre à jour le contrat dans l'orchestrateur
- Quand mettre à jour les tables SKILLS DISPONIBLES
- Frontmatter requis pour les skills (name, description, triggers, when_not_to_use)
- Ce qu'il ne faut jamais faire (skills orphelins, skills dupliqués entre local et global)

---

## Étape 5 — Installation des skills

### Agent 4 — `.claude/skills/` (6 nouveaux)

| Skill | Source repo | Dossier |
|-------|-------------|---------|
| `gsap-core` | greensock/gsap-skills | `4. Branding-UI & design system/.claude/skills/` |
| `gsap-scrolltrigger` | greensock/gsap-skills | idem |
| `gsap-timeline` | greensock/gsap-skills | idem |
| `modern-web-design` | freshtechbro/claudedesignskills | idem |
| `spline-interactive` | freshtechbro/claudedesignskills | idem |
| `lightweight-3d-effects` | freshtechbro/claudedesignskills | idem |

### Agent 5 — `.claude/skills/` (12 nouveaux)

| Skill | Source repo |
|-------|-------------|
| `gsap-core`, `gsap-frameworks`, `gsap-performance`, `gsap-plugins`, `gsap-react`, `gsap-scrolltrigger`, `gsap-timeline`, `gsap-utils` | greensock/gsap-skills |
| `subagent-driven-development`, `writing-plans`, `test-driven-development` | obra/superpowers |
| `astro-gsap-patterns` | Custom (créé dans cette session) |

### Agent 6 — `.claude/skills/` (2 nouveaux)

| Skill | Source repo |
|-------|-------------|
| `systematic-debugging` | obra/superpowers |
| `test-driven-development` | obra/superpowers |

---

## Skill custom créé : astro-gsap-patterns

**Fichier :** `5. Technique & intégrations/.claude/skills/astro-gsap-patterns/SKILL.md`

Contenu :
- Rappel Tier 1 (IntersectionObserver, CSS)
- **Tier 2** : GSAP init Astro island, Lenis init + ScrollTrigger sync, cleanup View Transitions (`astro:before-swap`), stagger hero, magnetic button
- **Tier 3** : Spline lazy island avec WebGL detection, fallback image statique, IntersectionObserver pour lazy trigger
- Tableau de perf gates par tier (Lighthouse, LCP, CLS, INP)

---

## Étape 6 — Sections SKILLS DISPONIBLES mises à jour

| CLAUDE.md | Skills ajoutés |
|-----------|----------------|
| Agent 4 | +6 (gsap-core, gsap-scrolltrigger, gsap-timeline, modern-web-design, spline-interactive, lightweight-3d-effects) |
| Agent 5 | +13 (8 gsap-skills + astro-gsap-patterns + 3 superpowers) |
| Agent 6 | +2 (systematic-debugging, test-driven-development) |

---

## Vérification croisée

| Vérification | Résultat |
|-------------|---------|
| Gate 5 dans orchestrateur contient "animation tier" | ✅ |
| Contrat 4→5 contient "animation tier recommendation" + "signature animation spec" | ✅ |
| Gate Agent 5 contient "animation tier selection confirmed" | ✅ |
| Skills installés correspondent aux tables SKILLS DISPONIBLES | ✅ |
| Tier system cohérent entre Agent 4 CLAUDE.md et motion-strategy v2 | ✅ |
| Section 3D dans motion-strategy v2 = framework 3 cas (pas ban catégorique) | ✅ |
| Interdictions permanentes maintenues : carousel, glassmorphism, scroll-jacking, auto-play, custom cursor | ✅ |

---

## Fichiers modifiés (récapitulatif)

| Fichier | Type | Nature |
|---------|------|--------|
| `4. Branding-UI & design system/CLAUDE.md` | EDIT | Section C tiered + livrable E + 6 skills |
| `4. Branding-UI & design system/motion-strategy-Studio-Kodo.md` | REWRITE | v1→v2 tiered complet |
| `5. Technique & intégrations/CLAUDE.md` | EDIT | Gate + livrables A/B/F + 13 skills |
| `CLAUDE.md` (racine) | EDIT | Contrat 4→5 + Gate 5 + sync rule |
| `6. QA & optimisation/CLAUDE.md` | EDIT | +2 superpowers skills |
| `4. Branding-UI & design system/.claude/skills/gsap-core/` | NEW | Cloned greensock/gsap-skills |
| `4. Branding-UI & design system/.claude/skills/gsap-scrolltrigger/` | NEW | Cloned greensock/gsap-skills |
| `4. Branding-UI & design system/.claude/skills/gsap-timeline/` | NEW | Cloned greensock/gsap-skills |
| `4. Branding-UI & design system/.claude/skills/modern-web-design/` | NEW | Cloned freshtechbro/claudedesignskills |
| `4. Branding-UI & design system/.claude/skills/spline-interactive/` | NEW | Cloned freshtechbro/claudedesignskills |
| `4. Branding-UI & design system/.claude/skills/lightweight-3d-effects/` | NEW | Cloned freshtechbro/claudedesignskills |
| `5. Technique & intégrations/.claude/skills/gsap-*/` (8 skills) | NEW | Cloned greensock/gsap-skills |
| `5. Technique & intégrations/.claude/skills/astro-gsap-patterns/` | NEW | Créé dans cette session |
| `5. Technique & intégrations/.claude/skills/subagent-driven-development/` | NEW | Cloned obra/superpowers |
| `5. Technique & intégrations/.claude/skills/writing-plans/` | NEW | Cloned obra/superpowers |
| `5. Technique & intégrations/.claude/skills/test-driven-development/` | NEW | Cloned obra/superpowers |
| `6. QA & optimisation/.claude/skills/systematic-debugging/` | NEW | Cloned obra/superpowers |
| `6. QA & optimisation/.claude/skills/test-driven-development/` | NEW | Cloned obra/superpowers |
| `studio-kodo/node_modules/` | DELETED | trash (artefact npm) |
| `studio-kodo/package-lock.json` | DELETED | trash (artefact npm) |
| `CHANGELOG-tiered-animation.md` | NEW | Ce fichier |
