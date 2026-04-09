# Design System v1 — HUGGO

> **Projet** : Site vitrine premium HUGGO
> **Version** : v1.0
> **Date** : 2026-04-09
> **Statut** : READY FOR TECH — validation requise avant Gate 5

---

## A) DESIGN BRIEF

### 1. Objectifs UX & conversion — ce que l'UI rend évident en 3 secondes

1. **HUGGO = commande WhatsApp pour commerçants** — le smartphone 3D avec conversation WhatsApp dans le hero doit ancrer immédiatement le canal et le produit.
2. **Zéro commission** — le chiffre "0%" doit être visuellement dominant (couleur accent, grande taille) dans les 600 premiers pixels.
3. **Simple, pas technophile** — l'UI doit respirer le "pas compliqué" : espaces généreux, hiérarchie claire, pas de surcharge visuelle. Le commerçant non-technophile ne doit jamais se sentir submergé.
4. **Double parcours visible** — la bifurcation commerçant / distributeur doit se lire dans le hero sans effort cognitif (deux CTA visuellement distincts, pas un choix modal).

### 2. Principes UI (7 règles)

| # | Principe | Application |
|---|----------|-------------|
| 1 | **Hiérarchie par contraste de taille** | Le H1 et les chiffres-clés sont 2 à 3x plus grands que le body. Les preuves chiffrées (15M, 0%, +30%) sont les éléments les plus grands après le H1. |
| 2 | **Densité basse** | Pas plus de 3 blocs d'information par écran visible (viewport). Spacing généreux entre sections (80-120px desktop). Le commerçant scanne, il ne lit pas. |
| 3 | **Rythme Prove → Clarify → Convert** | Chaque page alterne des sections de preuve (chiffres, logos) et des sections de clarification (bénéfices, étapes), terminant toujours par une bande CTA de conversion. |
| 4 | **Contraste CTA maximal** | Le CTA primaire "Demander une démo" est toujours en couleur accent (orange HUGGO) sur fond contrasté. Il ne se confond jamais avec le fond de section. |
| 5 | **Crédibilité par les données, pas par la décoration** | Les chiffres sont les éléments décoratifs. Pas d'illustrations abstraites, pas de formes géométriques décoratives sans fonction. Si un visuel n'appuie pas une preuve ou un mécanisme, il est supprimé. |
| 6 | **Cohérence cross-page** | Même structure de header/footer, même hauteur de hero, même pattern de pré-footer CTA sur les 8 pages. Le visiteur ne doit jamais être désorienté en changeant de page. |
| 7 | **Progressive disclosure mobile** | Sur mobile, les longs contenus (FAQ, paliers, fonctionnalités réseau) sont en accordéon. Le hero est plus court (pas de smartphone 3D — fallback image statique). |

### 3. Direction visuelle

#### Style

**Premium accessible** — ni corporate austère, ni startup flashy. L'UI inspire confiance et compétence sans intimider un boulanger de quartier. Lignes épurées, coins arrondis (radius généreux), surfaces planes avec ombres subtiles. Inspiré de la propreté d'Obypay sans le côté "fintech" — plus chaleureux grâce à l'orange et au vert HUGGO.

#### Typographie

**Display / Headings** : police serif arrondie ou sans-serif géométrique bold — candidates : "Obviously" (comme Obypay) pour les titres courts, ou "Bricolage Grotesque" / "Plus Jakarta Sans" pour un feel plus accessible. La typo heading doit avoir du caractère sans paraître élitiste.

**Body** : "DM Sans" (comme Obypay) ou "Inter" — lisibilité maximale, x-height élevé, caractères ouverts. Le commerçant lit sur mobile entre deux clients.

**Monospace / Data** : "JetBrains Mono" ou "IBM Plex Mono" pour les chiffres-clés (15M, 0%, +30%) — renforce la crédibilité data.

Échelle typographique avec rôles nommés : cf. section B (tokens).

#### Couleurs

Palette fondée sur l'identité HUGGO existante, étendue en Oklch :

| Rôle | Hex approx. | Oklch | Usage |
|------|-------------|-------|-------|
| Primary (Vert HUGGO) | #4A9B4A | oklch(0.58 0.14 142) | Surfaces hero, header, cards, badges, accents de confiance |
| Accent (Orange HUGGO) | #F5920A | oklch(0.73 0.17 70) | CTA primaire, chiffres-clés, highlights, états hover |
| Surface light | #FAFAF7 | oklch(0.98 0.005 90) | Fond de page light mode (off-white chaud, pas blanc pur) |
| Surface dark | #1A1D1E | oklch(0.20 0.005 210) | Fond de page dark mode |
| Text primary | #1A1D1E | oklch(0.20 0.005 210) | Texte principal light mode |
| Text on primary | #FFFFFF | oklch(1.0 0 0) | Texte sur fond vert/orange |
| Text secondary | #5A6066 | oklch(0.48 0.01 230) | Texte secondaire, labels, captions |
| Border | #E0E2E4 | oklch(0.90 0.005 230) | Séparateurs, bordures de cards |
| Success | #2E8540 | oklch(0.52 0.14 150) | États succès formulaire |
| Error | #D32F2F | oklch(0.50 0.19 25) | États erreur formulaire |
| Warning | #F9A825 | oklch(0.76 0.15 80) | États warning |

#### Iconographie

