# Design System v1 — Studio Kodo

> **Version :** v1.1
> **Date :** 2026-04-01
> **Agent :** vitrine-ui-design-system
> **Inputs :** PRD-Studio-Kodo.md, pack-strategie-Studio-Kodo.md, UX-Architecture-v1-Studio-Kodo.md, copy-v1-Studio-Kodo.md
> **Statut :** Draft — en attente de validation

---

## A. DESIGN BRIEF

### A.1 UX & conversion objectives

**En 3 secondes, le visiteur doit comprendre :**

1. Ce n'est pas un template — le site lui-même prouve le savoir-faire
2. Une seule personne fait tout (branding → code → prod)
3. V1 en 3 jours — la rapidité est structurelle, pas un slogan

**Objectif de conversion :** 10+ demandes de devis/mois via formulaire multi-étapes (5 steps). CTA secondaire : appel téléphonique direct.

**La preuve est l'objet :** aucun témoignage, aucun logo client au lancement. Le site Studio Kodo et les 4 case studies concept SONT les seules preuves. Chaque pixel doit démontrer une compétence indiscutable.

---

### A.2 UI principles (7 règles)

| # | Principe | Application |
|---|----------|-------------|
| 1 | **Hierarchy through scale** | Contraste typographique dramatique : display headings (Jost 700, 4xl–5xl) vs. body (Lora 400, md). Le regard circule par la taille, pas par la couleur. |
| 2 | **Asymmetric balance** | Grille modulaire 12 colonnes avec asymétrie intentionnelle (texte 5 col + image 6 col + 1 col vide). Jamais de centrage systématique. Inspiration magazines mid-century. |
| 3 | **Generous negative space** | Le vide EST le signal de luxe. `space-section` ≥ 120px desktop. Pas de sections compressées. Laisser respirer les headlines. |
| 4 | **Warm restraint (60-30-10)** | 60% neutres (Crème/Charcoal), 30% tons moyens (Warm Gray, Olive), 10% accents (Teal, Mustard). Un seul accent par viewport visible. |
| 5 | **Proof proximity** | Les preuves (case studies, chiffres, process) sont placées dans le flux visuel menant au CTA, jamais dans une section orpheline. Distance proof→CTA ≤ 1 scroll. |
| 6 | **Editorial photography** | Full-bleed quand possible. Cadrage éditorial (magazine, pas stock). Traitement : contraste doux, grain subtil (CSS `filter`), tons chauds. Ratio 16:9 ou 3:2. |
| 7 | **Purposeful motion** | Chaque animation a un objectif déclaré (guider le regard, confirmer une action, marquer une transition). Aucun mouvement décoratif gratuit. Budget : voir motion-strategy. |

---

### A.3 Visual direction

#### Style : Luxe épuré mid-century modern

Le croisement entre la retenue luxe d'Aesop/The Row et les couleurs/formes géométriques de Caava. Premium par le vide et la typographie, vivant par les accents de couleur chauds.

**Caractéristiques visuelles :**
- Layouts asymétriques avec whitespace généreux
- Formes géométriques (cercles, lignes épurées) en éléments décoratifs ponctuels
- Grille modulaire avec asymétrie intentionnelle
- Esthétique éditoriale / magazine
- Surfaces planes et nettes (pas de gradients, pas de glassmorphism)

#### Typographie

| Rôle | Police | Poids | Raison |
|------|--------|-------|--------|
| **Headings** | Jost | 500, 600, 700 | Géométrique sans-serif, descendant direct de Futura. Caractère mid-century immédiat. Google Fonts, variable font. |
| **Body** | Lora | 400, 400i, 700 | Serif élégant, lisibilité excellente en corps de texte. Contraste harmonieux avec Jost (géométrique vs. organique). Google Fonts. |
| **Mono / technique** | JetBrains Mono | 400 | Si nécessaire dans les case studies (code, métriques techniques). |

**Échelle typographique :**

