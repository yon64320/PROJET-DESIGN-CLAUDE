# Component Handoff Table — Studio Kodo

> **Version :** v2.0
> **Date :** 2026-04-01
> **Agent :** vitrine-ui-design-system
> **Destinataire :** Agent 5 (Tech Stack)
> **Référence tokens :** tokens.json (W3C Design Tokens 2025.10)
> **Animation Tier :** Tier 3 — GSAP + ScrollTrigger + Lenis + Spline 3D *(validé PRD v1.2)*
> **Changement v2.0 :** Animations CSS remplacées par GSAP. Composants Tier 3 ajoutés (SplineHeroIsland, MagneticButton, ParallaxSection, WordSplitHeading). ScrollTrigger triggers par section. Cleanup View Transitions.

---

## A. COMPONENT TABLE

### Buttons

| Component | States | Tokens used | Animation (easing, duration) | Responsive behavior | A11y requirements |
|-----------|--------|-------------|------------------------------|--------------------|--------------------|
| **Button — primary** | default, hover, focused, active, disabled, loading, error, success | bg: `accent-action`, text: `text-on-accent`, radius: `radius-md`, shadow: `shadow-subtle`→`shadow-card`, padding: `space-element` H + `space-element-sm` V | hover: GSAP `power2.out` 150ms scale(1.02)+shadow; active: 50ms scale(0.98); loading: spinner after 300ms delay. **Tier 3 : `data-magnetic` attribute** → magnetic effect (rayon 80px, strength 0.3, retour `elastic.out(1, 0.4)` 500ms). Desktop only, pas sur mobile/touch. | Full-width < 640px, auto-width ≥ 640px, min-height 48px always | `role="button"`, `aria-disabled="true"` when disabled, `aria-busy="true"` when loading, `:focus-visible` ring 2px `accent-action` offset 2px, contrast ≥ 4.5:1. Magnetic : pas d'effet au focus clavier. |
| **Button — secondary** | default, hover, focused, active, disabled | bg: transparent, text+border: `accent-action` 1.5px, radius: `radius-md` | hover: `ease-state-change` 150ms bg-opacity 8%; active: 12% | Same as primary | Same ARIA, contrast ≥ 4.5:1 |
| **Button — ghost** | default, hover, focused | bg: transparent→`surface-secondary`, text: `text-primary`, radius: `radius-md` | hover: `ease-state-change` 150ms bg | Same as primary | `:focus-visible` ring |
| **Button — icon** | default, hover, focused | bg: transparent, icon: `text-secondary`→`text-primary`, 44×44px touch target | hover: `ease-state-change` 150ms color | Fixed 44×44px all breakpoints | `aria-label` required, `:focus-visible` ring |

### Links

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Link — inline** | default, hover, focused, active | color: `accent-action`→`accent-action-hover`, underline, offset +2px hover | `ease-state-change` 150ms | No change | Underline always visible, `:focus-visible` ring 2px |
| **Link — nav** | default, hover, focused, active page | `text-primary`→`accent-action`, active: underline 2px offset 4px | `ease-state-change` 150ms | Inline desktop, stack in mobile overlay | `aria-current="page"`, `:focus-visible` |
| **Link — CTA arrow** | default, hover | `accent-action`, arrow "→", hover: arrow translateX(4px) | `ease-state-change` 200ms transform | No change | Descriptive text |

### Badges

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Badge — category** | default | bg: `surface-secondary`, text: `text-secondary`, Jost 600 `body-xs` uppercase ls:0.08em, radius: `radius-sm`, pad: `space-inline` H / `space-inline-sm` V | None | No change | — |
| **Badge — "Projet concept"** | default | bg: `accent-warm` 15%, text: `accent-warm` dark value, radius: `radius-sm` | None | No change | `aria-label="Projet concept — démonstration"` |
| **Badge — duration** | default | bg: `accent-action` 10%, text: `accent-action`, radius: `radius-sm` | None | No change | — |

