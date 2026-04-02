---
name: astro-gsap-patterns
description: Provides ready-to-use patterns for integrating GSAP, ScrollTrigger, Lenis, and Spline inside Astro projects with View Transitions — covering init, cleanup, and Tier 1/2/3 implementation.
version: 1.0.0
triggers:
  - "GSAP dans Astro"
  - "ScrollTrigger cleanup"
  - "Lenis Astro"
  - "Spline island Astro"
  - "animation Tier 2 Astro"
  - "animation tier Astro"
  - "gsap astro view transitions"
when_not_to_use:
  - Pure CSS animations (Tier 1) — no GSAP needed
  - Non-Astro frameworks (use gsap-react or gsap-frameworks instead)
---

# Astro × GSAP Patterns

> Patterns d'intégration GSAP/Lenis/Spline dans Astro, compatibles View Transitions.
> Applicable aux Tiers 2 et 3 du système d'animation tiered.

---

## Tier 1 — CSS-only (rappel)

Tier 1 n'utilise pas GSAP. Patterns :
- CSS custom properties pour les easings (`--ease-entrance`, `--ease-exit`, `--ease-state-change`)
- IntersectionObserver natif pour scroll reveal (< 1KB JS)
- `transition` CSS sur `transform` + `opacity` uniquement

```css
:root {
  --ease-entrance: cubic-bezier(0, 0, 0.2, 1);
  --ease-exit: cubic-bezier(0.4, 0, 1, 1);
  --ease-state-change: cubic-bezier(0.4, 0, 0.2, 1);
}
```

```ts
// scroll-reveal.ts — Tier 1
const observer = new IntersectionObserver(
  (entries) => entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.classList.add('is-revealed')
      observer.unobserve(e.target)
    }
  }),
  { threshold: 0.2 }
)
document.querySelectorAll('[data-reveal]').forEach(el => observer.observe(el))
```

---

## Tier 2 — GSAP + ScrollTrigger + Lenis

### Installation

```bash
npm install gsap lenis
```

### Init GSAP dans un Astro island

```astro
---
// src/components/AnimationController.astro
// Pas de client:load — script inline qui s'exécute après DOMContentLoaded
---
<script>
  import { initAnimations } from '../scripts/gsap-init'
  document.addEventListener('astro:page-load', initAnimations)
</script>
```

```ts
// src/scripts/gsap-init.ts
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'
import { initLenis } from './lenis-init'

gsap.registerPlugin(ScrollTrigger)

let lenis: ReturnType<typeof initLenis> | null = null

export function initAnimations() {
  lenis = initLenis()

  // Scroll reveal global
  gsap.utils.toArray<HTMLElement>('[data-reveal]').forEach((el, i) => {
    gsap.fromTo(el,
      { opacity: 0, y: 30 },
      {
        opacity: 1, y: 0,
        duration: 0.6,
        delay: i * 0.1,
        ease: 'power2.out',
        scrollTrigger: {
          trigger: el,
          start: 'top 80%',
          once: true,
        }
      }
    )
  })
}
```

### Lenis init + ScrollTrigger sync

```ts
// src/scripts/lenis-init.ts
import Lenis from 'lenis'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

export function initLenis() {
  const lenis = new Lenis({
    duration: 1.2,
    easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
    smoothWheel: true,
  })

  // Sync Lenis avec ScrollTrigger
  lenis.on('scroll', ScrollTrigger.update)
  gsap.ticker.add((time) => lenis.raf(time * 1000))
  gsap.ticker.lagSmoothing(0)

  return lenis
}
```

### Cleanup obligatoire — View Transitions Astro

```ts
// À inclure dans le même script que l'init
document.addEventListener('astro:before-swap', () => {
  // Tuer tous les ScrollTriggers avant navigation
  ScrollTrigger.getAll().forEach(t => t.kill())
  // Détruire Lenis
  lenis?.destroy()
  lenis = null
})
```

### Stagger hero (Tier 2)