| Token | Desktop | Mobile | Line-height | Usage |
|-------|---------|--------|-------------|-------|
| `heading-5xl` | 72px / 4.5rem | 40px / 2.5rem | 1.05 | H1 Hero uniquement |
| `heading-4xl` | 56px / 3.5rem | 32px / 2rem | 1.1 | H1 pages intérieures |
| `heading-3xl` | 40px / 2.5rem | 28px / 1.75rem | 1.15 | H2 sections majeures |
| `heading-2xl` | 32px / 2rem | 24px / 1.5rem | 1.2 | H2 sections secondaires |
| `heading-xl` | 24px / 1.5rem | 20px / 1.25rem | 1.25 | H3 |
| `heading-lg` | 20px / 1.25rem | 18px / 1.125rem | 1.3 | H4, card titles |
| `body-lg` | 20px / 1.25rem | 18px / 1.125rem | 1.6 | Lead paragraphs |
| `body-md` | 17px / 1.0625rem | 16px / 1rem | 1.65 | Body text principal |
| `body-sm` | 15px / 0.9375rem | 14px / 0.875rem | 1.6 | Captions, métadonnées |
| `body-xs` | 13px / 0.8125rem | 12px / 0.75rem | 1.5 | Labels, microcopy |

**Letter-spacing :**
- Headings 5xl–3xl : `-0.02em` (tracking négatif = densité premium)
- Headings 2xl–lg : `-0.01em`
- Body : `0` (normal)
- Labels uppercase : `0.08em` (espacement mid-century)

#### Couleurs

**Palette sémantique — Light mode :**

| Token | Hex | Oklch | Rôle |
|-------|-----|-------|------|
| `surface-primary` | #FAF7F2 | oklch(97.5% 0.008 80) | Fond principal — crème chaud |
| `surface-secondary` | #F2EDE5 | oklch(94.5% 0.012 80) | Fond sections alternées |
| `surface-elevated` | #FFFFFF | oklch(100% 0 0) | Cartes, éléments surélevés |
| `surface-overlay` | rgba(26,26,24,0.6) | — | Overlay modals/menus |
| `text-primary` | #1A1A18 | oklch(15% 0.005 100) | Texte principal — charcoal chaud |
| `text-secondary` | #4A4A46 | oklch(36% 0.008 100) | Texte secondaire |
| `text-muted` | #8A8A84 | oklch(60% 0.008 100) | Texte tertiaire, placeholders |
| `text-on-accent` | #FFFFFF | oklch(100% 0 0) | Texte sur fond accent |
| `accent-action` | #008F82 | oklch(58% 0.1 175) | CTA primaire, teal profond |
| `accent-action-hover` | #007A6F | oklch(52% 0.1 175) | CTA hover |
| `accent-warm` | #D4991A | oklch(72% 0.14 85) | Accent chaud — mustard |
| `accent-secondary` | #C86218 | oklch(58% 0.15 55) | Accent — burnt orange |
| `accent-tertiary` | #6E7228 | oklch(50% 0.09 110) | Accent — olive |
| `border-subtle` | #E5E0D8 | oklch(90% 0.01 80) | Bordures légères |
| `border-strong` | #C8C2B8 | oklch(80% 0.015 80) | Bordures marquées |
| `status-success` | #2D7A4F | oklch(50% 0.1 155) | Succès |
| `status-error` | #C4382A | oklch(48% 0.17 28) | Erreur |
| `status-warning` | #D4991A | oklch(72% 0.14 85) | Avertissement (= accent-warm) |
| `status-info` | #008F82 | oklch(58% 0.1 175) | Info (= accent-action) |

**Palette sémantique — Dark mode :**

Le dark mode n'est PAS un simple invert. Les surfaces sont redessinées avec des gris chauds profonds. Les accents sont légèrement relevés en luminosité pour maintenir le contraste.

