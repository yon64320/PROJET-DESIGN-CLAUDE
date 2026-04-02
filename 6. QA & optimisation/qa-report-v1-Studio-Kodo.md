# QA Report v2 — Studio Kodo

> **Version :** v2.0
> **Date :** 2026-04-01
> **Agent :** vitrine-qa-optimisation
> **Mode :** Deliverables QA (pré-code)
> **Inputs audités :** PRD v1.2, pack-strategie, UX-Architecture-v1, copy-v1, design-system-v1.1, tokens.json v1.1.0, component-handoff v2.0, motion-strategy v3.0, tech-stack v2.0
> **Changement v2.0 :** Re-audit complet suite au passage Tier 1 → Tier 3 (GSAP + ScrollTrigger + Lenis + Spline 3D). 10 zones de risque Tier 3 auditées. Issues v1.0 conservées et mises à jour. Nouvelles issues préfixées T3-.
> **Statut :** GO avec réserves

---

## 1. QA REPORT — ISSUES TABLE

### A. Conversion & UX (issues v1 conservées)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| A1 | **Page 404 : aucun copy fourni** — le tech-stack prévoit une page 404.astro mais l'agent 3 n'a produit aucun copy pour cette page | P1 | Un visiteur qui atterrit sur une 404 sans message clair ni redirection est un prospect perdu | tech-stack-v1 §A.1 mentionne 404, copy-v1 ne contient aucune section B.12 | Agent 3 : produire copy 404 (headline empathique + CTA "Retour à l'accueil" + CTA "Voir les réalisations"). Maximum 5 lignes. | Agent 3 |
| A2 | **CTA "Demander un devis" vs "Démarrer un projet similaire"** — deux labels CTA primaires coexistent sans règle de contexte claire | P2 | Incohérence de label entre pages = confusion dans le parcours | copy-v1 : accueil/services = "Demander un devis", case studies = "Démarrer un projet similaire" | Agent 3 : clarifier la règle dans le tone guide — "Demander un devis" = pages génériques, "Démarrer un projet similaire" = pages case study. Documenter explicitement. | Agent 3 |
| A3 | **Formulaire multi-étapes : aucun mécanisme de sauvegarde des données entre étapes en cas de fermeture** | P2 | Si le visiteur ferme accidentellement à l'étape 4, il perd tout et doit recommencer | UX-Architecture C.6 mentionne "Le visiteur peut revenir en arrière sans perdre ses données" mais rien sur la persistance en cas de fermeture | Agent 5 : ajouter `sessionStorage` pour persister les données entre étapes. Auto-restauration si le visiteur revient. < 0.5KB de JS supplémentaire. | Agent 5 |
| A4 | **Réalisations : filtre par tags marqué "optionnel"** — avec 4 case studies seulement, un filtre est du bruit visuel | P2 | Un filtre sur 4 items ajoute de la complexité sans valeur | UX-Architecture C.3 §3 : "Section filtre (optionnel)" | Confirmer le rejet du filtre pour V1. Le filtre n'est justifié qu'à partir de 8+ case studies. | Agent 2 |
| A5 | **Section "Chiffres clés" accueil marquée "optionnel au lancement"** — mais les chiffres sont disponibles via les case studies concept | P2 | Les chiffres clés sont parmi les éléments de conversion les plus forts. Les rendre optionnels affaiblit l'accueil | UX-Architecture C.1 §6 : "optionnel au lancement", copy-v1 B.1 §6 : copy produit | Recommander l'inclusion en V1. Le copy existe déjà. Retirer la mention "optionnel". | Agent 2 |

### B. Content / Credibility (issues v1 conservées)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| B1 | **11 champs "À renseigner" dans le copy** — téléphone, SIRET, adresse, statut juridique, nom fondateur, email, hébergeur, crédits typos, crédits icônes, date politique confidentialité, outil analytics | P0 | Impossible de mettre en ligne sans ces informations. Non-conformité RGPD | copy-v1 : mentions-legales (6 placeholders), politique-confidentialité (3 placeholders), header/footer | Le fondateur doit fournir les informations manquantes. L'agent 5 confirme l'hébergeur (Vercel). L'agent 4 confirme les crédits (Jost, Lora, Phosphor). | **Fondateur** + Agent 5 + Agent 4 |
| B2 | **Garantie "Satisfait ou on itère" : jamais formalisée** — mentionnée dans le PRD §4.2 et le proof inventory mais non définie ni intégrée au copy | P1 | La garantie est un réducteur d'objection critique. Son absence laisse un trou dans la stratégie de réassurance | PRD §4.2 : "À définir". Pack stratégie C.1 : preuve #11 "À définir" | Agent 3 : rédiger une formulation de garantie pour la FAQ Services et la réassurance Contact. Le fondateur doit valider la portée de l'engagement. | **Fondateur** + Agent 3 |
| B3 | **"On" utilisé fréquemment dans le copy** — "On vous rappelle", "On se parle", "On échange" | P2 | Le "on" contredit le positionnement "interlocuteur unique". Incohérent avec un freelance solo | copy-v1 : multiples occurrences sur toutes les pages | Agent 3 : remplacer les "on" par "je" quand le fondateur parle, ou par des formulations passives. | Agent 3 |
| B4 | **Case study Maison Levain : "5 jours ouvrés" au lieu de "3 jours"** — la promesse centrale est "V1 en 3 jours" mais ce projet est livré en 5 jours | P2 | Le visiteur voit un projet à 5 jours après avoir lu "V1 en 3 jours" = dissonance | copy-v1 B.4, pack-strategie A.2 | Agent 3 : ajouter un micro-copy explicatif : "Ce projet inclut branding + site — 2 jours de plus que le scope site seul." | Agent 3 |
| B5 | **Flowtrack : "+32% de conversion" est un ratio relatif faible** — passe de 1.8% à 2.4% en valeur absolue | P2 | Un fondateur de startup connaît les benchmarks et peut trouver ça modeste | copy-v1 B.5 §6 | Agent 3 : mettre en avant valeur absolue ET relative. Ajouter un deuxième chiffre plus impactant (le -40% de churn). | Agent 3 |