Style **outline** (stroke 1.5-2px), coins arrondis, cohérent avec le ton accessible. Bibliothèque recommandée : Lucide Icons ou Phosphor Icons. Pas de flat illustrations — les icônes sont fonctionnelles, pas décoratives. Couleur : text-secondary par défaut, primary ou accent quand associées à un chiffre ou un CTA.

#### Imagerie

- **Smartphone 3D** : modèle Spline (hero accueil), écran affichant une conversation WhatsApp stylisée aux couleurs HUGGO
- **Mascotte HUGGO** : utilisée avec parcimonie (accueil section 8 uniquement), accompagnée d'un CTA WhatsApp
- **Logos partenaires** : B&W (grayscale filter CSS), taille uniforme, espacement généreux
- **Photographs** : placeholders structurés pour témoignages et visuels verticales (quand fournis). Pas de stock photos génériques — soit des visuels authentiques, soit des placeholders stylisés cohérents avec la marque
- **Screenshots produit** : quand fournis, présentés dans un cadre smartphone ou laptop stylisé, jamais en plein écran brut

### 4. Patterns de crédibilité (data-driven)

| Pattern | Justification | Placement |
|---------|---------------|-----------|
| **Chiffres-clés près du hero** | Les visiteurs B2B scannent les preuves en premier. Un chiffre crédible dans les 600 premiers pixels augmente le scroll-through de 20-40% | Section 2 de l'accueil (juste sous le hero) |
| **Social proof avant le CTA final** | Placer la preuve sociale juste avant le dernier CTA réduit l'hésitation. Le cerveau cherche la validation avant l'action | Section 7 accueil, juste avant pré-footer CTA |
| **Logo bar comme "noise of legitimacy"** | ~50 logos créent un effet de masse qui rassure même sans lecture individuelle. Le cerveau perçoit "beaucoup de partenaires = fiable" | Section 3 accueil, potentiellement aussi footer |
| **Preuve chiffrée dans chaque bloc bénéfice** | Un claim sans chiffre est perçu comme du marketing. Un claim avec chiffre est perçu comme un fait | Chaque bloc de section 4 (bénéfices), sections résultats |
| **Formulaire court (5+1 champs)** | Chaque champ supplémentaire réduit la conversion de ~10%. 5 champs obligatoires = friction minimale pour du B2B qualifié | Page Contact |
| **Micro-texte de rassurance sous CTA** | "Rappel sous 24h · Sans engagement" réduit l'anxiété post-clic | Sous chaque CTA primaire |
| **FAQ comme objection handling** | Le format Q/R est le plus scanné après les headings. Les objections résolues avant le formulaire augmentent la conversion de 15-30% | Fin de chaque page, avant pré-footer CTA |
| **Vidéo préférence** | Les visiteurs préfèrent la vidéo au texte (65% B2B). Un embed vidéo sur "Comment ça marche" augmente la compréhension produit et le temps passé | Section 5 de /how-it-works |

### 5. Responsive — principes mobile-first

| Principe | Application |
|----------|-------------|
| **Mobile-first** | Le design est conçu pour 375px en premier, puis étendu à tablet et desktop. Pas de "desktop first réduit" |
| **Breakpoints logiques** | `sm: 640px` · `md: 768px` · `lg: 1024px` · `xl: 1280px` · `2xl: 1440px`. Au-delà de 1440px : contenu centré, max-width 1280px |
| **Hero mobile simplifié** | Pas de smartphone 3D sur mobile — fallback image statique. H1 tronqué sur 2 lignes max. CTA pleine largeur |
| **Accordéons mobile** | FAQ, paliers fonctionnalités, fonctionnalités réseau : en accordéon sur mobile, en grille ou colonnes sur desktop |
| **Navigation mobile** | Hamburger menu (icône + label "Menu"). CTA "Demander une démo" toujours visible hors menu, dans le header fixe. Menu plein écran (overlay), fond opaque |
| **Touch targets** | Minimum 44x44px pour tous les éléments interactifs. Espacement minimum 8px entre targets adjacentes |
| **Texte** | Body minimum 16px sur mobile (pas de texte < 14px sauf captions). Line-height 1.5-1.6 pour body |
| **Images** | Toutes les images en `srcset` / `<picture>` avec au minimum 2 résolutions (1x, 2x). Format WebP prioritaire, fallback JPEG |

### 6. Accessibilité

| Exigence | Cible | Méthode |
|----------|-------|---------|
| **Contraste texte** | 4.5:1 minimum (WCAG AA) | Vérifier chaque combinaison text/fond dans les deux modes |
| **Contraste UI** | 3:1 minimum (WCAG AA) | Bordures de champs, icônes fonctionnelles, séparateurs actifs |
| **Focus states** | Visible, contrasté, distinct du hover | Ring de focus 2px offset 2px, couleur accent (orange) sur fond clair, blanc sur fond sombre |
| **Navigation clavier** | Tab order logique, skip-to-content | Tous les éléments interactifs atteignables au clavier. Skip-to-content en premier élément focusable |
| **Aria labels** | Définis dans le copy v1 | Bouton WhatsApp, toggle dark mode, hamburger, toggle langue — tous ont des aria-label FR/EN |
| **Reduced motion** | `prefers-reduced-motion` respecté | Toutes les animations désactivées ou réduites à opacité seule. Pas de mouvement pour les utilisateurs qui le demandent |
| **Alt text** | Descriptif et fonctionnel | Chaque image a un alt text décrivant le contenu ou la fonction. Images décoratives : `alt=""` |
| **Couleur seule** | Jamais seul indicateur | Les erreurs de formulaire ont un texte + une icône + un changement de bordure, pas uniquement une couleur rouge |
| **Landmarks ARIA** | Structurés | `<header>`, `<nav>`, `<main>`, `<footer>`, `<section>` avec `aria-label` quand pertinent |

