# TECH STACK — SITE TEST
**Agent :** vitrine-tech-stack
**Date :** 2026-03-25
**Statut :** v1 — prêt pour implémentation sous réserve de validation de la checklist finale

---

## A. TECH REQUIREMENTS SUMMARY

---

### Types de pages

Toutes les pages sont **entièrement statiques** — HTML pré-compilé au build, aucune donnée utilisateur côté serveur.

| Page | Type | Source de contenu |
|------|------|------------------|
| `/` Home | SSG statique | Code + CMS (FAQ, Process, Piliers) |
| `/offre` | SSG statique | Code + CMS (FAQ, Process détaillé) |
| `/realisations` | SSG statique | CMS (mini-cas clients) |
| `/contact` | SSG statique | Code (formulaire → Formspree) |
| `/a-propos` | SSG statique | Code |
| Pages légales | SSG statique | Markdown ou CMS |

Aucune page ne requiert de rendu serveur en temps réel.

---

### Interactivité : faible

| Besoin | Implémentation | Poids JS |
|--------|----------------|---------|
| Nav mobile hamburger | JS minimal (class toggle) | < 0.5KB |
| Sticky nav (fond + bordure) | 1 scroll listener (rAF throttlé) + CSS | < 0.3KB |
| FAQ accordion | `<details>/<summary>` natif ou JS léger | < 0.5KB |
| Scroll reveal (scroll reveal blocs) | IntersectionObserver natif + CSS | < 1KB |
| Hero word stagger | CSS `@keyframes` avec délais calculés | 0KB JS |
| Formulaire contact | HTML natif + POST vers Formspree | 0KB JS |
| Embed Calendly | Lazy-load au clic | ~150KB chargé tardivement |
| CookieConsent | Script autonome | 3KB |

**Total JS propre (hors Calendly, hors GA4) : < 5KB minified.**
Aucun framework JS côté client. Aucun GSAP, aucune lib d'animation externe.

---

### Édition

| Zone | Éditable | Éditeur | Fréquence |
|------|----------|---------|-----------|
| FAQ (6+ questions) | Oui — CMS | Fondateur | Mensuel |
| Mini-cas clients (3–5) | Oui — CMS | Fondateur | Rare |
| Process 5 étapes (titres, descriptions, livrables, temps) | Oui — CMS | Fondateur | Très rare |
| Témoignages | Oui — CMS (activé post-lancement) | Fondateur | Ponctuel |
| Structure des pages | Non — code | Développeur | Sur demande |
| CTAs primaires | Non — code | — | — |
| Tokens design (couleurs, typo) | Non — CSS | — | — |
| SEO meta (title, description) | Oui (limité, validé) | Fondateur | Rare |
| Blog / Actualités | Différé | — | Post-lancement |

Interface d'édition obligatoirement visuelle — le fondateur n'a pas accès au code.

---

### Effets premium

Niveau : **premium discret** — CSS et JS natif uniquement.

| Effet | Implémentation | Contrainte |
|-------|---------------|-----------|
| Hero word stagger | CSS `@keyframes` + `animation-delay` par mot | Désactivé si `prefers-reduced-motion` |
| Scroll reveal blocs | IntersectionObserver + CSS class toggle | Désactivé si reduced motion |
| Nav sticky transition | Scroll event + CSS transition | Réduit à 0ms si reduced motion |
| Card hover elevation | CSS `:hover` + `transition` | Désactivé si reduced motion |
| Accordion FAQ | CSS height ou JS minimal | Instantané si reduced motion |
| Confirmation formulaire | Fade-in 300ms | Instantané si reduced motion |

Aucune 3D, aucun parallax, aucun canvas, aucune lib vidéo.

---

### Intégrations

| Besoin | Solution | Tier | Coût |
|--------|----------|------|------|
| Prise de RDV | Calendly (embed lazy-load) | Free | 0€ |
| Formulaire contact | Formspree | Free (50 sub/mois) | 0€ |
| Email notification | Formspree natif | Inclus | — |
| Analytics | GA4 | Free | 0€ |
| Consentement RGPD | CookieConsent (Orestbida) | Open source | 0€ |
| CMS édition | Sanity | Free | 0€ |
| Hébergement | Vercel | Free | 0€ |
| CRM v1 | Email (Formspree → fondateur) | — | 0€ |

**Coût d'exploitation total en v1 : 0€/mois** (hors nom de domaine ~12€/an).

---

### Contraintes

| Contrainte | Détail |
|-----------|--------|
| RGPD France | Consentement avant tout tracking — bandeau obligatoire |
| Performance | LCP < 2.5s, CLS < 0.1, INP < 100ms |
| Fonts | Self-hosted (DM Serif Display + DM Sans) — pas de Google Fonts en runtime |
| JS budget | < 50KB gzipped (hors Calendly) |
| Pas de 3D | Aucune dépendance WebGL/Three.js |
| Budget | Maximum gratuit ou < 20€/mois |
| Délai | Mise en ligne rapide — stack zero-config |
| Équipe post-livraison | Fondateur non-technique seul — aucune compétence dev requise pour les mises à jour de contenu |

---