### C. Structural & Technical SEO (issues v1 conservées)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| C1 | **Schema.org : types listés mais aucune structure détaillée** | P2 | Sans templates JSON-LD détaillés, le développeur devra interpréter | tech-stack-v1 §F.8 liste les types sans templates | Agent 5 : produire les templates JSON-LD pour Organization, LocalBusiness, FAQPage. | Agent 5 |
| C2 | **Hn hierarchy de la page Services potentiellement incohérente** | P2 | Hiérarchie Hn incohérente pénalise le crawl et l'accessibilité | copy-v1 B.2 : "Pour qui" au même niveau H2 que les offres | Agent 3 : vérifier que l'ordre Hn est logique. Non bloquant. | Agent 3 |
| C3 | **Blog : emplacement nav réservé en code mais aucune mention dans le repo structure** | P2 | Si le slot blog n'est pas prévu, son ajout futur demandera plus de travail | UX-Architecture A.3 vs tech-stack-v1 F.3 | Agent 5 : ajouter un commentaire dans `Nav.astro` et un dossier vide `src/pages/blog/`. | Agent 5 |

### D. Accessibility & Motion (issues v1 mises à jour + nouvelles T3)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| D1 | **Badge "Projet concept" : contraste accent-warm insuffisant en dark mode pour body-xs** | P1 | Le badge est un élément de transparence éthique critique. Illisible = problème de crédibilité ET d'accessibilité | design-system-v1 A.3 : accent-warm/surface-primary 3.2:1 dark — large text only. Component-handoff : badge body-xs (13px) | Agent 4 : utiliser `text-primary` sur fond `accent-warm 15%` ou augmenter l'opacité du fond. Tester en light ET dark. | Agent 4 |
| D3 | **Accordion FAQ : `grid-template-rows: 0fr→1fr` non supporté Safari < 16.4** | P2 | Fallback nécessaire pour 5-8% des visiteurs | motion-strategy §2 effet #12, component-handoff Accordion | Agent 5 : prévoir un fallback `max-height` ou `<details>` natif. Feature detection avec `@supports`. | Agent 5 |
| **T3-D1** | **Lenis conflicts avec ancres, focus clavier et scroll restauration** — Lenis intercepte le scroll natif. Risques : 1) `<a href="#faq">` peut ne pas scroller correctement, 2) `Tab` focus sur un élément hors viewport peut ne pas auto-scroller, 3) `history.scrollRestoration` cassé après back/forward | **P1** | Les ancres sont utilisées dans la nav mobile et les CTAs internes. Le focus clavier est critique pour l'accessibilité WCAG 2.4.3. Le scroll restauration cassé frustre les utilisateurs qui naviguent avec back/forward | tech-stack-v1 F.6.2 : Lenis init. Aucune mention de gestion des ancres ou du focus scroll. Component-handoff §A Navigation : skip link `<a href="#main-content">`, liens FAQ ancres | **Agent 5** : 1) Utiliser `lenis.scrollTo(target, {offset, duration})` pour les ancres au lieu de laisser le navigateur gérer. Intercepter tous les clics sur `a[href^="#"]`. 2) Ajouter un handler `focusin` qui appelle `lenis.scrollTo(document.activeElement)` si l'élément est hors viewport. 3) Écouter `popstate` et appeler `lenis.scrollTo(window.scrollY, {immediate: true})` pour restaurer la position. 4) **Tester le skip link** — si Lenis bloque le `#main-content`, c'est un fail WCAG 2.4.1. | **Agent 5** |
| **T3-D2** | **Magnetic buttons : pas de guard contre le mouvement pendant le focus clavier** — le component-handoff dit "pas d'effet au focus clavier" mais le code motion-strategy §Moment 5 ne filtre que `mousemove`/`mouseleave`, pas `focus` | **P1** | Si un utilisateur navigue au clavier et que le bouton se déplace magnétiquement parce que la souris est aussi dans le rayon, le bouton bouge sous ses doigts — confus et non conforme WCAG 2.5.3 (Label in Name) | tech-stack-v1 F.6.7 : `[data-magnetic]`. motion-strategy §Moment 5 : code ne vérifie pas `document.activeElement === btn` | **Agent 5** : dans `magnetic-button.ts`, ajouter un guard : `if (document.activeElement === btn) return` dans le handler `mousemove`. Ou mieux : utiliser `:focus-visible` pour distinguer focus clavier vs focus souris, et désactiver le magnétique pendant le focus clavier. | **Agent 5** |
| **T3-D3** | **prefers-reduced-motion : le cleanup dans `gsap.matchMedia()` est incomplet** — le callback de retour (quand l'utilisateur désactive reduced-motion) est vide | **P1** | Si un utilisateur active puis désactive `prefers-reduced-motion` (ex : via les paramètres système), les animations ne se réinitialisent pas. Le site reste figé sans animations | tech-stack-v1 F.6.6 : `return () => { // Cleanup when preference changes back }` — corps vide | **Agent 5** : implémenter le callback de retour : appeler `initLenis()` + `initPageAnimations()` + réinjecter Spline si page accueil. Alternative : recharger la page (moins élégant mais fiable). | **Agent 5** |
| **T3-D4** | **WCAG 2.3.3 (AAA) : aucune mention d'un contrôle utilisateur pour désactiver les animations** — le site repose uniquement sur `prefers-reduced-motion` (réglage OS) | **P2** | Les utilisateurs qui ne savent pas configurer `prefers-reduced-motion` dans leur OS n'ont aucun moyen de désactiver les animations. WCAG 2.3.3 recommande un contrôle in-page | motion-strategy §5 : uniquement via `prefers-reduced-motion`. Aucun toggle UI. Le dark mode toggle existe mais pas d'équivalent pour le motion | **Agent 4** : ajouter un toggle "Réduire les animations" dans le footer ou les paramètres (à côté du dark mode toggle). **Agent 5** : implémenter en JS — le toggle écrit `data-reduced-motion="true"` sur `<html>` + persiste en `localStorage`. Le `gsap.matchMedia()` écoute aussi ce flag en plus de `prefers-reduced-motion`. | **Agent 4** + **Agent 5** |

### E. Performance & Technical Quality (issues v1 mises à jour + nouvelles T3)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| E1 | **CLS target incohérent : PRD dit < 0.1, design system et motion strategy disent ≤ 0.12** *(mise à jour v2 : le tech-stack v2 est aligné sur < 0.1)* | P1 | Le design system et la motion strategy n'ont pas été mis à jour | PRD §9.4 : "CLS < 0.1". design-system-v1 A.7 : "CLS ≤ 0.12". tech-stack v2 §A.4 : "< 0.1" (aligné) | **Agent 4** : mettre à jour CLS dans design-system-v1 et motion-strategy vers < 0.1. Le tech-stack est déjà aligné. | Agent 4 |
| E2 | **Budget JS island formulaire : 48KB sur 50KB autorisés** — marge de 2KB seulement | P1 | N'importe quel ajout fait dépasser le budget | tech-stack-v1 §E.1 : React (32KB) + RHF (9KB) + Zod (4KB) + ContactForm (3KB) = 48KB | Agent 5 : explorer Preact (3KB au lieu de 32KB). Total ~19KB → marge confortable. Alternativement : augmenter le budget à 60KB (Contact est la seule page avec island React). | Agent 5 |
| E3 | **Font loading : Jost variable + Lora estimés à ~60KB** — non négligeable sur mobile | P2 | 15% du budget total de la page. Sur 3G lent, 500ms supplémentaires | tech-stack-v1 §F.7 + §F.8 | Agent 5 : self-hosting woff2 uniquement, subset latin. Économie 20-30%. | Agent 5 |
| E4 | **tokens.json : line-height scale simplifiée (4 valeurs) vs design system (6 valeurs)** | P2 | Le développeur ne saura pas quel token utiliser pour heading-4xl (1.1) vs heading-xl (1.25) | design-system-v1 A.3 vs tokens.json | Agent 4 : enrichir tokens.json avec des tokens par taille. | Agent 4 |
| **T3-E1** | **Spline 3D : WebGL detection insuffisante** — le code tech-stack vérifie `canvas.getContext('webgl')` mais pas WebGL 2 ni la capacité GPU réelle. Certains appareils mobiles "supportent" WebGL mais avec un GPU trop faible pour Spline (< 30fps) | **P1** | Sur un mobile bas de gamme avec WebGL supporté mais GPU faible, Spline se charge (150-300KB), consomme la batterie, et rend à < 15fps. L'utilisateur voit un hero saccadé = perception anti-premium. Pire : ça peut bloquer le main thread et dégrader INP sur toute la page | tech-stack-v1 F.6.5 : vérifie uniquement `canvas.getContext("webgl")`. Aucune vérification de performance GPU. Component-handoff SplineHeroIsland : "WebGL detection" sans précision | **Agent 5** : 1) Ajouter un **device capability check** : `navigator.hardwareConcurrency < 4` → fallback image. 2) Ajouter un `navigator.connection?.effectiveType` check : si `2g` ou `slow-2g` → fallback image (pas la peine de télécharger 150-300KB). 3) Ajouter un **runtime fps check** : après 2s de rendu Spline, si fps moyen < 24, destroy la scène et afficher le fallback image. 4) Mobile < 640px : déjà hidden par design (component-handoff) — **confirmer que le dynamic import ne se déclenche PAS** sur < 640px (actuellement le IntersectionObserver se déclenche quel que soit le breakpoint). | **Agent 5** |
| **T3-E2** | **Spline lazy loading : impact Lighthouse mobile non quantifié** — le PRD exige Lighthouse > 90 (perf), la motion-strategy dit ≥ 85 mobile après lazy load. Pas de test réel | **P1** | Si Lighthouse mobile tombe sous 85, le site ne respecte pas le trade-off assumé Tier 3. Un score < 80 serait perçu comme non-premium par un prospect technique | PRD v1.2 : Lighthouse > 90. Motion-strategy §4 : ≥ 85 mobile. tech-stack v2 §A.4 : > 90. **Incohérence motion-strategy (85) vs tech-stack (90)** | **Agent 4** : aligner motion-strategy sur > 90 (comme le PRD et le tech-stack). **Agent 5** : 1) Confirmer que Spline ne charge PAS avant interaction avec le viewport (le `IntersectionObserver` threshold 0.1 pourrait déclencher trop tôt sur certains layouts). 2) Prévoir un test Lighthouse CI dans le workflow GitHub (`lighthouse.yml` est prévu dans la repo structure). 3) Documenter un **kill switch** : si Lighthouse mobile < 85 après intégration Spline, retirer Spline et passer en Tier 2 (fallback image permanente). | **Agent 4** + **Agent 5** |
| **T3-E3** | **Bundle size GSAP+ScrollTrigger+SplitText+Lenis : ~28KB gz annoncé mais non vérifié** — le budget dit ~28KB gz, le seuil est < 28KB. Aucune marge documentée | **P1** | Si le bundle réel dépasse 28KB (ex : tree-shaking GSAP incomplet, Lenis imports supplémentaires), le budget est cassé et le Lighthouse score baisse. SplitText seul peut ajouter 4-6KB selon la version | tech-stack-v1 §A.4 : gsap ~8KB + ScrollTrigger ~8KB + SplitText ~4KB + Lenis ~8KB = ~28KB. Aucune mesure réelle | **Agent 5** : 1) Vérifier les tailles réelles après tree-shaking avec `npx bundlephobia gsap@3.12` et `lenis@1.1`. 2) Si SplitText (Club GSAP) n'est pas disponible, `split-type` (MIT, ~3KB) réduit le budget de 1KB. 3) Documenter une marge de 10% : budget = 28KB, alerte à 25KB, bloquant à 30KB. 4) Ajouter un check de bundle size dans le CI (`bundlesize` ou `size-limit` npm package). | **Agent 5** |
| **T3-E4** | **Spline 3D : pas de lazy `import()` conditionnel sur le breakpoint** — le IntersectionObserver déclenche le chargement quel que soit le viewport, mais le component-handoff dit "< 640px : hidden (fallback image only)" | **P1** | Sur mobile < 640px, le Spline est masqué en CSS mais le dynamic import se déclenche quand même si le hero est visible → 150-300KB téléchargés pour rien. Sur mobile avec data limité, c'est un gaspillage critique | tech-stack-v1 F.6.5 : `IntersectionObserver` sans check de breakpoint. Component-handoff SplineHeroIsland : "< 640px: hidden (fallback image only)" | **Agent 5** : ajouter un guard `window.innerWidth >= 640` (ou `matchMedia("(min-width: 640px)")`) AVANT d'observer le container avec IntersectionObserver. Sur < 640px, afficher directement le fallback image sans jamais importer `@splinetool/runtime`. | **Agent 5** |

