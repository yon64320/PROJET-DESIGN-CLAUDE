# Component Handoff — HUGGO

> **Projet** : Site vitrine premium HUGGO
> **Version** : v1.0
> **Date** : 2026-04-09
> **Statut** : READY FOR TECH — validation requise avant Gate 5

---

## D) COMPONENT HANDOFF TABLE

### Composants principaux

| Component | States | Tokens used | Animation (easing, duration) | Responsive behavior | A11y requirements |
|-----------|--------|-------------|------------------------------|---------------------|-------------------|
| **Button Primary** | Default: fond `accent.action`, texte `text.on-accent`, height 50px, radius `radius.lg`, flèche icône droite. Hover: fond `accent.action-hover`, shadow `accent-glow`, flèche translateX(4px). Focused: ring 2px `border.focus` offset 2px. Pressed: fond `accent.action-pressed`, scale(0.98). Disabled: fond `border.default`, texte `text.secondary`, cursor not-allowed. Loading: fond `accent.action` 70% opacité, spinner blanc 16px. Error: fond `feedback.error`, shake translateX ±4px. Success: fond `feedback.success`, icône checkmark. | `accent.action`, `accent.action-hover`, `accent.action-pressed`, `text.on-accent`, `border.focus`, `border.default`, `text.secondary`, `feedback.error`, `feedback.success`, `radius.lg`, `shadow.accent-glow`, `type.button` | Hover: 150ms ease-out (bg-color, box-shadow, transform). Pressed: 100ms ease-out (transform). Arrow: 150ms ease-out translateX(4px). Error shake: 300ms ease-out. | Pleine largeur (100%) sur mobile pour hero et pré-footer CTA. Height maintenu 50px. Font-size maintenu 16px. Touch target ≥ 44x44px. | `role="button"` si `<a>`. `aria-disabled="true"` si disabled. `aria-busy="true"` si loading. Focus ring visible tous navigateurs. Contraste texte/fond ≥ 4.5:1 tous états. |
| **Button Secondary** | Default: fond transparent, bordure 2px `brand.primary`, texte `brand.primary`, height 50px, radius `radius.lg`. Hover: fond `brand.primary` 8% opacité, bordure `brand.primary-hover`. Focused: ring 2px `border.focus` offset 2px. Pressed: fond `brand.primary` 15% opacité, scale(0.98). Disabled: bordure `border.default`, texte `text.secondary`. Loading: bordure pulse opacité 0.5-1. Error: bordure `feedback.error`, texte `feedback.error`. Success: bordure `feedback.success`, texte `feedback.success`. | `brand.primary`, `brand.primary-hover`, `text.secondary`, `border.default`, `border.focus`, `feedback.error`, `feedback.success`, `radius.lg`, `type.button` | Hover: 150ms ease-out. Pressed: 100ms. Loading pulse: 1s ease-in-out infinite. | Pleine largeur mobile (comme primary). Hauteur et font identiques. | Mêmes que Primary. |
| **Button Tertiary** | Default: fond transparent, pas de bordure, texte `brand.primary`, underline on hover. Hover: texte `brand.primary-hover`, underline visible. Focused: ring 2px `border.focus`. Pressed: opacité 0.8. Disabled: texte `text.secondary` 50% opacité. Loading: "..." animé. Error: texte `feedback.error`. Success: texte `feedback.success` + checkmark. | `brand.primary`, `brand.primary-hover`, `text.secondary`, `border.focus`, `feedback.error`, `feedback.success`, `type.button` | Hover: 150ms ease-out. | Inline ou block selon le contexte. | Focus ring visible. Distinction underline vs texte environnant. |
| **Link** | Default: texte `brand.primary`, underline offset 2px, thickness 1px. Hover: texte `brand.primary-hover`, thickness 2px. Focused: ring 2px `border.focus`, fond `accent.subtle` 50%. Pressed: texte `accent.action-pressed`. Disabled: texte `text.secondary`, pas d'underline. | `brand.primary`, `brand.primary-hover`, `accent.action-pressed`, `text.secondary`, `border.focus`, `accent.subtle` | Hover: 150ms ease-out (underline-thickness, color). | Identique desktop/mobile. Touch target minimum 44px de hauteur pour les liens isolés. | Underline obligatoire (pas uniquement la couleur). Contraste ≥ 3:1 vs texte environnant. `tabindex` naturel. |
| **Badge** | Default: fond `accent.subtle`, texte `accent.action`, padding 4px 12px, radius `radius.sm`, `type.body-sm` weight 600. Hover: fond `accent.action` 20% opacité. Focused: ring 2px `border.focus` (si interactif). Pressed: scale(0.95). Disabled: opacité 0.5. Loading: pulse opacité 0.5-1. Error: fond `feedback.error` 15%, texte `feedback.error`. Success: fond `feedback.success` 15%, texte `feedback.success`. | `accent.subtle`, `accent.action`, `border.focus`, `feedback.error`, `feedback.success`, `radius.sm`, `type.body-sm` | Hover: 150ms. Pressed: 100ms. Loading pulse: 1.5s infinite. | Taille fixe, pas de changement responsive. | `role="status"` si dynamique. Contraste texte/fond ≥ 4.5:1. |
| **Card (Verticale)** | Default: fond `surface.elevated`, border 1px `border.default`, radius `radius.md`, padding `space.component-sm`, shadow `shadow.sm`. Contenu : overline (type `heading-sm`), H3 (type `heading-lg`), body (type `body-md`), CTA tertiary. Hover: shadow `shadow.md`, translateY(-2px), border-color `brand.primary` 30%. Focused: ring 2px `border.focus`. Pressed: shadow `shadow.sm`, translateY(0), scale(0.99). Disabled: opacité 0.5. Loading: skeleton shimmer. Error: bordure `feedback.error`. Success: bordure `feedback.success`. | `surface.elevated`, `border.default`, `brand.primary`, `border.focus`, `shadow.sm`, `shadow.md`, `radius.md`, `space.component-sm`, `type.heading-sm`, `type.heading-lg`, `type.body-md` | Hover: 200ms ease-out. Pressed: 100ms. Skeleton shimmer: 1.5s infinite. | 3 colonnes desktop (3x4 grid), 1 colonne mobile. Padding réduit `space.element` mobile. Shadow `shadow.sm` permanent mobile. | Tout le contenu de la card accessible au lecteur d'écran. Lien CTA dans la card (pas la card entière clickable). |
| **Card (Palier pricing)** | Default: fond `surface.elevated`, border 1px `border.default`, radius `radius.md`, padding `space.component-sm`. Contenu : badge nom palier, description (type `body-sm`), liste fonctionnalités (type `body-md`), CTA "Demander un devis". Hover: shadow `shadow.md`, translateY(-2px). Focused: ring 2px `border.focus`. Pressed: translateY(0), scale(0.99). Disabled: opacité 0.5. Loading: skeleton. Error: N/A. Success: N/A. | `surface.elevated`, `border.default`, `shadow.sm`, `shadow.md`, `radius.md`, `space.component-sm`, `accent.subtle`, `accent.action`, `type.body-sm`, `type.body-md`, `type.heading-md`, `type.button` | Hover: 200ms ease-out. Staggered entrance: 400ms + 150ms stagger (Tier 2). | 4 colonnes desktop (4x3 grid), 2 colonnes tablet, 1 colonne mobile (accordéon). | Liste de fonctionnalités avec `<ul>` sémantique. CTA par palier. |
| **Card (Bénéfice)** | Default: fond `surface.elevated`, radius `radius.md`, padding `space.component-sm`. Contenu : icône (24px, `text.secondary`), H3 (type `heading-lg`), body (type `body-md`), preuve (type `body-sm`, `text.secondary`). Hover: shadow `shadow.md`, icône couleur `brand.primary`. Focused: ring 2px `border.focus`. Pressed: scale(0.99). Disabled: N/A. Loading: skeleton. Error: N/A. Success: N/A. | `surface.elevated`, `text.secondary`, `brand.primary`, `border.focus`, `shadow.md`, `radius.md`, `space.component-sm`, `type.heading-lg`, `type.body-md`, `type.body-sm` | Hover: 200ms ease-out (shadow, icon color). Entrance: 400ms + 100ms stagger (Tier 2). | 4 colonnes desktop, 2 tablet, 1 mobile. | Icônes avec `aria-hidden="true"` (décoratives). Texte porte tout le sens. |
| **Accordion / FAQ** | Default closed: fond `surface.elevated`, border-bottom 1px `border.default`, padding `space.component-sm`, question en `type.heading-md`, chevron → droite. Hover: fond `surface.secondary`, chevron translateX(2px). Focused: ring 2px `border.focus` inset. Pressed: fond `surface.secondary`, scale(0.99). Disabled: opacité 0.5. Open: chevron rotate(90°), contenu visible (max-height + opacity), fond `surface.secondary` maintenu. Loading: N/A. Error: N/A. Success: N/A. | `surface.elevated`, `surface.secondary`, `border.default`, `border.focus`, `text.primary`, `type.heading-md`, `type.body-md`, `space.component-sm` | Open/close: 250ms ease-in-out (max-height, opacity). Chevron rotate: 200ms ease-in-out. Hover: 150ms ease-out. | Identique desktop/mobile. Tous les items en accordéon sur mobile. Desktop : accordéon ou liste ouverte (selon la page). | `<details>/<summary>` natif ou `role="region"` + `aria-expanded`. Contenu caché = `aria-hidden="true"`. |
| **Form Input** | Default: fond `surface.elevated`, bordure 1px `border.default`, radius `radius.sm`, height 48px, padding 12px 16px, `type.body-md`. Placeholder: `text.secondary` 60%. Hover: bordure `brand.primary` 50%. Focused: bordure `border.focus` 2px, ring externe 2px `border.focus` 30%. Pressed: identique focused. Disabled: fond `surface.secondary`, bordure `border.default` 50%, cursor not-allowed. Loading: spinner 14px droite, readonly. Error: bordure `feedback.error`, icône warning 14px droite, message erreur sous le champ. Success: bordure `feedback.success`, icône check 14px droite. | `surface.elevated`, `surface.secondary`, `border.default`, `brand.primary`, `border.focus`, `text.primary`, `text.secondary`, `feedback.error`, `feedback.success`, `radius.sm`, `type.body-md`, `type.body-sm` | Hover: 150ms ease-out (border). Focus: 150ms. Error shake: 300ms (translateX ±3px). | Height maintenu 48px. Pleine largeur mobile. Label au-dessus toujours. | `for`/`id` label-input. `aria-describedby` messages erreur. `aria-required="true"`. `aria-invalid="true"` si erreur. |
| **Form Select** | Identique Input avec chevron customisé droite. Options dropdown: fond `surface.elevated`, shadow `shadow.md`, radius `radius.sm`. Option hover: fond `accent.subtle`. Option selected: texte `accent.action`, check icône. | Mêmes que Input + `accent.subtle`, `shadow.md` | Dropdown open: 200ms ease-out (opacity, translateY 4px→0). | Dropdown pleine largeur mobile. Touch targets ≥ 44px par option. | `<select>` natif ou `role="listbox"` + `aria-activedescendant`. |
| **Form Textarea** | Identique Input, height 120px au lieu de 48px. Resize vertical uniquement. | Mêmes que Input. | Mêmes que Input. | Height minimum 120px. Resize vertical. | Mêmes que Input. |
| **Section Standard** | Fond alternant `surface.primary`/`surface.secondary`. Padding vertical `space.section`. Contenu dans `grid.max-width`. Loading: skeleton (barres shimmer). Error: message centré + CTA "Réessayer". | `surface.primary`, `surface.secondary`, `space.section`, `grid.max-width` | Entrée scroll: fade-up 400ms spring. | Padding vertical réduit `space.section-sm` sur mobile. | Landmarks ARIA (`<section aria-label>`). |
| **Section Brand** | Fond `surface.brand`, texte `text.on-brand`. Padding vertical `space.section`. CTA accent (orange) sur fond vert. | `surface.brand`, `text.on-brand`, `accent.action`, `space.section` | Identique section standard. | Identique. | Contraste texte blanc/fond vert ≥ 4.5:1 vérifié. |
| **Section Metrics** | Fond `surface.secondary`. Chiffres en `type.data-xl` + `accent.action`. Labels en `type.body-sm`. | `surface.secondary`, `accent.action`, `type.data-xl`, `type.data-lg`, `type.body-sm` | Counter animation 1200ms. | Chiffres empilés verticalement sur mobile (1 colonne). Taille réduite `type.data-lg` mobile. | Chiffres lisibles (pas uniquement en couleur). Alt text sur les unités. |
| **Logo Bar** | Fond `surface.primary`. Overflow hidden. Logos ~50 en B&W (grayscale filter CSS). HTML dupliqué 3x pour boucle seamless. Scroll CSS-only horizontal infini. Label optionnel au-dessus. | `surface.primary`, `type.heading-sm` (label) | `transform: translateX(-33.33%)` linear 30s infinite. Pas de hover effect. | Même vitesse et taille sur tous les breakpoints. Logos taille uniforme (~40px height). Gap 24px. | `aria-label="Partenaires et intégrations"`. Logos `alt=""` (decorative — le label au-dessus porte le sens). `prefers-reduced-motion`: scroll arrêté. |
| **Navigation Header** | Top: fond `surface.brand`, height 72px. Logo (lien accueil), liens `text.on-brand` (`type.body-md`), CTA primary, toggle langue. Scrolled: height 56px, backdrop-blur 12px, `surface.brand` 90% opacité, shadow `shadow.lg`. Mobile: hamburger → overlay plein écran `surface.brand` opaque. | `surface.brand`, `text.on-brand`, `accent.action`, `shadow.lg`, `type.body-md`, `type.button` | Compact: 200ms ease-out (height). Backdrop-blur: instant. Mobile menu: 250ms ease-in-out (opacity + translateY). | Desktop: liens horizontaux. Tablet: liens condensés ou hamburger à < 1024px. Mobile (< 768px): hamburger + CTA visible hors menu. | `<nav aria-label="Navigation principale">`. Skip-to-content premier focusable. Tous liens tab-accessible. Hamburger: `aria-expanded`, `aria-controls`. |
| **Footer** | Fond `surface.brand`, texte `text.on-brand`. 4 colonnes desktop (Logo / Pages / Contact / Legal). Liens hover: underline. Copyright en `type.caption`. | `surface.brand`, `text.on-brand`, `type.body-md`, `type.caption`, `space.section-sm` | Hover liens: 150ms ease-out. | 1 colonne mobile, empilé. | `<footer>` sémantique. Liens accessibles. |
| **WhatsApp Floating Button** | Fond #25D366, icône WhatsApp blanc, 56x56px, radius `radius.full`, shadow `shadow.md`, fixed bas-droite 24px, z-index 50. Hover: shadow `shadow.lg`, scale(1.05). Focused: ring 2px `border.focus` offset 3px. Pressed: scale(0.95), shadow `shadow.sm`. | #25D366 (WhatsApp brand), `shadow.md`, `shadow.lg`, `shadow.sm`, `border.focus`, `radius.full` | Hover: 150ms ease-out. Pressed: 100ms. | Identique tous breakpoints. Position fixed bas-droite. Z-index sous modals mais au-dessus de tout le reste. | `aria-label="Nous contacter sur WhatsApp"` (FR) / `"Contact us on WhatsApp"` (EN). `target="_blank"` + `rel="noopener"`. |

