# Tech Stack v1 — Studio Kodo

> **Version :** v2.0
> **Date :** 2026-04-01
> **Agent :** vitrine-tech-stack
> **Inputs :** PRD v1.2, pack-strategie, UX-Architecture-v1, copy-v1, design-system-v1.1, tokens.json v1.1.0, component-handoff v2.0, motion-strategy v3.0
> **Animation Tier :** Tier 3 — GSAP + ScrollTrigger + Lenis + Spline 3D *(validé PRD v1.2)*
> **Statut :** Draft — en attente de validation
> **Changement v2.0 :** Passage Tier 1 → Tier 3. JS budget revu (~28KB eager + 150-300KB Spline lazy). GSAP/Lenis/Spline patterns d'intégration Astro. Perf budgets ajustés (Lighthouse > 90 Perf, > 95 autres). View Transitions cleanup.

---

## A. TECH REQUIREMENTS SUMMARY

### A.1 Page types

| Page | Type | Rendering | Interactivité | Animation Tier | Éditable |
|------|------|-----------|---------------|----------------|----------|
| Accueil (`/`) | Statique | SSG | **Haute** (Spline 3D, word-split, parallax, counters, magnetic CTAs, scroll storyboard) | **Tier 3** | Oui (textes, images, chiffres) |
| Services (`/services`) | Statique | SSG | Moyenne (stagger reveals, accordion, magnetic CTAs) | **Tier 2** | Oui (textes, scope offres) |
| Réalisations (`/realisations`) | Statique | SSG | Moyenne (stagger, hover parallax interne, filter layout) | **Tier 2** | Oui (ajout de case studies) |
| Case study (×4) (`/realisations/[slug]`) | Statique | SSG | Moyenne (word-split H1, parallax galerie, scroll storyboard, counters) | **Tier 2** | Oui (contenu complet) |
| À propos (`/a-propos`) | Statique | SSG | Moyenne (word-split H1, parallax photo, scroll storyboard) | **Tier 2** | Oui (textes, photo) |
| Contact (`/contact`) | Hybride | SSG + island | **Haute** (formulaire multi-étapes, GSAP step transitions, magnetic CTA, checkmark animation) | **Tier 2** | Non |
| Mentions légales (`/mentions-legales`) | Statique | SSG | Basse (smooth scroll Lenis uniquement) | **Tier 1** | Oui (infos légales) |
| Politique de confidentialité (`/politique-confidentialite`) | Statique | SSG | Basse (smooth scroll Lenis uniquement) | **Tier 1** | Oui (infos RGPD) |
| 404 | Statique | SSG | Basse | **Tier 1** | Non |

**Synthèse :** 10 des 11 pages sont entièrement statiques. Seule la page Contact nécessite un island interactif (formulaire multi-étapes). GSAP + ScrollTrigger + Lenis sont chargés en eager sur toutes les pages (~28KB gz). Spline 3D est lazy-loaded uniquement sur la page Accueil (+150-300KB). Aucune page ne nécessite de rendu serveur dynamique (SSR).

### A.2 Interactivité

**Niveau global : moyen à haut** (Tier 3 validé — expressive premium).

| Élément interactif | Complexité | Approche | Tier min |
|--------------------|-----------|----------|----------|
| Smooth scroll (Lenis) | Moyenne | Lenis ~8KB, sync avec GSAP ticker + ScrollTrigger.update | 2 |
| ScrollTrigger reveals (`[data-animate]`) | Moyenne | GSAP ScrollTrigger batch, `from({y:20, opacity:0})` | 2 |
| Word-split headings (`[data-split]`) | Moyenne | GSAP SplitText (Club) ou split-type (MIT alternative) | 2 |
| Magnetic buttons (`[data-magnetic]`) | Moyenne | GSAP mousemove/mouseleave, desktop only | 2 |
| Parallax scroll (images) | Moyenne | GSAP ScrollTrigger scrub, yPercent, overflow:hidden | 2 |
| Scroll storyboard (process frise) | Haute | GSAP timeline + ScrollTrigger scrub 0.8 | 2 |
| Counter animation (chiffres) | Moyenne | GSAP textContent tween, snap entier | 2 |
| Card hover depth (shadow + translateY) | Basse | GSAP `power2.out` 300ms | 1 |
| Card parallax interne (mouse-follow) | Moyenne | GSAP mousemove, image x/y dans le cadre | 2 |
| **Spline 3D island** | **Haute** | **@splinetool/runtime lazy, WebGL detection, fallback image** | **3** |
| Accordion FAQ | Basse | CSS `grid-template-rows: 0fr→1fr` 300ms | 1 |
| Dark mode toggle | Basse | Vanilla JS < 0.5KB (inchangé) | 1 |
| Nav mobile (hamburger → overlay) | Basse | CSS + micro-script < 0.5KB | 1 |
| Header scroll shadow | Basse | CSS opacity transition on pseudo-element | 1 |
| **Formulaire multi-étapes** | **Haute** | **React island (React Hook Form + Zod) + GSAP step transitions** | 2 |
| Form step transitions | Moyenne | GSAP `power2.inOut` 400ms translateX + opacity | 2 |
| Selection bounce (form) | Basse | GSAP `back.out(1.7)` 200ms scale | 2 |
| Confirmation checkmark | Basse | GSAP SVG strokeDashoffset + scale 600ms | 2 |
| Filter layout animation | Moyenne | GSAP `power2.inOut` 400ms position | 2 |

### A.3 Editing needs

| Qui | Quoi | Fréquence | Compétence technique |
|-----|------|-----------|---------------------|
| Fondateur (personne technique) | Case studies (ajout de vrais projets) | Mensuelle | Élevée (peut éditer du Markdown, du code) |
| Fondateur | Textes de pages (ajustements copy) | Trimestrielle | Élevée |
| Fondateur | Images (mockups, photos) | Mensuelle | Élevée |
| Fondateur | Infos légales | Annuelle | — |

**Conclusion :** Le fondateur est technique → un CMS headless n'est pas obligatoire. Markdown dans le repo (content collections) est suffisant et plus performant. Un CMS headless optionnel (Keystatic) peut être ajouté si le workflow évolue.

### A.4 Premium effects & perf constraints

**Niveau d'ambition motion :** expressive premium — **Tier 3 (GSAP + ScrollTrigger + Lenis + Spline 3D)**.

**Animation dependencies :**

| Library | Version | Taille (gz) | Chargement | Pages |
|---------|---------|-------------|------------|-------|
| gsap (core) | ^3.12 | ~8 KB | Eager | Toutes |
| gsap/ScrollTrigger | ^3.12 | ~8 KB | Eager | Toutes |
| gsap/SplitText | ^3.12 | ~4 KB | Eager | Accueil, À propos, Case study, sections conversion |
| lenis | ^1.1 | ~8 KB | Eager | Toutes |
| **Sous-total Tier 2** | — | **~28 KB gz** | — | — |
| @splinetool/runtime | ^2.x | 150–300 KB | **Lazy** (dynamic import) | Accueil uniquement |
| **Total max** | — | **~328 KB** | 28 KB eager + 300 KB lazy | — |

**Note SplitText :** Si la licence Club GSAP n'est pas disponible, utiliser `split-type` (MIT, ~3KB gz) comme alternative gratuite. L'API est similaire.

**Performance gates (from PRD v1.2 + motion strategy v3.0) :**

| Métrique | Cible |
|----------|-------|
| Lighthouse Performance | > 90 (trade-off assumé pour expressivité Tier 3) |
| Lighthouse Accessibility | > 95 |
| Lighthouse Best Practices | > 95 |
| Lighthouse SEO | > 95 |
| LCP | < 2.5s |
| FCP | < 1.2s |
| CLS | < 0.1 |
| INP | < 200ms (< 100ms sur Contact) |
| Total JS eager (animation) | ~28KB gz |
| JS island formulaire (React) | < 50KB gz |
| Spline 3D lazy | 150-300KB (Accueil uniquement, ne bloque pas LCP) |
| Total page weight (Accueil hors Spline) | < 450KB |

