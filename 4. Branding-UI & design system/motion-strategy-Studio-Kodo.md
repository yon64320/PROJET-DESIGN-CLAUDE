# Motion & Effects Strategy — Studio Kodo

> **Version :** v2.0
> **Date :** 2026-04-01
> **Agent :** vitrine-ui-design-system
> **Destinataire :** Agent 5 (Tech Stack)
> **Niveau d'ambition :** Discreet premium
> **Animation Tier sélectionné : Tier 1 — CSS-only** *(voir Section 0 pour justification)*

---

## 0. PHILOSOPHY & TIER SELECTION

**Le mouvement chez Studio Kodo est un outil, pas un ornement.**

Chaque animation doit répondre à l'une de ces trois questions :
1. **Guide-t-elle le regard ?** (scroll reveal qui dirige vers le CTA)
2. **Confirme-t-elle une action ?** (feedback de clic, validation formulaire)
3. **Marque-t-elle une transition d'état ?** (hover, expand, theme switch)

Si la réponse est "non" aux trois → pas d'animation.

**Niveau d'ambition : discreet premium.** Le mouvement est ressenti, pas remarqué. Le visiteur ne se dit pas "c'est animé" — il se dit "c'est fluide". La sobriété du mouvement reflète la philosophie mid-century : chaque geste est intentionnel.

### Sélection du Tier d'animation

| Tier | Description | JS Budget | Statut pour Studio Kodo |
|------|-------------|-----------|------------------------|
| **Tier 1** | CSS-only, 0KB JS animation | 0 KB | ✅ **SÉLECTIONNÉ** |
| **Tier 2** | GSAP + ScrollTrigger + Lenis | ~28 KB gz | Disponible si upgrade demandé |
| **Tier 3** | Tier 2 + Spline 3D | +150–300 KB lazy | Non justifié pour ce projet |

**Justification Tier 1 pour Studio Kodo :**
- Audience PME/artisan → Lighthouse mobile ≥ 95 prioritaire
- Style mid-century → esthétique plate, mouvement sobre
- Animations cibles réalisables en CSS natif + IntersectionObserver (< 1KB)
- Preuve de compétence via qualité statique, pas via effets JS

**Conditions d'upgrade vers Tier 2 :** Si le client demande explicitement des effets de type parallax, magnetic CTAs, ou word-split, et valide l'impact perf (~28KB gz).

---

## 1. SIGNATURE MOMENTS (3 maximum)

### Moment 1 — Hero entrance (Accueil)
**Tier minimum : 1**

**Objectif :** Établir immédiatement le niveau de qualité. Le premier mouvement du site dit "ce n'est pas un template".

**Effet :** Entrée en cascade (stagger) des éléments du hero :
1. H1 — fade-in + translateY(20px→0) — 400ms
2. Sous-titre — même animation — décalé de 100ms
3. CTAs — même animation — décalé de 200ms
4. Visuel (composition/mockup) — fade-in + scale(0.98→1) — décalé de 300ms

**Propriétés animées :** `transform` + `opacity` uniquement (GPU-composited).

**Easing :** `ease-entrance` — `cubic-bezier(0, 0, 0.2, 1)`

**Budget :** Aucun impact sur LCP — les éléments sont dans le DOM, seule leur visibilité est animée. L'animation commence APRÈS le premier paint.

**Reduced motion :** Les 4 éléments apparaissent instantanément (opacity 0→1 en 100ms, pas de translate ni scale).

---

### Moment 2 — Case study card hover (Réalisations)
**Tier minimum : 1**

**Objectif :** Créer une sensation de profondeur et d'exploration. Le visiteur "plonge" dans le projet.

**Effet :** Au hover sur une vignette case study :
1. L'image zoome légèrement — scale(1→1.03) — 300ms
2. L'ombre s'épaissit — `shadow-card` → `shadow-elevated`
3. L'overlay gradient s'assombrit légèrement (opacity 0.7→0.8)

**Propriétés animées :** `transform` sur l'image (composited), `opacity` sur pseudo-element pour ombre et overlay.

**Easing :** `ease-state-change` — `cubic-bezier(0.4, 0, 0.2, 1)`