---

### Table effets & contraintes

| Effet | Composant(s) | Propriétés CSS animées | Perf constraint | Fallback reduced-motion |
|-------|-------------|----------------------|-----------------|------------------------|
| Fade-up entrance | All sections, cards | `transform: translateY(20px→0)`, `opacity: 0→1` | Composited only (transform + opacity). Max 3 simultanées | Éléments visibles immédiatement (opacity 1, transform none) |
| Button hover glow | Button Primary | `box-shadow` (accent-glow) | box-shadow est paint — acceptable car bouton petit | Changement couleur fond uniquement |
| Button arrow slide | Button Primary (avec flèche) | `transform: translateX(0→4px)` sur icône | Composited (transform) | Pas de mouvement |
| Card hover lift | Cards (verticale, palier, bénéfice) | `transform: translateY(0→-2px)`, `box-shadow` | Composited + paint (shadow) — acceptable | Pas de mouvement, shadow change uniquement |
| Accordion open | Accordion/FAQ | `max-height`, `opacity`, `transform: rotate(90deg)` chevron | max-height est layout — acceptable car composant petit | Ouverture instantanée |
| Form field focus | Input, Select, Textarea | `border-color`, `box-shadow` (ring) | Paint — acceptable car élément petit | Transition instantanée |
| Form error shake | Input, Button | `transform: translateX(±3px)` | Composited | Pas de shake — bordure rouge seule |
| Logo bar scroll | Logo bar | `transform: translateX()` | Composited (transform only). Animation CSS, pas JS | Scroll arrêté, logos fixes |
| Header compact | Navigation | `height`, `backdrop-filter` | height est layout — limité au header (petit). backdrop-filter composited | Transition height instantanée |
| Counter animation | Metrics sections | Text content (JS) — pas de propriété CSS animée | JS update requestAnimationFrame | Chiffre final affiché immédiatement |
| 3D smartphone | Hero Spline canvas | WebGL (transform3d via GPU) | Rendu GPU séparé, n'affecte pas le layout CSS | Image statique |
| Smooth scroll | Global (Lenis) | `scrollTop` (JS) | requestAnimationFrame, pas de layout thrashing | Scroll natif du navigateur |