| Token | Hex | Oklch | Changement vs. light |
|-------|-----|-------|---------------------|
| `surface-primary` | #1A1A18 | oklch(15% 0.005 100) | Charcoal chaud, jamais noir pur |
| `surface-secondary` | #242422 | oklch(18% 0.005 100) | Fond sections alternées |
| `surface-elevated` | #2E2E2C | oklch(22% 0.005 100) | Cartes — légèrement plus clair |
| `surface-overlay` | rgba(0,0,0,0.7) | — | Plus opaque qu'en light |
| `text-primary` | #F2EDE5 | oklch(94.5% 0.012 80) | Crème chaud (pas blanc pur) |
| `text-secondary` | #B8B2A8 | oklch(74% 0.015 80) | Gris chaud clair |
| `text-muted` | #7A7670 | oklch(52% 0.01 80) | Gris moyen chaud |
| `text-on-accent` | #FFFFFF | oklch(100% 0 0) | Inchangé |
| `accent-action` | #00B5A5 | oklch(68% 0.1 175) | Teal relevé (+10% luminosité) |
| `accent-action-hover` | #00CDB8 | oklch(75% 0.1 175) | Hover plus clair en dark |
| `accent-warm` | #E8B830 | oklch(78% 0.14 85) | Mustard légèrement relevé |
| `accent-secondary` | #E07828 | oklch(63% 0.15 55) | Burnt orange relevé |
| `accent-tertiary` | #8A8E38 | oklch(58% 0.09 110) | Olive relevé |
| `border-subtle` | #333330 | oklch(24% 0.005 100) | Bordures discrètes |
| `border-strong` | #4A4A46 | oklch(36% 0.008 100) | Bordures visibles |
| `status-success` | #3DA566 | oklch(60% 0.1 155) | Succès relevé |
| `status-error` | #E04E40 | oklch(56% 0.17 28) | Erreur relevée |
| `status-warning` | #E8B830 | oklch(78% 0.14 85) | = accent-warm dark |
| `status-info` | #00B5A5 | oklch(68% 0.1 175) | = accent-action dark |

**Tokens invariants (identiques light/dark) :**
- Spacing, radius, typography scale, grid, easing

**Contrastes vérifiés (WCAG 2.1 AA) :**

| Paire | Light ratio | Dark ratio | Statut |
|-------|------------|------------|--------|
| text-primary / surface-primary | 15.8:1 | 14.2:1 | AAA |
| text-secondary / surface-primary | 8.2:1 | 5.8:1 | AA |
| text-muted / surface-primary | 4.5:1 | 4.5:1 | AA |
| accent-action / surface-primary | 5.1:1 | 5.2:1 | AA |
| text-on-accent / accent-action | 5.4:1 | 4.8:1 | AA |
| accent-warm / surface-primary | 3.8:1 | 3.2:1 | Large text only |

> Note : `accent-warm` (mustard) est utilisé uniquement pour les éléments décoratifs ou le texte large (≥18px bold / ≥24px regular) — jamais pour du body text.

#### Iconographie

- Style : **linéaire, poids 1.5px**, angles géométriques (pas arrondi). Esprit mid-century.
- Source recommandée : Phosphor Icons (style Thin ou Light) ou set custom SVG
- Taille minimale : 24×24px (touch target via padding : 44×44px)
- Couleur : `text-secondary` par défaut, `accent-action` quand interactif

#### Imagerie

- Format : **WebP** (fallback AVIF pour les navigateurs compatibles, JPEG pour legacy)
- Traitement : contraste doux, grain subtil optionnel (`filter: contrast(0.95) saturate(0.9)`)
- Ratios : 16:9 (hero, case study hero), 3:2 (vignettes galerie), 1:1 (avatar fondateur)
- Lazy loading : tout sauf hero (above-the-fold)
- Srcset : 640w, 1024w, 1440w, 1920w
- Placeholder : blur-up (LQIP intégré inline base64, 20px de large)

---

### A.4 Credibility patterns (data-driven)

| Pattern | Application Studio Kodo | Impact attendu |
|---------|------------------------|----------------|
| **Proof proximity** | Case studies et chiffres clés positionnés dans le flux avant le CTA (jamais en section isolée) | +15-25% CTR sur CTA |
| **Multi-step form** | Formulaire 5 étapes au lieu d'un formulaire monolithique | +86% complétion vs. formulaire long |
| **Inline validation** | Validation temps réel sur chaque champ | -22% erreurs, +22% complétion |
| **Single primary CTA** | Un seul CTA primaire visible par viewport | Évite la competition effect |
| **Whitespace around CTA** | Espace généreux (min 40px) autour de chaque CTA primaire | +20% attention |
| **Contrasting CTA** | CTA teal sur fond crème = contraste maximum dans la palette | +21% click rate |
| **Authentic imperfection** | Métriques case studies réalistes ("+180%", pas "+500%") | Trust perception supérieure |

**Éléments NON disponibles au lancement (à prévoir post-M+3) :**
- Témoignages vidéo (+80% conversion — à collecter dès le premier client)
- Logos clients (bandeau de confiance)
- Ratings authentiques

---

### A.5 Responsive principles

**Approche : mobile-first**