## B. CADRE DE DÉCISION FRONTEND

---

### Comparatif

#### Astro
**Points forts :**
- Conçu pour les sites marketing — génère du HTML statique pur par défaut (zéro JS si non demandé)
- Islands architecture : JS uniquement pour les composants qui en ont besoin, pas pour la page entière
- Compatible nativement avec tous les CMS headless (`@sanity/astro`, adaptateurs Contentful, Decap...)
- Déploiement 0-config sur Vercel et Netlify
- DX propre : composants `.astro` = HTML + scoped CSS + logique au build
- Pas de framework JS lock-in — peut mélanger Vanilla JS, React ou Vue pour des islands spécifiques si besoin

**Limites :**
- Moins de tutoriels que Next.js sur les cas d'usage avancés
- Pas adapté aux applications avec données temps réel (dashboard, auth complexe)

**Complexité :** Faible à modérée — syntaxe proche HTML, courbe d'apprentissage rapide

**Bons cas d'usage :** Sites vitrines, blogs, landing pages, sites marketing — exactement ce projet.

**Risque de sur-hydratation :** Quasi nul. Les composants sont statiques par défaut. Le JS n'est injecté que pour les islands explicitement marqués `client:*`. Un composant Nav, Hero ou Section n'hydrate rien côté client.

---

#### Next.js
**Points forts :**
- Écosystème React très riche, nombreuses ressources
- SSR/SSG hybride puissant pour les cas complexes
- API Routes intégrées

**Limites :**
- Overkill pour 5 pages statiques sans données dynamiques en temps réel
- React hydration = JS supplémentaire injecté par défaut même pour du contenu statique
- Bundle plus lourd qu'Astro par défaut (React runtime inclus)
- Configuration plus complexe pour obtenir un site 100% statique

**Risque de sur-hydratation :** Élevé si non maîtrisé — React hydrate le DOM entier même pour du contenu qui n'en a pas besoin.

---

#### Nuxt (Vue)
**Points forts :** Même puissance que Next.js, approche Vue plus douce

**Limites :** Idem Next.js. Mauvais rapport complexité/bénéfice pour un site statique de 5 pages.

**Risque de sur-hydratation :** Modéré à élevé.

---

#### Webflow
**Points forts :**
- Éditeur visuel no-code, rapide à setup
- Hébergement intégré
- CMS basique inclus

**Limites :**
- **Vendor lock-in sévère** — code non exportable proprement, migration impossible sans refonte
- Animations custom (word stagger, IntersectionObserver avec stagger paramétré) : impossibles ou très hacky
- JS injecté automatiquement et difficile à auditer — LCP parfois imprévisible
- Impossible de respecter scrupuleusement un design system code-driven (CSS variables, composants précis)
- Coût : $36/mois minimum pour le CMS plan
- Tout futur changement technique dépend de Webflow — dépendance permanente

**Risque de sur-hydratation :** Élevé — Webflow injecte son runtime JS sur chaque page.

---

#### HTML/CSS/JS custom (Vanilla + Vite)
**Points forts :**
- Contrôle absolu, zéro dépendance framework
- Idéal pour landing page unique

**Limites :**
- Pas de composants réutilisables sans build system custom
- Pas de CMS sans intégration manuelle supplémentaire
- Développement plus long pour multi-pages
- Pas de routing, pas de sitemap automatique

---

### RECOMMANDATION FRONTEND

**Choix : Astro**

| Critère | Résultat |
|---------|---------|
| LCP < 2.5s | HTML pré-compilé → LCP quasi-garanti sans optimisation |
| JS < 50KB gzipped | JS propre < 5KB — Astro n'injecte aucun runtime framework |
| CMS headless | `@sanity/astro` officiel, intégration native |
| Déploiement rapide | Zero-config sur Vercel |
| Évolutivité | Pages `/realisations/[slug]` en V2 sans changer de stack |
| Accessibilité | HTML sémantique généré proprement, contrôle total |

**Conditions d'arbitrage :**
- **Si client impose Webflow** → Webflow + CSS animations custom pour les effets ; prévoir un surcoût de personnalisation de 20–30% et accepter les limites de performance
- **Si lancement en 48h sans CMS requis** → HTML/CSS/JS custom avec Vite, CMS intégré post-lancement en V1.1
- **Si blog actif au lancement** → Astro reste le bon choix (`@astrojs/rss` + Sanity)

---

## C. CADRE DE DÉCISION BACKEND

---

### Ce projet n'a pas besoin de backend dédié

**Raisons :**
- Toutes les pages sont statiques (aucune donnée utilisateur côté serveur)
- Formulaires → service tiers (Formspree)
- Analytics → côté client (GA4)
- CMS → Sanity (API consommée au build, pas en runtime)
- Prise de RDV → Calendly (service externe)
- Pas d'authentification, pas de base de données, pas de logique métier

**Surface d'attaque :** quasi nulle — un site statique n'expose aucun endpoint propre en production.

---

### Quand un backend minimal suffirait

Si en V2 :
- Webhook Calendly à traiter (enregistrement de lead dans un CRM)
- Qualification de leads par formulaire multi-étapes
- Espace client avec authentification

