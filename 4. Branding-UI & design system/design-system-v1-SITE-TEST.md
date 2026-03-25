# DESIGN BRIEF + DESIGN SYSTEM v1 + EFFECTS STRATEGY — SITE TEST
**Agent :** vitrine-ui-design-system
**Date :** 2026-03-25
**Statut :** v1 — prêt pour agent tech sous réserve de fourniture des assets listés en section D

---

## A. DESIGN BRIEF

---

### 1. Objectifs UX & conversion — ce que l'UI doit rendre évident en 3 secondes

En moins de 3 secondes de lecture de la Home, un dirigeant de PME doit comprendre :

1. **"Ce site parle de mon problème"** — le H1 attaque un problème réel, pas une offre abstraite. L'UI ne doit pas diluer ce message avec des éléments décoratifs concurrents.
2. **"Ces gens ont une méthode"** — la section process signale la structure et la rigueur avant même d'être lue en détail. La mise en forme (timeline, numérotation, encadrés livrables) porte ce message.
3. **"Je sais quoi faire"** — le CTA primaire est toujours visible, toujours accessible. Jamais enfoui.

Ce que l'UI ne doit pas créer : confusion (trop de CTA concurrents), surcharge (sections sans job), généricité (look "agence digitale de 2018").

**Signal de qualité à incarner :** le site lui-même est la démonstration de l'offre. Un dirigeant doit penser "c'est ce type de site qu'ils pourraient faire pour moi" — pas "c'est un site correct".

---

### 2. Principes UI — 6 règles

**R1 — Hiérarchie avant esthétique**
Chaque décision typographique, spatiale et colorielle sert la hiérarchie de lecture : H1 → subhead → preuve → CTA. Aucun élément visuel ne peut distraire du message prioritaire de la section en cours.

**R2 — Densité intentionnelle**
Le blanc (espace négatif) est un signal premium. Les sections respirent. Mieux vaut une page longue bien aérée qu'une page compacte semblant tout vouloir dire en même temps. Espacement généreux = confiance = positionnement haut de gamme.

**R3 — Crédibilité par la forme**
En l'absence de preuves chiffrées, la mise en forme elle-même prouve le sérieux : étapes nommées dans une timeline propre, livrables distincts visuellement, checklist inclus/exclus lisible d'un coup d'œil. La forme signale la méthode.

**R4 — Un seul CTA primaire visible à tout moment**
Le bouton "Réserver mon appel découverte" est le seul élément en couleur d'accent plein à l'écran. Pas de compétition visuelle entre CTAs. Le CTA secondaire (lien texte) est clairement secondaire visuellement.

**R5 — Mobile comme premier périmètre de décision**
La prise de RDV se fera souvent sur mobile (consultation LinkedIn, bouche-à-oreille). Les CTAs sont dimensionnés pour le pouce, les formulaires pour le clavier mobile, les blocs pour la lecture verticale. On ne réduit pas une version desktop — on compose mobile-first.

**R6 — Cohérence signale la fiabilité**
Un prestataire dont le site est visuellement cohérent prouve implicitement sa capacité à livrer un travail cohérent. Tokens de design stricts. Pas d'exception non documentée.

---

### 3. Direction visuelle

#### Style général