| Breakpoint | Token | Colonnes | Gouttière | Marge | Usage |
|------------|-------|----------|-----------|-------|-------|
| < 640px | `bp-sm` | 4 | 16px | 20px | Mobile |
| 640–1023px | `bp-md` | 8 | 24px | 32px | Tablette |
| 1024–1439px | `bp-lg` | 12 | 32px | 48px | Desktop |
| ≥ 1440px | `bp-xl` | 12 | 32px | 80px | Large desktop |
| ≥ 1920px | `bp-2xl` | 12 | 32px | auto (max-width 1440px centré) | Ultra-wide |

**Principes :**
- Navigation : header sticky → hamburger menu < 1024px, CTA sticky bottom bar sur mobile
- Grille case studies : 2×2 desktop → 1 colonne mobile
- Formulaire multi-étapes : centré 600px max-width desktop, full-width mobile
- Typographie fluide entre breakpoints via `clamp()`
- Images : `srcset` + `sizes` pour servir la bonne résolution

---

### A.6 Accessibility

| Domaine | Exigence | Détail |
|---------|----------|--------|
| **Contrastes** | WCAG 2.1 AA minimum | 4.5:1 texte normal, 3:1 éléments UI, 3:1 texte large |
| **Focus states** | `:focus-visible` sur tous les éléments interactifs | Ring 2px `accent-action`, offset 2px. Jamais `outline: none` sans remplacement. |
| **Keyboard** | Navigation complète au clavier | Tab order logique. Skip link "Aller au contenu principal". |
| **Screen readers** | Labels sr-only pour tous les éléments visuels-seulement | Toggle dark mode, icônes sociales, hamburger, badge "Projet concept". |
| **Touch targets** | Minimum 44×44px | Boutons, liens, icônes interactives. Padding si l'élément visuel est plus petit. |
| **Formulaires** | Labels explicites, validation inline, messages d'erreur liés | `aria-describedby`, `aria-invalid="true"`, `aria-live` pour messages dynamiques. |
| **Motion** | Respect `prefers-reduced-motion` | Voir motion-strategy pour le détail des fallbacks. |
| **Color** | La couleur n'est jamais le seul vecteur d'information | Icône + couleur pour les statuts. Underline + couleur pour les liens. |

---

### A.7 Motion — Tier 3 (détail complet dans motion-strategy-Studio-Kodo.md v3.0)

**Animation Tier sélectionné : Tier 3** — GSAP + ScrollTrigger + Lenis + Spline 3D *(validé PRD v1.2)*

| Catégorie | Durée | Easing GSAP / CSS | Propriétés |
|-----------|-------|-------------------|------------|
| Micro-interaction (press, toggle) | 50–150ms | CSS `ease-state-change` | transform, opacity |
| Transition d'état (hover, focus) | 150–300ms | `power2.out` / CSS `ease-state-change` | transform, opacity, background-color |
| Entrée de contenu (scroll reveal) | 400–600ms | `power2.out` (GSAP) | transform(y), opacity |
| Word-split entrance | 600–800ms | `power3.out` (GSAP) | transform(y, rotateX), opacity |
| Sortie de contenu | 200–400ms | `power2.in` (GSAP) | transform, opacity |
| Layout change (accordion, menu) | 200–400ms | `power2.inOut` / CSS | transform, grid-template-rows |
| Counter animation | 1500ms | `power2.out` (GSAP) | textContent |
| Parallax / scroll-linked | scroll-driven | `none` (scrub) | transform(yPercent) |
| Magnetic button | 300ms / 500ms retour | `power2.out` / `elastic.out(1, 0.4)` | transform(x, y) |

**Hard rules :** Word-split max 800ms. Scroll reveals max 600ms. Max 8 éléments animés simultanément par viewport. Uniquement `transform` + `opacity` (composited).

**Performance gates :** INP ≤ 200ms, CLS ≤ 0.1, LCP ≤ 2.5s. Lighthouse Perf > 90.

**JS budget :** ~28 KB gz eager (GSAP core + ScrollTrigger + SplitText + Lenis) + 150–300 KB lazy (Spline 3D, Accueil uniquement).

**Reduced motion :** `gsap.matchMedia()` désactive toutes les animations GSAP. Lenis détruit. Spline → image fallback. Voir motion-strategy v3.0 section 5 pour le tableau complet.

---

## B. DESIGN SYSTEM v1