### A.5 Design tokens

- **Source :** `tokens.json` v1.1.0 au format W3C Design Tokens 2025.10 (fourni par agent 4)
- **Consommation :** Génération de CSS custom properties `--kodo-*` à build-time
- **Theming :** Light/dark via `data-theme="light|dark"` sur `<html>`
- **Persistance :** `localStorage` pour le choix utilisateur
- **Détection :** `prefers-color-scheme` pour le défaut système
- **Tokens variables :** `color.*`, `shadow.*` (changent par thème)
- **Tokens invariants :** `spacing.*`, `radius.*`, `typography.*`, `grid.*`
- **Tokens animation (v1.1.0) :** `easing.*` — GSAP easing palette (entrances, exits, state changes, elastic, scrub) consommés comme référence dans le code JS, pas en CSS custom properties

### A.6 Integrations required

| Intégration | Priorité | Outil recommandé |
|-------------|----------|-----------------|
| Formulaire multi-étapes | Critique | Custom (React Hook Form + Zod dans Astro island) |
| Soumission formulaire (backend) | Critique | Resend (email) + webhook optionnel |
| Anti-spam | Critique | Honeypot + rate limiting (pas de CAPTCHA visuel) |
| Analytics | Haute | Plausible Analytics (self-hosted ou cloud) |
| CRM / lead management | Moyenne | Phase 1 : email notification (Resend). Phase 2 : Notion database ou Airtable via webhook |
| Newsletter | Basse (post-lancement) | Slot prévu, pas implémenté |
| Réseaux sociaux | Basse | Liens statiques (Instagram, LinkedIn) |

### A.7 Compliance & security

| Exigence | Impl. |
|----------|-------|
| RGPD | Mentions légales + politique de confidentialité (pages dédiées) |
| Bandeau cookies | Minimal (si Plausible sans cookies → exempt CNIL). Bandeau info optionnel |
| HTTPS | Automatique via Vercel |
| CSP headers | Content-Security-Policy strict — **ajout `script-src` pour GSAP, `connect-src` pour Spline CDN** |
| Honeypot anti-spam | Champ caché dans le formulaire |
| Rate limiting formulaire | Edge function (Vercel) |
| Données formulaire | Jamais stockées côté client. Email direct via Resend. |
| WCAG 2.1 AA | Vérifié par agent 6 (QA) |

---

## B. FRONTEND DECISION FRAMEWORK

### B.1 Comparaison