### Cards

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Card — service** | default, hover, focused | bg: `surface-elevated`, shadow: `shadow-card`→`shadow-elevated`, radius: `radius-lg`, pad: `space-component-sm` | hover: GSAP `power2.out` 300ms `y: -4, scale: 1.02` + shadow lift. **Tier 3 :** ScrollTrigger `top 75%` → stagger reveal `from({y:30, opacity:0})` 200ms entre cartes. | 3 col ≥ 1024, 1 col < 1024 | `<a>` wrapper if clickable, `:focus-visible` ring |
| **Card — case study** | default, hover, focused | image overflow:hidden, overlay gradient, text: `text-on-accent`, radius: `radius-lg`, badge overlay | hover: GSAP `power2.out` 300ms image scale(1.03). **Tier 3 :** Card parallax interne (image `x/y` mouse-follow dans le cadre). ScrollTrigger `top 80%` → stagger reveal 150ms entre vignettes. | 2×2 ≥ 1024, 2×1 640–1023, 1 col < 640. Ratio 3:2 | `<a>` wrapper, img alt, `:focus-visible`, badge aria-label |
| **Card — differentiation** | default | icon 24px `accent-action`, title Jost 600 `heading-lg`, body Lora `body-md`, bg transparent | None | 3 col ≥ 1024, stack < 1024 | H3 heading |

### Accordion / FAQ

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Accordion item** | collapsed, hover, focused, expanded | trigger: Jost 600 `heading-lg`, chevron `text-secondary`, border: `border-subtle`→`border-strong`, content: Lora `body-md`, hover bg: `surface-secondary`, pad: `space-element` V | expand: `ease-entrance` 300ms `grid-template-rows: 0fr→1fr`; chevron: `ease-state-change` 200ms rotate | Full-width all breakpoints | `aria-expanded`, `aria-controls`, keyboard Enter/Space |

### Forms

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Text input** | default, hover, focused, disabled, error, success | bg: `surface-elevated`, border: 1.5px `border-subtle`→`border-strong`→2px `accent-action`/`status-error`/`status-success`, radius: `radius-sm`, h:48px, pad: `space-element` H, font: Lora `body-md`, label: Jost 500 `body-sm` | border: `ease-state-change` 150ms | Full-width, max-width 600px in form | `<label>` above, `aria-describedby` error, `aria-invalid`, `aria-required`, `autocomplete` |
| **Textarea** | same as input | same + min-h:120px, resize:vertical | same | same | same |
| **Select** | default, hover, focused, disabled | same as input + custom chevron | same | same | Native `<select>` preferred |
| **Checkbox** | default, hover, checked, focused, disabled | 20×20px, border: 1.5px `border-strong`, checked: `accent-action` bg, check: `text-on-accent` | `ease-entrance` 150ms scale | No change | `<input type="checkbox">` + `<label>`, `<fieldset>`+`<legend>` for groups |
| **Selection button** | default, hover, selected, focused | bg: `surface-elevated`, border: 1.5px `border-subtle`→2px `accent-action`, selected: `accent-action` 8% bg, shadow: `shadow-subtle`→`shadow-card`, radius: `radius-md`, min-h:56px, Jost 500 | `ease-state-change` 150ms | 2 col ≥ 640, 1 col < 640 | `role="radiogroup"`, `role="radio"`, `aria-checked`, arrow keys |
| **Progress bar** | — | track: `border-subtle`, fill: `accent-action`, h:4px, radius: `radius-full`, dots: 8px circles | fill: `ease-state-change` 300ms width | Full-width in form | `role="progressbar"`, `aria-valuenow/min/max`, `aria-label` |