```ts
gsap.from('.hero > *', {
  opacity: 0,
  y: 20,
  stagger: 0.1,
  duration: 0.5,
  ease: 'power2.out',
  delay: 0.1, // Après LCP
})
```

### Magnetic button (Tier 2 — CTAs primaires uniquement)

```ts
// src/scripts/magnetic-button.ts
export function initMagneticButton(selector: string) {
  document.querySelectorAll<HTMLElement>(selector).forEach(btn => {
    btn.addEventListener('mousemove', (e) => {
      const rect = btn.getBoundingClientRect()
      const x = e.clientX - rect.left - rect.width / 2
      const y = e.clientY - rect.top - rect.height / 2
      gsap.to(btn, { x: x * 0.3, y: y * 0.3, duration: 0.3, ease: 'power2.out' })
    })
    btn.addEventListener('mouseleave', () => {
      gsap.to(btn, { x: 0, y: 0, duration: 0.5, ease: 'elastic.out(1, 0.3)' })
    })
  })
}
```

---

## Tier 3 — Tier 2 + Spline 3D island

### Pattern island avec WebGL detection + fallback

```astro
---
// src/components/SplineHero.astro
---
<div id="spline-wrapper" style="min-height: 400px; position: relative;">
  <div class="spline-skeleton" aria-hidden="true"></div>
  <img
    id="spline-fallback"
    src="/hero-fallback.jpg"
    alt="Studio Kodo hero"
    style="display: none; width: 100%; height: 100%; object-fit: cover;"
  />
</div>

<script>
  async function loadSpline() {
    // WebGL detection
    const canvas = document.createElement('canvas')
    const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl')

    if (!gl) {
      // Fallback si WebGL non disponible
      document.querySelector('.spline-skeleton')?.remove()
      const fallback = document.getElementById('spline-fallback')
      if (fallback) fallback.style.display = 'block'
      return
    }

    try {
      const { Application } = await import('@splinetool/runtime')
      const splineCanvas = document.createElement('canvas')
      splineCanvas.id = 'spline-canvas'
      document.getElementById('spline-wrapper')?.appendChild(splineCanvas)

      const app = new Application(splineCanvas)
      await app.load('https://prod.spline.design/[SCENE-ID]/scene.splinecode')
      document.querySelector('.spline-skeleton')?.remove()
    } catch (err) {
      console.warn('Spline load failed, showing fallback')
      document.querySelector('.spline-skeleton')?.remove()
      const fallback = document.getElementById('spline-fallback')
      if (fallback) fallback.style.display = 'block'
    }
  }

  // Lazy load — seulement quand le composant est visible
  const observer = new IntersectionObserver((entries) => {
    if (entries[0].isIntersecting) {
      loadSpline()
      observer.disconnect()
    }
  }, { threshold: 0.1 })

  const wrapper = document.getElementById('spline-wrapper')
  if (wrapper) observer.observe(wrapper)
</script>
```

### Budget perf Tier 3

- `@splinetool/runtime` : ~150–300KB (lazy, ne bloque pas LCP)
- Lighthouse mobile cible ≥ 85 (vs ≥ 95 Tier 1/2)
- Skeleton visible pendant le load → pas de CLS
- Ne jamais charger Spline en synchrone (blocking)

---

## Perf gates par tier

| Métrique | Tier 1 | Tier 2 | Tier 3 |
|----------|--------|--------|--------|
| JS animation budget | 0 KB | ≤ 28 KB gz | ≤ 28 KB + 150–300 KB lazy |
| LCP target | ≤ 2.5s | ≤ 2.5s | ≤ 2.5s (Spline lazy) |
| CLS target | ≤ 0.12 | ≤ 0.12 | ≤ 0.12 (skeleton requis) |
| INP target | ≤ 200ms | ≤ 200ms | ≤ 200ms |
| Lighthouse mobile | ≥ 95 | ≥ 90 | ≥ 85 |

---

*Pattern file pour agent vitrine-tech-stack. S'utilise après confirmation du tier d'animation par le client.*