→ **Astro Server Endpoints ou Vercel Edge Functions** couvrent ces cas sans serveur dédié. Un seul fichier `.ts` dans `src/pages/api/` = endpoint serverless.

---

### Options évaluées et rejetées

| Option | Raison du rejet |
|--------|----------------|
| Backend léger (Express, FastAPI) | Aucun besoin en v1. Coût d'hébergement inutile. |
| BaaS (Supabase, Firebase) | Overkill pour 5 pages statiques. À réévaluer si espace client en v2. |
| CMS headless avec API runtime | Sanity est consommé au build, pas en runtime — zéro appel API en production. |
| Backend custom (Node, Bun) | Aucune justification identifiable. Signal clair de sur-ingénierie. |

---

### Signaux de sur-ingénierie à surveiller

> "On va créer une API REST pour les formulaires." → Non. Formspree.
> "On met une base de données pour stocker les leads." → Non. Email + CRM manuel.
> "On déploie avec Docker." → Non. Vercel free tier.
> "On sécurise un endpoint avec JWT." → Non. Aucun endpoint custom en v1.
> "On ajoute un backend pour le blog." → Non. Astro + Sanity au build.

---

## D. CMS & MODÈLE DE CONTENU

---

### Comparatif des approches

| Approche | Quand l'utiliser | Adapté ici ? |
|----------|-----------------|-------------|
| **Fichiers Markdown** | Éditeur technique, blog simple, équipe dev | Non — éditeur non-technique |
| **Decap CMS (Git-based)** | Quasi-technique, budget zéro, petit volume | Alternative si fondateur plus à l'aise que prévu |
| **Sanity (headless)** | Interface admin claire, schema-driven, éditeur non-technique | **Recommandé** |
| **Storyblok / Contentful** | Visual editor, équipe contenu importante | Overkill et plus coûteux |
| **WordPress** | Blog lourd, plugins PHP, écosystème familier | Overkill, surface de sécurité large, PHP = maintenance |

---

### RECOMMANDATION CMS

**Choix : Sanity (free tier)**

**Justification :**
- Studio UI propre et intuitif — conçu pour des éditeurs non-techniques
- **Schema code-driven** : le développeur définit exactement ce qui est éditable, ce qui est verrouillé, les validations, les longueurs maximales. Le fondateur ne voit que les champs autorisés.
- Intégration native avec Astro (`@sanity/astro` officiel)
- Free tier suffisant pour ce projet : unlimited API calls au build, 10GB bandwidth, 2 datasets
- GROQ (langage de query Sanity) : simple et précis pour les besoins de ce site
- Webhooks natifs → redéploiement Vercel automatique à chaque sauvegarde

**Alternative : Decap CMS (open source)**
- Entièrement gratuit
- Édite des fichiers Markdown dans le repo Git via interface web
- Plus adapté si le fondateur est à l'aise avec des interfaces similaires à WordPress
- Inconvénient : courbe d'apprentissage légèrement plus raide, couplage fort aux fichiers

---

### Gouvernance : champs éditables vs structure verrouillée

Le développeur crée le schema. Le fondateur ne voit que les champs définis.

| Zone | Éditable | Type Sanity | Contrainte |
|------|----------|-------------|-----------|
| FAQ — liste de Q&R | Oui | Array d'objets | Validation : question non vide |
| Mini-cas clients | Oui | Array d'objets | Max 5 items recommandés |
| Process 5 étapes | Oui (limité) | Array fixe de 5 objets | Nombre d'items verrouillé à 5 |
| Témoignages | Oui (activé post-lancement) | Array d'objets | `visible: boolean` |
| SEO title / meta description | Oui | String avec validation | Max 60 / 160 chars |
| Structure des pages (sections, ordre) | Non | Hors CMS — dans le code Astro | — |
| CTAs primaires (texte, lien) | Non | Hors CMS | Hard-codé dans les composants |
| Tokens design | Non | CSS variables dans le code | — |
| Hiérarchie Hn | Non | Hors CMS | SEO structurel verrouillé |

---

### Modèle de contenu minimal

```typescript
// settings (singleton — 1 seul document)
{
  siteName: string,
  seo: {
    defaultTitle: string,       // max 60 chars
    defaultDescription: string  // max 160 chars
  }
}

// faq (editable — Home et Offre)
{
  _id: string,
  question: string,             // required
  reponse: text,                // portableText ou textarea
  page: 'home' | 'offre',      // filtrage par page
  ordre: number                 // tri d'affichage
}

// caseStudy (editable)
{
  _id: string,
  titre: string,
  secteur: string,
  contexte: text,               // 1 phrase
  solution: string[],           // 2–3 points (array de strings)
  resultat: string,             // qualitatif ou chiffré
  image: image,                 // asset Sanity
  visible: boolean,             // draft/published
  ordre: number
}

// processStep (editable — 5 items fixes)
{
  _id: string,
  numero: number,               // 1–5 (readonly dans Studio)
  titre: string,
  description: text,
  livrable: string,
  tempsClient: string           // ex: "~1h"
}

// testimonial (activé post-lancement)
{
  _id: string,
  auteur: string,
  role: string,
  entreprise: string,
  texte: text,
  visible: boolean
}
```