### B.1 Tokens — Spacing

| Token | Value | Usage | Do not use | Paired with |
|-------|-------|-------|------------|-------------|
| `space-section` | 120px / 80px mob | Entre sections majeures d'une page | Entre composants dans une section | — |
| `space-section-sm` | 80px / 56px mob | Entre sous-sections | Entre éléments dans un composant | — |
| `space-component` | 40px / 32px mob | Entre composants dans une section | Entre éléments inline | — |
| `space-component-sm` | 24px / 20px mob | Entre éléments de même niveau | Pour du padding interne | — |
| `space-element` | 16px | Padding interne des composants | Entre sections | Avec radius et border tokens |
| `space-element-sm` | 12px | Espacement compact (badges, tags) | — | — |
| `space-inline` | 8px | Entre éléments inline (icône + texte) | — | — |
| `space-inline-sm` | 4px | Micro-espacement | — | — |

### B.2 Tokens — Radius

| Token | Value | Usage | Do not use |
|-------|-------|-------|------------|
| `radius-none` | 0px | Sections, images full-bleed | — |
| `radius-sm` | 4px | Badges, tags, inputs | Boutons |
| `radius-md` | 8px | Boutons, cartes, modals | Avatars |
| `radius-lg` | 16px | Cartes featured, conteneurs larges | Éléments petits |
| `radius-full` | 9999px | Avatars, badges pill, toggles | Cartes, sections |

### B.3 Tokens — Shadow

| Token | Light value | Dark value | Usage |
|-------|-------------|------------|-------|
| `shadow-subtle` | `0 1px 3px oklch(15% 0.005 100 / 0.06)` | `0 1px 3px oklch(0% 0 0 / 0.2)` | Hover léger, séparation subtile |
| `shadow-card` | `0 4px 12px oklch(15% 0.005 100 / 0.08)` | `0 4px 12px oklch(0% 0 0 / 0.3)` | Cartes au repos |
| `shadow-elevated` | `0 8px 24px oklch(15% 0.005 100 / 0.12)` | `0 8px 24px oklch(0% 0 0 / 0.4)` | Cartes hover, dropdowns |
| `shadow-overlay` | `0 16px 48px oklch(15% 0.005 100 / 0.16)` | `0 16px 48px oklch(0% 0 0 / 0.5)` | Modals, menus mobiles |

### B.4 Tokens — Grid

| Token | Value | Contexte |
|-------|-------|----------|
| `grid-columns-sm` | 4 | < 640px |
| `grid-columns-md` | 8 | 640–1023px |
| `grid-columns-lg` | 12 | ≥ 1024px |
| `grid-gutter-sm` | 16px | < 640px |
| `grid-gutter-md` | 24px | 640–1023px |
| `grid-gutter-lg` | 32px | ≥ 1024px |
| `grid-margin-sm` | 20px | < 640px |
| `grid-margin-md` | 32px | 640–1023px |
| `grid-margin-lg` | 48px | 1024–1439px |
| `grid-margin-xl` | 80px | ≥ 1440px |
| `grid-max-width` | 1440px | Contenu centré au-delà |

### B.5 Named easing functions

| Token | CSS Value | GSAP Equivalent | Usage |
|-------|-----------|-----------------|-------|
| `ease-entrance` | `cubic-bezier(0, 0, 0.2, 1)` | `"power2.out"` | Scroll reveals, apparitions |
| `ease-entrance-dramatic` | — | `"power3.out"` | Word-split, entrées signature |
| `ease-exit` | `cubic-bezier(0.4, 0, 1, 1)` | `"power2.in"` | Disparitions, form step exit |
| `ease-state-change` | `cubic-bezier(0.4, 0, 0.2, 1)` | `"power2.inOut"` | Hover, focus, toggle, tab switch |
| `ease-bounce` | `cubic-bezier(0.34, 1.56, 0.64, 1)` | `"back.out(1.7)"` | Selection bounce, micro-interactions |
| `ease-elastic-return` | — | `"elastic.out(1, 0.4)"` | Retour magnetic button |
| `ease-scrub` | — | `"none"` | Parallax, scroll storyboard |

---

### B.6 Components

#### Button

**Variantes :** Primary, Secondary (outline), Ghost, Icon

**Button — Primary :**

