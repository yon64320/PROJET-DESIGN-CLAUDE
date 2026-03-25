# QA REPORT — SITE TEST
**Agent :** vitrine-qa-optimisation
**Date :** 2026-03-25
**Mode :** QA sur livrables (pré-implémentation)
**Sources auditées :** 5 livrables (Stratégie, UX, Copy, Design System, Tech Stack)

---

## 1. QA REPORT — TABLEAU DES ISSUES

### P0 — BLOQUANTS ABSOLUS (ne pas implémenter sans correction)

| # | Issue | Gravité | Impact business | Preuve (source) | Fix recommandé | Owner |
|---|-------|---------|-----------------|-----------------|----------------|-------|
| P0-1 | **Process 5 étapes : 100% placeholder** — Le pivot de crédibilité de tout le site (Home §4, Offre §4, FAQ "pas le temps", Hero signal crédibilité) est vide. 3 sections sur 8 de la Home et 2 sections sur 7 de l'Offre ne peuvent pas être finalisées. | P0 | Critique — sans le process, l'argument différenciateur #1 ("business-first, méthode") n'est pas prouvé. L'ICP voit du flou là où on lui promet de la clarté. | Copy Home §4 entier en `[PLACEHOLDER]`, idem Offre §4 et §5, FAQ "pas le temps" sur les deux pages | Fondateur fournit : noms des 5 étapes, description 2-3 lignes, livrable par étape, temps client par étape. Copywriter finalise la section. | **Fondateur** (contenu) → **Agent 3** |
| P0-2 | **Incohérence navigation entre agents** — UX Architecture spécifie nav = `Logo / Offre / Réalisations / CTA` (À propos masqué). Copy ET Design livrent nav = `Logo / Offre / À propos / CTA` (Réalisations absent). Deux livrables différents. | P0 | Une navigation incohérente entre le brief UX et l'implémentation = risque de livrer sans avoir tranché, avec des liens morts ou des items nav non cohérents | UX Archi §Navigation (`Offre / Réalisations / CTA sticky`) vs Copy §Navigation sticky (`[Offre] — [À propos]`) vs Design §NAVIGATION (idem Copy) | Décision à acter : si page Réalisations différée (0 portfolio), nav = `Offre / À propos / CTA`. Si Réalisations publiée même en placeholder, nav = `Offre / Réalisations / CTA`. Corriger les deux livrables après décision. | **UX arbitre** → **Agent 3 + Agent 4** |
| P0-3 | **`<html lang="fr">` dans le `<head>` (bug HTML)** — Dans le code BaseLayout.astro fourni par l'agent tech, `<html lang="fr">` est écrit à l'intérieur du `<head>`. C'est du HTML invalide — `lang` doit être sur la balise `<html>` racine, pas imbriqué dans le `<head>`. | P0 | SEO pénalisé (validators, accessibilité lecteurs d'écran), HTML invalide en production | Tech §SEO technique, BaseLayout.astro code : `<html lang="fr">` indenté dans `<head>` | Déplacer `lang="fr"` sur la balise `<html>` racine : `<html lang="fr">`. La balise `<head>` ne contient que du contenu de tête. | **Agent 5** |

---

### P1 — IMPORTANTS (à corriger avant go-live)