### F. Tracking & Data (issues v1 conservées)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| F1 | **Événement `form_abandon` : `beforeunload` est fragile sur mobile** | P2 | L'abandon de formulaire est la métrique la plus utile pour optimiser le taux de complétion | tech-stack-v1 §E.2 | Agent 5 : compléter avec un tracking basé sur la navigation (`popstate`, clic nav). Plus fiable que `beforeunload`. | Agent 5 |
| F2 | **Aucun UTM tracking documenté** | P2 | Sans convention UTM, les campagnes sociales seront impossibles à attribuer | pack-strategie §D.4, tech-stack-v1 ne mentionne pas les UTMs | Agent 5 : documenter une convention UTM minimale. Plausible lit les UTMs nativement. | Agent 5 |
| F3 | **Pas de pipeline lead → CRM documentée pour la V1** | P2 | Sans suivi structuré, le fondateur oubliera de relancer | tech-stack-v1 §E.3 | Documenter un workflow minimum (email Resend structuré + tableur template). | Agent 5 |

### G. Tier 3 — View Transitions & Cleanup (nouvelles issues)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| **T3-G1** | **GSAP ScrollTrigger cleanup sur View Transitions : SplitText revert non explicite** — le code `astro:before-swap` tue les ScrollTriggers et Lenis, mais le commentaire dit "SplitText: revert automatique au retrait des éléments du DOM". SplitText ne revert PAS automatiquement si les éléments sont simplement retirés — il faut appeler `.revert()` explicitement | **P1** | Si SplitText n'est pas revert avant le swap, les éléments `<span>` injectés par SplitText persistent dans le nouveau DOM (Astro View Transitions swap partiel), causant : 1) accumulation de spans à chaque navigation, 2) layout breaks sur les headings, 3) re-split impossible (SplitText refuse de re-split un élément déjà splité) | tech-stack-v1 F.6.3 : "SplitText: revert automatique au retrait des éléments". C'est **FAUX** — SplitText ne hook pas le DOM removal. Il faut `.revert()` manuellement | **Agent 5** : dans `view-transitions.ts`, ajouter avant le kill des ScrollTriggers : `document.querySelectorAll("[data-split]").forEach(el => { const split = SplitText.get(el); if (split) split.revert(); })`. Alternative : stocker les instances SplitText dans un `Set` global et appeler `.revert()` sur chaque instance dans `astro:before-swap`. | **Agent 5** |
| **T3-G2** | **Lenis re-init après View Transition : pas de délai pour le nouveau DOM** — `astro:after-swap` appelle `initLenis()` immédiatement, mais le nouveau DOM n'est peut-être pas complètement rendu (images lazy, layout shifts en cours) | **P2** | Lenis calcule la hauteur scrollable au moment de l'init. Si le DOM n'est pas stable (images en cours de chargement), Lenis sous-estime la hauteur → impossible de scroller jusqu'en bas de la page. Le fondateur scrolle et le contenu se coupe | tech-stack-v1 F.6.3 : `astro:after-swap` → `initLenis()` immédiat. Pas de `ScrollTrigger.refresh()` explicite | **Agent 5** : 1) Appeler `ScrollTrigger.refresh()` après `initPageAnimations()`. 2) Ajouter un `window.addEventListener("load", () => ScrollTrigger.refresh())` pour recalculer après chargement complet des images lazy. 3) Ou utiliser `ResizeObserver` sur le `<main>` pour appeler `lenis.resize()` + `ScrollTrigger.refresh()` quand la hauteur change. | **Agent 5** |
| **T3-G3** | **Spline 3D cleanup absent dans `astro:before-swap`** — le code détruit ScrollTriggers et Lenis mais pas la scène Spline. Si l'utilisateur navigue Away de l'accueil, le WebGL context reste actif en mémoire | **P1** | Fuite mémoire WebGL. Après 4-5 navigations aller-retour vers l'accueil, le navigateur peut manquer de mémoire GPU (surtout mobile). Symptômes : écran noir sur le canvas, crash onglet, ou ralentissement global | tech-stack-v1 F.6.3 : pas de mention de cleanup Spline. F.6.5 : SplineHeroIsland crée `new Application(canvas)` sans référence exportée | **Agent 5** : 1) Stocker la référence `app` (Spline Application) dans une variable globale ou un attribut `data-spline-app` sur le container. 2) Dans `astro:before-swap`, appeler `app.dispose()` (API Spline) avant de tuer les ScrollTriggers. 3) Supprimer le canvas WebGL du DOM. 4) Vérifier que `@splinetool/runtime` expose bien `.dispose()` — si non, `splineCanvas.getContext('webgl')?.getExtension('WEBGL_lose_context')?.loseContext()` comme fallback. | **Agent 5** |