### 7. Motion — budgets globaux

| Type | Durée max | Easing | Propriétés |
|------|-----------|--------|------------|
| **Micro-interactions** (hover, focus, press) | 150ms | `ease-out` | `transform`, `opacity`, `box-shadow` |
| **Transitions d'état** (accordion open, tab switch) | 200-300ms | `ease-in-out` | `transform`, `opacity`, `max-height` (accordéon) |
| **Entrées d'éléments** (scroll-triggered) | 300-500ms | `cubic-bezier(0.16, 1, 0.3, 1)` | `transform` (translateY), `opacity` |
| **Hero 3D** (Spline) | N/A (interactive) | Physics-based | `transform3d` via WebGL (Spline runtime) |
| **Logo bar scroll** | Infini (CSS) | `linear` | `transform: translateX()` |

**Budgets perf globaux** :
- **INP** (Interaction to Next Paint) : ≤ 200ms
- **CLS** (Cumulative Layout Shift) : ≤ 0.1 (cible PRD) — réserve conservatrice vs 0.12
- **LCP** (Largest Contentful Paint) : < 2.5s
- Propriétés composited only : `transform` et `opacity` pour toutes les animations JS/CSS. Jamais `width`, `height`, `top`, `left`, `margin`, `padding`
- Max 3 animations simultanées par viewport (hors logo bar)

---

## B) DESIGN SYSTEM v1

### Tokens sémantiques

Tous les tokens suivent le format W3C Design Tokens 2025.10. Les valeurs Oklch sont les sources de vérité. Les valeurs hex sont des fallbacks sRGB calculés.

Détail complet : voir `tokens.json` (fichier séparé).

---

#### Couleur — rôles sémantiques

| Token | Light value | Dark value | Role | Usage context | Do not use | Paired with |
|-------|-----------|-----------|------|---------------|------------|-------------|
| `color.surface.primary` | oklch(0.98 0.005 90) | oklch(0.15 0.005 210) | Fond de page principal | Body background, sections alternées (pair) | Comme couleur de texte | text.primary, text.secondary |
| `color.surface.secondary` | oklch(0.95 0.008 90) | oklch(0.20 0.005 210) | Fond de sections alternées (impair) | Sections contrastées, cards surélevées, code blocks | Comme fond de header/footer | text.primary, border.default |
| `color.surface.elevated` | oklch(1.0 0 0) | oklch(0.25 0.008 210) | Surfaces élevées (cards, modals, dropdowns) | Cards, tooltips, menu mobile, formulaires | Comme fond de page principal en light mode | shadow.md, border.default |
| `color.surface.brand` | oklch(0.58 0.14 142) | oklch(0.45 0.12 142) | Fond branded (hero, header, pré-footer CTA) | Hero backgrounds, header sticky, CTA bands | Pour de longues zones de texte body | text.on-brand, accent.action |
| `color.text.primary` | oklch(0.20 0.005 210) | oklch(0.95 0.005 90) | Texte principal, headings | H1-H6, paragraphes principaux, labels | Sur fond brand sans vérification contraste | surface.primary |
| `color.text.secondary` | oklch(0.48 0.01 230) | oklch(0.65 0.01 230) | Texte secondaire | Captions, dates, labels de champs, micro-copy | Pour des headings ou CTA text | surface.primary, surface.secondary |
| `color.text.on-brand` | oklch(1.0 0 0) | oklch(1.0 0 0) | Texte sur fond brand (vert) | H1 hero, liens header, CTA dans hero | Sur fond clair light mode | surface.brand |
| `color.text.on-accent` | oklch(1.0 0 0) | oklch(0.13 0.01 70) | Texte sur fond accent (orange) | Label du CTA primaire | Sur fond non-accent | accent.action |
| `color.accent.action` | oklch(0.73 0.17 70) | oklch(0.70 0.15 70) | Couleur d'action principale (CTA) | Boutons primaires, liens actifs, highlights, badges | Comme couleur de fond de section | text.on-accent |
| `color.accent.action-hover` | oklch(0.68 0.17 70) | oklch(0.65 0.15 70) | Hover du CTA primaire | État hover boutons primaires | Hors du contexte hover | accent.action |
| `color.accent.action-pressed` | oklch(0.63 0.17 70) | oklch(0.60 0.15 70) | Pressed du CTA primaire | État active/pressed boutons primaires | Hors du contexte pressed | accent.action |
| `color.accent.subtle` | oklch(0.90 0.06 70) | oklch(0.30 0.06 70) | Fond subtil accent | Badges, tags, backgrounds d'indicateurs | Comme couleur de texte | text.primary, accent.action |
| `color.brand.primary` | oklch(0.58 0.14 142) | oklch(0.55 0.12 142) | Vert HUGGO — identitaire | Logos, icônes branded, header, badges de confiance | Comme couleur de texte body sur fond clair (contraste insuffisant) | text.on-brand |
| `color.brand.primary-hover` | oklch(0.53 0.14 142) | oklch(0.50 0.12 142) | Hover d'éléments brandés | Liens navigation header, boutons secondaires | Hors du contexte hover | brand.primary |
| `color.feedback.success` | oklch(0.52 0.14 150) | oklch(0.58 0.12 150) | Succès | Messages formulaire succès, validations | Comme couleur décorative | surface.primary |
| `color.feedback.error` | oklch(0.50 0.19 25) | oklch(0.55 0.17 25) | Erreur | Messages formulaire erreur, bordures invalides | Comme couleur décorative | surface.primary |
| `color.feedback.warning` | oklch(0.76 0.15 80) | oklch(0.72 0.13 80) | Warning | Avertissements, champs incomplets | Comme couleur de fond principale | text.primary |
| `color.border.default` | oklch(0.90 0.005 230) | oklch(0.30 0.005 230) | Bordures par défaut | Cards, séparateurs, champs de formulaire | Comme couleur de texte | surface.elevated, surface.secondary |
| `color.border.focus` | oklch(0.73 0.17 70) | oklch(0.70 0.15 70) | Bordure de focus | Focus ring (2px offset 2px) | Hors du contexte focus | accent.action |