---

## E. INTEGRATIONS PLAN

---

### Formulaire contact

**Solution : Formspree (free tier — 50 soumissions/mois)**

| Critère | Détail |
|---------|--------|
| Anti-spam | Honeypot field natif + option reCAPTCHA invisible |
| Routing | Soumission → email vers adresse fondateur (config Formspree dashboard) |
| Stockage | Formspree stocke les soumissions 30 jours (exportable CSV) |
| Notifications | Email immédiat au fondateur à chaque soumission |
| Implémentation | HTML `<form action="https://formspree.io/f/[id]" method="POST">` — 0 JS requis |
| Fallback | JSON endpoint disponible pour submit via `fetch` si confirmation inline souhaitée |
| RGPD | Formspree GDPR-compliant — serveurs EU disponibles |

```html
<form action="https://formspree.io/f/[ID]" method="POST">
  <!-- Honeypot anti-spam -->
  <input type="text" name="_gotcha" style="display:none">

  <label for="prenom">Prénom</label>
  <input id="prenom" name="prenom" type="text" required>

  <label for="email">Email professionnel</label>
  <input id="email" name="email" type="email" required>

  <label for="besoin">Votre besoin en 2 lignes (optionnel)</label>
  <textarea id="besoin" name="besoin" rows="3"></textarea>

  <input type="hidden" name="_subject" value="Nouveau lead — Site SITE TEST">

  <button type="submit">Envoyer ma demande →</button>
  <p class="text-xs text-muted">En soumettant ce formulaire, vous acceptez notre
    <a href="/politique-confidentialite">politique de confidentialité</a>.</p>
</form>
```

**Gestion du succès :** Option A (simple) — redirection vers `?success=true` + message inline. Option B — `fetch` + JSON response Formspree + message de confirmation CSS fade-in.

**Si dépassement 50 soumissions/mois :** Passer au tier Formspree Bronze (10$/mois) — ou migrer vers Netlify Forms si hébergement déplacé sur Netlify.

---

### CRM

**v1 : Email uniquement**

- Formspree route chaque soumission par email au fondateur
- Traitement manuel (inbox = CRM en v1)
- Aucun outil CRM à configurer au lancement

**Évolution post-lancement si volume justifie (>10 leads/mois) :**

| Option | Outil | Coût | Effort |
|--------|-------|------|--------|
| Simple | Formspree → Notion database (via webhook Make/Zapier) | 0–9€/mois | 1h setup |
| Intermédiaire | Formspree → HubSpot Free | 0€ | 2h setup |
| Intégré | Formspree → Zapier → CRM au choix | Selon Zapier | Variable |

**Champs à mapper :**
- `prenom`, `email`, `besoin`, `date_soumission`
- `source` : UTM parameter si trackable (campagne LinkedIn, Google...)
- Tags : `source: {google, linkedin, referral, direct}` / `statut: {nouveau, en-cours, clos}`

---

### Analytics — GA4

**Implémentation :**
- Script GA4 **bloqué jusqu'au consentement** (CookieConsent gère l'injection conditionnelle)
- Injection via `window.gtag` uniquement après acceptation dans la catégorie "analytics"
- Consent Mode v2 activé (signaux agrégés en mode refus)

**Événements custom à implémenter :**

| Événement GA4 | Déclencheur | Paramètres |
|---------------|------------|-----------|
| `cta_primary_click` | Clic sur tout `btn-primary` | `{cta_text, page_location, section}` |
| `nav_cta_click` | Clic sur CTA nav sticky | `{scroll_position}` |
| `footer_cta_click` | Clic CTA footer | `{page}` |
| `form_rdv_started` | Focus sur premier champ formulaire | `{page}` |
| `form_rdv_submitted` | Soumission formulaire réussie | `{page}` |
| `calendly_opened` | Déclenchement lazy-load Calendly (clic) | `{page}` |
| `calendly_booked` | Événement `calendly.event_scheduled` (postMessage) | `{}` |
| `scroll_depth_25` | Scroll 25% | `{page}` |
| `scroll_depth_75` | Scroll 75% | `{page}` |
| `portfolio_item_click` | Clic sur un cas client | `{case_titre, secteur}` |
| `faq_opened` | Clic sur accordion FAQ | `{question_text, page}` |

---

### Prise de RDV — Calendly

**Règles d'intégration :**
- Embed widget sur page `/contact` — directement visible (pas de clic intermédiaire)
- Sur Home (section CTA final) : lien vers `/contact` ou déclencheur inline selon le choix UX
- Formulaire contact = fallback si Calendly ne se charge pas (JS désactivé, extension ad-blocker)

**Lazy-load obligatoire** (script Calendly ~150KB) :