**Budget :** overflow:hidden sur conteneur empêche tout CLS. Tout composited — 0 layout/paint cost.

**Reduced motion :** Ombre + overlay changent (état statique), pas de zoom image.

---

### Moment 3 — Form step transitions (Contact)
**Tier minimum : 1**

**Objectif :** Le formulaire multi-étapes doit être fluide — chaque transition renforce la sensation de progression et de rapidité.

**Effet :**
1. Étape actuelle — fade-out + translateX(0→-20px) — 200ms
2. Étape suivante — fade-in + translateX(20px→0) — 300ms
3. La barre de progression avance — fill width transition 300ms
4. Les step dots se remplissent avec un flash subtil de `accent-action`

**Propriétés animées :** `transform` + `opacity` (composited).

**Easing :** Step out : `ease-exit`. Step in : `ease-entrance`. Progress : `ease-state-change`.

**Budget :** Aucun layout shift — chaque étape occupe le même espace (position: absolute dans conteneur fixe).

**Reduced motion :** Swap instantané (opacity 0→1 en 100ms), progress bar avance sans transition.

---

## 2. AUTHORIZED EFFECTS (catalogue complet)

| # | Effet | Où | Easing | Duration | Properties | Purpose | **Min Tier** |
|---|-------|-----|--------|----------|------------|---------|-------------|
| 1 | **Stagger entrance** | Hero, process steps, metrics | `ease-entrance` | 400ms + 100ms stagger | transform, opacity | Guide le regard dans la hiérarchie | **1** |
| 2 | **Scroll reveal** | Sections below fold (preuves, services, process) | `ease-entrance` | 400ms, IntersectionObserver 0.2 | transform(translateY 20px), opacity | Rythme le défilement | **1** |
| 3 | **Card hover depth** | Service cards, case study vignettes | `ease-state-change` | 200–300ms | transform(translateY, scale), box-shadow via opacity | Feedback tactile | **1** |
| 4 | **Accordion expand** | FAQ, services FAQ | `ease-entrance` | 300ms | grid-template-rows: 0fr→1fr | Transition naturelle | **1** |
| 5 | **Chevron rotation** | Accordion triggers | `ease-state-change` | 200ms | transform: rotate(90deg) | Indicateur d'état | **1** |
| 6 | **Button press** | Tous les boutons | — | 50ms | transform: scale(0.98) | Feedback d'action immédiat | **1** |
| 7 | **Button hover** | Tous les boutons | `ease-state-change` | 150ms | transform: scale(1.02), box-shadow | Invitation à cliquer | **1** |
| 8 | **Focus ring** | Tous les éléments interactifs | — | instant | outline | Accessibilité | **1** |
| 9 | **Link underline offset** | Liens inline | `ease-state-change` | 150ms | text-underline-offset | Feedback subtil | **1** |
| 10 | **Form step transition** | Formulaire multi-étapes | `ease-entrance` / `ease-exit` | 200–300ms | transform(translateX), opacity | Progression fluide | **1** |
| 11 | **Progress bar fill** | Formulaire progress | `ease-state-change` | 300ms | width | Feedback de progression | **1** |
| 12 | **Input border focus** | Champs de formulaire | `ease-state-change` | 150ms | border-color | Feedback d'état | **1** |
| 13 | **Dark mode switch** | Toutes surfaces et textes | `ease-state-change` | 200ms | background-color, color | Transition douce entre thèmes | **1** |
| 14 | **Nav shadow on scroll** | Header sticky | `ease-state-change` | 200ms | opacity on pseudo-element | Indique le scrolling | **1** |
| 15 | **Hamburger → X** | Menu mobile | `ease-state-change` | 300ms | transform (rotate+translate) | Feedback d'état du menu | **1** |
| 16 | **Mobile menu slide** | Menu overlay | `ease-entrance` | 300ms | transform: translateX | Transition contextuelle | **1** |
| 17 | **CTA arrow nudge** | Liens "Voir le projet →" | `ease-state-change` | 200ms | transform: translateX(4px) on arrow | Direction du regard | **1** |
| 18 | **Count-up numbers** | Metrics sections | linear | ~1000ms | textContent via JS | Ancre l'attention sur les chiffres | **1** |
| 19 | **Image LQIP reveal** | Toutes images lazy | `ease-entrance` | 300ms | filter: blur(20px→0), opacity | Chargement progressif élégant | **1** |
| 20 | **Parallax décoration** | Éléments décoratifs (bg shapes, pas de contenu) | `ease-state-change` | scroll-linked | transform: translateY (ratio 0.2x) | Profondeur subtile | **2** |
| 21 | **Word-split text** | Titres H1/H2 non-critiques uniquement | `ease-entrance` | 600ms stagger 30ms/word | transform, opacity per word | Signature premium | **2** |
| 22 | **Magnetic button** | CTAs primaires uniquement (1 par page max) | `ease-state-change` | 300ms | transform: translate(x, y) mouse-follow | Premium tactile | **2** |
| 23 | **Smooth scroll (Lenis)** | Toute la page | — | système | scroll velocity smoothing | Fluidité globale | **2** |
| 24 | **Spline 3D island** | Hero ou section dédiée | — | lazy load | iframe/canvas WebGL | Signature 3D lazy | **3** |