| Critère | **Astro** | Next.js | Nuxt | Webflow |
|---------|-----------|---------|------|---------|
| **Rendering** | SSG natif, islands optionnels | SSG + SSR + RSC | SSG + SSR | Propriétaire |
| **JS shipped (site statique)** | 0KB par défaut | ~80KB+ (React runtime) | ~60KB+ (Vue runtime) | Variable (non contrôlable) |
| **Islands architecture** | Natif (`client:*` directives) | Pas natif (tout est React) | Pas natif | N/A |
| **GSAP island isolation** | **Excellent** — GSAP dans `<script>` natif Astro (pas d'hydration), Spline dans un island React `client:visible` isolé | Tout est React — GSAP dans useGSAP hook partout, pas d'isolation bundle | GSAP dans lifecycle hooks Vue, pas d'isolation | JS custom limité |
| **View Transitions** | Natif (`astro:transitions`) + cleanup hooks (`before-swap`/`after-swap`) | Non natif (App Router transitions ≠ browser VT) | Non natif | N/A |
| **Lenis compatibility** | Direct — `<script>` tag, aucun wrapper framework | Via useEffect, cleanup nécessaire, conflit potentiel avec App Router | Via onMounted, cleanup nécessaire | N/A |
| **Content collections** | Natif (Markdown + frontmatter, type-safe) | MDX possible, plus de config | Content module | CMS intégré |
| **Performance baseline** | Lighthouse 100 facile (0KB JS baseline) | 90+ demande optimisation | 90+ demande optimisation | 80-95 (dépend du design) |
| **Complexité** | Faible | Moyenne-haute | Moyenne | Faible (mais verrouillé) |
| **Éco-système UI** | Tout framework en island | React only | Vue only | WYSIWYG |
| **Risque over-hydration** | Quasi nul (opt-in) | Élevé (opt-out) | Élevé (opt-out) | N/A |
| **CMS integration** | Keystatic, Sanity, Markdown | Identique | Identique | Built-in |
| **Dark mode tokens** | CSS custom properties natif | Identique | Identique | Limité |
| **Hosting** | Vercel, Netlify, Cloudflare | Vercel optimal | Vercel, Netlify | Webflow hosting |
| **Lock-in** | Aucun (HTML statique) | Faible | Faible | **Élevé** |

### B.2 Décision

**→ Astro** (confirmé, renforcé par le Tier 3)

**Raisons :**

1. **Islands architecture = idéale pour GSAP + Spline isolation :** Astro permet de charger GSAP/ScrollTrigger/Lenis via un `<script>` Astro natif (pas d'hydration React). Le Spline 3D island est isolé dans un composant React `client:visible` — son bundle de 150-300KB ne contamine pas les autres pages. Next.js chargerait React sur CHAQUE page juste pour GSAP.

2. **View Transitions natives + cleanup hooks :** Astro fournit `astro:before-swap` et `astro:after-swap` — parfait pour le cycle de vie GSAP (kill ScrollTriggers → destroy Lenis → re-init). Next.js App Router n'a pas d'équivalent natif pour le cleanup d'animations.

3. **0KB JS baseline :** Les ~28KB de GSAP/Lenis sont le SEUL JS eager. Pas de runtime framework ajouté. Avec Next.js, on aurait ~80KB React + 28KB GSAP = ~108KB avant même le formulaire.

4. **Content collections :** Les case studies seront ajoutées mensuellement en Markdown. Astro content collections sont type-safe, avec validation Zod intégrée — parfait pour le content model case study.

5. **Lighthouse > 90 réaliste :** Avec SSG pur + 28KB eager + Spline lazy, Lighthouse > 90 Performance est le plancher, pas le plafond. Next.js partirait de ~85 et nécessiterait des optimisations.

**Conditions de changement :**

| Si… | Alors… |
|-----|--------|
| Le fondateur veut un blog dynamique avec commentaires | Rester sur Astro + ajouter un island (commentaires) |
| Le projet évolue vers du e-commerce (panier, checkout) | Migrer vers Next.js (besoin de SSR + API routes) |
| Besoin d'un CMS visuel non-technique | Ajouter Keystatic (fonctionne avec Astro) |
| Besoin de personnalisation dynamique (A/B testing, contenu par segment) | Ajouter Astro SSR (mode hybride) — pas de migration nécessaire |
| Animations deviennent plus complexes (full React app) | Rester sur Astro — les islands React suffisent pour isoler les composants interactifs |

**Alternatives rejetées :**

| Option | Raison du rejet |
|--------|----------------|
| Next.js | Over-engineering pour 11 pages statiques. Runtime React (~80KB) sur chaque page, incompatible avec le budget JS animation. GSAP cleanup plus complexe sans View Transitions natives. |
| Nuxt | Mêmes problèmes que Next.js avec Vue. Pas de gain pour ce cas d'usage. |
| Webflow | Lock-in élevé. Impossible de respecter les tokens W3C, le dark mode custom, les GSAP islands, le Spline 3D island isolé, ou le formulaire multi-étapes custom. |
| 11ty / Hugo | SSG pur sans islands → le formulaire multi-étapes et le Spline 3D island nécessiteraient des workarounds fragiles. Pas de View Transitions natives. |

---

## C. BACKEND DECISION FRAMEWORK

### C.1 Décision : pas de backend dédié

| Signal | Présent ? |
|--------|-----------|
| Authentification utilisateur | Non |
| Base de données relationnelle | Non |
| API custom (CRUD) | Non |
| Webhook entrant complexe | Non |
| Traitement asynchrone (jobs, queues) | Non |
| Fichiers uploadés par l'utilisateur | Non |
| Paiement en ligne | Non |

**Aucun signal de besoin backend.**

### C.2 Ce qui remplace un backend

| Besoin | Solution |
|--------|----------|
| Soumission formulaire → email | Resend (API REST, appel direct depuis une edge function Vercel) |
| Soumission formulaire → CRM | Phase 1 : email. Phase 2 : webhook vers Notion/Airtable |
| Analytics | Plausible (SaaS, aucun backend nécessaire) |
| Images | Build-time optimization (Astro `<Image>`) |
| Contenu éditorial | Markdown dans le repo (content collections) |

### C.3 Signaux d'over-engineering à surveiller

| Si quelqu'un propose… | Questionner… |
|------------------------|-------------|
| Une base de données pour les leads | Pourquoi pas un simple email + tableur ? Le volume attendu est 10 leads/mois. |
| Un serveur Node.js | Pour faire quoi ? Toutes les fonctions sont couvertes par edge functions + SaaS. |
| GraphQL | Pour requêter quoi ? Le contenu est statique au build. |
| Docker / Kubernetes | Pour héberger quoi ? Vercel déploie en 1 commande. |
| Un backend "au cas où" | YAGNI. Ajouter quand le besoin est réel, pas avant. |

---

## D. CMS & CONTENT MODEL

### D.1 Décision : Markdown (content collections Astro)

| Option | Pour | Contre | Verdict |
|--------|------|--------|---------|
| **Markdown + content collections** | Type-safe, version control (git), 0 dépendance externe, build-time validation, parfait pour un fondateur technique | Pas de GUI pour les non-techniques | **✅ Choix retenu** |
| Keystatic | GUI web + git-backed, s'intègre à Astro | Ajout de complexité, peu utile si le fondateur est OK avec Markdown | Optionnel (ajout post-lancement si besoin) |
| Sanity | GUI riche, API flexible, real-time preview | Overengineering pour 11 pages + 4 case studies. Coût potentiel. Dépendance externe. | Rejeté |
| Storyblok / Contentful | GUI visuelle, preview | Overengineering, coût, lock-in | Rejeté |

### D.2 Governance

| Contenu | Éditable | Format | Qui |
|---------|----------|--------|-----|
| Case studies | Oui | Markdown + frontmatter (content collection `caseStudies`) | Fondateur |
| Textes de pages | Oui | Markdown (content collection `pages`) ou directement dans les composants Astro | Fondateur |
| Images case studies | Oui | Fichiers dans `public/images/case-studies/[slug]/` + référence dans frontmatter | Fondateur |
| Navigation (items, ordre) | Verrouillé | Code (composant `Nav.astro`) | Développeur |
| Formulaire (étapes, champs) | Verrouillé | Code (composant React `ContactForm`) | Développeur |
| Tokens design | Verrouillé | `tokens.json` → CSS custom properties au build | Développeur |
| Animations GSAP | Verrouillé | Code (`src/scripts/animations/`) | Développeur |
| SEO meta | Éditable | Frontmatter par page | Fondateur |

### D.3 Content model minimal

#### Collection : `caseStudies`

```typescript
// src/content/config.ts
import { defineCollection, z } from 'astro:content';

const caseStudies = defineCollection({
  type: 'content', // Markdown body
  schema: ({ image }) => z.object({
    title: z.string(),                          // "Maison Levain"
    subtitle: z.string(),                       // "Boulangerie artisanale"
    category: z.enum(['artisan', 'startup', 'pme', 'bien-etre']),
    services: z.array(z.string()),              // ["Branding complet", "Site vitrine"]
    keyMetric: z.object({
      value: z.string(),                        // "+180%"
      label: z.string(),                        // "de demandes de devis"
    }),
    metrics: z.array(z.object({
      value: z.string(),
      label: z.string(),
      prefix: z.string().optional(),            // "+" (for counter animation data-prefix)
      suffix: z.string().optional(),            // "%" (for counter animation data-suffix)
    })),
    timeline: z.array(z.object({
      day: z.string(),                          // "Jour 1"
      step: z.string(),                         // "Cadrage"
      detail: z.string(),
    })),
    heroImage: image(),
    galleryImages: z.array(image()),
    order: z.number(),                          // Tri
    seo: z.object({
      title: z.string(),
      description: z.string(),
    }),
    draft: z.boolean().default(false),
  }),
});

const pages = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    seo: z.object({
      title: z.string(),
      description: z.string(),
    }),
  }),
});

export const collections = { caseStudies, pages };
```

#### Collection : `process`

```typescript
const process = defineCollection({
  type: 'data', // JSON
  schema: z.object({
    steps: z.array(z.object({
      number: z.number(),
      title: z.string(),
      description: z.string(),
      duration: z.string(),
      whatYouDo: z.string(),
      whatIDo: z.string(),
    })),
  }),
});
```

#### Collection : `faq`

```typescript
const faq = defineCollection({
  type: 'data',
  schema: z.object({
    items: z.array(z.object({
      question: z.string(),
      answer: z.string(),
      page: z.enum(['services', 'general']),
    })),
  }),
});
```

---

## E. INTEGRATIONS PLAN

### E.1 Formulaire multi-étapes

| Aspect | Décision |
|--------|----------|
| **Framework** | React (island Astro `client:visible`) |
| **Form lib** | React Hook Form (< 10KB gzipped) |
| **Validation** | Zod (shared schemas, < 5KB gzipped) |
| **Step transitions** | GSAP `power2.inOut` 400ms translateX + opacity (dans l'island React via `useGSAP` hook) |
| **Selection bounce** | GSAP `back.out(1.7)` 200ms scale (étapes 1 et 4) |
| **Confirmation** | GSAP SVG strokeDashoffset + scale 600ms (checkmark animation) |
| **Anti-spam** | Honeypot field (champ caché CSS `display:none`, rejeté si rempli) |
| **Rate limiting** | Vercel Edge Function (max 5 soumissions / IP / heure) |
| **CAPTCHA** | Aucun (honeypot + rate limit suffisent pour le volume attendu) |
| **Soumission** | POST vers `/api/contact` (Vercel serverless function) |
| **Notification** | Email via Resend API (fondateur reçoit un email formaté avec tous les champs) |
| **Confirmation** | Email de confirmation automatique au prospect (via Resend) |
| **Stockage** | Aucun stockage serveur. Email = source of truth. Phase 2 : webhook vers Notion/Airtable. |
| **Données envoyées** | `projectType`, `sector`, `description`, `pages`, `features[]`, `timing`, `name`, `email`, `phone`, `notes` |

**Flow technique :**

```
[Navigateur]
  └─ React island (ContactForm) — client:visible
       ├─ Étapes 1-4 : state local (React Hook Form)
       ├─ GSAP step transitions (useGSAP hook, translateX + opacity)
       ├─ GSAP selection bounce (back.out(1.7) sur boutons choix)
       ├─ Étape 5 : validation Zod → POST /api/contact
       ├─ Confirmation UI (GSAP checkmark animation)
       └─ Magnetic CTA final (data-magnetic, init après étape 5)

[Vercel Edge / Serverless]
  └─ /api/contact.ts
       ├─ Vérification honeypot → 400 si rempli
       ├─ Rate limiting (KV ou header check)
       ├─ Validation serveur (Zod, même schéma)
       ├─ Resend: email au fondateur (template HTML)
       ├─ Resend: email de confirmation au prospect
       └─ Réponse 200 → UI affiche confirmation
```

**Budget JS de l'island :**

| Dépendance | Taille gzipped |
|------------|---------------|
| React + React DOM | ~32KB |
| React Hook Form | ~9KB |
| Zod (tree-shaken) | ~4KB |
| Composant ContactForm | ~3KB |
| **Total** | **~48KB** → dans le budget de 50KB |

**Note :** GSAP est déjà chargé en eager sur la page (global) — l'island React l'utilise via `useGSAP` hook sans duplication de bundle.

**Optimisation :** `client:visible` → l'island ne se charge que quand le formulaire entre dans le viewport. Sur les pages sans formulaire, 0KB React est envoyé.

### E.2 Analytics

| Aspect | Décision |
|--------|----------|
| **Outil** | Plausible Analytics |
| **Mode** | Cloud (plausible.io) — simplifie l'infra. Self-hosted possible si souhaité. |
| **Script** | `<script defer data-domain="studiokodo.fr" src="https://plausible.io/js/script.js">` (~1KB) |
| **Cookies** | Aucun (Plausible est cookieless) |
| **Bandeau CNIL** | Non requis (pas de cookies, pas de données personnelles) |
| **Events custom** | Via `plausible()` API JavaScript |

**Tracking plan (from pack-strategie D.4) :**

| # | Événement | Nom technique | Paramètres | Implémentation |
|---|-----------|---------------|------------|----------------|
| 1 | Page vue | Automatique | `page_path`, `referrer` | Natif Plausible |
| 2 | Clic CTA "Demander un devis" | `cta_click` | `props: {location: "hero\|header\|services\|footer"}` | `data-analytics` attr + script |
| 3 | Formulaire : début | `form_start` | — | Déclenché au render de l'étape 1 |
| 4 | Formulaire : progression | `form_step` | `props: {step: "2\|3\|4\|5"}` | Déclenché à chaque transition |
| 5 | Formulaire : soumission | `form_submit` | `props: {project_type: "..."}` | Après POST 200 |
| 6 | Formulaire : abandon | `form_abandon` | `props: {last_step: "1\|2\|3\|4"}` | `beforeunload` si formulaire démarré et non soumis |
| 7 | Clic téléphone | `phone_click` | `props: {location: "header\|footer\|contact"}` | Sur `<a href="tel:">` |
| 8 | Case study : ouverture | `case_study_view` | `props: {project: "maison-levain\|..."}` | Natif (page view) |
| 9 | Case study : scroll 50%+ | `case_study_engaged` | `props: {project: "..."}` | ScrollTrigger at 50% (via GSAP) |
| 10 | Toggle dark mode | `dark_mode_toggle` | `props: {mode: "dark\|light"}` | Sur le toggle |

### E.3 CRM / Lead management

**Phase 1 (lancement) :**
- Chaque soumission de formulaire → email formaté au fondateur via Resend
- Le fondateur gère ses leads dans son outil existant (email, tableur, Notion — son choix)
- Volume attendu : 10 leads/mois → pas besoin d'un CRM dédié

**Phase 2 (si volume > 20 leads/mois) :**
- Ajouter un webhook dans `/api/contact.ts` qui pousse les données vers :
  - **Notion** (gratuit, le fondateur l'utilise peut-être déjà) via l'API Notion
  - **Airtable** (gratuit jusqu'à 1000 records) via l'API Airtable
- Aucun changement frontend nécessaire — juste une ligne de code dans l'API route

**Phase 3 (si besoin de séquences email) :**
- Ajouter un service d'email marketing (Resend + Loops, ou Brevo)
- Trigger : soumission formulaire → séquence de nurturing (2-3 emails)

### E.4 Résumé des services tiers

| Service | Rôle | Coût | Criticité |
|---------|------|------|-----------|
| **Vercel** | Hosting + deployment + edge functions | Gratuit (hobby) ou $20/mois (pro) | Critique |
| **Resend** | Envoi d'emails (notification + confirmation) | Gratuit (100 emails/jour) | Critique |
| **Plausible** | Analytics privacy-first | $9/mois (10K pageviews) | Haute |
| **Google Fonts** | Jost + Lora | Gratuit | Critique |
| **Domaine** | studiokodo.fr / studiokodo.com | ~15€/an | Critique |
| **GSAP** | Animation library | Gratuit (standard license) | Critique |
| **GSAP SplitText** | Word-split plugin | Club GSAP ($99/an) ou split-type (gratuit MIT) | Haute |
| **Spline** | 3D scene hosting/runtime | Gratuit (free tier) | Haute (Accueil uniquement) |
| Notion/Airtable (Phase 2) | CRM léger | Gratuit | Optionnel |

**Coût mensuel total (lancement) : ~$9/mois** (Plausible seul, si Vercel hobby suffit). +$99/an si GSAP Club pour SplitText.

---

## F. TECH EXECUTION BRIEF

### F.1 Stack finale

| Couche | Choix | Version |
|--------|-------|---------|
| **Framework** | Astro | 5.x |
| **Language** | TypeScript | 5.x |
| **UI (island)** | React | 19.x |
| **Form** | React Hook Form + Zod | RHF 7.x + Zod 3.x |
| **Animation (core)** | GSAP + ScrollTrigger + SplitText | ^3.12 |
| **Smooth scroll** | Lenis | ^1.1 |
| **3D** | @splinetool/runtime (lazy) | ^2.x |
| **Styling** | CSS natif (custom properties from tokens.json) | — |
| **Fonts** | Google Fonts (Jost variable + Lora) | — |
| **Icons** | Phosphor Icons (SVG inline) ou set custom | — |
| **Images** | Astro `<Image>` (sharp) — WebP + AVIF | — |
| **Analytics** | Plausible | Cloud |
| **Email** | Resend | API |
| **Hosting** | Vercel | — |
| **Content** | Astro Content Collections (Markdown + JSON) | — |
| **CMS optionnel** | Keystatic (ajout post-lancement si besoin) | — |

### F.2 Rendering architecture

```
TOUTES LES PAGES : SSG (Static Site Generation)

Build time:
  ├─ Astro compile les pages .astro → HTML statique
  ├─ Content collections (Markdown) → pages case studies
  ├─ tokens.json → CSS custom properties (script de build)
  ├─ Images → optimisées (WebP, AVIF, srcset)
  └─ Output: dossier dist/ (HTML + CSS + assets + GSAP bundle + 1 island React)

Runtime:
  ├─ Pages statiques servies par CDN Vercel (edge, ~50ms TTFB)
  ├─ GSAP + ScrollTrigger + Lenis : chargés en eager (~28KB gz)
  ├─ Spline 3D : lazy-loaded sur Accueil uniquement (dynamic import)
  ├─ Island React (formulaire) : chargé client:visible
  └─ /api/contact.ts : Vercel serverless function (cold start ~100ms)
```

### F.3 Repo structure

```
studio-kodo/
├── .github/
│   └── workflows/
│       └── lighthouse.yml              # CI: Lighthouse audit on PR
├── public/
│   ├── favicon.ico
│   ├── favicon.svg
│   ├── og-image.png                    # 1200×630
│   ├── robots.txt
│   ├── hero-fallback.webp              # Spline 3D fallback image
│   └── images/
│       ├── hero/                       # Hero compositions
│       ├── case-studies/
│       │   ├── maison-levain/          # Hero + gallery images
│       │   ├── flowtrack/
│       │   ├── durand-et-fils/
│       │   └── om-studio/
│       ├── about/                      # Photo fondateur
│       └── icons/                      # SVG icons (process, differentiation)
├── src/
│   ├── assets/                         # Images traitées par Astro <Image>
│   ├── components/
│   │   ├── layout/
│   │   │   ├── Nav.astro
│   │   │   ├── Footer.astro
│   │   │   ├── MobileCTABar.astro
│   │   │   └── SkipLink.astro
│   │   ├── ui/
│   │   │   ├── Button.astro            # Supporte data-magnetic pour Tier 2+
│   │   │   ├── Badge.astro
│   │   │   ├── Card.astro
│   │   │   ├── CardCaseStudy.astro
│   │   │   ├── Accordion.astro
│   │   │   ├── AccordionItem.astro
│   │   │   ├── DarkModeToggle.astro
│   │   │   ├── ProcessStep.astro
│   │   │   ├── MetricCard.astro        # Supporte data-target, data-prefix, data-suffix
│   │   │   ├── SectionWrapper.astro    # Supporte data-animate pour ScrollTrigger
│   │   │   ├── WordSplitHeading.astro  # Wrapper pour H1/H2 avec [data-split]
│   │   │   └── ScrollReveal.astro      # Wrapper [data-animate] pour éléments
│   │   ├── sections/
│   │   │   ├── Hero.astro              # Inclut SplineHeroIsland + word-split H1
│   │   │   ├── DifferentiationBand.astro
│   │   │   ├── CaseStudyGrid.astro
│   │   │   ├── ServicesPreview.astro
│   │   │   ├── ProcessTimeline.astro   # Scroll storyboard scrub
│   │   │   ├── KeyMetrics.astro        # Counter animations
│   │   │   ├── ConversionSection.astro # Word-split + magnetic CTA
│   │   │   ├── ForQui.astro
│   │   │   └── CaseStudyNav.astro
│   │   ├── islands/                    # Astro islands (hydrated components)
│   │   │   └── SplineHeroIsland.astro  # Spline 3D — client:visible, lazy import
│   │   └── react/                      # React island
│   │       ├── ContactForm.tsx         # useGSAP pour step transitions
│   │       ├── FormStep1.tsx
│   │       ├── FormStep2.tsx
│   │       ├── FormStep3.tsx
│   │       ├── FormStep4.tsx
│   │       ├── FormStep5.tsx
│   │       ├── ProgressBar.tsx
│   │       └── FormConfirmation.tsx    # GSAP checkmark animation
│   ├── content/
│   │   ├── config.ts                   # Content collections schemas (Zod)
│   │   ├── case-studies/
│   │   │   ├── maison-levain.md
│   │   │   ├── flowtrack.md
│   │   │   ├── durand-et-fils.md
│   │   │   └── om-studio.md
│   │   ├── faq.json
│   │   └── process.json
│   ├── layouts/
│   │   └── BaseLayout.astro            # HTML shell, head, nav, footer, dark mode, GSAP/Lenis init
│   ├── pages/
│   │   ├── index.astro                 # Accueil (Tier 3)
│   │   ├── services.astro
│   │   ├── realisations/
│   │   │   ├── index.astro             # Galerie
│   │   │   └── [...slug].astro         # Case study dynamique
│   │   ├── a-propos.astro
│   │   ├── contact.astro
│   │   ├── mentions-legales.astro
│   │   ├── politique-confidentialite.astro
│   │   └── 404.astro
│   ├── scripts/
│   │   ├── animations/
│   │   │   ├── gsap-init.ts            # GSAP + ScrollTrigger + SplitText registration + defaults
│   │   │   ├── lenis-init.ts           # Lenis init + ScrollTrigger sync + destroy
│   │   │   ├── scroll-reveal.ts        # [data-animate] → ScrollTrigger batch reveal
│   │   │   ├── word-split.ts           # [data-split] → SplitText + optional ScrollTrigger
│   │   │   ├── magnetic-button.ts      # [data-magnetic] → mousemove/mouseleave GSAP
│   │   │   ├── parallax.ts             # .parallax-container → yPercent scrub
│   │   │   ├── counter.ts              # .counter[data-target] → textContent tween
│   │   │   ├── process-storyboard.ts   # .process-section → timeline scrub 0.8
│   │   │   └── page-animations.ts      # Router: détecte la page, init les animations appropriées
│   │   ├── view-transitions.ts         # astro:before-swap cleanup + astro:after-swap re-init
│   │   ├── dark-mode.ts                # Toggle + localStorage + prefers-color-scheme
│   │   └── analytics-events.ts         # Plausible custom events
│   ├── styles/
│   │   ├── tokens.css                  # Generated from tokens.json
│   │   ├── global.css                  # Reset + base styles + reduced-motion CSS fallback
│   │   ├── typography.css              # Font faces + scale
│   │   └── utilities.css               # sr-only, skip-link, etc.
│   └── lib/
│       ├── form-schema.ts              # Zod schema (shared client/server)
│       └── plausible.ts                # Plausible event helper
├── api/
│   └── contact.ts                      # Vercel serverless function
├── scripts/
│   └── generate-tokens.ts              # tokens.json → tokens.css build script
├── tokens.json                         # Symlink or copy from agent 4
├── astro.config.mjs
├── tsconfig.json
├── package.json
└── vercel.json
```

### F.4 Token pipeline (tokens.json → CSS)

**Build script** (`scripts/generate-tokens.ts`) :

1. Lit `tokens.json` (W3C format v1.1.0)
2. Flatten les tokens en paths : `color.surface.primary` → `--kodo-color-surface-primary`
3. Génère `src/styles/tokens.css` avec deux blocs :
   - `:root, [data-theme="light"]` → tokens light
   - `[data-theme="dark"]` → tokens dark (from `theme.dark.*`)
4. Résout les alias (`{color.accent.warm}` → valeur résolue)
5. Inclut les fallbacks hex en commentaires
6. **Note :** Les tokens `easing.*` sont documentés en commentaires CSS mais consommés directement en JS (GSAP strings), pas en CSS custom properties

**Exécution :** `prebuild` script dans `package.json` → toujours à jour avant le build Astro.

### F.5 Dark mode implementation

```typescript
// src/scripts/dark-mode.ts (< 0.5KB)

// 1. Au chargement : lire la préférence
const stored = localStorage.getItem('kodo-theme');
const preferred = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
const theme = stored || preferred;
document.documentElement.setAttribute('data-theme', theme);

// 2. Toggle : switcher et persister
function toggleTheme() {
  const current = document.documentElement.getAttribute('data-theme');
  const next = current === 'dark' ? 'light' : 'dark';
  document.documentElement.setAttribute('data-theme', next);
  localStorage.setItem('kodo-theme', next);
}

// 3. Écouter les changements système (si pas de préférence stockée)
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
  if (!localStorage.getItem('kodo-theme')) {
    document.documentElement.setAttribute('data-theme', e.matches ? 'dark' : 'light');
  }
});
```

**Anti-flash :** Script inline dans `<head>` (avant le premier paint) pour appliquer le thème immédiatement :

```html
<script is:inline>
  (function(){
    var t=localStorage.getItem('kodo-theme');
    if(!t)t=matchMedia('(prefers-color-scheme:dark)').matches?'dark':'light';
    document.documentElement.setAttribute('data-theme',t);
  })();
</script>
```

### F.6 Animation implementation patterns (Tier 3)

#### F.6.1 GSAP + ScrollTrigger Init (global)

```typescript
// src/scripts/animations/gsap-init.ts
import { gsap } from "gsap"
import { ScrollTrigger } from "gsap/ScrollTrigger"
import { SplitText } from "gsap/SplitText"

gsap.registerPlugin(ScrollTrigger, SplitText)

// Defaults GSAP globaux (from motion strategy easing palette)
gsap.defaults({
  duration: 0.6,
  ease: "power2.out"  // ease-entrance — default for scroll reveals
})
```

#### F.6.2 Lenis Init + ScrollTrigger Sync

```typescript
// src/scripts/animations/lenis-init.ts
import Lenis from "lenis"
import { gsap } from "gsap"
import { ScrollTrigger } from "gsap/ScrollTrigger"

let lenis: Lenis | null = null

export function initLenis() {
  lenis = new Lenis({
    duration: 1.2,
    easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
    orientation: "vertical",
    smoothWheel: true
  })

  // Sync Lenis scroll position with ScrollTrigger
  lenis.on("scroll", ScrollTrigger.update)

  // Drive Lenis from GSAP ticker (single RAF loop)
  gsap.ticker.add((time) => {
    lenis!.raf(time * 1000)
  })
  gsap.ticker.lagSmoothing(0)

  return lenis
}

export function destroyLenis() {
  if (lenis) {
    lenis.destroy()
    lenis = null
  }
}
```

#### F.6.3 Astro View Transitions — Cleanup + Re-init

```typescript
// src/scripts/view-transitions.ts
import { gsap } from "gsap"
import { ScrollTrigger } from "gsap/ScrollTrigger"
import { initLenis, destroyLenis } from "./animations/lenis-init"
import { initPageAnimations } from "./animations/page-animations"

// CLEANUP — avant chaque navigation Astro
document.addEventListener("astro:before-swap", () => {
  // 1. Kill all ScrollTriggers (évite les fuites mémoire)
  ScrollTrigger.getAll().forEach(t => t.kill())

  // 2. Kill all GSAP tweens en cours
  gsap.killTweensOf("*")

  // 3. Destroy Lenis (sera re-créé après swap)
  destroyLenis()

  // 4. SplitText: revert automatique au retrait des éléments du DOM
})

// RE-INIT — après chaque navigation Astro
document.addEventListener("astro:after-swap", () => {
  // 1. Nouvelle instance Lenis
  initLenis()

  // 2. Détecter la page courante et init les animations appropriées
  initPageAnimations()
})
```

#### F.6.4 Page Animation Router

```typescript
// src/scripts/animations/page-animations.ts
import { initScrollReveals } from "./scroll-reveal"
import { initWordSplit } from "./word-split"
import { initMagneticButtons } from "./magnetic-button"
import { initParallax } from "./parallax"
import { initCounters } from "./counter"
import { initProcessStoryboard } from "./process-storyboard"

export function initPageAnimations() {
  const path = window.location.pathname

  // Commun à toutes les pages (sauf mentions légales / politique)
  if (!path.includes("mentions-legales") && !path.includes("politique-confidentialite")) {
    initScrollReveals()        // [data-animate] → ScrollTrigger batch
    initMagneticButtons()      // [data-magnetic] → mousemove GSAP
  }

  // Pages avec word-split
  if (path === "/" || path === "/a-propos" || path.startsWith("/realisations/")) {
    initWordSplit("[data-split]")
  }

  // Pages avec parallax
  if (path === "/" || path === "/a-propos" || path.startsWith("/realisations")) {
    initParallax()
  }

  // Pages avec counters
  if (path === "/" || path.startsWith("/realisations/")) {
    initCounters()
  }

  // Pages avec process storyboard
  if (path === "/" || path === "/a-propos" || path.startsWith("/realisations/")) {
    initProcessStoryboard()
  }

  // Accueil uniquement — Spline 3D (géré par SplineHeroIsland.astro, pas ici)
}
```

#### F.6.5 Spline 3D Lazy Island (Accueil uniquement)

```astro
---
// src/components/islands/SplineHeroIsland.astro
---
<div id="spline-container" class="spline-island" style="min-height: 400px; position: relative;">
  <!-- Skeleton visible pendant load -->
  <div class="spline-skeleton" aria-hidden="true">
    <div class="skeleton-shape skeleton-sphere"></div>
    <div class="skeleton-shape skeleton-cylinder"></div>
    <div class="skeleton-shape skeleton-plane"></div>
    <p class="spline-loading-text">Chargement de la scène 3D…</p>
    <span class="sr-only">Scène 3D interactive en cours de chargement</span>
  </div>

  <!-- Canvas Spline injecté dynamiquement -->
  <canvas id="spline-canvas" style="display: none;"></canvas>

  <!-- Fallback image pour noscript -->
  <noscript>
    <img src="/hero-fallback.webp"
         alt="Composition 3D géométrique — formes mid-century flottantes, palette teal et mustard sur fond crème"
         loading="eager" />
  </noscript>
</div>

<script>
  import { gsap } from "gsap"

  // 1. WebGL detection
  const canvas = document.createElement("canvas")
  const gl = canvas.getContext("webgl") || canvas.getContext("experimental-webgl")

  // 2. Reduced motion check
  const prefersReduced = window.matchMedia("(prefers-reduced-motion: reduce)").matches

  if (gl && !prefersReduced) {
    // 3. Timeout fallback (5s)
    const timeout = setTimeout(() => showFallback(), 5000)

    // 4. IntersectionObserver → lazy init uniquement quand le hero est visible
    const observer = new IntersectionObserver((entries) => {
      if (entries[0].isIntersecting) {
        observer.disconnect()
        loadSpline(timeout)
      }
    }, { threshold: 0.1 })

    const container = document.getElementById("spline-container")
    if (container) observer.observe(container)
  } else {
    showFallback()
  }

  async function loadSpline(timeout: ReturnType<typeof setTimeout>) {
    try {
      const { Application } = await import("@splinetool/runtime")
      clearTimeout(timeout)

      const splineCanvas = document.getElementById("spline-canvas") as HTMLCanvasElement
      const app = new Application(splineCanvas)
      await app.load("https://prod.spline.design/[scene-id]/scene.splinecode")

      // Skeleton fade-out → canvas fade-in
      splineCanvas.style.display = "block"
      gsap.to(".spline-skeleton", {
        opacity: 0,
        duration: 0.5,
        ease: "power2.out",
        onComplete: () => {
          document.querySelector(".spline-skeleton")?.remove()
        }
      })
    } catch {
      clearTimeout(timeout)
      showFallback()
    }
  }

  function showFallback() {
    const container = document.getElementById("spline-container")
    const skeleton = container?.querySelector(".spline-skeleton")
    if (skeleton) {
      skeleton.innerHTML = `<img src="/hero-fallback.webp"
        alt="Composition 3D géométrique — formes mid-century flottantes, palette teal et mustard sur fond crème"
        loading="eager"
        style="width:100%;height:100%;object-fit:cover;" />`
    }
  }
</script>
```

**Stratégie d'isolation bundle Spline :** Le `import("@splinetool/runtime")` dynamique garantit que les 150-300KB ne sont chargés que sur la page Accueil, et uniquement si WebGL est disponible et reduced-motion n'est pas actif. Le IntersectionObserver ajoute une couche supplémentaire : le chargement ne commence que quand le hero entre dans le viewport.

#### F.6.6 prefers-reduced-motion via GSAP matchMedia

```typescript
// Intégré dans gsap-init.ts après registration des plugins

gsap.matchMedia().add("(prefers-reduced-motion: reduce)", () => {
  // Kill all existing ScrollTriggers
  ScrollTrigger.getAll().forEach(st => st.kill())

  // Set all animated elements to their final state
  gsap.set("[data-animate]", { clearProps: "all" })

  // Destroy Lenis — retour au scroll natif
  destroyLenis()

  // Replace Spline with fallback image
  const splineContainer = document.getElementById("spline-container")
  if (splineContainer) {
    splineContainer.innerHTML = `<img src="/hero-fallback.webp"
      alt="Composition 3D géométrique — formes mid-century flottantes, palette teal et mustard sur fond crème"
      loading="eager" />`
  }

  // Disable magnetic buttons
  document.querySelectorAll("[data-magnetic]").forEach(btn => {
    (btn as HTMLElement).style.transform = ""
  })

  return () => {
    // Cleanup when preference changes back to no-preference
    // Re-init animations via initPageAnimations()
  }
})
```

**CSS fallback supplémentaire :**

```css
/* src/styles/global.css — reduced motion safety net */
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }

  /* Preserve essential UI feedback */
  button,
  a,
  input,
  select,
  textarea {
    transition-duration: 100ms !important;
    transition-property: background-color, color, border-color, opacity !important;
  }
}
```

#### F.6.7 Data attributes convention

| Attribute | Usage | Example |
|-----------|-------|---------|
| `[data-animate]` | ScrollTrigger reveal (`from({y:20, opacity:0})`) | `<div data-animate>` |
| `[data-split]` | Word-split heading (SplitText) | `<h1 data-split>` |
| `[data-split-on-scroll]` | Word-split triggered by scroll (not page load) | `<h2 data-split data-split-on-scroll>` |
| `[data-magnetic]` | Magnetic button effect (desktop only) | `<button data-magnetic>` |
| `[data-target]` | Counter animation target value | `<span data-target="180">` |
| `[data-prefix]` | Counter animation prefix | `<span data-target="180" data-prefix="+">` |
| `[data-suffix]` | Counter animation suffix | `<span data-target="180" data-suffix="%">` |

### F.7 Image strategy

| Type | Format | Sizes (srcset) | Loading | Placeholder |
|------|--------|----------------|---------|-------------|
| Hero (accueil) | WebP + AVIF | 640w, 1024w, 1440w, 1920w | `eager` (LCP) | Aucun (above fold) |
| Spline 3D fallback | WebP + AVIF | 640w, 1024w, 1440w | `eager` (si fallback) | Aucun |
| Case study hero | WebP + AVIF | 640w, 1024w, 1440w, 1920w | `eager` (LCP candidate) | Aucun |
| Case study gallery | WebP + AVIF | 640w, 1024w, 1440w | `lazy` | LQIP blur-up (base64 inline, 20px) |
| Case study vignettes | WebP + AVIF | 640w, 1024w | `lazy` | LQIP blur-up |
| Photo fondateur | WebP + AVIF | 400w, 800w | `lazy` | LQIP blur-up |
| Logo | SVG | — | `eager` | — |
| Icons | SVG inline | — | — | — |
| OG image | PNG | 1200×630 | — | — |
| Favicon | SVG + ICO + PNG (32, 180) | — | — | — |

**Traitement éditorial :** CSS `filter: contrast(0.95) saturate(0.9)` sur les images éditoriales (case studies, hero). Appliqué via une classe CSS, pas au build.

**Astro `<Image>` :** Optimisation automatique au build (sharp). Génère WebP par défaut, AVIF optionnel. Ajoute `width`, `height` automatiquement (anti-CLS).

### F.8 Font loading strategy

```html
<!-- Preload critical fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!-- Jost (variable, 400-700) + Lora (400, 400i, 700) -->
<link rel="preload" href="https://fonts.googleapis.com/css2?family=Jost:wght@400..700&family=Lora:ital,wght@0,400;0,700;1,400&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400..700&family=Lora:ital,wght@0,400;0,700;1,400&display=swap"></noscript>
```

**Subsetting :** Utiliser `&text=` ou `unicode-range` si les fonts Google ne le font pas automatiquement. Priorité : latin + latin-extended.

**`font-display: swap`** : Texte visible immédiatement avec les fallbacks système, puis substitution.

**Fallback stacks (from tokens.json) :**
- Jost → `system-ui, sans-serif`
- Lora → `Georgia, serif`
- JetBrains Mono → `Consolas, monospace`

### F.9 Technical SEO

| Élément | Implémentation |
|---------|---------------|
| `<title>` | Unique par page, < 60 caractères (from copy v1 SEO sections) |
| `<meta name="description">` | Unique par page, < 155 caractères (from copy v1) |
| `<h1>` | Un seul par page |
| Heading hierarchy | H1 → H2 → H3 (pas de saut, vérifié par agent 6) |
| `<html lang="fr">` | Français |
| Canonical | `<link rel="canonical" href="https://studiokodo.fr/[path]">` auto-généré |
| Sitemap | `astro-sitemap` integration → `/sitemap-index.xml` |
| `robots.txt` | Allow all, sitemap reference |
| Schema.org | `Organization` (global) + `LocalBusiness` (accueil) + `WebPage` (toutes) + `FAQPage` (services) |
| OG / Twitter | `og:title`, `og:description`, `og:image`, `twitter:card=summary_large_image` |
| Internal links | Automatisés dans le composant `Nav`, manuels dans le copy (vérifié par QA) |
| `noindex` | Mentions légales + politique de confidentialité (optionnel) |
| Image alt | Obligatoire sur toutes les images (vérifié par build + QA) |
| Skip link | "Aller au contenu principal" → `<main id="main-content">` |
| Crawlable links | Tous les `<a href>` sont des HTML standards (pas de `onClick` JS-only) |
| Progressive enhancement | Word-split headings : texte complet dans le DOM, lisible sans JS |

### F.10 Perf budgets enforcement

| Budget | Valeur | Enforcement |
|--------|--------|------------|
| JS animation eager (GSAP + Lenis) | ~28KB gzipped | Build warning si dépassé |
| JS island formulaire (React) | < 50KB gzipped | Bundle analyzer dans CI |
| Spline 3D lazy | 150-300KB (Accueil uniquement) | Vérifié manuellement — ne bloque pas LCP |
| CSS total | < 25KB gzipped | Build warning |
| HTML par page | < 50KB | — |
| Hero image (LCP) | < 200KB (largest srcset) | Image optimizer + CI check |
| Spline fallback image | < 150KB | — |
| Fonts | ~60KB (Jost variable + Lora) | Préchargement + swap |
| Third-party (Plausible) | < 2KB | Script async/defer |
| **Total page weight (Accueil, hors Spline)** | **< 450KB** | Lighthouse CI |
| **Total page weight (Accueil, avec Spline)** | **< 750KB** | Vérifié manuellement (lazy, post-LCP) |

**CI enforcement :**
- Lighthouse CI dans GitHub Actions
- Score minimum : > 90 Performance, > 95 Accessibility/Best Practices/SEO
- Fail si Performance < 85 (warning si < 90)
- Fail si A11y/BP/SEO < 90 (warning si < 95)
- **Note :** Lighthouse est exécuté SANS Spline lazy-load (réseau throttled → timeout probable). Le test Spline est fait manuellement sur preview deploy.

### F.11 Deployment

| Aspect | Décision |
|--------|----------|
| **Platform** | Vercel |
| **Build command** | `npm run build` (→ `node scripts/generate-tokens.ts && astro build`) |
| **Output** | `dist/` (static files) |
| **Framework preset** | Astro (auto-détecté par Vercel) |
| **Preview deployments** | Automatiques sur chaque PR (Vercel preview URLs) |
| **Production** | Auto-deploy sur push `main` |
| **Custom domain** | `studiokodo.fr` → Vercel DNS (+ `www` redirect) |
| **SSL** | Automatique (Let's Encrypt via Vercel) |
| **CDN** | Edge network Vercel (global) |
| **Rollback** | Instant rollback via Vercel dashboard (promotion d'un deploy précédent) |
| **Environment variables** | `RESEND_API_KEY`, `PLAUSIBLE_DOMAIN` |
| **Headers** | CSP, X-Frame-Options, X-Content-Type-Options dans `vercel.json` |

**`vercel.json` :**

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        { "key": "X-Content-Type-Options", "value": "nosniff" },
        { "key": "X-Frame-Options", "value": "DENY" },
        { "key": "Referrer-Policy", "value": "strict-origin-when-cross-origin" },
        { "key": "Permissions-Policy", "value": "camera=(), microphone=(), geolocation=()" }
      ]
    },
    {
      "source": "/images/(.*)",
      "headers": [
        { "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }
      ]
    },
    {
      "source": "/_astro/(.*)",
      "headers": [
        { "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }
      ]
    }
  ]
}
```

### F.12 Accessibility implementation

| Exigence | Implémentation |
|----------|---------------|
| Skip link | Premier élément dans `<body>`, lien vers `#main-content` |
| Landmarks | `<header>`, `<nav aria-label>`, `<main>`, `<footer>` |
| Focus visible | `:focus-visible { outline: 2px solid var(--kodo-accent-action); outline-offset: 2px; }` |
| Tab order | Logique (DOM order = visual order). Pas de `tabindex > 0`. |
| ARIA formulaire | `aria-describedby` (erreurs), `aria-invalid`, `aria-required`, `aria-live` (messages dynamiques) |
| ARIA accordion | `aria-expanded`, `aria-controls`, keyboard Enter/Space |
| ARIA nav mobile | `role="dialog"`, `aria-modal`, focus trap, Escape close |
| ARIA progress bar | `role="progressbar"`, `aria-valuenow/min/max`, `aria-label` |
| ARIA dark mode | `<button aria-label="Basculer en mode sombre/clair">` |
| Images | `alt` obligatoire, décoratif → `alt=""` + `aria-hidden="true"` |
| Spline 3D island | `aria-hidden="true"` (décoratif). Skeleton: `sr-only` "Scène 3D interactive en cours de chargement" |
| Magnetic buttons | Focus clavier : aucun mouvement magnétique. `sr-only` : "Ce bouton réagit au mouvement de votre curseur" |
| Word-split headings | Texte complet dans le DOM, lisible par screen readers. SplitText ne casse pas l'accessibilité. |
| Reduced motion | **GSAP `matchMedia()` pour prefers-reduced-motion** (pas juste CSS media query). Désactive GSAP, Lenis, Spline. CSS fallback en complément. |
| Touch targets | Minimum 44×44px (padding si élément visuel plus petit) |
| Color not sole indicator | Icône + couleur pour erreurs/succès. Underline + couleur pour liens. |

---

## G. DECISION LOG

| # | Décision | Raison | Alternatives rejetées | Risque |
|---|----------|--------|----------------------|--------|
| 1 | **Astro** comme framework | SSG 0KB JS baseline, islands pour formulaire + Spline, View Transitions natives avec cleanup hooks — seul framework offrant cette isolation à ce niveau. | Next.js (runtime React sur chaque page, pas d'isolation GSAP), Nuxt (idem avec Vue), Webflow (lock-in, pas de tokens custom) | Écosystème plus petit que React/Next — mitigé par la simplicité du projet |
| 2 | **Tier 3** animation (GSAP + Lenis + Spline) | Le site est la vitrine-preuve du studio. Différenciateur immédiat vs concurrents freelances. PRD v1.2 validé. | Tier 1 (insuffisant — ne démontre pas le savoir-faire), Tier 2 (partiel — pas de 3D signature) | Trade-off perf : Lighthouse > 90 au lieu de > 95. JS eager ~28KB. Spline 150-300KB lazy. Mitigé par lazy-loading + fallbacks. |
| 3 | **GSAP** comme animation library | Standard industrie, easing palette riche, ScrollTrigger intégré, gsap.matchMedia() pour reduced-motion, compatible tous frameworks. | Framer Motion (React-only, pas d'isolation), anime.js (moins de features scroll), CSS animations (insuffisant pour Tier 3) | Licence SplitText = Club GSAP ($99/an). Alternative : split-type (MIT). |
| 4 | **Lenis** pour le smooth scroll | Léger (~8KB), sync native avec ScrollTrigger via GSAP ticker, pas de scroll-jacking (scroll natif augmenté). | CSS `scroll-behavior: smooth` (pas assez de contrôle pour Tier 3), Locomotive Scroll (deprecated, plus lourd), native-only (pas de sensation premium) | Si mobile perf insuffisante → désactiver Lenis sur mobile (garder scroll natif) |
| 5 | **Pas de backend** | Aucun besoin identifié. Email + edge function suffisent. | Express/Fastify (overengineering), Supabase (YAGNI) | Si besoin d'espace membre → ajouter un backend then |
| 6 | **Markdown** comme CMS | Fondateur technique, git-based, 0 dépendance externe, type-safe. | Sanity (overengineering), Keystatic (ajout futur possible) | Si non-technique rejoint → ajouter Keystatic |
| 7 | **Vercel** comme hosting | Deploy automatique, preview URLs, edge functions, CDN global, gratuit pour ce volume. | Netlify (comparable), Cloudflare Pages (moins mature avec Astro) | Lock-in léger — mitigé par output HTML statique (portable) |
| 8 | **Resend** pour les emails | API simple, templates HTML, gratuit pour le volume. | SendGrid (plus lourd), Mailgun (comparable) | Dépendance à un service tiers — mitigé par la simplicité de migration |
| 9 | **Plausible** pour l'analytics | Privacy-first, cookieless, lightweight (~1KB). | Umami self-hosted (plus de travail), GA4 (pas privacy-first, lourd) | Coût $9/mois |
| 10 | **React** pour l'island formulaire | React Hook Form est la meilleure lib de forms. L'island est isolé — pas de contamination. GSAP fonctionne dans React via `useGSAP`. | Vanilla JS (trop complexe pour 5 étapes + validation + GSAP transitions), Svelte (moins d'écosystème forms) | ~32KB de React runtime — acceptable car isolé à une seule page |
| 11 | **CSS natif** (pas de Tailwind) | Les tokens W3C produisent des CSS custom properties — Tailwind ajouterait une couche inutile. ~30 tokens, pas 300. | Tailwind (config overhead), Sass (inutile avec custom properties) | Plus de CSS à écrire — mitigé par la petite taille du projet |
| 12 | **Honeypot** au lieu de CAPTCHA | 0 friction, efficace contre les bots simples. Volume 10 leads/mois. | reCAPTCHA (lourd), Turnstile (bon mais dépendance CF) | Si spam élevé → ajouter Turnstile en fallback |
| 13 | **Pas de service worker** | Site statique rapide sur CDN. Offline n'est pas un use case. | Workbox (complexité sans gain) | — |

---

## H. DEPENDENCIES SUMMARY (package.json additions)

```json
{
  "dependencies": {
    "astro": "^5.x",
    "@astrojs/react": "^4.x",
    "@astrojs/sitemap": "^3.x",
    "react": "^19.x",
    "react-dom": "^19.x",
    "react-hook-form": "^7.x",
    "zod": "^3.x",
    "gsap": "^3.12",
    "lenis": "^1.1",
    "@splinetool/runtime": "^2.x"
  },
  "devDependencies": {
    "typescript": "^5.x",
    "@types/react": "^19.x"
  },
  "scripts": {
    "prebuild": "node scripts/generate-tokens.ts",
    "dev": "astro dev",
    "build": "astro build",
    "preview": "astro preview"
  }
}
```

**Note @splinetool/runtime :** À ajouter au `package.json`. GSAP et Lenis sont déjà présents. Spline runtime est importé dynamiquement (`import()`) — il sera tree-shaken des pages qui ne l'utilisent pas grâce au code-splitting d'Astro.

---

## READY TO CODE CHECKLIST

### Avant d'ouvrir un éditeur, vérifier :

**Assets critiques :**
- [ ] Logo Studio Kodo (SVG) — livré par le fondateur ou généré
- [ ] Favicon (SVG source + ICO + PNG 32×32 + PNG 180×180)
- [ ] Hero composition ou mockup principal (au moins 1 image pour le développement)
- [ ] **Spline 3D fallback image** (hero-fallback.webp — WebP, 1440w max)
- [ ] **Spline 3D scene file** (.splinecode hébergé sur Spline CDN)
- [ ] Au moins 1 image par case study (hero) pour le développement
- [ ] Icônes process (×3) et différenciation (×3) — SVG
- [ ] Photo fondateur (ou placeholder)
- [ ] OG image (1200×630)

**Contenu :**
- [ ] Copy v1 validé (fichier `copy-v1-Studio-Kodo.md` — agent 3 ✅)
- [ ] Case studies copy validé (4 projets concept)
- [ ] Microcopy validé (formulaire, erreurs, confirmations, skeleton Spline)
- [ ] Infos légales à renseigner (SIRET, adresse, statut juridique)
- [ ] Numéro de téléphone à renseigner

**Design :**
- [ ] `tokens.json` v1.1.0 validé (agent 4 ✅)
- [ ] Component handoff table v2.0 validé (agent 4 ✅)
- [ ] Motion strategy v3.0 validé (agent 4 ✅)
- [ ] Direction iconographique confirmée (Phosphor Icons thin/light ou custom)

**Animation :**
- [ ] **Tier 3 confirmé par l'utilisateur** (PRD v1.2 ✅)
- [ ] **GSAP licence clarifiée** — Standard (free) + Club GSAP pour SplitText ($99/an) OU split-type (MIT, free)
- [ ] **Spline 3D scene** créée et hébergée — URL du .splinecode connue
- [ ] **Spline fallback image** produite à partir de la scène 3D (screenshot statique)

**Technique :**
- [ ] Domaine acheté (`studiokodo.fr` et/ou `studiokodo.com`)
- [ ] Compte Vercel créé + projet initialisé
- [ ] Compte Resend créé + API key
- [ ] Compte Plausible créé + domaine configuré
- [ ] Email du fondateur (pour recevoir les notifications de formulaire)
- [ ] `@splinetool/runtime` ajouté au `package.json`

**Validation :**
- [ ] Ce document (tech-stack v2.0) validé par l'utilisateur
- [ ] Budget confirmé (services tiers : ~$9/mois + $99/an GSAP Club optionnel)
- [ ] Aucun changement de scope (11 pages, pas d'e-commerce, pas de blog au lancement)

---

*Fin du tech execution brief v2.0. Ce document + les livrables des agents 1-4 (mis à jour Tier 3) constituent l'entrée de l'agent 6 (QA) et du développement.*