### H. Tier 3 — Cross-browser (nouvelles issues)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| **T3-H1** | **Safari : GSAP SplitText + `rotateX` cause un flash blanc sur les mots** — Safari gère mal les transforms 3D (rotateX) sur des éléments inline-block générés par SplitText. Un flash blanc apparaît pendant l'animation du word-split | **P1** | Le word-split est le premier élément vu par le visiteur (H1 hero). Un flash blanc sur Safari (15-20% du trafic web France) donne une impression de bug, pas de premium | motion-strategy §Moment 1 : `from({y: 40, opacity: 0, rotateX: -10})`. SplitText génère des `<span style="display:inline-block">` | **Agent 5** : 1) Ajouter `will-change: transform` sur les spans SplitText AVANT l'animation (et le retirer après). 2) Ajouter `-webkit-backface-visibility: hidden` sur les spans. 3) **Tester sans `rotateX`** : si le flash persiste, supprimer `rotateX: -10` et garder uniquement `y: 40, opacity: 0` — l'effet reste premium sans le tilt 3D. 4) Ajouter Safari dans la matrice de test CI ou documenter un test manuel obligatoire. | **Agent 5** |
| **T3-H2** | **Firefox : Lenis smooth scroll conflit avec `scroll-behavior: smooth` CSS** — si `scroll-behavior: smooth` est défini en CSS (ce qui est courant dans les resets), Lenis et le navigateur se battent pour le contrôle du scroll. Firefox est particulièrement sensible à ce conflit | **P2** | Double animation de scroll (Lenis + CSS natif) = scroll saccadé, sensation de "glue". Le visiteur pense que le site est buggé | tech-stack-v1 F.6.2 : Lenis init. global.css probablement contient `scroll-behavior: smooth` dans le reset ou dans la reduced-motion media query | **Agent 5** : 1) S'assurer que `html { scroll-behavior: auto !important; }` est défini quand Lenis est actif. 2) Retirer tout `scroll-behavior: smooth` du CSS global (Lenis gère le smooth scroll). 3) Dans la media query `prefers-reduced-motion: reduce`, où Lenis est détruit, ajouter `scroll-behavior: auto` (pas `smooth` — reduced motion = pas de smooth scroll). | **Agent 5** |
| **T3-H3** | **Safari iOS : WebGL context perdu fréquemment en background** — quand l'utilisateur switch d'onglet ou reçoit une notification, Safari iOS libère les WebGL contexts agressivement. Le Spline 3D affiche un canvas noir au retour | **P2** | Le visiteur ouvre le site, regarde ses notifications, revient — le hero est noir. Il doit recharger la page. Sur mobile, c'est un scénario très fréquent | Comportement documenté de Safari iOS WebGL. tech-stack-v1 F.6.5 : aucune gestion du `webglcontextlost` event | **Agent 5** : 1) Écouter `webglcontextlost` sur le canvas Spline : `splineCanvas.addEventListener("webglcontextlost", showFallback)`. 2) Option : écouter `webglcontextrestored` et tenter un `app.load()` (si l'API Spline le supporte). 3) Alternative simple : sur le `visibilitychange` event, si `document.hidden` was true et le canvas est noir, afficher le fallback image. | **Agent 5** |