### Navigation

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Header** | default, scrolled | bg: `surface-primary` 95% + blur(12px), h:72/60px, z:50, scroll shadow: `shadow-subtle` | shadow: `ease-state-change` 200ms opacity | Full nav ≥ 1024, hamburger < 1024 + bottom CTA bar | `<nav aria-label="Navigation principale">`, skip link, `aria-current` |
| **Hamburger** | closed, open | lines→X, color: `text-primary` | `ease-state-change` 300ms transform | Only < 1024px | `<button aria-expanded aria-controls aria-label>` |
| **Mobile menu** | closed, open | bg: `surface-primary`, overlay: `surface-overlay`, shadow: `shadow-overlay` | slide-in right: `ease-entrance` 300ms translateX | Full-screen overlay | `role="dialog"`, focus trap, `aria-modal`, Escape close |
| **Dark toggle** | light, dark | sun/moon 20px, `text-secondary`→`text-primary` | `ease-state-change` 200ms opacity+rotate(180deg) | Same all breakpoints | `<button aria-label="Basculer en mode sombre/clair">` |
| **Mobile CTA bar** | default | bg: `surface-elevated`, shadow-top: `shadow-card`, CTA full-width, h:64px | None | Only < 1024px, sticky bottom, z:40 | Separate from nav landmark |

### Footer

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Footer** | default | bg: `surface-secondary`/`surface-primary` (dark), pad: `space-section-sm`, separator: 1px `border-subtle` | None | 2 col ≥ 640, stack < 640 | `<footer>`, `<nav aria-label="Navigation secondaire">` |
| **Social icon** | default, hover, focused | 20px `text-muted`→`accent-action` | `ease-state-change` 150ms | No change | `<a aria-label="Studio Kodo sur [platform]">` |

### Sections

| Component | States | Tokens used | Animation | Responsive | A11y |
|-----------|--------|-------------|-----------|------------|------|
| **Hero** | default | bg: `surface-primary`, H1: Jost 700 `heading-5xl`, sub: Lora `body-lg` `text-secondary`, CTAs gap `space-element`, pad: `space-section` | **Tier 3 — GSAP timeline (page load) :** t=100ms H1 word-split (`SplitText`, stagger 0.06, `power3.out`, 800ms, `from({y:40, opacity:0, rotateX:-10})`). t=400ms sous-titre fade-in `power2.out` 600ms. t=600ms CTAs stagger 100ms. t=800ms scroll indicator bounce yoyo. **Spline 3D island** lazy-loaded zone droite (5-6 col). Skeleton CSS → scène fade-in à ~1.5s. | Asymmetric 2-col ≥ 1024 (texte 5-6 col + Spline 5-6 col), stack < 1024 (text first, Spline below). Spline hidden < 640px (fallback image). | `<h1>` unique, CTA above fold. Spline: `aria-hidden="true"` (décoratif). Skeleton: sr-only "Scène 3D interactive en cours de chargement". |
| **Section conversion** | default | bg: `surface-secondary`/`surface-elevated` dark, headline: Jost 600 `heading-3xl` centered, CTA centered max-w:320px | **Tier 3 :** ScrollTrigger `top 70%` → word-split headline (`power3.out` 800ms) + magnetic button CTA (`data-magnetic`). | Centered all breakpoints | Phone: `<a href="tel:">` |
| **Process frise** | default | circles `accent-action`, Jost 600 titles, Lora text, badge duration, connector 2px `border-subtle` | **Tier 3 — ScrollTrigger storyboard scrub 0.8 :** ligne `scaleX: 0→1` (ease `none`), chaque étape reveal séquentiel `from({y:30, opacity:0})` aux positions 0.1/0.4/0.7. Desktop: scaleX horizontal. Mobile: scaleY vertical. | Horizontal ≥ 1024 (flex-row), Vertical < 1024 (flex-column, line left) | `<ol>` semantic |
| **Case study hero** | default | image full-bleed 16:9, overlay gradient, badge, H1: `text-on-accent` Jost 700 `heading-4xl` | **Tier 3 :** Word-split H1 (`SplitText`, `power3.out`, 800ms) + image parallax vertical `yPercent: -10→10` scrub via ScrollTrigger. | Image covers width, text bottom-left | Alt on image, badge aria-label. Word-split: texte dans le DOM (progressive enhancement). |
| **Metrics row** | default | number: Jost 700 `heading-3xl` `accent-action`, label: Lora `body-sm` `text-secondary` | **Tier 3 — Counter animation GSAP :** ScrollTrigger `top 80%` → `textContent` tween 1.5s, `power2.out`, snap entier. Prefix/suffix via `data-prefix`/`data-suffix`. Reduced motion: chiffre final instantané. | 3-4 col ≥ 1024, 2 col ≥ 640, stack < 640 | `<dl>` for metric+label |