```javascript
// src/scripts/calendly-lazy.js
const btn = document.getElementById('open-calendly');
const container = document.getElementById('calendly-embed');

if (btn && container) {
  btn.addEventListener('click', () => {
    btn.style.display = 'none';
    container.style.display = 'block';

    const script = document.createElement('script');
    script.src = 'https://assets.calendly.com/assets/external/widget.js';
    document.head.appendChild(script);
    script.onload = () => {
      Calendly.initInlineWidget({
        url: 'https://calendly.com/[username]/appel-decouverte-30min',
        parentElement: container,
        prefill: {},
        utm: {}
      });
    };
  }, { once: true });

  // Tracking de la réservation
  window.addEventListener('message', (e) => {
    if (e.origin === 'https://calendly.com' &&
        e.data?.event === 'calendly.event_scheduled') {
      if (typeof gtag !== 'undefined') {
        gtag('event', 'calendly_booked');
      }
    }
  });
}
```

**Règles de qualification :**
- Aucune question de qualification avant l'appel (friction = perte de leads)
- Durée : 30 min uniquement (signal "on respecte votre temps")
- Buffer entre RDV : 15 min (configurable dans Calendly)
- Titre du créneau : "Appel découverte 30 min — [Nom agence]"

---

### RGPD — Consentement cookies

**Solution : CookieConsent v3 (Orestbida) — open source, 3KB gzipped**

**Justification du choix vs alternatives :**
- Axeptio (10€/mois) — inutile pour ce budget
- Tarteaucitron.js — moins bien maintenu, UX moins propre
- CookieConsent v3 — gratuit, léger, hautement customisable en CSS, utilisé sur des millions de sites

**Configuration :**

```javascript
// src/scripts/cookie-consent.js
import 'vanilla-cookieconsent';

CookieConsent.run({
  categories: {
    necessary: {
      enabled: true,
      readOnly: true
    },
    analytics: {
      autoClear: {
        cookies: [{ name: /^(_ga|_gid)/ }]
      }
    }
  },
  language: {
    default: 'fr',
    translations: {
      fr: {
        consentModal: {
          title: 'Nous utilisons des cookies',
          description: 'Ce site utilise des cookies analytiques pour mesurer l\'audience. Vous pouvez accepter ou refuser.',
          acceptAllBtn: 'Tout accepter',
          rejectAllBtn: 'Tout refuser',
          showPreferencesBtn: 'Gérer'
        }
      }
    }
  },
  onConsent: ({ cookie }) => {
    if (CookieConsent.acceptedCategory('analytics')) {
      // Injecter GA4
      loadGoogleAnalytics();
    }
  }
});
```

**Personnalisation CSS :** Appliquer les CSS variables du design system :
```css
#cc-main {
  --cc-btn-primary-bg: var(--color-accent);
  --cc-btn-primary-hover-bg: var(--color-accent-hover);
  --cc-bg: var(--color-surface);
  --cc-font-family: var(--font-body);
  --cc-modal-border-radius: var(--radius-md);
}
```

---

## F. EXECUTION BRIEF TECH

---

### Architecture de rendu

| Page | Stratégie | Données | Revalidation |
|------|-----------|---------|-------------|
| `/` Home | SSG (build time) | FAQ + Process depuis Sanity | Webhook Sanity → Deploy Vercel |
| `/offre` | SSG (build time) | FAQ depuis Sanity | Idem |
| `/realisations` | SSG (build time) | CaseStudy depuis Sanity | Idem |
| `/contact` | SSG (build time) | Aucune (formulaire vers Formspree) | — |
| `/a-propos` | SSG (build time) | Aucune | — |
| Pages légales | SSG (build time) | Markdown ou Sanity | — |
| `/realisations/[slug]` *(v2)* | SSG (pre-rendered paths) | CaseStudy individuel | Webhook Sanity |

**Revalidation sur changement CMS :**
1. Fondateur sauvegarde dans Sanity Studio
2. Sanity webhook → Vercel Deploy Hook (URL configurée dans Vercel)
3. Redéploiement automatique (~1–3 min)
4. Le nouveau contenu est en ligne sans intervention technique

---

### Structure repo recommandée