### I. Tier 3 — Dark Mode + Animations (nouvelles issues)

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|----------------|----------|----------------|-------|
| **T3-I1** | **Spline 3D : la scène ne s'adapte pas au dark mode** — la composition mid-century utilise la palette teal/mustard/crème. En dark mode, le fond passe à charcoal mais la scène Spline garde ses couleurs light mode. Résultat : la scène "flotte" sur un fond incompatible | **P1** | Le hero est la première chose vue. Un clash visuel entre la scène 3D (fond crème) et le background dark (charcoal) détruit l'impression premium immédiatement | motion-strategy §4 : "palette teal/mustard/crème". design-system-v1 A.3 : dark mode surfaces = charcoal. Aucune mention d'une variante dark de la scène Spline | **Agent 4** : spécifier deux variantes de la scène Spline (ou un fond transparent dans la scène). Options : 1) Scène avec fond transparent → s'adapte au background CSS. 2) Deux fichiers `.splinecode` (light/dark) → chargement conditionnel. 3) Appliquer un CSS `filter` sur le canvas Spline en dark mode (`brightness(0.8) contrast(1.1)`). **Agent 5** : implémenter le switch de scène ou le filtre CSS au toggle dark mode. | **Agent 4** + **Agent 5** |
| **T3-I2** | **Dark mode toggle pendant les animations GSAP : pas de coordination** — si l'utilisateur toggle le dark mode pendant qu'une animation GSAP est en cours (ex : word-split, counter), les couleurs changent à mi-animation. Les tweens GSAP qui animent des propriétés de couleur (rare ici, mais les borders/shadows changent) peuvent se retrouver avec des valeurs stale | **P2** | Effet visuel mineur mais perceptible : un mot qui apparaît en word-split commence en charcoal (light) et finit en crème (dark) si le toggle est activé pendant l'animation. Pas de bug fonctionnel, mais inconsistant | motion-strategy : les animations n'animent PAS de couleurs (uniquement transform + opacity). dark-mode.ts : toggle instantané des CSS custom properties. Mais les shadows (`shadow-subtle` → `shadow-card`) changent au hover via GSAP | **Agent 5** : risque faible car les animations n'animent que transform + opacity. Cependant : 1) Les card hover shadows sont animées via GSAP (`shadow: shadow-card → shadow-elevated`). Vérifier que GSAP lit les CSS custom properties dynamiquement (pas des valeurs snapshot). 2) Si les shadows sont hardcodées dans le JS (pas des CSS vars), les refactorer pour utiliser `getComputedStyle()` au début de chaque tween. | **Agent 5** |