---

#### Typographie — échelle nommée

| Token | Size | Line height | Weight | Letter spacing | Role | Usage context | Do not use | Paired with |
|-------|------|------------|--------|----------------|------|---------------|------------|-------------|
| `type.display-xl` | 56px / 3.5rem | 1.1 | 700 | -0.02em | Hero H1 (accueil) | H1 page d'accueil uniquement | Sous-headings, body | space.section |
| `type.display-lg` | 44px / 2.75rem | 1.15 | 700 | -0.01em | H1 pages internes | H1 Retail, Franchise, Collectivity, How-it-works, Pricing, About, Contact | Accueil H1, body | space.section |
| `type.heading-xl` | 36px / 2.25rem | 1.2 | 700 | -0.01em | H2 sections | Headings de section principaux (toutes pages) | H1, body | space.component |
| `type.heading-lg` | 28px / 1.75rem | 1.25 | 600 | 0 | H3 sous-sections | Sous-headings (bénéfices, paliers, FAQ questions) | H1-H2, body | space.component |
| `type.heading-md` | 22px / 1.375rem | 1.3 | 600 | 0 | H4 éléments | Labels de paliers, noms de features, stats labels | Paragraphes | space.element |
| `type.heading-sm` | 18px / 1.125rem | 1.4 | 600 | 0.01em | H5-H6, overlines | Overlines de section ("Retail", "Franchise"), labels | Body text | space.element |
| `type.body-lg` | 18px / 1.125rem | 1.6 | 400 | 0 | Body grand, sous-titres hero | Sous-titre hero, lead paragraphs | Headings, captions | space.element |
| `type.body-md` | 16px / 1rem | 1.6 | 400 | 0 | Body par défaut | Paragraphes, listes, descriptions | Headings | space.element |
| `type.body-sm` | 14px / 0.875rem | 1.5 | 400 | 0.01em | Body petit | Micro-copy CTA, labels de champs, captions longues | Headings, mobile body (trop petit) | space.element |
| `type.caption` | 12px / 0.75rem | 1.4 | 400 | 0.02em | Captions, mentions | Copyright footer, sources, mentions légales | Body, labels (trop petit pour lecture) | text.secondary |
| `type.data-xl` | 48px / 3rem | 1.1 | 700 | -0.02em | Chiffres-clés grands | 15M, 0%, 60% — section chiffres accueil | Body, headings textuels | accent.action, type.body-sm |
| `type.data-lg` | 36px / 2.25rem | 1.15 | 700 | -0.01em | Chiffres-clés moyens | +15-30%, métriques pages verticales | Body | accent.action, type.body-sm |
| `type.button` | 16px / 1rem | 1 | 600 | 0.02em | Texte des boutons | CTA primaire, secondaire, tertiaire | Paragraphes | accent.action, brand.primary |

**Responsive scaling** : les tailles display/heading réduisent de 20-30% sur mobile (< 768px). Les tailles body restent identiques (lisibilité). Implémentation via `clamp()` CSS.

| Token | Desktop | Mobile (< 768px) |
|-------|---------|------------------|
| `type.display-xl` | 56px | 36px → `clamp(2.25rem, 5vw, 3.5rem)` |
| `type.display-lg` | 44px | 30px → `clamp(1.875rem, 4vw, 2.75rem)` |
| `type.heading-xl` | 36px | 26px → `clamp(1.625rem, 3.5vw, 2.25rem)` |
| `type.heading-lg` | 28px | 22px → `clamp(1.375rem, 3vw, 1.75rem)` |
| `type.data-xl` | 48px | 32px → `clamp(2rem, 4.5vw, 3rem)` |
| `type.data-lg` | 36px | 26px → `clamp(1.625rem, 3.5vw, 2.25rem)` |

---

#### Spacing — échelle nommée