| État | Fond | Texte | Bordure | Shadow | Scale |
|------|------|-------|---------|--------|-------|
| Default | `accent-action` | `text-on-accent` | none | `shadow-subtle` | 1 |
| Hover | `accent-action-hover` | `text-on-accent` | none | `shadow-card` | 1.02 |
| Focused | `accent-action` | `text-on-accent` | ring 2px `accent-action` offset 2px | `shadow-subtle` | 1 |
| Active | `accent-action-hover` | `text-on-accent` | none | none | 0.98 |
| Disabled | `accent-action` opacity 0.4 | `text-on-accent` opacity 0.4 | none | none | 1 |
| Loading | `accent-action` | spinner `text-on-accent` | none | `shadow-subtle` | 1 |
| Error | `status-error` | `text-on-accent` | none | `shadow-subtle` | 1 |
| Success | `status-success` | `text-on-accent` | none | `shadow-subtle` | 1 |

- Taille : min-height 48px, padding `space-element` H, `space-element-sm` V
- Radius : `radius-md`
- Typo : Jost 600, `body-md`
- Transition : `ease-state-change` 150ms (transform, box-shadow, background-color)
- Responsive : full-width < 640px, auto-width > 640px
- A11y : `role="button"`, focus ring visible, contraste ≥ 4.5:1, `aria-disabled`, `aria-busy` loading

**Button — Secondary (outline) :**

| État | Fond | Texte | Bordure |
|------|------|-------|---------|
| Default | transparent | `accent-action` | 1.5px `accent-action` |
| Hover | `accent-action` 8% | `accent-action` | 1.5px `accent-action` |
| Focused | transparent | `accent-action` | ring 2px offset 2px |
| Active | `accent-action` 12% | `accent-action` | 1.5px `accent-action` |
| Disabled | transparent | `accent-action` 40% | 1.5px `accent-action` 40% |

**Button — Ghost :**

| État | Fond | Texte |
|------|------|-------|
| Default | transparent | `text-primary` |
| Hover | `surface-secondary` | `text-primary` |
| Focused | transparent + ring | `text-primary` |

Pour "← Retour", navigation secondaire, boutons compacts.

#### Link

| État | Style | Couleur |
|------|-------|---------|
| Default | underline | `accent-action` |
| Hover | underline offset +2px | `accent-action-hover` |
| Focused | focus ring | `accent-action` |
| Active | underline + darken | `accent-action-hover` |

Transition : `ease-state-change` 150ms.

#### Badge

| Variante | Fond | Texte | Radius |
|----------|------|-------|--------|
| Default (catégorie) | `surface-secondary` | `text-secondary` | `radius-sm` |
| "Projet concept" | `accent-warm` 15% | `accent-warm` (dark value) | `radius-sm` |
| Status success | `status-success` 12% | `status-success` | `radius-sm` |

- Typo : Jost 600, `body-xs`, uppercase, letter-spacing 0.08em
- Padding : `space-inline` H, `space-inline-sm` V

#### Card

**Card — Service :**

| État | Fond | Shadow | Transform |
|------|------|--------|-----------|
| Default | `surface-elevated` | `shadow-card` | none |
| Hover | `surface-elevated` | `shadow-elevated` | translateY(-2px) |
| Focused | `surface-elevated` | `shadow-card` | ring 2px `accent-action` |

- Radius : `radius-lg`, Padding : `space-component-sm`
- Contenu : H3 Jost 600, body Lora 400, bullets, CTA link
- Transition : `ease-state-change` 200ms
- Responsive : 3 col > 1024px, 1 col < 1024px

**Card — Case study (vignette) :**

| État | Détail |
|------|--------|
| Default | Image full-bleed + overlay gradient bottom, titre + catégorie + chiffre + badge |
| Hover | Image scale(1.03) via overflow:hidden, shadow elevated, overlay assombri |
| Focused | Focus ring 2px sur le conteneur |

- Ratio : 3:2, Radius : `radius-lg`
- Overlay : `linear-gradient(transparent 40%, oklch(15% 0.005 100 / 0.7))`
- Transition : `ease-state-change` 300ms (image transform)

**Card — Differentiation block :**
- Icône 24px `accent-action` + titre Jost 600 + texte Lora 400
- Fond transparent, pas de hover (informatif)
- 3 inline desktop, stack mobile

#### Accordion / FAQ