---

## 2. CROSS-AGENT CONSISTENCY CHECK

### 2.1 Token naming — tokens.json ↔ design-system ↔ component-handoff (v2 — inchangé)

| Vérification | Statut | Détail |
|--------------|--------|--------|
| Token names identiques | ✅ OK | Noms cohérents entre les 3 documents |
| Dark mode overrides complets | ✅ OK | 17 tokens overridés, cohérent |
| Easing names cohérents | ✅ OK | `ease-entrance`, `ease-exit`, `ease-state-change`, `ease-bounce` — identiques partout |
| Shadow tokens alignés | ✅ OK | 4 niveaux identiques partout |
| Spacing tokens alignés | ✅ OK | Cohérent |

### 2.2 Page specs (UX) ↔ Copy ↔ Tech (v2 — mis à jour)

| Page | Sections UX | Sections Copy | Sections Tech | Tier | Statut |
|------|-------------|---------------|---------------|------|--------|
| Accueil | 7 sections | 7 sections | SSG | **3** | ✅ Aligné |
| Services | 8 sections | 8 sections | SSG | **2** | ✅ Aligné |
| Réalisations index | 4 sections | 3 sections | SSG | **2** | ⚠️ Filtre omis (A4) |
| Case study (×4) | 9 sections | 9 sections | SSG | **2** | ✅ Aligné |
| À propos | 5 sections | 5 sections | SSG | **2** | ✅ Aligné |
| Contact | 4 sections + form | 4 sections + microcopy | SSG + island React | **2** | ✅ Aligné |
| Mentions légales | 6 sections | 6 sections (placeholders) | SSG | **1** | ⚠️ Placeholders (B1) |
| Politique confidentialité | 9 sections | 9 sections (placeholders) | SSG | **1** | ⚠️ Placeholders (B1) |
| **404** | **Non spécifié** | **Non produit** | **Prévu** | **1** | ❌ Gap (A1) |

### 2.3 Animation tier alignment (NOUVEAU v2)

| Document | Tier global | Lighthouse Perf cible | CLS cible | JS eager budget | Spline cible mobile |
|----------|-------------|----------------------|-----------|-----------------|---------------------|
| PRD v1.2 | Tier 3 | > 90 | < 0.1 | — | — |
| Design system v1.1 | Tier 3 | — | **≤ 0.12** ❌ | — | — |
| Motion strategy v3.0 | Tier 3 | **≥ 85 mobile** ❌ | ≤ 0.1 | ~28 KB | Fallback image < 640px |
| Tech stack v2.0 | Tier 3 | > 90 | < 0.1 | ~28 KB | Fallback image < 640px |
| Component handoff v2.0 | Tier 3 | — | — | — | Hidden < 640px |

**Incohérences identifiées :**
1. **CLS : design-system dit ≤ 0.12** → doit être < 0.1 (PRD) — issue E1
2. **Lighthouse mobile : motion-strategy dit ≥ 85** → doit être > 90 (PRD) — issue T3-E2

### 2.4 Spline 3D lifecycle check (NOUVEAU v2)

| Phase | Documenté | Implémenté dans tech-stack | Statut |
|-------|-----------|---------------------------|--------|
| WebGL detection | ✅ | ✅ `canvas.getContext("webgl")` | ⚠️ Insuffisant (T3-E1) |
| Reduced motion check | ✅ | ✅ `prefers-reduced-motion` | ✅ OK |
| IntersectionObserver lazy init | ✅ | ✅ threshold 0.1 | ⚠️ Pas de guard breakpoint (T3-E4) |
| Timeout fallback (5s) | ✅ | ✅ | ✅ OK |
| Skeleton → canvas transition | ✅ | ✅ gsap fade | ✅ OK |
| Dark mode adaptation | ❌ | ❌ | ❌ Gap (T3-I1) |
| `webglcontextlost` handler | ❌ | ❌ | ❌ Gap (T3-H3) |
| View Transition cleanup (`.dispose()`) | ❌ | ❌ | ❌ Gap (T3-G3) |
| Mobile < 640px guard (no import) | ❌ | ❌ | ❌ Gap (T3-E4) |

### 2.5 View Transitions cleanup check (NOUVEAU v2)

| Ressource à nettoyer | `astro:before-swap` | Statut |
|----------------------|---------------------|--------|
| ScrollTrigger instances | ✅ `getAll().forEach(t => t.kill())` | ✅ OK |
| GSAP tweens en cours | ✅ `gsap.killTweensOf("*")` | ✅ OK |
| Lenis instance | ✅ `destroyLenis()` | ✅ OK |
| **SplitText instances** | ❌ Commentaire dit "auto" — **faux** | ❌ Gap (T3-G1) |
| **Spline Application** | ❌ Pas mentionné | ❌ Gap (T3-G3) |
| Magnetic button event listeners | ❌ Pas mentionné | ⚠️ Risque faible (GSAP tue les tweens mais pas les event listeners natifs) |

### 2.6 Performance targets alignment (v2 — mis à jour)

| Métrique | PRD | Design System | Motion Strategy | Tech Stack | Aligné ? |
|----------|-----|---------------|-----------------|------------|----------|
| Lighthouse Perf | > 90 | — | **≥ 85** | > 90 | **❌ T3-E2** |
| Lighthouse A11y | > 95 | — | — | > 95 | ✅ |
| Lighthouse BP | > 95 | — | — | > 95 | ✅ |
| Lighthouse SEO | > 95 | — | — | > 95 | ✅ |
| LCP | < 2.5s | ≤ 2.5s | ≤ 2.5s | < 2.5s | ✅ |
| FCP | < 1.2s | — | — | < 1.2s | ✅ |
| CLS | **< 0.1** | **≤ 0.12** | ≤ 0.1 | < 0.1 | **❌ E1** |
| INP | — | ≤ 200ms | ≤ 200ms | < 200ms | ✅ |
| JS eager (animation) | — | — | ~28KB | ~28KB | ✅ |
| Spline lazy | — | — | 150-300KB | 150-300KB | ✅ |