| # | Issue | Gravité | Impact business | Preuve (source) | Fix recommandé | Owner |
|---|-------|---------|-----------------|-----------------|----------------|-------|
| P1-1 | **Garantie/engagement : placeholder visible en FAQ Offre** — La FAQ `/offre` §6 contient la question "Il y a une garantie ?" avec `[PLACEHOLDER: définir et formuler l'engagement ou garantie]`. Si publié tel quel, le placeholder est visible à l'utilisateur. | P1 | Direct — un utilisateur qui lit la FAQ voit le placeholder | Copy Offre §6, dernier item FAQ | (A) Le fondateur définit une garantie réelle (révisions incluses, satisfaction process, facturation par étapes) et Agent 3 la rédige. (B) Retirer cette question de la FAQ v1 si non défini — ne pas publier une question sans réponse. | **Fondateur** → **Agent 3** |
| P1-2 | **Calendly : contradiction lazy-load click vs widget visible** — Tech §Intégrations déclare "Embed widget sur /contact — directement visible (pas de clic intermédiaire)". Mais le code fourni implémente un lazy-load déclenché au clic. UX confirme : pas de clic intermédiaire sur /contact. Incohérence interne agent 5. | P1 | Sur la page de conversion principale, chaque friction supplémentaire réduit la conversion. Un clic avant de voir le calendrier = perte de leads. ~30% B2B bloquent Calendly via ad-blocker. | Tech §Calendly, règle "directement visible" vs code `btn.addEventListener('click', ...)` | Sur `/contact` : charger Calendly via IntersectionObserver au scroll vers la section (pas au clic). Conserver un formulaire fallback visible par défaut si le script Calendly ne se charge pas (noscript ou timeout 3s + CSS). | **Agent 5** |
| P1-3 | **Formspree : risque de dépassement du free tier (50 sub/mois)** — Objectif 10-20 leads/mois + audit requests + contacts divers. Si le site fonctionne, 50 soumissions/mois est atteint avant la cible haute. Formspree free = arrêt silencieux des soumissions à 50. | P1 | Leads perdus en silence si dépassement non géré | Tech §Formspree "50 sub/mois" + Stratégie KPI "10-20 leads" | Documenter le seuil de bascule (Bronze $10/mois). Configurer alerte dans Formspree à 80% du quota. Alternative : Netlify Forms (250/mois gratuit). | **Agent 5** |
| P1-4 | **Tracking plan : écarts entre Stratégie et Tech** — Événements définis en Stratégie absents ou mal nommés dans l'implémentation tech. Manquants : `scroll_50%`, `cta_secondary_click`, `form_secondary_submitted`, `form_error`. | P1 | Monitoring de conversion incomplet — impossible de mesurer le CTA secondaire "audit existant", les erreurs formulaire, le scroll 50% | Stratégie §Tracking plan vs Tech §GA4 events | Ajouter dans Tech : `scroll_depth_50`, `cta_secondary_click` (paramètre `cta_text`), `form_error` (paramètres `field_name`, `error_type`). Unifier le nommage `form_contact_submitted`. | **Agent 5** |
| P1-5 | **Page À propos : 100% placeholder, décision non actée** — Toute la page `/a-propos` dépend du fondateur (photo, récit, présentation). Si absent au lancement, les liens vers `/a-propos` (nav, footer) seraient cassés ou pointent vers une page vide. | P1 | 404 ou page vide si incluse sans contenu. Navigation cassée si absente sans mise à jour. | Copy §À propos : récit fondateur `[PLACEHOLDER]`, photo `[PLACEHOLDER]`, identité `[PLACEHOLDER]` | Décision formelle fondateur : À propos v1 ou différé ? Si différé → retirer de la nav (Copy + Design), du footer, des liens internes. Si v1 → contenu fourni avant implémentation. | **Fondateur** → **Agent 3 + Agent 4** |

---

### P2 — ACCEPTABLES (à traiter avant ou juste après go-live)