| Token | Value | Role | Usage context | Do not use | Paired with |
|-------|-------|------|---------------|------------|-------------|
| `space.section` | 96px (6rem) | Espacement entre sections | Margin-top/bottom entre sections de page | À l'intérieur d'un composant | type.heading-xl, type.display-* |
| `space.section-sm` | 64px (4rem) | Espacement section compact | Sections plus courtes (FAQ, pré-footer CTA) | Entre des composants intra-section | type.heading-lg |
| `space.component` | 32px (2rem) | Espacement entre composants | Gap entre cards, entre blocs de bénéfice, entre questions FAQ | À l'intérieur d'un composant atomique | type.heading-lg, type.body-lg |
| `space.component-sm` | 24px (1.5rem) | Espacement composant compact | Gap interne cards, padding cards, espacement liste features | Entre sections | type.body-md |
| `space.element` | 16px (1rem) | Espacement entre éléments | Gap entre paragraphe et CTA, entre label et champ, entre icône et texte | Entre sections | type.body-md, type.body-sm |
| `space.element-sm` | 12px (0.75rem) | Espacement élément compact | Padding interne badges, gap micro-éléments | Entre composants | type.caption |
| `space.element-xs` | 8px (0.5rem) | Espacement minimal | Gap entre icône inline et texte, padding interne tags | Comme espacement de section | type.body-sm |
| `space.element-2xs` | 4px (0.25rem) | Espacement micro | Gap entre éléments intimement liés (label + asterisque, icon + badge count) | Comme espacement visible principal | — |

**Responsive** : `space.section` passe à 64px sur mobile. `space.section-sm` passe à 48px.

---

#### Radius

| Token | Value | Role | Usage context | Do not use |
|-------|-------|------|---------------|------------|
| `radius.none` | 0 | Pas de radius | Éléments pleine largeur (sections, bandes CTA) | Cards, boutons |
| `radius.sm` | 8px (0.5rem) | Léger arrondi | Champs de formulaire, badges, tags | Cards principales |
| `radius.md` | 12px (0.75rem) | Arrondi standard | Cards, accordéons, conteneurs visuels | Boutons (trop petit) |
| `radius.lg` | 20px (1.25rem) | Arrondi prononcé (style Obypay) | Boutons (CTA), pills de navigation, toggles | Sections pleine largeur |
| `radius.xl` | 24px (1.5rem) | Arrondi large | Cards hero, conteneur smartphone 3D, modals | Petits éléments |
| `radius.full` | 9999px | Cercle / pill | Bouton WhatsApp flottant, avatar, tags ronds | Cards, conteneurs larges |

---

#### Shadow (par rôle d'élévation)

| Token | Light value | Dark value | Role | Usage context |
|-------|-----------|-----------|------|---------------|
| `shadow.sm` | `0 1px 2px oklch(0.20 0 0 / 0.05)` | `0 1px 2px oklch(0 0 0 / 0.3)` | Élévation faible | Champs de formulaire au repos, badges |
| `shadow.md` | `0 4px 12px oklch(0.20 0 0 / 0.08)` | `0 4px 12px oklch(0 0 0 / 0.4)` | Élévation moyenne | Cards, dropdowns, boutons hover |
| `shadow.lg` | `0 8px 24px oklch(0.20 0 0 / 0.12)` | `0 8px 24px oklch(0 0 0 / 0.5)` | Élévation haute | Modals, header sticky compacté, menu mobile |
| `shadow.xl` | `0 16px 48px oklch(0.20 0 0 / 0.16)` | `0 16px 48px oklch(0 0 0 / 0.6)` | Élévation maximale | Tooltip, popover, éléments flottants |
| `shadow.accent-glow` | `0 4px 20px oklch(0.73 0.17 70 / 0.25)` | `0 4px 20px oklch(0.70 0.15 70 / 0.35)` | Glow accent sur CTA | CTA primaire hover, bouton WhatsApp flottant |

---

#### Grid

| Token | Value | Role | Usage context |
|-------|-------|------|---------------|
| `grid.columns` | 12 | Colonnes de grille | Layout principal — 12 colonnes desktop |
| `grid.gutter` | 24px (1.5rem) | Gouttière entre colonnes | Gap entre colonnes de grille |
| `grid.margin` | 24px mobile / 48px tablet / 80px desktop | Marge latérale | Padding gauche/droite du conteneur principal |
| `grid.max-width` | 1280px | Largeur maximale du contenu | Le contenu est centré au-delà de 1440px viewport |

**Layouts communs** :
- Hero : 12 colonnes (texte 6 col / visual 6 col desktop ; full width mobile)
- Bénéfices : 4x3 colonnes desktop, 2x6 tablet, 1x12 mobile
- Verticales (3 cards) : 3x4 colonnes desktop, 1x12 mobile
- Paliers (4 cards) : 4x3 colonnes desktop, 2x6 tablet, 1x12 mobile
- FAQ : 8 colonnes centrées desktop (2 colonnes marge de chaque côté)
- Logo bar : pleine largeur (pas de conteneur max-width)

---

### Theming — Light + Dark

#### Tokens qui changent par thème

Tous les tokens `color.*` ont une valeur light et une valeur dark (voir tableau de couleurs ci-dessus et table dark mode overrides dans `component-handoff-huggo.md`).

#### Tokens invariants (ne changent PAS par thème)

| Catégorie | Tokens invariants |
|-----------|-------------------|
| Typographie | Toutes les tailles, poids, line-heights, letter-spacings |
| Spacing | Tous les tokens d'espacement |
| Radius | Tous les tokens de radius |
| Grid | Colonnes, gouttière, max-width, margin |
| Motion | Durées, easings, propriétés |

#### Dark mode : principes de redesign

Le dark mode n'est PAS le light mode inversé. Règles spécifiques :