### 2.7 CTA consistency (v1 — inchangé)

| CTA | Accueil | Services | Réalisations | Case studies | À propos | Contact | Header |
|-----|---------|----------|-------------|--------------|----------|---------|--------|
| "Demander un devis →" | ✅ | ✅ | ✅ | — | ✅ | — | ✅ |
| "Démarrer un projet similaire →" | — | — | — | ✅ | — | — | — |
| "Voir les réalisations →" | ✅ | ✅ | — | ✅ | ✅ | ✅ | — |
| Numéro de téléphone | ✅ | ✅ | ✅ | — | ✅ | ✅ | ✅ |

---

## 3. GO-LIVE GATE

### Bloqueurs (P0) — À résoudre avant implémentation

| # | Blocker | Owner | Effort |
|---|---------|-------|--------|
| B1 | 11 champs "À renseigner" — informations légales et coordonnées manquantes | Fondateur | 15 min |

### P1 — À résoudre avant mise en ligne

| # | Issue | Owner | Effort | Catégorie |
|---|-------|-------|--------|-----------|
| A1 | Copy page 404 manquant | Agent 3 | 15 min | v1 |
| B2 | Garantie de service non formalisée | Fondateur + Agent 3 | 30 min | v1 |
| D1 | Contraste badge "Projet concept" dark mode | Agent 4 | 30 min | v1 |
| E1 | CLS target à aligner sur < 0.1 dans design-system + motion-strategy | Agent 4 | 5 min | v1 |
| E2 | Budget JS island trop serré (48/50KB) | Agent 5 | 1h | v1 |
| **T3-D1** | **Lenis conflicts avec ancres, focus clavier, scroll restauration** | **Agent 5** | **2h** | **Tier 3** |
| **T3-D2** | **Magnetic buttons : guard focus clavier manquant** | **Agent 5** | **30 min** | **Tier 3** |
| **T3-D3** | **prefers-reduced-motion : callback de retour vide** | **Agent 5** | **1h** | **Tier 3** |
| **T3-E1** | **Spline WebGL detection insuffisante (GPU faible, mobile)** | **Agent 5** | **2h** | **Tier 3** |
| **T3-E2** | **Lighthouse mobile cible incohérent (85 vs 90) + kill switch Spline** | **Agent 4 + Agent 5** | **1h** | **Tier 3** |
| **T3-E3** | **Bundle size GSAP+Lenis non vérifié, pas de CI check** | **Agent 5** | **1h** | **Tier 3** |
| **T3-E4** | **Spline import() non conditionnel au breakpoint mobile** | **Agent 5** | **30 min** | **Tier 3** |
| **T3-G1** | **SplitText .revert() manquant dans View Transitions cleanup** | **Agent 5** | **30 min** | **Tier 3** |
| **T3-G3** | **Spline .dispose() absent dans View Transitions cleanup** | **Agent 5** | **1h** | **Tier 3** |
| **T3-H1** | **Safari : flash blanc word-split rotateX** | **Agent 5** | **1h** | **Tier 3** |
| **T3-I1** | **Spline 3D : pas d'adaptation dark mode** | **Agent 4 + Agent 5** | **2h** | **Tier 3** |

### Acceptables post-lancement (P2)

| # | Issue | Owner | Priorité post-launch |
|---|-------|-------|---------------------|
| A2 | Documenter la règle des deux labels CTA | Agent 3 | Semaine 1 |
| A3 | sessionStorage pour persistance formulaire | Agent 5 | Semaine 1 |
| A4 | Confirmer rejet du filtre réalisations | Agent 2 | Semaine 1 |
| A5 | Inclure la section "Chiffres clés" en V1 | Agent 2 | Semaine 1 |
| B3 | Remplacer les "on" par "je" | Agent 3 | Semaine 2 |
| B4 | Clarifier timeline Maison Levain | Agent 3 | Semaine 1 |
| B5 | Revoir métriques Flowtrack | Agent 3 | Semaine 2 |
| C1 | Templates JSON-LD Schema.org | Agent 5 | Semaine 2 |
| C2 | Vérifier hiérarchie Hn Services | Agent 3 | Semaine 1 |
| C3 | Réserver slot blog | Agent 5 | Semaine 1 |
| D3 | Fallback accordion `grid-template-rows: 0fr` | Agent 5 | Semaine 1 |
| E3 | Self-hosting fonts | Agent 5 | Semaine 2 |
| E4 | Enrichir tokens.json line-heights | Agent 4 | Semaine 1 |
| F1 | Améliorer tracking abandon formulaire | Agent 5 | Semaine 2 |
| F2 | Convention UTM documentée | Agent 5 | Semaine 1 |
| F3 | Template suivi leads | Agent 5 | Semaine 1 |
| T3-D4 | Toggle "Réduire les animations" in-page (WCAG 2.3.3) | Agent 4 + Agent 5 | Semaine 2 |
| T3-G2 | Lenis re-init délai + ScrollTrigger.refresh() | Agent 5 | Semaine 1 |
| T3-H2 | Firefox : Lenis vs scroll-behavior CSS | Agent 5 | Semaine 1 |
| T3-H3 | Safari iOS : webglcontextlost handler | Agent 5 | Semaine 2 |
| T3-I2 | Dark mode toggle pendant animations GSAP | Agent 5 | Semaine 2 |

### Recommandation finale

**GO avec réserves — renforcées par le Tier 3.**

Le passage Tier 1 → Tier 3 apporte **15 nouvelles issues** dont **11 P1**. Le pipeline a bien documenté les patterns d'animation (motion-strategy v3, component-handoff v2, tech-stack v2 sont remarquablement détaillés), mais plusieurs **gaps critiques** apparaissent dans les zones de jonction entre les livrables :