---

### Liste d'assets à produire

| Asset | Format | Tailles | Usage | Statut |
|-------|--------|---------|-------|--------|
| **Modèle 3D smartphone** | Spline scene (.spline) | N/A (scène 3D) | Hero accueil — smartphone avec conversation WhatsApp | A PRODUIRE dans Spline editor |
| **Image fallback smartphone** | WebP + JPEG fallback | 800x600 (1x), 1600x1200 (2x) | Fallback mobile et navigateurs sans WebGL | A PRODUIRE (export depuis Spline ou design) |
| **Logos HubRise (~50)** | SVG (preferred) ou PNG transparent | 120x40px uniforme, B&W | Logo bar défilante toutes pages | A TELECHARGER + CONVERTIR B&W |
| **Logos partenaires tech** | SVG ou PNG transparent | 160x60px uniforme | Section social proof, page À propos | A TELECHARGER (Google Cloud, ACSEO, Centrale Paris, Orisha, Contodeo) |
| **Logo HUGGO** | SVG (fond vert + fond blanc + fond transparent) | Original + 40px height (header) + 24px (favicon) | Header, footer, favicon, OG image | DISPONIBLE (convertir en SVG si JPEG only) |
| **Icône App HUGGO** | PNG ou SVG | 192x192 (PWA), 512x512 (PWA), 180x180 (apple-touch) | PWA manifest, apple-touch-icon | DISPONIBLE |
| **Mascotte HUGGO** | WebP + JPEG fallback | 400x400 (1x), 800x800 (2x) | Section mascotte accueil | DISPONIBLE |
| **Icônes paliers** | SVG | 24x24 ou 32x32 | 4 icônes distinctives (Essentiel, Smart, Marketing, Analytics) | A PRODUIRE (Lucide ou Phosphor Icons) |
| **Icônes bénéfices** | SVG | 24x24 | 4 icônes (canal direct, assistant IA, onboarding, panier 360°) | A PRODUIRE (Lucide ou Phosphor Icons) |
| **Icônes canaux 360°** | SVG | 32x32 | 6 icônes (WhatsApp, borne, iPad, caisse, site, paiement) | A PRODUIRE |
| **OG Image** | PNG | 1200x630 | Partage social (Facebook, LinkedIn, Twitter) | A PRODUIRE |
| **Screenshots conversation WhatsApp** | WebP + JPEG | 375x812 (1x), 750x1624 (2x) | Hero retail, section démo conversation, screenshots onboarding | A FOURNIR par le client |
| **Vidéo démo** | MP4 (embed) ou YouTube/Vimeo | 1920x1080 | Page Comment ça marche section 5 | A FOURNIR par le client |
| **Témoignages (photos)** | WebP + JPEG | 80x80 (avatar), 160x160 (2x) | Sections témoignage (toutes pages verticales) | A FOURNIR par le client |
| **Visuels verticales** | WebP + JPEG | 600x400 (1x), 1200x800 (2x) | Hero Retail (screenshot), Hero Franchise (dashboard), Hero Collectivity (producteur) | A PRODUIRE ou A FOURNIR |