1. **Surfaces** : les surfaces s'éclaircissent vers le haut (du plus sombre au plus clair : page → section → card → tooltip). C'est l'inverse du light mode où les éléments élevés sont plus clairs.
2. **Contraste text** : le texte primaire dark est off-white (oklch 0.95), pas blanc pur (réduit la fatigue visuelle). Le texte secondaire monte à oklch 0.65 (vs 0.48 en light) pour rester lisible.
3. **Brand primary (vert)** : légèrement désaturé et assombri en dark pour ne pas "briller" sur fond sombre.
4. **Accent (orange)** : maintenu proche du light mode (l'orange reste vibrant sur fond sombre). Légère réduction de lightness pour éviter l'éblouissement.
5. **Ombres** : plus intenses en dark mode (opacité plus élevée) car les ombres subtiles du light mode sont invisibles sur fond sombre.
6. **Images** : les logos partenaires restent en grayscale. La mascotte et les visuels ne sont pas filtrés.
7. **Smartphone 3D** : le fond derrière le modèle Spline s'adapte au thème (fond sombre). Le modèle 3D lui-même garde ses couleurs.

---

### Composants — 8 états par composant

#### Boutons

**Variantes** : Primary (accent orange), Secondary (outline brand vert), Tertiary (ghost/text)

| État | Primary | Secondary | Tertiary |
|------|---------|-----------|----------|
| **Default** | Fond: `accent.action`, texte: `text.on-accent`, height 50px, radius `radius.lg` (20px), padding 0 24px, `type.button` | Fond: transparent, bordure 2px `brand.primary`, texte: `brand.primary`, mêmes dimensions | Fond: transparent, pas de bordure, texte: `brand.primary`, underline on hover |
| **Hover** | Fond: `accent.action-hover`, shadow `shadow.accent-glow`, flèche translate 4px → via `transform`, 150ms ease-out | Fond: `brand.primary` à 8% opacité, bordure: `brand.primary-hover` | Texte: `brand.primary-hover`, underline visible |
| **Focused** | Ring: 2px `border.focus`, offset 2px, fond identique à default | Ring: 2px `border.focus`, offset 2px | Ring: 2px `border.focus`, offset 2px |
| **Active/Pressed** | Fond: `accent.action-pressed`, scale(0.98), shadow `shadow.sm`, 100ms ease-out | Fond: `brand.primary` à 15% opacité, scale(0.98) | Opacité 0.8 |
| **Disabled** | Fond: `border.default`, texte: `text.secondary`, cursor not-allowed, pas de shadow | Bordure: `border.default`, texte: `text.secondary`, cursor not-allowed | Texte: `text.secondary` à 50% opacité |
| **Loading** | Fond: `accent.action` à 70%, spinner 16px blanc centré (remplace le texte), cursor wait | Bordure pulse animation (opacity 0.5-1, 1s ease-in-out infinite) | Texte remplacé par "..." animé |
| **Error** | Fond: `feedback.error`, texte blanc, shake animation (translateX -4px/+4px, 300ms) | Bordure: `feedback.error`, texte: `feedback.error` | Texte: `feedback.error` |
| **Success** | Fond: `feedback.success`, texte blanc, icône checkmark apparaît 300ms | Bordure: `feedback.success`, texte: `feedback.success`, icône checkmark | Texte: `feedback.success`, icône checkmark |

**Animation timing** : tous les changements d'état en 150ms `ease-out`. Propriétés animées : `background-color`, `border-color`, `transform`, `opacity`, `box-shadow`.

**Flèche animée (style Obypay)** : icône flèche → à droite du label. Au hover, `translateX(4px)` en 150ms. Uniquement sur les CTA primaires avec texte type "Découvrir", "Voir les tarifs".

**Responsive** : pleine largeur (width 100%) sur mobile pour les CTA hero et pré-footer. Hauteur maintenue à 50px. Font-size maintenue à 16px.

**A11y** : `role="button"` si `<a>`, `aria-disabled="true"` si disabled. Focus ring visible sur tous les navigateurs. Contraste texte/fond ≥ 4.5:1 sur tous les états.

---

#### Links (liens textuels)

| État | Visuel |
|------|--------|
| **Default** | Texte: `brand.primary`, underline offset 2px, decoration-thickness 1px |
| **Hover** | Texte: `brand.primary-hover`, underline decoration-thickness 2px, 150ms ease-out |
| **Focused** | Ring: 2px `border.focus`, offset 2px, background-color `accent.subtle` à 50% |
| **Active/Pressed** | Texte: `accent.action-pressed`, underline solid |
| **Disabled** | Texte: `text.secondary`, pas d'underline, cursor default |
| **Loading** | N/A (les liens ne chargent pas) |
| **Error** | N/A |
| **Success** | N/A |

**A11y** : distinction visuelle entre lien et texte (underline obligatoire, pas uniquement la couleur). Contraste ≥ 3:1 vs texte environnant.

---

#### Badges

| État | Visuel |
|------|--------|
| **Default** | Fond: `accent.subtle`, texte: `accent.action`, padding 4px 12px, radius `radius.sm`, `type.body-sm` weight 600 |
| **Hover** | Fond: `accent.action` à 20% opacité, 150ms |
| **Focused** | Ring: 2px `border.focus` (si interactif) |
| **Active/Pressed** | Scale(0.95), 100ms (si interactif) |
| **Disabled** | Opacité 0.5 |
| **Loading** | Pulse (opacité 0.5-1, 1.5s ease-in-out) |
| **Error** | Fond: `feedback.error` à 15%, texte: `feedback.error` |
| **Success** | Fond: `feedback.success` à 15%, texte: `feedback.success` |

**Usage** : paliers (Essentiel, Smart, Marketing, Analytics), tags de fonctionnalité, labels "add-on".

---

#### Cards

| État | Visuel |
|------|--------|
| **Default** | Fond: `surface.elevated`, border 1px `border.default`, radius `radius.md`, padding `space.component-sm`, shadow `shadow.sm` |
| **Hover** | Shadow `shadow.md`, translateY(-2px), border-color `brand.primary` à 30%, 200ms ease-out |
| **Focused** | Ring: 2px `border.focus`, offset 2px |
| **Active/Pressed** | Shadow `shadow.sm`, translateY(0), scale(0.99), 100ms |
| **Disabled** | Opacité 0.5, pointer-events none |
| **Loading** | Skeleton animation : fond gris animé (shimmer left-to-right, 1.5s ease-in-out infinite) |
| **Error** | Bordure: `feedback.error`, icône warning en haut à droite |
| **Success** | Bordure: `feedback.success` à 50%, icône checkmark en haut à droite |

**Variantes** : Verticale card (Retail/Franchise/Collectivity), Palier card (pricing), Bénéfice card, Testimonial card (placeholder).

**Responsive** : en colonne unique sur mobile, padding réduit à `space.element`. Shadow réduit à `shadow.sm` permanent sur mobile (pas de hover effect sur touch).

---

#### Accordions / FAQ

| État | Visuel |
|------|--------|
| **Default (closed)** | Fond: `surface.elevated`, border-bottom 1px `border.default`, padding `space.component-sm`, heading `type.heading-md`, chevron → à droite |
| **Hover** | Fond: `surface.secondary`, chevron translateX(2px), 150ms |
| **Focused** | Ring: 2px `border.focus`, offset interne |
| **Active/Pressed** | Fond: `surface.secondary`, scale(0.99), 100ms |
| **Disabled** | Opacité 0.5, non interactif |
| **Loading** | N/A |
| **Error** | N/A |
| **Success** | N/A |
| **Open** | Chevron rotation 90° (ou +/- toggle), contenu apparaît en 250ms ease-out (max-height + opacity). Fond maintenu `surface.secondary` |

**Animation** : l'ouverture utilise `max-height` + `opacity` pour un reveal progressif. La rotation du chevron en 200ms `ease-in-out`. Propriétés : `transform` (chevron), `max-height` + `opacity` (contenu).

**A11y** : `<details>/<summary>` natif ou `role="region"` avec `aria-expanded`. Le contenu caché n'est pas dans le DOM rendu (ou `aria-hidden="true"`).

---

#### Forms (champs de formulaire)

| État | Visuel |
|------|--------|
| **Default** | Fond: `surface.elevated`, bordure 1px `border.default`, radius `radius.sm`, height 48px (input) / 120px (textarea), padding 12px 16px, `type.body-md`, placeholder: `text.secondary` à 60% |
| **Hover** | Bordure: `brand.primary` à 50%, 150ms |
| **Focused** | Bordure: `border.focus` (2px), ring externe 2px `border.focus` à 30%, label animé (si floating label) |
| **Active/Pressed** | Identique à focused |
| **Disabled** | Fond: `surface.secondary`, bordure: `border.default` à 50%, cursor not-allowed, texte: `text.secondary` |
| **Loading** | Spinner 14px à droite du champ, input readonly |
| **Error** | Bordure: `feedback.error`, icône ⚠ 14px à droite, message d'erreur sous le champ en `type.body-sm` couleur `feedback.error`. Shake animation (translateX ±3px, 300ms) au submit si erreur |
| **Success** | Bordure: `feedback.success`, icône ✓ 14px à droite |

**Select (dropdown "Vous êtes...")** : même style que input. Chevron customisé à droite. Options dans un dropdown `surface.elevated` avec `shadow.md`.

**Labels** : au-dessus du champ, `type.body-sm` weight 600, couleur `text.primary`. Astérisque rouge pour obligatoire.

**A11y** : chaque champ lié à son label via `for`/`id`. Messages d'erreur liés via `aria-describedby`. `aria-required="true"` pour les champs obligatoires. `aria-invalid="true"` en état erreur.

---

#### Sections (conteneurs de page)

| État | Visuel |
|------|--------|
| **Default** | Alternance `surface.primary` / `surface.secondary` entre sections. Padding vertical `space.section`. Contenu centré dans `grid.max-width` |
| **Hover** | N/A (les sections ne sont pas interactives) |
| **Focused** | N/A |
| **Active/Pressed** | N/A |
| **Disabled** | N/A |
| **Loading** | Skeleton screens : blocs gris shimmering (headings = barres larges, body = barres fines, images = rectangles) |
| **Error** | Message d'erreur centré + CTA "Réessayer" |
| **Success** | N/A |

**Variantes** :
- Section standard (fond `surface.primary` ou `surface.secondary`)
- Section brand (fond `surface.brand`, texte `text.on-brand`) — hero, pré-footer CTA
- Section chiffres (fond `surface.secondary`, chiffres en `accent.action` + `type.data-xl`)
- Section logo bar (fond `surface.primary`, overflow hidden, pleine largeur)

---

#### Navigation (header sticky)

| État | Visuel |
|------|--------|
| **Default (top)** | Fond: `surface.brand` (vert), height 72px, logo + liens `text.on-brand` + CTA primaire (orange) + toggle langue. Padding horizontal `grid.margin` |
| **Hover (liens)** | Texte: `text.on-brand` avec underline, 150ms |
| **Focused** | Ring: 2px blanc, offset 2px |
| **Active/Pressed** | Texte opacité 0.8 |
| **Disabled** | N/A |
| **Loading** | N/A |
| **Error** | N/A |
| **Success** | N/A |
| **Scrolled (compacté)** | Height réduit à 56px, backdrop-blur 12px sur fond `surface.brand` à 90% opacité, shadow `shadow.lg`. Logo réduit, liens maintenus, CTA maintenu. Transition 200ms ease-out |

**Mobile** : hamburger menu (3 barres → X au clic). Menu overlay plein écran, fond `surface.brand` opaque. Liens empilés verticalement, CTA en bas. Fermeture au clic lien ou bouton X.

**Backdrop-blur (navigation sticky)** : un `backdrop-filter: blur(12px)` subtil est appliqué au header en état scrollé. Ce n'est PAS du full glassmorphism — le fond reste quasi-opaque (`surface.brand` à 90% opacité) avec un blur léger pour lisibilité quand du contenu défile derrière. Si le support navigateur est insuffisant, fallback à fond 100% opaque.

**A11y** : `<nav aria-label="Navigation principale">`, skip-to-content comme premier élément focusable. Tous les liens atteignables au clavier.

---

#### Footer

| État | Visuel |
|------|--------|
| **Default** | Fond: `surface.brand` (vert), texte `text.on-brand`. Logo HUGGO, liens de navigation, mention "HUGGO, filiale d'Atidgo", coordonnées, copyright. Padding `space.section-sm` vertical |
| **Hover (liens)** | Underline, 150ms |
| **Focused** | Ring: 2px blanc, offset 2px |
| **Active/Pressed** | Opacité 0.8 |
| **Disabled** | N/A |
| **Loading** | N/A |
| **Error** | N/A |
| **Success** | N/A |

**Structure** : 4 colonnes desktop (Logo+baseline / Pages / Contact / Legal). 1 colonne mobile (empilé).

---

#### Bouton WhatsApp flottant

| État | Visuel |
|------|--------|
| **Default** | Fond: #25D366 (vert WhatsApp), icône WhatsApp blanc, 56x56px, radius `radius.full`, shadow `shadow.md`, position fixed bas-droite (24px du bord), z-index 50 |
| **Hover** | Shadow `shadow.lg`, scale(1.05), 150ms ease-out |
| **Focused** | Ring: 2px `border.focus`, offset 3px |
| **Active/Pressed** | Scale(0.95), shadow `shadow.sm`, 100ms |
| **Disabled** | N/A (toujours actif) |
| **Loading** | N/A |
| **Error** | N/A |
| **Success** | N/A |

**A11y** : `aria-label="Nous contacter sur WhatsApp"` (FR) / `"Contact us on WhatsApp"` (EN).

---

## REQUIREMENTS FOR STACK

### Résumé technique pour Agent 5

| Contrainte | Valeur | Impact technique |
|------------|--------|-----------------|
| **Tier d'animation** | Tier 3 (3D interactive) | Nécessite lazy-loading d'un runtime 3D (Spline ou React Three Fiber), budget JS +150-300 KB lazy |
| **Dépendances animation** | GSAP (~28 KB gz) + ScrollTrigger + Lenis (smooth scroll) + @splinetool/react-spline (lazy) | Bibliothèques à installer et tree-shaker |
| **Perf targets** | LCP < 2.5s, INP ≤ 200ms, CLS ≤ 0.1, Lighthouse mobile ≥ 85, Lighthouse a11y ≥ 95 | Le runtime 3D ne doit pas bloquer le LCP — lazy-load obligatoire |
| **CSS-only logo bar** | Scroll horizontal infini, ~50 logos, HTML dupliqué 3x, animation CSS `translateX` linear | Pas de JS pour le défilement. Images optimisées WebP |
| **Dark mode** | Light + Dark, basculement via toggle dans header + respect `prefers-color-scheme` | CSS custom properties, tokens switch par thème |
| **Bilingue** | FR/EN, toggle dans header, hreflang | i18n statique, pas de CMS |
| **Formulaires** | 2 formulaires (démo 5+1 champs, contact 4 champs), destination agnostique | Validation front (HTML5 + JS), soumission configurable (webhook/email) |
| **Responsive** | Mobile-first, breakpoints sm/md/lg/xl/2xl | Container queries ou media queries |
| **Typographie** | 2 familles (display + body) + 1 monospace (data) | Variable fonts recommandées pour réduire le poids |
| **Espace colorimétrique** | Oklch (source) + sRGB fallback | `@supports (color: oklch(0 0 0))` pour progressive enhancement |
| **Reduced motion** | `prefers-reduced-motion` | Toutes les animations (GSAP, CSS, Spline) doivent respecter ce media query |
| **CMS** | Non requis | Site statique, éditable par un développeur |
| **Images** | WebP + fallback JPEG, srcset 2 résolutions, lazy-load natif sauf above-the-fold | Optimisation build-time |
| **Header sticky** | Compacte au scroll, backdrop-blur 12px | `position: sticky`, `backdrop-filter`, fallback opaque |