1. **Lifecycle Spline 3D incomplet** : WebGL detection trop simple, pas de guard mobile, pas de cleanup View Transitions, pas d'adaptation dark mode. 5 issues P1 sur Spline seul.
2. **View Transitions cleanup insuffisant** : SplitText et Spline non nettoyés = fuites mémoire après navigation.
3. **Lenis + accessibilité** : ancres, focus clavier, skip link — non documentés. Risque WCAG 2.4.1 / 2.4.3.
4. **Cross-browser Safari** : flash blanc word-split et perte WebGL context — tests manuels obligatoires.

**Le seul P0 reste la collecte d'informations fondateur** (B1). Les P1 Tier 3 sont résolvables en ~14h de travail réparti principalement sur l'Agent 5 (Tech), avec quelques corrections Agent 4 (Design).

**Risque Tier 3 principal :** Si Lighthouse mobile tombe sous 85 avec Spline, le kill switch doit être documenté et prêt (retour au Tier 2 = fallback image permanente). Le coût de ce rollback est faible si le code est structuré avec le guard breakpoint (T3-E4) et le fallback image déjà en place.

---

## 4. OPTIMIZATION BACKLOG (post-launch)

| # | Action | Impact | Effort | Owner |
|---|--------|--------|--------|-------|
| 1 | **Collecter le premier témoignage client** (vidéo si possible) | Très élevé | Moyen | Fondateur |
| 2 | **A/B test H1 accueil** — tester l'alternative vs. la version actuelle | Élevé | Faible | Agent 3 |
| 3 | **Ajouter bandeau "X projets livrés"** dès 3+ vrais projets | Élevé | Faible | Agent 3 |
| 4 | **Optimiser le formulaire** — analyser le funnel step-by-step via Plausible | Élevé | Moyen | Agent 5 |
| 5 | **Self-host les fonts** — Jost + Lora en woff2, subset latin | Moyen | Faible | Agent 5 |
| 6 | **Ajouter Keystatic CMS** si le fondateur veut une GUI | Moyen | Moyen | Agent 5 |
| 7 | **Explorer Preact** pour réduire le bundle formulaire | Moyen | Moyen | Agent 5 |
| 8 | **Ajouter le blog** — slot nav + premiers articles SEO | Moyen | Élevé | Agent 3 + 5 |
| 9 | **Webhook CRM** — connecter le formulaire à Notion/Airtable | Moyen | Faible | Agent 5 |
| 10 | **Monitoring Web Vitals réel** — Vercel Speed Insights ou web-vitals library | Moyen | Faible | Agent 5 |
| 11 | **Spline scène dark mode** — si T3-I1 résolu par filtre CSS, considérer une vraie scène dark pour un résultat optimal | Moyen | Moyen | Agent 4 + 5 |
| 12 | **Runtime FPS monitoring Spline** — après 2s si fps < 24, auto-fallback image | Moyen | Moyen | Agent 5 |

---

## NEXT OWNERS

| Owner | Issues à traiter | Volume | Priorité |
|-------|-----------------|--------|----------|
| **Fondateur** | B1 (informations légales), B2 (valider garantie) | 2 issues | P0 + P1 — **bloquant** |
| **Agent 3 (Copy)** | A1 (404), A2 (règle CTA), B2 (rédiger garantie), B3 ("on"→"je"), B4 (timeline Maison Levain), B5 (métriques Flowtrack), C2 (Hn Services) | 7 issues | P1 + P2 |
| **Agent 4 (Design)** | D1 (contraste badge), E1 (CLS < 0.1 dans design-system + motion-strategy), E4 (line-heights tokens.json), **T3-D4** (toggle reduced motion UI), **T3-E2** (aligner Lighthouse 90 dans motion-strategy), **T3-I1** (spécifier variante Spline dark mode) | 6 issues | P1 + P2 |
| **Agent 5 (Tech)** | A3 (sessionStorage), C1 (Schema.org), C3 (blog slot), D3 (accordion fallback), E2 (budget JS), F1-F3 (tracking), **T3-D1** (Lenis ancres/focus), **T3-D2** (magnetic focus guard), **T3-D3** (reduced-motion callback), **T3-D4** (toggle implémentation), **T3-E1** (WebGL detection renforcée), **T3-E2** (kill switch + CI), **T3-E3** (bundle size CI), **T3-E4** (guard breakpoint mobile), **T3-G1** (SplitText revert), **T3-G2** (Lenis re-init timing), **T3-G3** (Spline dispose), **T3-H1** (Safari flash), **T3-H2** (Firefox Lenis/CSS), **T3-H3** (Safari iOS WebGL), **T3-I1** (Spline dark mode impl), **T3-I2** (dark toggle pendant anim) | 22 issues | P1 + P2 |
| **Agent 2 (UX)** | A4 (confirmer rejet filtre), A5 (confirmer inclusion chiffres clés) | 2 issues | P2 |

### Charge Tier 3 par owner

| Owner | Issues v1 | Issues Tier 3 (nouvelles) | Total | Effort estimé Tier 3 |
|-------|-----------|--------------------------|-------|----------------------|
| Agent 3 | 7 | 0 | 7 | — |
| Agent 4 | 3 | 3 | 6 | ~3h |
| Agent 5 | 8 | 14 | 22 | ~14h |
| Agent 2 | 2 | 0 | 2 | — |

**L'Agent 5 (Tech) absorbe 93% de la charge Tier 3.** C'est attendu : les issues Tier 3 sont des bugs de lifecycle, de cleanup, de cross-browser et de performance — toutes techniques. L'Agent 4 a 3 corrections de spec (dark mode Spline, Lighthouse cible, toggle UI).

---

*Fin du QA report v2.0. Ce document intègre les 10 zones de risque Tier 3 identifiées lors du passage GSAP + ScrollTrigger + Lenis + Spline 3D. Les 15 nouvelles issues (T3-*) sont routées vers leurs owners. Les issues v1 sont conservées et mises à jour.*