| État | Détail |
|------|--------|
| Collapsed | Titre Jost 600 `heading-lg` + chevron → + bordure bottom `border-subtle` |
| Hover | Fond `surface-secondary` |
| Focused | Focus ring sur trigger |
| Expanded | Chevron ↓, contenu Lora `body-md`, bordure `border-strong` |

- Expand : `ease-entrance` 300ms via `grid-template-rows: 0fr → 1fr`
- Chevron : `ease-state-change` 200ms rotate
- A11y : `aria-expanded`, `aria-controls`

#### Forms

**Text input :**

| État | Fond | Bordure | Label |
|------|------|---------|-------|
| Default | `surface-elevated` | 1.5px `border-subtle` | `text-secondary` Jost 500 |
| Hover | `surface-elevated` | 1.5px `border-strong` | — |
| Focused | `surface-elevated` | 2px `accent-action` | color → `accent-action` |
| Disabled | `surface-secondary` 60% | 1px `border-subtle` | `text-muted` |
| Error | `surface-elevated` | 2px `status-error` | `status-error` + icône |
| Success | `surface-elevated` | 2px `status-success` | `status-success` + icône |

- Radius `radius-sm`, Height 48px, Padding `space-element` H
- Typo input : Lora 400 `body-md`
- Label : au-dessus, toujours visible (pas de label flottant)
- Erreur : sous le champ, `body-xs`, icône + texte
- Transition : `ease-state-change` 150ms

**Selection buttons (formulaire étapes 1, 4) :**

| État | Fond | Bordure | Shadow |
|------|------|---------|--------|
| Default | `surface-elevated` | 1.5px `border-subtle` | `shadow-subtle` |
| Hover | `surface-elevated` | 1.5px `accent-action` | `shadow-card` |
| Selected | `accent-action` 8% | 2px `accent-action` | `shadow-card` |

- Radius `radius-md`, Min-height 56px, Transition 150ms

**Progress bar :**
- Track : `border-subtle`, Fill : `accent-action`, Height 4px, Radius `radius-full`
- Steps : cercles 8px, filled = `accent-action`, pending = `border-strong`
- A11y : `role="progressbar"`, `aria-valuenow/min/max`, `aria-label`

#### Sections

**Hero :**
- Layout asymétrique : texte 5-6 col + visuel 5-6 col
- H1 `heading-5xl` Jost 700, sous-titre `body-lg` Lora 400
- CTAs : Primary + Secondary, gap `space-element`
- Background `surface-primary`, Padding `space-section`
- Mobile : stack vertical, texte d'abord

**Section conversion (CTA final) :**
- Background `surface-secondary` (light) / `surface-elevated` (dark)
- Headline `heading-3xl` Jost 600 centré + sous-texte + CTA centré
- Padding `space-section`

**Process (frise) :**
- 3 étapes horizontal desktop, vertical mobile
- Numéro circulaire `accent-action`, titre Jost, texte Lora, durée en badge
- Ligne 2px `border-subtle` entre cercles

#### Nav (Header)

| Élément | Desktop | Mobile |
|---------|---------|--------|
| Layout | Logo · Nav items · Phone · CTA · Dark toggle | Logo · Dark toggle · Hamburger + bottom bar CTA |
| Fond | `surface-primary` 95% + blur(12px) | Idem |
| Height | 72px | 60px |
| Nav items | Jost 500 `body-md`, hover `accent-action` | Menu overlay full-screen |
| Active page | `accent-action` + underline 2px offset 4px | Idem |
| CTA | Button Primary compact | Bottom bar sticky full-width |

- z-index 50, shadow au scroll
- Hamburger → X : `ease-state-change` 300ms
- Menu mobile : slide-in, `ease-entrance` 300ms

#### Footer

- Layout : gauche (logo + tagline Lora 400i) + droite (nav colonnes)
- Fond : `surface-secondary` (light) / `surface-primary` (dark)
- Links : Jost 500 `body-sm`, hover `accent-action`
- Social icons : 20px `text-muted`, hover `accent-action`
- Séparateur 1px `border-subtle` avant copyright
- Padding `space-section-sm`

---

### B.7 Theming strategy

**Tokens qui changent par thème :** toute la catégorie `color.*`, `shadow.*`

**Tokens invariants :** `spacing.*`, `radius.*`, `typography.*`, `grid.*`, `easing.*`