---

## 3. EFFECTS TO AVOID (anti-cliché)

| # | Effet interdit | Raison | Alternative autorisée | **Tier Override** |
|---|----------------|--------|----------------------|------------------|
| 1 | **Parallax scrolling (contenu)** | CLS risk, motion sickness, coût perf | Scroll reveal simple (translateY) | Autorisé Tier 2 sur décoratifs uniquement |
| 2 | **Hover animations sur mobile** | `hover` n'existe pas sur touch | Tap feedback via `:active` state | Aucun |
| 3 | **Auto-play vidéo** | Poids LCP, data mobile, intrusif | Image statique + play button | **Jamais (tous tiers)** |
| 4 | **Slider / carrousel** | < 1% interaction après slide 1, CLS | Grille statique | **Jamais (tous tiers)** |
| 5 | **Compteurs au load (sans scroll)** | Mensonger, cliché template | Count-up au scroll via IntersectionObserver | Aucun |
| 6 | **Curseur custom** | Inaccessible, poids JS, fatigue | Cursor: pointer natif | **Jamais (tous tiers)** |
| 7 | **Animations lettre par lettre** | Inaccessible screen readers, poids JS | Fade-in par bloc (Tier 1) | Autorisé Tier 2 : word-split (pas lettre) |
| 8 | **Gradient animé sur boutons** | Poids paint, non-composited | Flat color + transform scale | Aucun |
| 9 | **Floating elements** | Distraction, CLS risk, motion sickness | Éléments statiques + whitespace | Aucun |
| 10 | **Page transition full-screen** | SPA uniquement, lourd | Navigation instantanée | Aucun |
| 11 | **Glassmorphism / blur surfaces** | Poids GPU mobile, cliché | Surfaces plates avec shadow token | **Jamais (tous tiers)** |
| 12 | **Scroll-jacking** | Accessibility nightmare, UX détesté | Scroll natif (Lenis = smooth, pas jacking) | **Jamais (tous tiers)** |
| 13 | **Mouse-follow effects (global)** | Poids JS, pas de sens sur touch | Rien (magnetic CTA Tier 2 = local, pas global) | Autorisé Tier 2 : magnetic sur CTAs uniquement |

---

## 4. 3D DECISION FRAMEWORK

### Tier 1 — Aucun 3D (recommandé Studio Kodo)

**Profondeur via CSS uniquement :**
- Shadows graduées (`shadow-subtle` → `shadow-card` → `shadow-elevated`) pour hiérarchie de surfaces
- `translateY(-2px)` + shadow lift sur hover pour simuler l'élévation
- scale(1.03) sur images au hover
- Overlay gradients pour séparation texte/image

**Ces techniques sont suffisantes pour Studio Kodo.** Le style mid-century est plat par nature — formes géométriques et whitespace créent la profondeur, pas les effets 3D.

### Tier 2 — 3D conditionnel (non applicable Studio Kodo)

Justification requise :
- Produit physique avec mockup 3D interactif
- Case studies avec interfaces complexes à explorer
- Différenciateur technique (démo WebGL)