### Tier 3 Components (nouveaux)

| Component | States | Tokens used | Animation (GSAP) | Responsive behavior | A11y requirements |
|-----------|--------|-------------|-------------------|--------------------|--------------------|
| **SplineHeroIsland** | skeleton, loaded, fallback, error | min-height: 400px, bg: `surface-primary` | Skeleton: CSS pulse géométrique. Chargé: skeleton fade-out 500ms `power2.out` → canvas fade-in. Fallback: image statique (WebGL absent ou timeout 5s). | ≥ 1024: zone 5-6 col droite du hero. 640–1023: below text, max-height 300px. < 640: hidden (fallback image only). | `aria-hidden="true"` (décoratif). Skeleton sr-only: "Scène 3D interactive en cours de chargement". Fallback: `alt` descriptif. Reduced motion: image fallback. |
| **MagneticButton** | default, magnetic-hover, focused, active, disabled | Hérite du Button primary. `data-magnetic` attribute. | Approche: `power2.out` 300ms, strength 0.3, radius 80px. Retour: `elastic.out(1, 0.4)` 500ms. Pas d'effet sur touch/mobile. | Même responsive que Button primary. | Focus clavier: aucun mouvement magnétique. sr-only: "Ce bouton réagit au mouvement de votre curseur". Reduced motion: hover standard (scale 1.02 + shadow). |
| **ParallaxSection** | default | Conteneur `overflow: hidden`. Image: `yPercent: -15→15` scrub. | ScrollTrigger `start: "top bottom"`, `end: "bottom top"`, scrub: true, ease: `none`. Images avec ratio parallax 0.3x. | Toutes tailles. Images gardent leur ratio dans le conteneur. | Reduced motion: images statiques, pas de yPercent. Pas de parallax sur texte (lisibilité). |
| **WordSplitHeading** | default, animated | H1/H2 avec `[data-split]` attribute. Texte dans le DOM (progressive enhancement). | GSAP SplitText par mot (pas par lettre). `from({y:40, opacity:0, rotateX:-10})`, stagger 0.06s, duration 0.8s, `power3.out`. ScrollTrigger optionnel (`data-split-on-scroll`): trigger `top 75%`. | Texte reflow normal sur mobile. SplitText s'adapte aux breakpoints. | Texte lisible sans JS. Screen readers: texte complet (SplitText ne casse pas l'accessibilité). Reduced motion: texte apparaît d'un bloc, opacity 0→1 100ms. |
| **ScrollReveal** | hidden, revealed | `[data-animate]` attribute. Default: `from({y:20, opacity:0})`. | GSAP ScrollTrigger `top 75%`, `toggleActions: "play none none none"`, `power2.out` 500ms. Stagger si éléments frères. | Tous breakpoints. | Reduced motion: éléments visibles d'emblée (pas de reveal). `gsap.set("[data-animate]", {clearProps: "all"})`. |

---

## B. EFFECTS & CONSTRAINTS