```
site-test/
├── src/
│   ├── components/
│   │   ├── global/
│   │   │   ├── Nav.astro            ← sticky, hamburger mobile
│   │   │   ├── Footer.astro
│   │   │   └── CookieConsent.astro  ← injection conditionnelle GA4
│   │   ├── ui/
│   │   │   ├── Button.astro         ← props: variant, size
│   │   │   ├── Badge.astro
│   │   │   ├── Card.astro
│   │   │   └── Accordion.astro      ← aria-expanded, keyboard nav
│   │   └── sections/
│   │       ├── Hero.astro
│   │       ├── ProblemEcho.astro
│   │       ├── Pillars.astro
│   │       ├── ProcessSteps.astro   ← données depuis props (Sanity)
│   │       ├── ForWho.astro
│   │       ├── PortfolioGrid.astro
│   │       ├── FAQ.astro            ← données depuis props (Sanity)
│   │       └── CTASection.astro     ← Calendly embed + formulaire fallback
│   ├── layouts/
│   │   ├── BaseLayout.astro         ← <html lang="fr">, meta, fonts preload, OG
│   │   └── LegalLayout.astro        ← max-width 720px, nav + footer
│   ├── pages/
│   │   ├── index.astro
│   │   ├── offre.astro
│   │   ├── realisations.astro
│   │   ├── contact.astro
│   │   ├── a-propos.astro
│   │   ├── mentions-legales.astro
│   │   └── politique-confidentialite.astro
│   ├── styles/
│   │   ├── tokens.css               ← CSS custom properties (design system complet)
│   │   ├── typography.css           ← @font-face + échelle typo
│   │   ├── base.css                 ← reset + styles globaux
│   │   └── reduced-motion.css       ← @media prefers-reduced-motion
│   ├── scripts/
│   │   ├── nav-sticky.js            ← rAF throttled scroll handler
│   │   ├── scroll-reveal.js         ← IntersectionObserver
│   │   ├── calendly-lazy.js         ← lazy-load + event tracking
│   │   └── analytics.js             ← gtag helper + événements custom
│   └── lib/
│       ├── sanity.ts                ← client Sanity + requêtes GROQ typées
│       └── types.ts                 ← types TypeScript pour les documents Sanity
├── public/
│   ├── fonts/
│   │   ├── dm-serif-display-regular.woff2
│   │   ├── dm-sans-regular.woff2
│   │   ├── dm-sans-medium.woff2
│   │   └── dm-sans-semibold.woff2
│   ├── favicon.ico
│   ├── favicon.svg
│   ├── apple-touch-icon.png         ← 180×180px
│   └── og/
│       ├── og-home.jpg              ← 1200×630px
│       ├── og-offre.jpg
│       └── og-contact.jpg
├── sanity/                          ← Studio Sanity (même repo)
│   ├── sanity.config.ts
│   └── schemas/
│       ├── index.ts
│       ├── faq.ts
│       ├── caseStudy.ts
│       ├── processStep.ts
│       └── settings.ts
├── astro.config.mjs                 ← @astrojs/sitemap, @sanity/astro
├── tsconfig.json
├── package.json
└── .env                             ← variables d'env (jamais commitées)
```

**Variables d'environnement :**
```bash
# .env.local (non commité)
SANITY_PROJECT_ID=xxxxxxxxx
SANITY_DATASET=production
SANITY_API_TOKEN=sk...          # read-only token pour le build
PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX
PUBLIC_FORMSPREE_ID=xxxxxxxxx
PUBLIC_CALENDLY_URL=https://calendly.com/[username]/appel-decouverte-30min
```

---

### Performance budgets

**Images :**
- Format : WebP obligatoire — `<picture>` avec JPEG fallback pour compatibilité maximale
- Compression : max 80KB par image de réalisation (800×450px, ratio 16:9)
- Hero : **pas d'image de fond** (fond CSS `color-background`) — impact LCP = zéro
- Lazy loading : `loading="lazy"` sur toutes les images **sauf** le logo nav et les images above the fold
- `srcset` + `sizes` obligatoires sur les cards réalisations

**Scripts :**

| Script | Poids (gzipped) | Chargement |
|--------|----------------|-----------|
| JS propre du site | < 5KB | Inline ou defer |
| CookieConsent | ~3KB | Defer |
| GA4 gtag.js | ~25KB | Conditionnel (post-consentement) |
| Calendly widget.js | ~150KB | Lazy (au clic uniquement) |
| Formspree | 0KB | HTML natif |

**Fonts :**
```html
<!-- Dans <head> du BaseLayout.astro -->
<link rel="preload" href="/fonts/dm-serif-display-regular.woff2"
      as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/fonts/dm-sans-variable.woff2"
      as="font" type="font/woff2" crossorigin>
```

```css
/* typography.css */
@font-face {
  font-family: 'DM Serif Display';
  src: url('/fonts/dm-serif-display-regular.woff2') format('woff2');
  font-weight: 400;
  font-display: swap;  /* obligatoire */
}

@font-face {
  font-family: 'DM Sans';
  src: url('/fonts/dm-sans-variable.woff2') format('woff2-variations');
  font-weight: 100 900;
  font-display: swap;
}
```

**Note :** Si variable font WOFF2 pour DM Sans n'est pas disponible, charger séparément Regular (400), Medium (500) et Semibold (600) uniquement — pas de Bold 700, pas d'Italic sauf si utilisé.

---

### SEO technique minimum

**Sitemap :**
```javascript
// astro.config.mjs
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://[domain].fr',
  integrations: [sitemap()]
});
```
Toutes les pages publiques indexées automatiquement.

**robots.txt :**
```
User-agent: *
Allow: /
Sitemap: https://[domain].fr/sitemap-index.xml
```

**Meta tags dans BaseLayout.astro :**
```astro
---
const { title, description, ogImage = '/og/og-home.jpg', canonical } = Astro.props;
---
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <html lang="fr">

  <title>{title}</title>
  <meta name="description" content={description}>
  <link rel="canonical" href={canonical ?? Astro.url.href}>

  <!-- Open Graph -->
  <meta property="og:title" content={title}>
  <meta property="og:description" content={description}>
  <meta property="og:image" content={`https://[domain].fr${ogImage}`}>
  <meta property="og:url" content={Astro.url.href}>
  <meta property="og:type" content="website">
  <meta property="og:locale" content="fr_FR">

  <!-- Fonts preload -->
  <link rel="preload" href="/fonts/dm-serif-display-regular.woff2" as="font" type="font/woff2" crossorigin>
  <link rel="preload" href="/fonts/dm-sans-variable.woff2" as="font" type="font/woff2" crossorigin>

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="/favicon.svg">
  <link rel="icon" type="image/x-icon" href="/favicon.ico">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">