**→ Studio Kodo vend du design + dev. La preuve passe par la qualité statique, pas par l'interactivité 3D.**

### Tier 3 — Spline 3D lazy island

Pattern si activé (Tier 3 uniquement) :
- Chargement lazy (`loading="lazy"` ou dynamic import)
- Skeleton visible pendant le load (évite CLS)
- Fallback image statique si WebGL indisponible
- Budget perf : Lighthouse mobile ≥ 85 après lazy load
- Isolation : island Astro ou React Server Component, pas de contamination du bundle principal

**→ Non justifié pour Studio Kodo (audience PME, style mid-century, Lighthouse ≥ 95 obligatoire).**

---

## 5. REDUCED MOTION FALLBACK (complet)

Quand `prefers-reduced-motion: reduce` est actif :

| Ce qui est SUPPRIMÉ | Ce qui est CONSERVÉ | Ce qui est REMPLACÉ |
|---------------------|---------------------|---------------------|
| Scroll reveal (translateY) | Hover state changes (color, shadow — pas de translate) | Stagger entrance → opacity 0→1 en 100ms |
| Image zoom on hover | Focus ring (instant) | Form step transition → swap instantané |
| Count-up numbers | Loading spinners | Progress bar fill → instant width |
| CTA arrow nudge | Input border transitions | Dark mode → instant swap |
| Parallax (Tier 2 — déjà interdit Tier 1) | Button active press (feedback essentiel) | Accordion → instant open/close |
| Word-split text (Tier 2) | Form validation feedback | LQIP blur → instant image |
| Magnetic buttons (Tier 2) | — | → static button |
| Smooth scroll Lenis (Tier 2) | — | → scroll natif |
| Spline 3D (Tier 3) | — | → image statique fallback |

**Implémentation CSS :**

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }

  /* Preserve essential feedback */
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

---

## 6. ANIMATION BUDGET

### Timing par catégorie

| Catégorie | Durée | Easing CSS | Propriétés autorisées |
|-----------|-------|------------|----------------------|
| Micro-interaction (press, toggle) | 50–150ms | `ease-out` | transform, opacity |
| State transition (hover, focus) | 150–300ms | `ease-state-change` `cubic-bezier(0.4, 0, 0.2, 1)` | transform, opacity, background-color (petits éléments) |
| Content entrance (scroll reveal) | 200–500ms | `ease-entrance` `cubic-bezier(0, 0, 0.2, 1)` | transform, opacity |
| Content exit (dismiss, modal close) | 150–300ms | `ease-exit` `cubic-bezier(0.4, 0, 1, 1)` | transform, opacity |
| Layout change (accordion, menu) | 200–400ms | `ease-state-change` | transform, grid-template-rows |

### Budgets par Tier

| Règle | Tier 1 | Tier 2 | Tier 3 |
|-------|--------|--------|--------|
| JS animation budget | 0 KB (CSS + IO uniquement) | ≤ 28 KB gz (GSAP + Lenis) | ≤ 28 KB + 150–300 KB lazy |
| Durée maximale | 500ms | 800ms (entrées complexes) | 800ms (hors 3D) |
| Éléments animés simultanés max | 5/viewport | 8/viewport | 8/viewport |
| Propriétés animées | transform + opacity | transform + opacity + Lenis | idem |
| Bibliothèques requises | Aucune | gsap, lenis | gsap, lenis, @splinetool/react-spline |

### Core Web Vitals gates

| Métrique | Budget | Ce qui le casse |
|----------|--------|-----------------|
| **INP** | ≤ 200ms | JS bloquant pendant animation, handlers lourds |
| **CLS** | ≤ 0.12 | Éléments animés qui déplacent le contenu adjacent |
| **LCP** | ≤ 2.5s | Hero animation qui retarde le largest paint |

### Budget par page