| Effect | Component/Section | Perf budget | Fallback (reduced-motion / low-end) | **Min Tier** |
|--------|------------------|-------------|--------------------------------------|-------------|
| **Spline 3D island** | Hero Accueil (zone droite) | Lazy-load ~150-300KB. Ne bloque pas LCP. WebGL detection. Timeout 5s. | Image statique fallback | **3** |
| **Word-split entrance** | H1 Accueil, H1 À propos, H1 Case study, Headline conversion | SplitText ~4KB. Texte dans le DOM. | Texte apparaît d'un bloc, opacity 0→1 100ms | **2** |
| **Magnetic button** | Tous CTA "Demander un devis" | mousemove handler debounced. Desktop only. | Hover standard (scale 1.02 + shadow) | **2** |
| **Smooth scroll (Lenis)** | Toutes les pages | ~8KB eager. Sync avec ScrollTrigger.update | Scroll natif navigateur | **2** |
| **Parallax scroll** | Réalisations galerie, Case study galerie, À propos récit fondateur | Scrub ScrollTrigger, transform yPercent composited. overflow:hidden. | Images statiques | **2** |
| **ScrollTrigger storyboard** | Process (Accueil §5, À propos §4, Case study §4) | Scrub 0.8, composited only | Toutes étapes visibles d'emblée | **2** |
| **Stagger reveal** | Piliers, grilles, cartes services, scope items, convictions | ScrollTrigger batch. CLS ≤ 0.1 — reserved space. | Éléments visibles d'emblée | **2** |
| **Counter animation** | Chiffres clés (Accueil §6), Résultats (Case study §6) | textContent tween, pas de layout shift | Chiffre final affiché directement | **2** |
| **Card parallax interne** | Case study vignettes hover | Mouse-follow dans le cadre, composited | Pas de mouvement | **2** |
| **Form step transition** | Contact formulaire multi-étapes | GSAP `power2.inOut` 400ms translateX + opacity | Swap instantané | **2** |
| **Selection bounce** | Contact étapes 1, 4 (boutons sélection) | `back.out(1.7)` 200ms scale | Sélection instantanée | **2** |
| **Confirmation checkmark** | Contact post-soumission | SVG strokeDashoffset + scale 600ms | Checkmark statique | **2** |
| Hover depth (shadow + translateY) | Service cards, case study cards | GPU-composited only | Static shadow | **1** |
| Image zoom on hover | Case study vignettes | overflow:hidden, transform on img | No zoom | **1** |
| Chevron rotation | Accordion triggers | transform: rotate, composited | Instant change | **1** |
| Progress bar fill | Form progress | scaleX transform | Instant width | **2** |
| Dark mode transition | All themed elements | bg-color + color only, 200ms | Instant swap | **1** |
| Nav scroll shadow | Header | opacity on pseudo-element | Static shadow | **1** |
| Hamburger → X | Mobile menu button | transform on 3 lines | Instant change | **1** |
| Filter layout animation | Réalisations filtres | GSAP `power2.inOut` 400ms position | Layout instantané | **2** |

---

## C. ASSET LIST

| Asset | Format | Sizes | Usage | Priority |
|-------|--------|-------|-------|----------|
| Logo Studio Kodo | SVG | — | Nav, footer, favicon source | Critique |
| Favicon | SVG + ICO + PNG | 32×32, 180×180 | Browser tab, bookmarks | Critique |
| Hero composition | WebP + AVIF | 1920w, 1440w, 1024w, 640w | Accueil hero | Critique |
| Case study heroes (×4) | WebP + AVIF | 1920w, 1440w, 1024w, 640w | Case study + vignette accueil | Critique |
| Case study galleries (×4) | WebP + AVIF | 1440w, 1024w, 640w | 4-8 images each | Haute |
| Photo fondateur | WebP + AVIF | 800w, 400w (1:1) | À propos | Haute |
| Icônes différenciation (×3) | SVG | 24×24 | Accueil bande | Moyenne |
| Icônes process (×3) | SVG | 24×24 | Accueil + À propos | Moyenne |
| Social icons (×2) | SVG | 20×20 | Footer | Basse |
| OG image | PNG | 1200×630 | Social sharing | Moyenne |
| LQIP placeholders | Base64 inline | 20px wide | All lazy images | Critique |

| Spline 3D scene file | .splinecode | — | Accueil hero island | Critique |
| Spline fallback image | WebP + AVIF | 1440w, 1024w, 640w | Fallback quand WebGL absent | Critique |