**"Editorial froid-chaud"** — sobriété de la presse spécialisée B2B (pas de gradients, pas d'effets agence), tempérée par une chaleur chromatique (tons terreux, typographie à personnalité). Signal : intelligent et humain, pas corporate froid, pas startup flashy.

Registre de référence : rapport annuel premium × cabinet de conseil indépendant × studio de design éditorial. Aucun élément ne doit évoquer "agence web générique", "startup SaaS en croissance forcée" ou "portfolio de freelance ambitieux".

#### Typographie — règles

**Font display (H1 hero et titres de page) :** `DM Serif Display` — serif avec personnalité propre, lisible en grande taille, signale "prise de position éditoriale" sans être académique.

**Font interface (H2, H3, body, labels, CTA) :** `DM Sans` — géométrique neutre, lisibilité optimale en petite taille, cohésion visuelle avec DM Serif (même famille de design).

**Font mono (données, code, étiquettes techniques si nécessaire) :** `DM Mono` — usage limité, cohérence famille.

Règles d'usage typo :
- DM Serif Display : **uniquement H1** (hero + pages) — jamais en corps de texte, jamais en dessous de 40px
- DM Sans : tout le reste, y compris H2, H3, labels CTA, FAQ, microcopy
- Poids autorisés : 400 (regular) + 500 (medium) + 600 (semibold). Pas de bold 700 sauf usage exceptionnel justifié
- Interligne : 1.5 pour le body, 1.2 pour les headlines, 1.3 pour les H2/H3
- Tracking (letter-spacing) : -0.01em pour les headlines, 0 pour le body, +0.05em pour les labels en majuscules uniquement
- Longueur de ligne (measure) : 60–75 caractères pour le body, 40–55 pour les textes courts (subheads, intros)

#### Couleur — règles

**Palette fondatrice :**

| Rôle | Nom token | Valeur | Règle d'usage |
|------|-----------|--------|---------------|
| Fond principal | `color-background` | `#F7F5F2` | Fond de page — blanc cassé chaud, jamais pur blanc |
| Surface élevée | `color-surface` | `#FFFFFF` | Cards, formulaires, éléments au-dessus du fond |
| Surface subtile | `color-surface-subtle` | `#EFEDE9` | Sections alternées, fonds de blocs informatifs |
| Texte principal | `color-text-primary` | `#1C1C1A` | Near-black chaud — titres, copy, labels |
| Texte secondaire | `color-text-secondary` | `#5C5C56` | Descriptions, sous-titres, body standard |
| Texte discret | `color-text-muted` | `#9C9C94` | Placeholders, microcopy RGPD, légendes |
| Bordure légère | `color-border` | `#E2DFDB` | Séparateurs, bordures de cards au repos |
| Bordure forte | `color-border-strong` | `#C8C5C0` | Boutons ghost, séparateurs importants |
| **Accent primaire** | `color-accent` | `#2D4A3E` | Vert forêt sombre — CTA bouton, liens actifs, step markers |
| Accent hover | `color-accent-hover` | `#1F3529` | État hover de l'accent |
| Accent fond subtil | `color-accent-subtle` | `#EBF2EF` | Fond de badge, hover state de liens, highlights |
| Texte sur accent | `color-accent-on` | `#FFFFFF` | Texte sur fond accent |
| Cuivre (micro-accent) | `color-copper` | `#8B6445` | Optionnel — lignes décoratives très fines, puces singulières. Usage limité |
| Fond footer | `color-footer-bg` | `#181815` | Fond du footer — near-black très chaud |
| Erreur | `color-error` | `#B83232` | Validation formulaire — messages d'erreur |
| Erreur fond | `color-error-subtle` | `#FDEAEA` | Fond de champ en erreur |
| Succès | `color-success` | `#27654A` | Confirmation d'envoi |
| Succès fond | `color-success-subtle` | `#E8F5EE` | Fond de message de confirmation |

**Règles chromatiques :**
- Pas de gradient bleu/violet/indigo (cliché agence digitale — interdit)
- La couleur accent `#2D4A3E` est la **seule** couleur vive à l'écran — uniquement sur les CTA primaires, les liens actifs, les step markers, les badges
- Le fond `#F7F5F2` crée une chaleur subtile que le blanc pur n'a pas — ne jamais remplacer par `#FFFFFF` comme fond de page
- Le cuivre est une touche ponctuelle (max 2 occurrences par page) — jamais sur du texte fonctionnel
- Contraste minimum : 4.5:1 pour tout texte de body, 3:1 pour les textes larges (>24px)

#### Iconographie

Style : **line art mono, 2px stroke, arrondis cohérents avec radius-sm du design system**. Pas d'icônes remplies (trop "app mobile"). Pas de style illustratif.

Système recommandé : **Lucide Icons** ou **Phosphor Icons (Regular)** — open source, cohérent, maintenu. Si les icônes de piliers/process sont des créations custom, elles doivent respecter le même stroke 2px.

Tailles :
- Navigation : 20px
- Piliers / sections : 40px dans un container 48px avec fond `color-accent-subtle`
- FAQ chevron : 16px
- CTA flèche : 16px, inline avec le texte

#### Imagery

Règle centrale : **pas d'image de stock générique**. Toute image sur le site est soit une capture de réalisation réelle, soit une photo du fondateur, soit une démonstration d'interface.

Fond hero : **pas d'image de fond**. Fond `color-background` avec potentiellement une texture subtile CSS (grain très léger, <2% opacité) ou un élément graphique abstrait minimal (ligne, forme géométrique simple). À éviter absolument : photo de bureau, ordinateur sur table, mains sur clavier, skyline de ville.

Photo fondateur (page À propos) : portrait sobre, format 3:4 ou 1:1, fond neutre (uni ou environnement naturel flouté). Éclairage naturel. Pas de fond blanc studio. Pas de costume formel sauf si cohérent avec le positionnement.

Captures de réalisations (section portfolio) : format 16:9 ou 4:3, recadrées proprement, avec un contour de device sobre si applicable (pas de mockup 3D type "MacBook flottant dans les airs").

---

### 4. Patterns de crédibilité

Contexte : 0 preuve chiffrée disponible en v1. La crédibilité repose intégralement sur le **process documenté** et la **qualité perçue de l'exécution**.

| Signal de crédibilité | Placement | Traitement UI |
|-----------------------|-----------|---------------|
| Timeline process 5 étapes | Home §4 + Offre §4 | Éléments numérotés dans des cercles accent, connecteur vertical (mobile) ou horizontal (desktop). Encadré livrable en fond `color-surface-subtle`. Encadré "votre temps" en badge `color-accent-subtle`. |
| Pour qui / Pas pour qui | Home §5 + Offre §5 | Deux colonnes séparées. Colonne "Pour vous" : puce ✓ en `color-accent`. Colonne "Pas pour vous" : puce en `color-text-muted`. Pas de tableau — layout flex. Séparateur visuel net entre les deux colonnes. |
| Piliers détaillés | Home §3 + Offre §2 | Cards 3 colonnes avec icône, titre H3, description, liste inclus, note "ce que ce n'est pas" en italique couleur muted. |
| FAQ objections | Home §7 + Offre §6 | Accordion propre. Question en medium, réponse en regular, couleur secondary. Chevron animé (rotation 180°). |
| Microcopy CTA réassurance | Sous chaque CTA primaire | Texte court en text-sm, color-text-muted, non-aligné avec le bouton (centré ou sous le bouton, jamais collé). Contenu : "Gratuit — sans engagement — réponse sous 24h" |
| Périmètre inclus/exclus | Offre §3 | Deux listes côte à côte. Inclus : puce ronde `color-accent`. Exclus : puce ronde `color-text-muted`. Fond `color-surface`. |
| Signal d'appel structuré (Contact) | Contact §2 | 3 blocs numérotés avec numéro en grand format accent. Signale que l'appel est prévisible et sans surprise. |

---

### 5. Responsive — principes mobile-first

**Approche :** on conçoit l'expérience mobile en premier et on enrichit pour les écrans larges — on ne réduit pas.

| Breakpoint logique | Comportement clé |
|--------------------|-----------------|
| **< 640px (mobile)** | Stack vertical de tout. Process timeline verticale. Piliers empilés. Navigation hamburger avec CTA en premier item du menu. CTAs pleine largeur. |
| **640–1024px (tablet)** | Piliers en 2+1 ou 3 colonnes selon la largeur disponible. Process peut passer en alternance ou timeline horizontale courte. |
| **> 1024px (desktop)** | 3 colonnes piliers. Process horizontale ou alternée. Layout à 2 colonnes pour À propos (photo + texte). Navigation full avec CTA. |
| **> 1400px (wide)** | Max-width container fixé. Padding augmenté. Aucun élément ne s'étire au-delà. |

Règles spécifiques :
- Taille minimale des zones tactiles : 44×44px (boutons, triggers accordion, liens nav)
- Formulaires : inputs pleine largeur sur mobile, stack vertical des champs
- Calendly embed : hauteur auto, overflow scroll interne si nécessaire
- Typographie responsive : H1 hero de ~52px mobile à ~88px desktop (pas de taille fixe)
- Images : `srcset` + `sizes` obligatoires. Format WebP.

---

### 6. Accessibilité

| Critère | Règle |
|---------|-------|
| Contraste texte | Minimum 4.5:1 (AA) pour tout texte body. `color-text-secondary` sur `color-background` : à vérifier (calculer le ratio exact). Si insuffisant, assombrir légèrement. |
| Contraste grands titres | Minimum 3:1 pour textes > 24px bold ou > 18.67px. |
| Contraste CTA | Bouton `color-accent` (#2D4A3E) sur fond blanc : à vérifier ≥ 4.5:1 pour le texte blanc. |
| Focus states | Jamais retirer l'outline sans remplacement. Focus visible : ring 2px `color-accent`, offset 2px, arrondi cohérent avec l'élément. Visible en keyboard nav et focus-visible. |
| Navigation clavier | Ordre de tabulation logique. Accordion navigable au clavier (Enter/Space pour ouvrir). Formulaires : labels liés aux inputs (for/id), pas de placeholder comme seul label. |
| Formulaires | Chaque champ a un `<label>` visible. Les messages d'erreur sont annoncés (role="alert" ou aria-live). Le message de confirmation aussi. |
| Sémantique HTML | H1 unique par page. Hiérarchie Hn cohérente. `<nav>` avec aria-label. `<main>`. Accordion avec aria-expanded. |
| Images | `alt` descriptif sur toutes les images fonctionnelles. `alt=""` sur les images purement décoratives. |
| Reduced motion | Voir section C (Effects Strategy). |
| Langue | `<html lang="fr">` obligatoire. |

---

### 7. Motion — règles générales

**Principe directeur :** Le mouvement sert la compréhension ou le signal de qualité. Il ne divertit pas.

| Règle | Détail |
|-------|--------|
| Durées courtes | Transitions UI (hover, focus) : 150–200ms. Reveals de contenu : 300–500ms. Animations de page : max 600ms. Jamais > 800ms pour un élément individuel. |
| Easing naturel | `ease-out` pour les éléments qui entrent (décélération = naturel). `ease-in-out` pour les transitions bidirectionnelles (accordion). Pas de `linear` sauf cas très spécifiques. |
| Déclencheurs valides | Hover d'un élément interactif. Scroll into view (Intersection Observer). Clic (accordion, formulaire). Chargement initial de page (hero uniquement). |
| Déclencheurs invalides | Scroll-jacking. Mouvement continu en boucle sans interaction. Animation sur des éléments non interactifs au-delà du scroll reveal. |
| Reduced motion obligatoire | `@media (prefers-reduced-motion: reduce)` : désactiver tous les scroll reveals, stagger animations, hover transforms. Conserver uniquement les transitions de couleur (200ms) et les transitions d'état essentielles à la compréhension (accordion open/close instantané). |

---

## B. DESIGN SYSTEM v1

---

### TOKENS

#### Couleurs (rôles)

```
/* Neutrals */
--color-background:       #F7F5F2;   /* fond de page */
--color-surface:          #FFFFFF;   /* cards, formulaires */
--color-surface-subtle:   #EFEDE9;   /* sections alternées, encadrés */
--color-text-primary:     #1C1C1A;   /* texte principal */
--color-text-secondary:   #5C5C56;   /* body, descriptions */
--color-text-muted:       #9C9C94;   /* placeholders, microcopy, légal */
--color-border:           #E2DFDB;   /* bordures légères */
--color-border-strong:    #C8C5C0;   /* bordures structurelles */

/* Accent */
--color-accent:           #2D4A3E;   /* CTA primaire, liens actifs, markers */
--color-accent-hover:     #1F3529;   /* hover état accent */
--color-accent-subtle:    #EBF2EF;   /* fonds de badges, hover subtil */
--color-accent-on:        #FFFFFF;   /* texte sur fond accent */

/* Copper — micro-accent décoratif */
--color-copper:           #8B6445;   /* usage ponctuel, max 2×/page */

/* Footer */
--color-footer-bg:        #181815;   /* fond footer */

/* États formulaire */
--color-error:            #B83232;
--color-error-subtle:     #FDEAEA;
--color-success:          #27654A;
--color-success-subtle:   #E8F5EE;
```

#### Typographie (échelle)

```
/* Familles */
--font-display:  "DM Serif Display", Georgia, serif;
--font-body:     "DM Sans", system-ui, -apple-system, sans-serif;
--font-mono:     "DM Mono", "Courier New", monospace;

/* Taille mobile-first — valeurs de référence */
--text-xs:    0.75rem;    /* 12px — légal, RGPD, métadonnées */
--text-sm:    0.875rem;   /* 14px — labels, badges, microcopy */
--text-base:  1rem;       /* 16px — body standard */
--text-md:    1.125rem;   /* 18px — body large, introductions */
--text-lg:    1.25rem;    /* 20px — H4, subheads secondaires */
--text-xl:    1.5rem;     /* 24px — H3 */
--text-2xl:   2rem;       /* 32px — H2 mobile */
--text-3xl:   2.5rem;     /* 40px — H2 desktop, H1 pages secondaires mobile */
--text-4xl:   3.25rem;    /* 52px — H1 hero mobile */
--text-5xl:   4.5rem;     /* 72px — H1 hero desktop */
--text-6xl:   5.5rem;     /* 88px — H1 hero wide (optionnel) */

/* Interligne */
--leading-tight:   1.2;   /* headlines */
--leading-snug:    1.3;   /* H2/H3 */
--leading-normal:  1.5;   /* body */
--leading-relaxed: 1.6;   /* copy long, article */

/* Poids */
--weight-regular:   400;
--weight-medium:    500;
--weight-semibold:  600;

/* Règle d'usage :
   - DM Serif Display → uniquement H1 (hero + pages), ≥ 40px
   - DM Sans → H2, H3, body, labels, CTA, FAQ, microcopy
   - DM Mono → étiquettes techniques si nécessaire
*/
```

#### Spacing (échelle 4px)

```
--space-1:   0.25rem;   /*  4px */
--space-2:   0.5rem;    /*  8px */
--space-3:   0.75rem;   /* 12px */
--space-4:   1rem;      /* 16px */
--space-5:   1.25rem;   /* 20px */
--space-6:   1.5rem;    /* 24px */
--space-8:   2rem;      /* 32px */
--space-10:  2.5rem;    /* 40px */
--space-12:  3rem;      /* 48px */
--space-16:  4rem;      /* 64px */
--space-20:  5rem;      /* 80px */
--space-24:  6rem;      /* 96px */
--space-32:  8rem;      /* 128px */

/* Padding de section (vertical) :
   mobile:   space-16 (64px)
   tablet:   space-20 (80px)
   desktop:  space-24 à space-32 (96–128px)
   hero:     space-32 top + nav height (128px+) */

/* Container :
   max-width: 1200px
   padding-inline mobile:  space-5 (20px)
   padding-inline tablet:  space-6 (24px)
   padding-inline desktop: space-12 (48px) */
```

#### Border radius

```
--radius-sm:    4px;     /* inputs, boutons */
--radius-md:    8px;     /* cards, accordions */
--radius-lg:    12px;    /* modales, panneaux */
--radius-xl:    20px;    /* badges, pills */
--radius-full:  9999px;  /* cercles, step markers, avatars */
```

#### Shadows (rôles)

```
--shadow-xs: 0 1px 2px rgba(28, 28, 26, 0.04);   /* élévation minimale */
--shadow-sm: 0 2px 8px rgba(28, 28, 26, 0.06);   /* cards au repos */
--shadow-md: 0 4px 16px rgba(28, 28, 26, 0.08);  /* cards hover, focus */
--shadow-lg: 0 8px 32px rgba(28, 28, 26, 0.12);  /* modales, drawers */

/* Règle : jamais de shadow colorée.
   Jamais de shadow sur du texte.
   shadow-sm sur cards au repos si fond blanc sur fond page.
   shadow-md au hover de cards interactives uniquement. */
```

#### Grid

```
/* Desktop (>1024px) : 12 colonnes, gutter 24px, margin 48px */
/* Tablet (640–1024px) : 8 colonnes, gutter 20px, margin 24px */
/* Mobile (<640px) : 4 colonnes, gutter 16px, margin 20px */
/* Wide (>1400px) : max-width container = 1200px, auto-marges */
```

---

### COMPOSANTS

---

#### BOUTON

**Variantes :**

| Variante | Usage | Apparence |
|----------|-------|-----------|
| `btn-primary` | CTA principal ("Réserver mon appel") | Fond `color-accent`, texte `color-accent-on`, radius-sm, padding space-4 space-8 |
| `btn-ghost` | CTA secondaire ou CTA footer | Fond transparent, bordure 1px `color-border-strong`, texte `color-text-primary`, radius-sm |
| `btn-ghost-light` | CTA sur fond sombre (footer) | Fond transparent, bordure 1px rgba(255,255,255,0.3), texte blanc |
| `btn-link` | Lien textuel avec action (CTA secondaire "Demander un audit →") | Pas de fond, texte `color-accent`, underline au hover, flèche inline |

**États (tous les variants) :**
- `default` : décrit ci-dessus
- `hover` : `btn-primary` → `color-accent-hover` (transition 200ms ease-out). `btn-ghost` → fond `color-surface-subtle`. Pas de transform scale.
- `focus-visible` : ring 2px `color-accent`, offset 2px, cohérent avec radius du bouton
- `active` : légère réduction d'opacité (0.9) pendant 100ms
- `disabled` : opacity 0.4, cursor-not-allowed, pas d'événements hover

**Tailles :**
- `btn-lg` : padding space-5 space-10, text-md — CTA hero et CTA de section
- `btn-md` : padding space-4 space-8, text-base — CTA standard (default)
- `btn-sm` : padding space-3 space-6, text-sm — CTA nav sticky (compact)

**Microcopy sous bouton :**
- Élément `<p>` séparé, text-sm, `color-text-muted`, text-align center, margin-top space-2
- Contenu standard : "Gratuit — sans engagement — réponse sous 24h"

---

#### LIEN TEXTE

- Couleur au repos : `color-text-secondary` pour les liens de navigation, `color-accent` pour les liens d'action
- Underline : absent au repos pour les liens nav, présent au hover. Toujours présent sur les liens in-body (accessibilité)
- Flèche →  : icon inline 16px, légère translation au hover (2px, transition 200ms)
- Focus : underline + ring focus-visible

---

#### BADGE / TAG

- Fond `color-accent-subtle`, texte `color-accent`, radius-xl, padding space-1 space-3, text-sm, weight-medium
- Variante neutral : fond `color-surface-subtle`, texte `color-text-secondary` — pour les statuts (ex: "Priorité 1", "À fournir")
- Usage : badges de section, étiquettes sur les étapes process ("Votre temps : ~2h"), labels

---

#### CARD

**Card standard (piliers, informations) :**
- Fond `color-surface`, bordure 1px `color-border`, radius-md, padding space-8, shadow-sm
- Hover (si interactive) : shadow-md, transform translateY(-2px), transition 250ms ease-out
- Non-interactive : pas de hover effect, pas de cursor-pointer

**Card étape process :**
- Pas de fond plein — structure visuelle par les éléments internes (numéro, ligne de connexion, encadré livrable)
- Voir section "Section Steps" ci-dessous

**Card cas client (réalisations) :**
- Image en haut (ratio 16:9, object-fit: cover), fond `color-surface`, radius-md, overflow hidden
- Corps : padding space-6, badge secteur, titre, description courte, lien texte CTA contextuel
- Hover : shadow-md, transition 250ms

---

#### ACCORDION / FAQ

**Structure sémantique : `<details>/<summary>` natif ou composant JS avec aria-expanded.**

- Conteneur : bordure-top 1px `color-border` sur chaque item (pas de bordure globale box)
- Trigger (`<summary>` ou bouton) :
  - padding : space-6 vertical
  - texte : text-md, weight-medium, `color-text-primary`
  - icône : chevron down 16px `color-text-secondary`, rotation 180° à l'ouverture (transition 200ms ease-out)
  - hover : fond `color-surface-subtle`
  - focus-visible : ring interne
- Panneau :
  - padding : space-2 top + space-6 bottom + padding-inline du trigger
  - texte : text-base, `color-text-secondary`, leading-normal
  - animation ouverture : height 0 → auto + opacity 0 → 1, 250ms ease-out
  - Reduced motion : instantané (0ms)
- Dernier item : bordure-bottom 1px `color-border`

---

#### FORMULAIRE

**Champ texte (input + textarea) :**
- Fond `color-surface`, bordure 1px `color-border`, radius-sm, padding space-3 space-4, text-base
- Placeholder : `color-text-muted`
- Focus : bordure `color-accent`, shadow ring 0 0 0 3px `color-accent-subtle` (pas de glow agressif)
- Erreur : bordure `color-error`, fond `color-error-subtle` subtil (10% opacité max)
- Textarea : resize vertical uniquement, min-height ~80px

**Label :**
- text-sm, weight-medium, `color-text-primary`, display block, margin-bottom space-2
- Ne jamais remplacer le label par le placeholder (accessibilité)

**Message d'erreur :**
- text-sm, `color-error`, flex row avec icône warning 14px, margin-top space-2
- role="alert" ou aria-live="polite" pour annonce au lecteur d'écran

**Bouton de soumission :**
- Variante `btn-primary`, pleine largeur sur mobile
- Texte : "Envoyer ma demande →" ou "Réserver mon appel →"

**Mention RGPD :**
- text-xs, `color-text-muted`, margin-top space-3, liens cliquables (politique de confidentialité)

**Message de confirmation (post-envoi) :**
- Remplacement inline du formulaire ou bandeau discret en haut
- Fond `color-success-subtle`, bordure-left 3px `color-success`, padding space-4 space-6, radius-md
- Texte : text-base, `color-text-primary`

---

#### NAVIGATION

**Structure :**
```
<nav aria-label="Navigation principale">
  [Logo]                    [Offre] [À propos]       [btn-sm btn-primary]
                                                      "Réserver un appel →"
</nav>
```

**Comportement au repos (haut de page) :**
- Fond transparent sur `color-background`
- Logo : SVG couleur principale ou near-black
- Liens : text-base, `color-text-secondary`, hover `color-text-primary` (transition 150ms)
- CTA : `btn-sm btn-primary`

**Comportement au scroll (sticky) :**
- Position fixed top 0, z-index élevé
- Fond `color-surface` (blanc), border-bottom 1px `color-border`, backdrop-blur(8px) si fond transparent en dessous
- Transition : 250ms ease-out sur background, border, shadow
- shadow-xs une fois sticky

**Mobile (<640px) :**
- Logo + icône hamburger (24px, `color-text-primary`)
- Panel menu : overlay pleine hauteur, fond `color-surface`, animation slide-in depuis la droite (250ms)
- Ordre dans le panel : CTA primaire en premier (btn-primary pleine largeur), puis Offre, À propos
- Fermeture : clic sur ×, clic sur overlay, Escape
- Focus trap dans le panel ouvert (accessibilité)

---

#### FOOTER

**Structure :**
```
Fond color-footer-bg (#181815)

Colonne 1 : Logo + tagline courte (1 ligne)
Colonne 2 : Navigation secondaire (Offre, À propos, Contact)
Colonne 3 : CTA répété (btn-ghost-light "Réserver un appel découverte")

Séparateur horizontal color-border (version light, faible opacité)

Ligne bas : Copyright + Mentions légales | Politique de confidentialité | Cookies
```

**Typographie footer :**
- Liens : text-sm, `color-text-muted` (rgba white 0.5), hover rgba white 0.8 (transition 150ms)
- Tagline : text-sm, `color-text-muted`
- Légal : text-xs, `color-text-muted`
- Séparateur : 1px, rgba white 0.1

---

### SECTIONS (assemblages de composants)

---

#### SECTION HERO (Home)

**Layout :**
- Padding-top : hauteur nav + space-20 minimum (ne pas coller au header)
- Padding-bottom : space-24
- Fond : `color-background` (pas d'image, pas de gradient)
- Contenu : max-width 740px, left-aligned (pas centré — signal "prise de position", pas "présentation générique")

**Hiérarchie des éléments :**
1. **H1** (DM Serif Display, text-4xl mobile → text-5xl desktop) — `color-text-primary`
2. **Subhead** (DM Sans, text-md → text-lg, `color-text-secondary`) — margin-top space-6, max-width 600px
3. **Signal crédibilité** (encadré subtil ou texte mis en valeur) — margin-top space-8. Fond `color-surface-subtle`, padding space-4 space-6, radius-md, texte text-sm, `color-text-secondary`. Contenu : version placeholder du process ou engagement.
4. **CTAs** — margin-top space-10. Stack vertical mobile (gap space-4), horizontal desktop.
   - CTA primaire : `btn-lg btn-primary`
   - Microcopy sous CTA primaire
   - CTA secondaire : `btn-link`

**Pas d'illustration, pas de photo, pas d'élément distrayant.** L'UI se concentre sur le message.

---

#### SECTION SOLUTION / 3 PILIERS (Home §3, Offre §2)

**Layout :**
- Section padding standard
- Fond alterné : `color-surface-subtle` (pour différencier visuellement de la section précédente)
- Titre H2 centré en haut (DM Sans, text-2xl → text-3xl)
- Sous-texte intro centré, max-width 600px, text-md, `color-text-secondary`
- Grille cards : 1 colonne mobile, 3 colonnes desktop, gap space-6

**Chaque card pilier :**
- Icône 40px dans container 48px, fond `color-accent-subtle`, radius-full, margin-bottom space-4
- Titre H3 (text-xl, weight-semibold)
- Description (text-base, `color-text-secondary`)
- Liste de ce qui est inclus (text-sm, `color-text-secondary`, puce personnalisée en `color-accent`)
- Note "ce que ce n'est pas" (text-sm, italique, `color-text-muted`) — séparée visuellement par une bordure-top `color-border`

---

#### SECTION STEPS / PROCESS (Home §4, Offre §4)

**Mobile (vertical) :**
- Timeline colonne : ligne centrale 1px `color-border`, connecteur depuis chaque step marker
- Step marker : cercle 40px, fond `color-accent`, texte blanc, weight-semibold, text-lg
- Corps de chaque étape : margin-left depuis la timeline, titre H3 text-lg, description text-base `color-text-secondary`
- Encadré livrable : fond `color-surface-subtle`, radius-sm, padding space-3 space-4, text-sm, label "Livrable :" en weight-medium
- Badge temps : fond `color-accent-subtle`, texte `color-accent`, radius-xl, text-sm, padding space-1 space-3. Label "Votre temps :"

**Desktop (horizontal ou alternée) :**
- Si horizontale : numéros en haut, ligne de connexion horizontale, contenu en dessous
- Si alternée : image/marker gauche, contenu droite (pair) / contenu gauche, marker droite (impair)
- Même tokens visuels que mobile

**Encadré réassurance temps total :**
- Fond `color-surface`, bordure-left 3px `color-accent`, padding space-6 space-8, radius-md, shadow-sm
- Texte bold en haut "Au total :", suivi du détail. Mis en évidence après les 5 étapes.

---

#### SECTION POUR QUI / PAS POUR QUI (Home §5, Offre §5)

**Layout :**
- Fond `color-background` (pas de fond alterné ici — contraste avec la section précédente)
- Titre H2 centré ou aligné gauche
- Deux colonnes desktop (gap space-12), une colonne mobile (gap space-8)

**Colonne "Pour vous" :**
- Titre "C'est fait pour vous si…" (text-lg, weight-semibold, `color-text-primary`)
- Liste avec puce ✓ (SVG check circle 16px, `color-accent`)
- Items en text-base, `color-text-secondary`

**Colonne "Pas pour vous" :**
- Titre "Ce n'est pas pour vous si…" (text-lg, weight-semibold, `color-text-secondary`)
- Liste avec puce × (SVG x circle 16px, `color-text-muted`)
- Items en text-base, `color-text-muted`

Séparateur visuel entre colonnes sur desktop : ligne 1px `color-border` ou simple espacement.

---

#### SECTION CTA FINAL (Home §8, Offre §7)

**Layout :**
- Fond `color-surface-subtle` ou fond plein `color-accent` (option 2 : plus impactant, fond sombre)
- Option recommandée v1 : fond `color-surface-subtle` (sobre) avec bordure-top et bottom `color-border`
- Contenu centré, max-width 640px
- Titre H2 text-2xl → text-3xl
- Paragraphe de contexte (1-2 phrases max)
- CTA primaire `btn-lg`
- Microcopy sous CTA

**Si embed Calendly :**
- Espace réservé min-height 600px (variable selon le widget)
- Fond `color-surface`, radius-md, shadow-sm autour du widget
- Texte de fallback formulaire en `btn-link` sous le widget

**Si formulaire :**
- Fond `color-surface`, radius-md, padding space-8, shadow-sm, max-width 520px, centré
- Champs en stack vertical, bouton pleine largeur, microcopy RGPD

---

#### SECTION FAQ (Home §7, Offre §6)

**Layout :**
- Fond `color-background`
- Titre H2 + sous-texte intro optionnel
- Liste d'accordions : max-width 720px, centré ou aligné gauche selon le contexte
- Voir composant Accordion ci-dessus

---

### RÈGLES DE COMPOSITION PAR TYPE DE PAGE

**Home** : Alternance de fonds (background → surface-subtle → background → surface-subtle). Chaque section majeure a un fond visuellement distinct de sa voisine. Pas de fond surface-subtle sur deux sections consécutives.

**Offre** : Structure plus dense (davantage de listes, de détails), mais mêmes règles d'alternance. La section "Périmètre inclus/exclus" utilise un fond `color-surface` avec bordure pour se distinguer.

**Contact** : Maximalisme de l'espace vide. Fond `color-background` uniforme. Aucun élément de vente. Seules les sections fonctionnelles (titre, 3 blocs, formulaire/Calendly, réassurance).

**À propos** : Typographie plus narrative. La section "Ce qu'on ne fait pas" est un bloc de texte courant (pas de liste), ce qui tranche stylistiquement et signale le choix intentionnel.

**Pages légales** : Layout simple 1 colonne, max-width 720px, padding standard. Pas de sidebar. Fond `color-background`. H1 + H2 pour les sections. Text-base, `color-text-secondary`. Liens retour vers Home.

---

## C. PREMIUM EFFECTS STRATEGY

---

### Niveau d'ambition

**Premium discret** — conforme aux contraintes du brief.

Le référentiel : un cabinet de conseil senior n'a pas d'animations spectaculaires sur son site. Il a une exécution irréprochable, des transitions fluides, et un soin évident sur les détails. C'est le signal de premium visé ici.

Corollaire : chaque effet qui attire l'attention sur lui-même plutôt que sur le contenu est par définition un mauvais effet pour ce projet.

---

### 3 Signature Moments

Ces trois moments sont les seuls où une animation dépasse les micro-interactions de base. Ils sont définis, documentés, et leur coût est maîtrisé.

**Moment 1 — Hero entrance**
*Où :* Section Hero de la Home (et des pages) au chargement initial.
*Quoi :* H1 apparaît mot par mot en stagger (chaque mot : fade-in + translateY(8px) → translateY(0)), durée par mot ~60ms, délai entre mots ~40ms. Durée totale H1 : 400–500ms. Subhead : fade-in simple, délai de 200ms après fin du H1. Signal crédibilité + CTAs : fade-in, délai 400ms.
*Pourquoi :* Signale la qualité d'exécution dès les premières secondes. Donne l'impression que le site "prend soin" de ses messages. Pas spectaculaire, mais mémorable dans le bon sens.
*Coût :* CSS animations ou JS minimal (IntersectionObserver pas nécessaire ici — triggered au load). Budget impact : négligeable.
*Fallback reduced motion :* Suppression complète — tout apparaît instantanément sans animation.

**Moment 2 — Scroll reveal des blocs de contenu**
*Où :* Sections piliers (cards), étapes process, section Pour qui/Pas pour qui.
*Quoi :* Chaque card ou bloc entre par : translateY(16px) → translateY(0) + opacity 0 → 1. Durée 350ms, ease-out. Stagger de 80ms entre les cards d'une même ligne.
*Pourquoi :* Structure visuelle la lecture — les éléments apparaissent dans l'ordre de lecture, guidant l'attention. Signal de qualité d'exécution.
*Coût :* IntersectionObserver natif. CSS animations. Budget impact : négligeable si `will-change` utilisé avec parcimonie.
*Fallback reduced motion :* Suppression complète — tous les éléments visibles d'emblée.

**Moment 3 — Navigation sticky transition**
*Où :* Header global au scroll.
*Quoi :* Au dépassement de ~80px de scroll : transition de fond transparent → fond `color-surface` avec border-bottom `color-border` + shadow-xs. Transition 250ms ease-out.
*Pourquoi :* Signal de qualité d'exécution. Crée un sentiment de "site bien fait" dès les premières secondes de scroll. Différencie des sites qui ont une nav qui "saute" brusquement.
*Coût :* CSS transitions + 1 class toggle au scroll (ResizeObserver ou scroll event throttlé). Négligeable.
*Fallback reduced motion :* Transition instantanée (0ms) — pas de suppression, juste synchrone.

---

### Effets autorisés

| Effet | Contexte | Durée | Note |
|-------|----------|-------|------|
| Fade-in + translateY (scroll reveal) | Cards, blocs de section | 350ms | Signature Moment 2 |
| Stagger reveal (hero, cards) | Hero, grilles | 60–80ms par item | Signature Moment 1 + 2 |
| Hover card elevation | Cards interactives | 250ms | transform translateY(-2px) + shadow-md |
| Hover CTA couleur | Tous les boutons | 200ms | Couleur uniquement, pas de transform |
| Hover lien flèche | btn-link | 200ms | translate flèche de 2px |
| Accordion height | FAQ | 250ms ease-in-out | height + opacity |
| Nav sticky | Header | 250ms | Signature Moment 3 |
| Focus states | Tous les interactifs | 150ms | ring focus-visible |
| Confirmation formulaire | Post-submit | 300ms fade-in | Message inline |

---

### Effets à éviter (liste bloquante)

| Effet | Raison |
|-------|--------|
| Parallax (fond, sections) | Coût perf, nausée mobile, hype 2015, aucune valeur business ici |
| Typing / typewriter effect | Cliché 2020, distrait du message, ralentit la lecture |
| Particle systems, canvas animé | Coût technique élevé, zéro valeur business, look "agence débutante" |
| Gradient bleu → violet sur hero | Cliché agence digitale — interdit explicitement dans le brief |
| Animated gradient de fond | Même raison |
| Curseur personnalisé | Perturbant, inutile, désactive les comportements attendus |
| Loading screen / splash | Friction supplémentaire sans justification |
| Video autoplay en fond de hero | Consommation réseau, distraction du message, difficulté d'accessibilité |
| Scroll hijacking | Désorientation utilisateur, nausée, pénalité Core Web Vitals |
| Lottie/animations complexes en fond | Coût réseau + JS, maintenance, pas de valeur différenciante ici |
| Infinite ticker de logos clients | Si 0 logos clients = signal creux. Si logos disponibles = acceptable mais non prioritaire. |
| Cards 3D flip | Cliché 2019, distrait, nausée |
| Hover zoom excessif sur images | Déplaçant, distraction |
| Counter animations (chiffres qui s'incrémentent) | Aucun chiffre disponible en v1. Et même avec des chiffres : distraction > valeur |

---

### Décision 3D

**Illusion de profondeur (oui, parcimonieusement) :**
- Via shadows multi-couches sur les cards
- Via micro hover sur les cards (translateY -2px)
- Via le blanc du fond `color-surface` sur le fond `color-background` — crée naturellement une hiérarchie de profondeur sans aucun effet

**3D réelle (WebGL, Three.js, CSS 3D flip) : NON pour ce projet.**

Justification :
- Aucune valeur business identifiable dans une offre B2B de services digitaux pour PME
- Coût de maintenance : élevé, sans retour
- Coût perf : impacte LCP et INP sur mobile (audience cible probable)
- Signal paradoxal : une 3D gadget sur un site qui vend "business-first, pas gadget" est contradictoire
- Si les réalisations incluent des projets avec 3D à terme : documenter le cas et réévaluer en v2

**Quand une vraie 3D serait justifiée (pour référence future) :**
- Démonstration d'un produit physique ou logiciel 3D dans le portfolio
- Section "démo interactive" d'une réalisation spécifique
- Si le brief client final l'exige ET que la valeur est prouvable

---

### Fallback reduced motion

**Ce qui disparaît entièrement :**
- Stagger word reveal sur le hero
- Scroll reveal (fade-in + translateY) sur les sections
- Hover transform translateY des cards
- Hover translate de la flèche sur les liens

**Ce qui reste (transitions essentielles à la compréhension) :**
- Transitions de couleur sur hover des CTA et liens (200ms → acceptable)
- Accordion open/close (height → instantané, mais le changement d'état visuel reste)
- Navigation sticky background change (instantané)
- Focus states (ring → toujours présent, sans animation)
- Messages de confirmation formulaire (apparition instantanée)

**Implémentation :**
```css
@media (prefers-reduced-motion: reduce) {
  /* Désactiver toutes les animations déclaratives */
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
  /* Exceptions : transitions de couleur CTA et accordion */
  .btn-primary, .btn-ghost, .btn-link {
    transition-duration: 0.2s !important; /* couleur uniquement */
  }
  .accordion-panel {
    transition-duration: 0s !important; /* instantané */
  }
}
```

---

## D. CHECKLIST "PRÊT POUR TECH"

---

### Liste des composants à intégrer

**Globaux (toutes les pages) :**
- [ ] Navigation sticky (logo + 2 liens + CTA compact)
- [ ] Menu mobile (hamburger + overlay + focus trap)
- [ ] Footer (logo + liens + CTA ghost light + légal)
- [ ] Bouton primary (3 tailles, 4 états)
- [ ] Bouton ghost (3 états)
- [ ] Bouton ghost-light / footer (3 états)
- [ ] Lien texte avec flèche (2 états)
- [ ] Badge / tag (accent + neutral)
- [ ] Focus states global

**Home :**
- [ ] Section Hero (H1 DM Serif + subhead + signal crédibilité + 2 CTAs + microcopy)
- [ ] Section Problem echo (texte + liste 5 items)
- [ ] Section 3 piliers (grille 1→3 col, 3 cards avec icône + liste inclus + note exclusion)
- [ ] Section Process timeline (5 étapes, markers numérotés, encadré livrable, badge temps) — VERSION PLACEHOLDER
- [ ] Section Pour qui / Pas pour qui (2 colonnes, 2 listes, puces distinctives)
- [ ] Section Réalisations placeholder (texte + CTA — version B copy v1)
- [ ] Section FAQ accordion (6 items minimum)
- [ ] Section CTA final (titre + texte + embed Calendly OU formulaire fallback)

**Page Offre :**
- [ ] Section Hero Offre (H1 + subhead + CTA)
- [ ] Section 3 piliers détail (variante étendue avec liste complète)
- [ ] Section Inclus / Exclus (2 listes côte à côte, puces couleur distinctes)
- [ ] Section Process en détail (stepper 5 étapes + encadré réassurance temps)
- [ ] Section Pour qui / Pas pour qui (variante détaillée)
- [ ] Section FAQ objections offre (6 items)
- [ ] Section CTA final offre

**Page Contact :**
- [ ] Section Hero Contact (H1 minimal + subhead réassurance)
- [ ] Section "Ce qui se passe" (3 blocs numérotés)
- [ ] Widget Calendly (espace réservé variable)
- [ ] Formulaire fallback Contact (3 champs, bouton, RGPD, microcopy erreur, confirmation)
- [ ] Section réassurance (3 points courts)

**Page À propos :**
- [ ] Section Hero À propos (H1 éditorial)
- [ ] Section Pourquoi cette approche (texte narratif + liste observatoire)
- [ ] Section Qui on est (layout photo+texte, PLACEHOLDER photo fondateur)
- [ ] Section Ce qu'on ne fait pas (texte courant, pas de liste)
- [ ] Section CTA

**Formulaires transversaux :**
- [ ] Formulaire audit CTA secondaire (2 champs : email + URL site)
- [ ] Tous les états erreur des formulaires (field-level + message alert)
- [ ] Tous les messages de confirmation (inline)

**Pages légales :**
- [ ] Layout pages légales (simple, max-width 720px)
- [ ] Mentions légales — contenu à rédiger
- [ ] Politique de confidentialité — contenu à rédiger
- [ ] Page cookies si tracking actif

---

### Liste des effets + contraintes (perf budget)

| Effet | Composant | Implémentation | Contrainte |
|-------|-----------|----------------|------------|
| Hero word stagger | Section Hero | CSS animation ou GSAP léger | Déclenché au load. Durée < 600ms. Désactiver si reduced motion. LCP ne doit pas être impacté (H1 doit être dans le DOM sans attente). |
| Scroll reveal blocks | Cards piliers, étapes process | IntersectionObserver + CSS class toggle | Pas de `will-change: transform` global. Uniquement sur éléments en dehors du viewport initial. Threshold : 0.1. Désactiver si reduced motion. |
| Nav sticky transition | Header | Scroll event + CSS class toggle | Throttle à 16ms (rAF). CSS transition uniquement sur background/border/shadow. Pas de reflow. |
| Card hover elevation | Cards interactives | CSS :hover + transition | transform + box-shadow uniquement. Pas de JS. Durée 250ms. |
| Accordion | FAQ | CSS ou minimal JS | aria-expanded obligatoire. Si CSS only (<details>): tester accessibilité claviers. Height animation ou clip-path. |
| Focus rings | Tous interactifs | CSS :focus-visible | Jamais supprimer outline sans remplacement. |
| Formulaire confirmation | Post-submit | JS insert DOM ou CSS class toggle | Transition fade-in 300ms. |

**Performance budget cibles :**
- LCP < 2.5s sur connexion 4G simulée
- CLS < 0.1 (éviter tout reflow au scroll reveal — utiliser opacity + transform uniquement)
- FID/INP < 100ms
- Total JS bundle (hors Calendly) : < 50KB gzipped recommandé
- Fonts : préchargement des deux fonts (DM Serif Display et DM Sans) — 2 weights max chacune pour limiter le téléchargement

---

### Liste des assets à produire

| Asset | Usage | Format | Dimensions / Specs |
|-------|-------|--------|--------------------|
| Logo agence | Nav + footer + OG | SVG (principal) + PNG @2x | SVG vectoriel. Versions : dark (sur fond clair) + light (sur fond sombre). Fond transparent. |
| Favicon | Onglet browser | ICO + PNG 32×32 + SVG favicon + Apple Touch 180×180 | Icône simple reconnaissable en 16px |
| Open Graph image — Home | Partage social/LinkedIn | JPEG ou PNG | 1200×630px. Branding cohérent. Pas de stock photo. |
| Open Graph image — Offre | Partage social | JPEG ou PNG | 1200×630px |
| Open Graph image — Contact | Partage social | JPEG ou PNG | 1200×630px |
| Photo fondateur | Page À propos | WebP + JPEG fallback | Min 800×800px, ratio 1:1 ou 3:4. Portrait sobre, fond neutre. |
| Icône pilier 1 (Site/Conversion) | Cards piliers | SVG | 40×40px, stroke 2px, style Lucide/Phosphor |
| Icône pilier 2 (Automatisation) | Cards piliers | SVG | 40×40px |
| Icône pilier 3 (IA concrète) | Cards piliers | SVG | 40×40px |
| Icônes contact (3 blocs numérotés) | Page Contact §2 | SVG optionnel | 32×32px si utilisées |
| Captures réalisations (future v2) | Section Réalisations | WebP + JPEG | 800×450px (16:9), max 80KB chacune |
| Screencast/gif flux automatisé | FAQ IA + Section pilier 3 | WebM + GIF fallback | Max 800px large, max 1MB. Subtitres recommandés (accessibilité). |

---

### Notes d'intégration

**CMS / Édition :**
Les zones éditables post-livraison identifiées (FAQ, témoignages, mini-cas, textes simples) doivent être structurées pour l'édition sans accès au code. Le tech agent devra choisir une solution d'édition adaptée (voir contraintes ci-dessous).

**Calendly :**
L'embed est le composant le plus lourd de la page Contact (~100–200KB). Prévoir un lazy-load du widget (ne charge le script Calendly qu'au scroll into view ou au clic sur un bouton "Choisir un créneau"). Fallback formulaire natif si le script ne charge pas.

**RGPD / Tracking :**
Tout tracking (GA4, Hotjar, Clarity) doit être conditionnel au consentement. La banner de consentement fait partie du périmètre technique — son design doit respecter les tokens du design system (pas de widget tiers sans restyle).

---

## EXIGENCES POUR STACK

*Résumé technique transmis à l'agent vitrine-tech-stack :*

**Performance :**
- LCP < 2.5s, CLS < 0.1, INP < 100ms — non négociables
- Fonts : DM Serif Display + DM Sans — self-hosted recommandé (éviter dépendance Google Fonts en production) ou variable font si disponible. Préchargement obligatoire des 2 fonts principales.
- Images : WebP obligatoire, lazy loading sauf hero, srcset pour responsive
- JS bundle (hors Calendly) < 50KB gzipped
- Calendly : lazy-load du script au clic/scroll

**Motion :**
- IntersectionObserver natif (pas de lib lourde type AOS)
- CSS transitions pour hover et états
- `@media (prefers-reduced-motion: reduce)` implémenté globalement
- Aucun scroll-jacking, aucun parallax

**3D :**
- Aucune dépendance 3D (pas de Three.js, pas de WebGL)
- Profondeur via CSS shadows uniquement

**CMS / Édition :**
- Zones éditables identifiées : FAQ (6 items), mini-cas clients (3 items), témoignages (à venir), textes de sections clés (process 5 étapes)
- Contrainte : édition sans accès au code obligatoire pour ces zones
- Zones non éditables (à cadrer) : structure des pages, CTAs, tokens de design, hiérarchie des sections

**Intégrations :**
- Calendly (ou équivalent) — embed widget, lazy-load
- Tracking GA4 — événements custom listés dans le pack stratégie (14 événements)
- Outil consentement RGPD (banner + gestion du consentement)
- Formulaire : soit natif (avec envoi email backend ou service type Resend/Postmark), soit outil type Tally/Typeform en iframe (à décider selon stack)

**Accessibilité (exigences minimales transmises au tech) :**
- HTML sémantique strict (H1 unique, Hn logique, nav avec aria-label, main)
- Accordion : aria-expanded + keyboard nav
- Formulaires : labels liés, messages d'erreur en aria-live
- Focus states visibles partout
- `<html lang="fr">`
- Alt textes sur toutes les images fonctionnelles

---

*Fin du Design System v1 — SITE TEST*
*Prêt pour Gate 5 (Tech) sous réserve de fourniture des assets logo et photo fondateur.*