| Page | Animations autorisées | Tier min | Notes |
|------|----------------------|----------|-------|
| **Accueil** | Stagger hero (1), scroll reveal sections (3-4), card hover (4 cards) | 1 | Max 5 simultanés |
| **Services** | Scroll reveal sections, card hover (3 cards), accordion FAQ | 1 | Pas de stagger hero |
| **Réalisations** | Card hover (4 cards), scroll reveal header | 1 | Galerie statique |
| **Case study** | Scroll reveal sections, count-up metrics optionnel | 1 | Max 5 éléments à la fois |
| **À propos** | Scroll reveal (récit, convictions, process), process stagger | 1 | — |
| **Contact** | Form step transition (1 à la fois), progress bar, input focus | 1 | Pas de scroll reveal |

---

## 7. TECHNICAL IMPLEMENTATION NOTES (for Agent 5)

### Tier 1 — CSS-only (recommandé Studio Kodo)

```css
/* Named easings as custom properties */
:root {
  --ease-entrance: cubic-bezier(0, 0, 0.2, 1);
  --ease-exit: cubic-bezier(0.4, 0, 1, 1);
  --ease-state-change: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-bounce: cubic-bezier(0.34, 1.56, 0.64, 1);
}
```

**Scroll reveal pattern (IntersectionObserver) :**
- Trigger : `threshold: 0.2`
- Class toggle : `.is-revealed` → CSS transition
- Initial state : `opacity: 0; transform: translateY(20px)`
- Revealed state : `opacity: 1; transform: translateY(0)`
- Stagger : `transition-delay` par index (100ms increments)
- Fallback sans JS : éléments visibles par défaut (progressive enhancement)

**Form step transition pattern :**
- Container : `position: relative; overflow: hidden`
- Steps : `position: absolute; width: 100%`
- Transition : opacity + translateX via CSS class swap
- Direction-aware : `.step-exit-left` / `.step-enter-right`

### Tier 2 — GSAP + ScrollTrigger + Lenis (si sélectionné)

**Initialisation GSAP dans Astro (island pattern) :**

```ts
// src/scripts/gsap-init.ts
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

export function initScrollAnimations() {
  // ScrollTrigger sync avec Lenis
  ScrollTrigger.scrollerProxy(document.body, {
    scrollTop(value) {
      if (arguments.length && lenis) {
        lenis.scrollTo(value as number)
      }
      return lenis?.scroll ?? window.scrollY
    },
    getBoundingClientRect() {
      return { top: 0, left: 0, width: window.innerWidth, height: window.innerHeight }
    },
  })
}
```

**Lenis init + ScrollTrigger sync :**

```ts
// src/scripts/lenis-init.ts
import Lenis from 'lenis'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

export function initLenis() {
  const lenis = new Lenis({
    duration: 1.2,
    easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
  })

  lenis.on('scroll', ScrollTrigger.update)

  gsap.ticker.add((time) => {
    lenis.raf(time * 1000)
  })
  gsap.ticker.lagSmoothing(0)

  return lenis
}
```

**Cleanup obligatoire dans Astro View Transitions :**

```ts
// Nettoyer ScrollTrigger à chaque navigation
document.addEventListener('astro:before-swap', () => {
  ScrollTrigger.getAll().forEach(t => t.kill())
  lenis?.destroy()
})
```

### Tier 3 — Spline 3D island (si sélectionné)

```astro
---
// src/components/SplineHero.astro
// Island pattern — ne charge que si Tier 3 sélectionné
---
<div id="spline-container" style="min-height: 400px;">
  <!-- Skeleton visible pendant load -->
  <div class="spline-skeleton" aria-hidden="true"></div>
</div>

<script>
  // Lazy load Spline uniquement si WebGL disponible
  const canvas = document.createElement('canvas')
  const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl')

  if (gl) {
    import('@splinetool/runtime').then(({ Application }) => {
      const app = new Application(document.getElementById('spline-canvas'))
      app.load('https://prod.spline.design/[scene-id]/scene.splinecode')
        .then(() => {
          document.querySelector('.spline-skeleton').remove()
        })
    })
  } else {
    // Fallback image statique si WebGL indisponible
    document.getElementById('spline-container').innerHTML =
      '<img src="/hero-fallback.jpg" alt="Studio Kodo" loading="eager" />'
  }
</script>
```

---

*Fin de la motion strategy v2. Ce document accompagne `design-system-v1-Studio-Kodo.md`, `tokens.json`, et `component-handoff-Studio-Kodo.md` pour l'agent 5.*