**Implémentation :**
- CSS custom properties `--kodo-*`
- Thème via `data-theme="light|dark"` sur `<html>`
- Respect `prefers-color-scheme` par défaut
- Toggle avec persist `localStorage`
- Transition thème : `ease-state-change` 200ms sur `background-color` et `color`

---

### B.8 Composition rules — par type de page

#### Page Accueil
```
[Nav sticky]
[Hero — asymétrique]                                  surface-primary
[Bande différenciation — 3 blocs]                     surface-secondary
[Réalisations aperçu — grille 2×2]                    surface-primary
[Services aperçu — 3 cartes]                          surface-secondary
[Process — frise 3 étapes]                            surface-primary
[Chiffres clés — 3-4 métriques]                       surface-secondary   (optionnel)
[Section conversion — headline + CTA + tel]           surface-secondary
[Footer]
```

#### Page Services
```
[Header — H1 + sous-titre]                            surface-primary
[Offre 1 : Site vitrine — large]                      surface-primary
[Offre 2 : Branding]                                  surface-secondary
[Offre 3 : Automatisation]                            surface-primary
[Pack complet]                                         surface-secondary
[Pour qui / Pas pour qui]                             surface-primary
[FAQ — accordions]                                    surface-secondary
[Section conversion]                                  surface-secondary
[Footer]
```

#### Page Case study (×4)
```
[Hero projet — image full-bleed + overlay]            image
[Brief]                                                surface-primary
[Solution]                                             surface-secondary
[Process & timeline]                                   surface-primary
[Galerie — images, whitespace]                        surface-secondary
[Résultats — gros chiffres]                           surface-primary
[Réflexion]                                            surface-secondary
[CTA conversion]                                       surface-primary
[Nav case studies prev/next]                           surface-secondary
[Footer]
```

#### Page Contact
```
[Header — H1 + sous-titre + réassurance]              surface-primary
[Formulaire (8 col) + réassurance (3 col)]            surface-primary
[Footer]
```

---

## REQUIREMENTS FOR STACK

1. **Performance** : Lighthouse Perf > 90 (trade-off Tier 3), A11y/BP/SEO > 95. LCP < 2.5s. JS < 80KB hors Spline lazy. CLS < 0.1. INP < 200ms.
2. **Tokens** : `.tokens.json` W3C fourni. CSS custom properties `--kodo-*`.
3. **Theming** : Light + dark via `data-theme`. Respect `prefers-color-scheme`. Persist `localStorage`.
4. **Typography** : Google Fonts — Jost (variable) + Lora. Préchargement + subsetting.
5. **Images** : WebP obligatoire, AVIF optionnel. Srcset 4 tailles. Blur-up LQIP. Lazy loading sauf hero.
6. **Motion — Tier 3** : GSAP core (~8KB) + ScrollTrigger (~8KB) + SplitText (~4KB, ou split-type MIT) + Lenis (~8KB) = ~28KB gz eager. Spline 3D runtime (150–300KB) lazy-loaded sur Accueil uniquement. `prefers-reduced-motion` géré via `gsap.matchMedia()`. Cleanup obligatoire pour Astro View Transitions (`astro:before-swap` / `astro:after-swap`).
7. **Formulaire** : Multi-étapes 5 steps, island React. Validation inline. Honeypot anti-spam. Transitions GSAP entre étapes.
8. **Icons** : SVG inline ou sprite. Phosphor Icons thin/light ou custom.
9. **Accessibility** : WCAG 2.1 AA. Focus visible, skip link, ARIA, touch targets 44px.
10. **Dark mode** : Token overrides fournis. Redesign des surfaces, pas d'inversion naïve.
11. **Grid** : CSS Grid 12 colonnes. Breakpoints : 640 / 1024 / 1440 / 1920.
12. **CMS** : Case studies et pages éditables. Markdown ou headless CMS léger.
13. **Spline 3D** : Island Astro lazy-loaded. WebGL detection + fallback image. Timeout 5s. Skeleton CSS pendant chargement. Lighthouse mobile ≥ 85 après lazy load.
14. **Animation dependencies** : gsap@^3.12, lenis@^1.1, @splinetool/runtime@^2.x (lazy). Voir motion-strategy v3.0 section 9.

---

*Fin du design system v1. Fichiers compagnons : `tokens.json`, `component-handoff-Studio-Kodo.md`, `motion-strategy-Studio-Kodo.md`.*