| # | Issue | Gravité | Impact business | Preuve (source) | Fix recommandé | Owner |
|---|-------|---------|-----------------|-----------------|----------------|-------|
| P2-1 | **Contrastes non vérifiés formellement** — Design doc flag `color-text-secondary` (#5C5C56) sur fond page (#F7F5F2) et texte blanc sur `color-accent` (#2D4A3E) comme "à vérifier". Estimation QA : text-secondary/background ≈ 6.6:1 (AA OK), blanc sur accent ≈ 13.6:1 (AAA OK). Non formellement validé. | P2 | Accessibilité WCAG AA | Design §Accessibilité : "à vérifier (calculer le ratio exact)" | Lancer WebAIM Contrast Checker sur toutes les combinaisons avant intégration. Si insuffisant : assombrir `color-text-secondary` de 5-8%. | **Agent 5** (intégration) |
| P2-2 | **OG images absentes des livrables design** — Tech prévoit `og-home.jpg`, `og-offre.jpg`, `og-contact.jpg` (1200×630px). Ces assets ne sont pas dans la checklist "assets à produire" du design system. | P2 | Partage LinkedIn sans OG image = prévisualisation vide = moins de clics entrants | Tech §repo structure `public/og/` vs Design §D CHECKLIST (non mentionné) | Ajouter à la checklist Design §D : spec OG images (1200×630px, fond `color-background`, H1 + logo, format JPEG < 150KB). | **Agent 4** |
| P2-3 | **Page/section légale cookies non couverte par le copy** — GA4 + CookieConsent sont implémentés (tracking actif). Le bandeau de consentement doit avoir un lien vers une politique cookies. Cette page n'est pas dans les livrables copy. | P2 | Obligation légale RGPD — bandeau non conforme sans lien politique accessible | UX §Sitemap `[page-cookies si tracking actif]` + Tech §CookieConsent | Rédiger une section "Cookies et traceurs" dans la politique de confidentialité OU page `/politique-cookies` dédiée. Lier depuis le bandeau CookieConsent. | **Agent 3** |
| P2-4 | **Formspree email subject "SITE TEST" en dur** — Le code HTML exemple du formulaire a `value="Nouveau lead — Site SITE TEST"`. Ce placeholder sera en prod si non changé. | P2 | Leads reçus avec objet email incohérent | Tech §Formspree, code `input hidden name="_subject"` | Remplacer par le nom de l'agence réel. Documenter comme variable à configurer dans Formspree dashboard. | **Agent 5** |
| P2-5 | **Liens `/realisations` conditionnels non gérés tech** — Copy confirme "Réalisations masquée de la nav en v1". Les liens SEO internes dans Home et Offre mentionnent `→ /realisations (si publiée)`. La condition doit être gérée côté code pour éviter les liens morts. | P2 | Liens morts = SEO + UX dégradé | Copy §SEO liens internes Home + Offre | Côté Tech (Astro) : variable de config `REALIZATIONS_PUBLISHED`. Si `false` : liens absents du DOM — pas de 404. | **Agent 5** |
| P2-6 | **Nom agence non disponible : présent partout** — `[PLACEHOLDER: Nom agence]` dans tous les titles SEO, meta, canonical URL, emails Formspree, sitemap. Pas bloquant pour le développement mais bloquant pour le déploiement. | P2 | Mise en ligne impossible sans ce contenu | Tous les fichiers | Décision fondateur : nom d'agence + nom de domaine. Fournir avant la configuration Vercel + Sanity + Formspree. | **Fondateur** |

---

## 2. GO-LIVE GATE

### BLOQUANTS — à corriger avant toute mise en ligne

1. **P0-1** — Process 5 étapes rédigé et intégré (Home §4 + Offre §4 + FAQ + Hero signal)
2. **P0-2** — Décision actée sur la navigation + correction Copy + Design
3. **P0-3** — `<html lang="fr">` corrigé dans BaseLayout.astro
4. **P1-1** — FAQ "garantie" : réponse réelle rédigée OU question retirée
5. **P1-2** — Calendly : lazy-load revu (IntersectionObserver), formulaire fallback actif par défaut si script non chargé
6. **P1-5** — Décision À propos v1 actée + nav/footer cohérents
7. **P2-3** — Page ou section légale cookies existante et liée dans le bandeau CookieConsent
8. **P2-6** — Nom de l'agence + nom de domaine fournis

### ACCEPTABLES — à traiter dans les 30 jours post-lancement

- P1-3 — Seuil Formspree configuré + alerte quota 80%
- P1-4 — Tracking : events manquants ajoutés
- P2-1 — Contrastes vérifiés formellement
- P2-2 — OG images produites et intégrées
- P2-4 — Email subject Formspree mis à jour
- P2-5 — Liens /realisations conditionnels implémentés

### Recommandation finale

> **NO-GO dans l'état actuel.**
>
> Le corpus des livrables est de très bonne qualité globale : cohérence stratégique forte, anti-générique bien tenu, design system complet, architecture technique propre et sobre. Les issues critiques ne remettent pas en cause le positionnement ni l'architecture — elles sont toutes corrigibles.
>
> **GO avec réserves** dès que P0-1 (process) est fourni par le fondateur et que P0-2, P0-3, P1-1, P1-2, P1-5 sont résolus. Les autres items P1/P2 peuvent être traités en sprint post-mise en ligne.

---

## 3. OPTIMISATION BACKLOG (post-launch)

| # | Action | Priorité | Objectif | Owner |
|---|--------|----------|----------|-------|
| 1 | **Constituer 2–3 mini-cas clients** (secteur, problème, solution, résultat qualitatif) — intégrer Home §6 + page Réalisations | Haute | Activer la preuve de capacité — impact fort sur l'objection "ils l'ont déjà fait" | Fondateur + Agent 3 |
| 2 | **Recueillir 2–3 témoignages écrits** clients (3-4 phrases) via email court — intégrer via Sanity CMS | Haute | Social proof near CTA | Fondateur → CMS |
| 3 | **Définir et publier la garantie/engagement** (révisions incluses, facturation par étapes, satisfaction process) | Haute | Différenciateur fort + lève la friction "j'ai peur de me faire avoir" | Fondateur + Agent 3 |
| 4 | **Produire une démo d'automatisation** (screencast 30–60s ou GIF d'un flux réel) | Moyenne | Rend l'argument IA concret et non-gadget | Fondateur + Agent 4/5 |
| 5 | **Tester 2 variantes du H1 hero** (v1 actuelle vs variante orientée transformation) | Moyenne | Optimisation taux scroll 75% + CTA click | Agent 3 + tracking |
| 6 | **Produire les OG images** pour les 3 pages principales (1200×630px) | Moyenne | Améliore les prévisualisations LinkedIn = clics entrants | Agent 4 |
| 7 | **Alerte Formspree + évaluer CRM minimal** (Notion ou HubSpot Free) dès 10 leads/mois | Moyenne | Éviter les leads perdus en silence | Agent 5 / Fondateur |
| 8 | **Test A/B CTA secondaire** : "Demander un audit de mon site actuel" vs "Voir comment ça marche" | Basse | Optimiser la conversion lead froid | Agent 3 |
| 9 | **Vérification Core Web Vitals en conditions réelles** (PageSpeed Insights sur prod) — LCP, CLS, INP | Basse | Confirmer les budgets perf tech | Agent 5 |
| 10 | **Activer module témoignages Sanity** + pré-structurer les slugs `/realisations/[slug]` pour V2 SEO long-tail | Basse | Préparer montée en puissance SEO | Agent 5 |

---

## NEXT OWNERS

| Owner | Issues à traiter |
|-------|-----------------|
| **Fondateur** (décisions business) | P0-1 (process contenu), P1-1 (garantie), P1-5 (À propos décision), P2-6 (nom + domaine) |
| **Agent 3 — vitrine-copywriting** | P0-1 (rédaction process après contenu fondateur), P0-2 (nav corriger copy après décision), P1-1 (rédiger garantie ou retirer FAQ), P1-5 (nav/footer cohérents), P2-3 (section légale cookies) |
| **Agent 4 — vitrine-ui-design-system** | P0-2 (nav corriger design après décision), P1-5 (nav/footer cohérents), P2-2 (ajouter spec OG images à la checklist) |
| **Agent 5 — vitrine-tech-stack** | P0-3 (bug `<html lang>`), P1-2 (Calendly lazy-load + fallback), P1-3 (seuil Formspree), P1-4 (events tracking manquants), P2-1 (contraste formel), P2-4 (email subject), P2-5 (liens /realisations conditionnels) |

---

*Fin QA Report v1 — SITE TEST — 2026-03-25*
*Produit par vitrine-qa-optimisation en mode QA sur livrables.*