**Image specs :** WebP primary, AVIF optional, srcset 4 sizes, `loading="lazy"` except hero, LQIP blur-up, editorial treatment `filter: contrast(0.95) saturate(0.9)`.

---

## D. DARK MODE TOKEN OVERRIDES

| Token | Light value | Dark value |
|-------|-------------|------------|
| `surface-primary` | #FAF7F2 | #1A1A18 |
| `surface-secondary` | #F2EDE5 | #242422 |
| `surface-elevated` | #FFFFFF | #2E2E2C |
| `surface-overlay` | rgba(26,26,24,0.6) | rgba(0,0,0,0.7) |
| `text-primary` | #1A1A18 | #F2EDE5 |
| `text-secondary` | #4A4A46 | #B8B2A8 |
| `text-muted` | #8A8A84 | #7A7670 |
| `text-on-accent` | #FFFFFF | #FFFFFF |
| `accent-action` | #008F82 | #00B5A5 |
| `accent-action-hover` | #007A6F | #00CDB8 |
| `accent-warm` | #D4991A | #E8B830 |
| `accent-secondary` | #C86218 | #E07828 |
| `accent-tertiary` | #6E7228 | #8A8E38 |
| `border-subtle` | #E5E0D8 | #333330 |
| `border-strong` | #C8C2B8 | #4A4A46 |
| `status-success` | #2D7A4F | #3DA566 |
| `status-error` | #C4382A | #E04E40 |
| `shadow-*` opacity | 0.06–0.16 | 0.2–0.5 |

**Dark mode principles :** warm charcoal (never #000), elevation = lighter surface, accents lifted +10-15% luminosity, shadows more opaque, text warm cream not pure white.

---

## E. ASTRO VIEW TRANSITIONS — CLEANUP PATTERN (Tier 3)

Les animations GSAP, ScrollTrigger et Lenis doivent être nettoyées à chaque navigation Astro pour éviter les fuites mémoire et les conflits.

**`astro:before-swap` (avant navigation) :**
- `ScrollTrigger.getAll().forEach(t => t.kill())` — tuer tous les ScrollTriggers
- `gsap.killTweensOf("*")` — tuer tous les tweens en cours
- `lenis.destroy()` — détruire l'instance Lenis
- SplitText: revert automatique au retrait des éléments

**`astro:after-swap` (après navigation) :**
- Re-init Lenis (nouvelle instance)
- Détecter la page courante et init les animations appropriées
- Re-init magnetic buttons (`[data-magnetic]`)
- Re-init ScrollTrigger reveals (`[data-animate]`)
- Re-init word-split (`[data-split]`)
- Spline: init uniquement si page Accueil

**Pattern technique complet :** voir motion-strategy-Studio-Kodo.md v3.0 section 8.

---

## F. COMPLETENESS CHECKLIST

- [x] Every component from the design system has a row
- [x] No empty cells in the table
- [x] Token names match tokens.json exactly
- [x] Animation easings use GSAP named functions from motion strategy v3.0
- [x] Responsive breakpoints are logical (640 / 1024 / 1440 / 1920)
- [x] A11y includes ARIA attributes, not just "accessible"
- [x] Dark mode overrides cover all theme-dependent tokens
- [x] Asset formats include WebP/AVIF
- [x] Effects list includes perf budget and reduced-motion fallback
- [x] Tier 3 components added (SplineHeroIsland, MagneticButton, ParallaxSection, WordSplitHeading, ScrollReveal)
- [x] ScrollTrigger triggers specified for each animated section
- [x] View Transitions cleanup pattern documented
- [x] Spline 3D assets added to asset list
- [x] Min Tier column in effects table

---

*Fin du component handoff v2.0 (Tier 3). Entrée pour l'agent 5 avec `tokens.json` v1.1, `motion-strategy-Studio-Kodo.md` v3.0, et `design-system-v1-Studio-Kodo.md` v1.1.*