---

### Table dark mode token overrides

| Token | Light value | Dark value | Note |
|-------|-----------|-----------|------|
| `color.surface.primary` | oklch(0.98 0.005 90) / #FAFAF7 | oklch(0.15 0.005 210) / #121516 | Fond de page principal |
| `color.surface.secondary` | oklch(0.95 0.008 90) / #F0F0EA | oklch(0.20 0.005 210) / #1A1D1E | Sections alternées |
| `color.surface.elevated` | oklch(1.0 0 0) / #FFFFFF | oklch(0.25 0.008 210) / #252A2C | Cards, modals — s'éclaircit vers le haut en dark |
| `color.surface.brand` | oklch(0.58 0.14 142) / #4A9B4A | oklch(0.45 0.12 142) / #357835 | Désaturé et assombri en dark |
| `color.text.primary` | oklch(0.20 0.005 210) / #1A1D1E | oklch(0.95 0.005 90) / #F0F0EA | Off-white (pas blanc pur) pour réduire la fatigue |
| `color.text.secondary` | oklch(0.48 0.01 230) / #5A6066 | oklch(0.65 0.01 230) / #8A9099 | Plus clair en dark pour maintenir la lisibilité |
| `color.text.on-brand` | oklch(1.0 0 0) / #FFFFFF | oklch(1.0 0 0) / #FFFFFF | Invariant — reste blanc |
| `color.text.on-accent` | oklch(1.0 0 0) / #FFFFFF | oklch(0.13 0.01 70) / #1A1208 | Texte sombre sur orange en dark mode |
| `color.accent.action` | oklch(0.73 0.17 70) / #F5920A | oklch(0.70 0.15 70) / #E58A0A | Légèrement réduit en lightness |
| `color.accent.action-hover` | oklch(0.68 0.17 70) / #E08209 | oklch(0.65 0.15 70) / #D07A09 | |
| `color.accent.action-pressed` | oklch(0.63 0.17 70) / #CC7408 | oklch(0.60 0.15 70) / #BB6B08 | |
| `color.accent.subtle` | oklch(0.90 0.06 70) / #FDE8C8 | oklch(0.30 0.06 70) / #3D3020 | Fond sombre subtil en dark |
| `color.brand.primary` | oklch(0.58 0.14 142) / #4A9B4A | oklch(0.55 0.12 142) / #438E43 | Légèrement désaturé |
| `color.brand.primary-hover` | oklch(0.53 0.14 142) / #3F8A3F | oklch(0.50 0.12 142) / #38803C | |
| `color.feedback.success` | oklch(0.52 0.14 150) / #2E8540 | oklch(0.58 0.12 150) / #3A9A4A | Plus clair en dark pour lisibilité |
| `color.feedback.error` | oklch(0.50 0.19 25) / #D32F2F | oklch(0.55 0.17 25) / #E04040 | Plus clair en dark |
| `color.feedback.warning` | oklch(0.76 0.15 80) / #F9A825 | oklch(0.72 0.13 80) / #E89520 | |
| `color.border.default` | oklch(0.90 0.005 230) / #E0E2E4 | oklch(0.30 0.005 230) / #3A3E42 | Sombre en dark |
| `color.border.focus` | oklch(0.73 0.17 70) / #F5920A | oklch(0.70 0.15 70) / #E58A0A | Suit l'accent |
| `shadow.sm` | 0 1px 2px oklch(0.20 0 0 / 0.05) | 0 1px 2px oklch(0 0 0 / 0.3) | Opacité augmentée en dark |
| `shadow.md` | 0 4px 12px oklch(0.20 0 0 / 0.08) | 0 4px 12px oklch(0 0 0 / 0.4) | |
| `shadow.lg` | 0 8px 24px oklch(0.20 0 0 / 0.12) | 0 8px 24px oklch(0 0 0 / 0.5) | |
| `shadow.xl` | 0 16px 48px oklch(0.20 0 0 / 0.16) | 0 16px 48px oklch(0 0 0 / 0.6) | |
| `shadow.accent-glow` | 0 4px 20px oklch(0.73 0.17 70 / 0.25) | 0 4px 20px oklch(0.70 0.15 70 / 0.35) | Glow plus prononcé en dark |

### Dark mode design principles

1. **Surfaces escalate upward** : `surface.primary` (darkest) → `surface.secondary` (slightly lighter) → `surface.elevated` (lightest). This is the inverse of light mode.
2. **Text is off-white, not pure white** : `text.primary` in dark mode is oklch(0.95), not oklch(1.0). Reduces eye strain.
3. **Brand green is desaturated** : oklch chroma drops from 0.14 to 0.12 in dark mode. Prevents "neon glow" effect.
4. **Accent orange stays vibrant** : only slight lightness reduction. Orange on dark backgrounds needs less adjustment.
5. **Shadows are heavier** : opacity increases 3-5x in dark mode. Subtle shadows from light mode are invisible on dark surfaces.
6. **Focus rings maintain visibility** : `border.focus` uses the accent orange, which is naturally visible on both light and dark backgrounds.
7. **Images/logos** : grayscale logos remain as-is. No additional filtering. Mascotte and product images are not darkened.
8. **Text on accent CTA** : in dark mode, CTA text switches to dark (`oklch(0.13)`) instead of white, because orange on dark has sufficient lightness that dark text achieves better contrast.