</head>
```

**Liens internes crawlables :** Astro génère des `<a href="...">` statiques — pas de SPA routing JS. Tous les liens nav et footer sont indexables nativement.

**CLS = 0 :** Ne jamais réserver d'espace pour les animations. Les éléments de scroll reveal doivent être dans le DOM (visibles) avant l'animation — seul `opacity` et `transform` sont changés (pas de layout shift).

---

### Déploiement

**Environnements :**

| Env | Déclencheur | URL | But |
|-----|------------|-----|-----|
| Production | Push sur `main` | `https://[domain].fr` | Site live |
| Preview | Push sur toute branche / PR | `https://[branch]--[project].vercel.app` | Validation avant merge |
| Local | `npm run dev` | `localhost:4321` | Développement |

**Workflow :**
1. Dev local sur branche `feature/[nom]`
2. Push → Preview auto Vercel (URL unique par commit)
3. Review OK → Merge PR sur `main`
4. Deploy production automatique
5. Sanity webhook → Vercel Deploy Hook → redéploiement si contenu CMS modifié

**Setup Vercel :**
- `npm install -g vercel` → `vercel login` → `vercel` (détecte Astro automatiquement)
- Build command : `npm run build`
- Output dir : `dist`
- Variables d'env à configurer dans le dashboard Vercel (pas dans le code)

**HTTPS + Domaine :**
- HTTPS automatique via Let's Encrypt (Vercel gère le renouvellement)
- DNS : ajouter un A record `76.76.21.21` ou CNAME `cname.vercel-dns.com`
- Redirection `www` → apex domain : configurable dans Vercel dashboard

**Rollback :**
- Vercel conserve chaque déploiement → rollback en 1 clic depuis "Deployments"
- Délai de rollback : < 30 secondes

---

### Risques + mitigations

| Risque | Prob. | Impact | Mitigation |
|--------|-------|--------|-----------|
| Calendly bloqué par ad-blocker (~30% des utilisateurs B2B) | Haute | Moyen | **Formulaire fallback natif obligatoire** — visible dès que Calendly ne charge pas |
| GA4 bloqué par navigateur/uBlock | Haute | Faible | Consent Mode v2 récupère des signaux agrégés même en mode refus |
| Contenu CMS non prêt au lancement | Haute | Moyen | Placeholders prêts dans le code (FAQ et Process en dur pour v1, remplacés par CMS en v1.1) |
| LCP > 2.5s sur connexion lente | Faible (Astro SSG) | Élevé | Préchargement fonts, images WebP, hero sans image, Calendly lazy, GA4 conditionnel |
| CLS dû aux fonts (FOUT) | Faible | Moyen | `font-display: swap` + preload + tailles de texte CSS avant chargement font |
| Sanity rate limit (free tier) | Très faible | Faible | Contenu consommé **au build uniquement** — 0 appel API en production runtime |
| Formspree dépassement free tier | Faible en v1 | Faible | Passage Bronze ($10/mois) si > 50 soumissions/mois — signe de succès |
| RGPD non conforme | Faible si bien implémenté | Élevé | CookieConsent avant tout tracking, politique de confidentialité complète, aucun cookie tiers avant consentement |
| Verrouillage CMS non respecté | Moyen | Moyen | Schema Sanity strict : validation longueur, types typés, items fixes pour Process — tester dans Studio avant livraison |
| Logo ou photo fondateur non fournis au lancement | Haute | Faible | Placeholders définis dans le design system, LGTM pour lancement sans photo si /a-propos est différée |

---

## DECISION LOG

---

| Décision | Choix retenu | Alternatives rejetées | Raison | Risque résiduel |
|----------|-------------|----------------------|--------|----------------|
| Framework frontend | Astro | Next.js, Nuxt, Webflow, HTML custom | SSG pur + islands = JS minimal, LCP garanti, intégration CMS native | Courbe d'apprentissage si développeur Next.js only |
| CMS | Sanity (free) | Decap CMS, WordPress, Contentful | Interface Studio non-technique, schema-driven, webhooks, free tier suffisant | Si Sanity change son pricing gratuit → migration vers Decap (simple) |
| Hébergement | Vercel | Netlify, OVH, AWS | Zero-config Astro, CDN global, previews auto, HTTPS gratuit, rollback 1 clic | Dépendance Vercel — mais migration Netlify triviale si nécessaire |
| Formulaire | Formspree | Netlify Forms, Resend+API route, Tally | HTML natif sans JS, 0 serveur, anti-spam intégré, email direct | 50 soumissions/mois — acceptable en v1 |
| Consentement RGPD | CookieConsent v3 (Orestbida) | Axeptio, Tarteaucitron | 3KB, open source, CSS customisable, maintenu activement | Non certifié CNIL mais conforme RGPD techniquement |
| CRM v1 | Email uniquement | HubSpot, Pipedrive, Notion | Zéro coût, zéro configuration, suffisant pour < 20 leads/mois | Manuel — si volume augmente, migrer vers Notion ou HubSpot Free |
| Animations | CSS natif + IntersectionObserver | GSAP, AOS, Framer Motion | Budget JS < 50KB, maintenance simplifiée, réduit la dépendance externe | Effets légèrement moins fluides que GSAP sur mobile bas de gamme — acceptable |
| Pas de backend | Aucun | Express, Supabase, Firebase | Aucun besoin justifié en v1. Surface d'attaque nulle. Coût zéro. | Si webhook Calendly nécessaire en v2 → Astro server endpoint (simple ajout) |
| Fonts | Self-hosted | Google Fonts CDN | Évite la dépendance externe, RGPD (pas de requête vers Google sans consentement), preload contrôlé | Mise à jour des fonts manuelle si nouvelle version — négligeable |

---

## CHECKLIST PRÊT À CODER

Ce qui doit être validé et fourni **avant d'ouvrir un éditeur de code** :

### Décisions à confirmer

- [ ] **Calendly ou formulaire sur /contact ?** — Recommandation : Calendly + formulaire fallback. Si pas encore de compte Calendly, créer le compte et noter l'URL du créneau avant de coder la section.
- [ ] **Page À propos en v1 ou différée ?** — Confirme si la page est incluse dans la livraison initiale (impact sur le composant Nav et la structure du Footer).
- [ ] **Page Réalisations : placeholder ou masquée ?** — Si 0 cas disponible au lancement, choisir Option A (placeholder honnête) ou Option B (page masquée) pour planifier les composants à coder.
- [ ] **Nom de domaine acheté et DNS accessible ?** — Nécessaire pour la config Vercel et les tests de performance réels.
- [ ] **Formspree ou Netlify Forms ?** — Recommandation Formspree si hébergement Vercel. Si hébergement Netlify retenu, Netlify Forms est inclus et simplifie le setup.

### Assets à obtenir avant développement

- [ ] **Logo agence** — SVG vectoriel, versions light (sur fond sombre) et dark (sur fond clair), fond transparent
- [ ] **Favicon** — SVG + ICO (dérivé du logo)
- [ ] **Fonts** — DM Serif Display et DM Sans en WOFF2 (télécharger depuis Google Fonts ou Fontsource, self-host dans `/public/fonts/`)
- [ ] **Images Open Graph** — 1200×630px pour Home, Offre, Contact (peuvent être générées en CSS si pas de brief visuel)
- [ ] **Photo fondateur** — Si page À propos en v1 (format 1:1 ou 3:4, fond neutre, éclairage naturel)

### Contenu à fournir avant développement (ou décision d'utiliser des placeholders)

- [ ] **Process en 5 étapes nommées** avec : titre, description courte, livrable principal, temps client estimé — **PRIORITÉ 1** (bloque les sections Home §4 et Offre §4)
- [ ] **FAQ 6 questions/réponses** pour Home et 6 pour Offre (disponibles depuis le brief stratégique — à confirmer)
- [ ] **URL Calendly** du créneau de 30 min (ou décision formulaire uniquement)
- [ ] **Email du fondateur** pour routing Formspree

### Comptes et services à créer

- [ ] **Compte Vercel** (GitHub OAuth recommandé) + repo Git initialisé
- [ ] **Compte Sanity** + projet créé + dataset `production`
- [ ] **Compte Formspree** + formulaire créé + ID récupéré
- [ ] **Compte GA4** + propriété créée + Measurement ID (`G-XXXXXXXX`) récupéré
- [ ] **Compte Calendly** + créneau "Appel découverte 30 min" configuré + URL notée
- [ ] **Variables d'env** documentées dans un fichier `.env.local` (jamais commité)

### Vérifications techniques pré-lancement

- [ ] Lighthouse score >= 90 sur mobile sur les 3 pages principales (Home, Offre, Contact)
- [ ] CLS = 0 sur scroll (tester avec Chrome DevTools > Performance)
- [ ] LCP < 2.5s sur connexion 4G simulée (Chrome DevTools > Network throttling)
- [ ] `prefers-reduced-motion` testé — tous les effets désactivés
- [ ] Keyboard navigation testée sur Home et Contact (Tab, Escape, Enter)
- [ ] Formulaire testé : envoi, confirmation, message d'erreur, RGPD mention
- [ ] Calendly lazy-load testé : bouton → chargement → widget visible → événement GA4 `calendly_opened`
- [ ] CookieConsent testé : refus → GA4 non chargé, acceptation → GA4 actif
- [ ] Sitemap accessible sur `https://[domain].fr/sitemap-index.xml`
- [ ] `robots.txt` accessible sur `https://[domain].fr/robots.txt`
- [ ] OG tags vérifiés via [opengraph.xyz](https://www.opengraph.xyz) ou LinkedIn Post Inspector
- [ ] Webhook Sanity → Vercel testé : modification d'une FAQ dans Studio → redéploiement déclenché → contenu mis à jour

---

*Fin Tech Stack v1 — SITE TEST*
*Prêt pour Gate 6 (QA) une fois le build initial livré et la checklist ci-dessus complétée.*
