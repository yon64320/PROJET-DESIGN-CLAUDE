# Motion & Effects Strategy — Studio Kodo

> **Version :** v3.0
> **Date :** 2026-04-01
> **Agent :** vitrine-ui-design-system
> **Destinataire :** Agent 5 (Tech Stack)
> **Niveau d'ambition :** Expressive premium
> **Animation Tier sélectionné : Tier 3 — GSAP + ScrollTrigger + Lenis + Spline 3D** *(validé PRD v1.2)*

---

## 0. PHILOSOPHY & TIER SELECTION

**Le mouvement chez Studio Kodo est une démonstration de maîtrise.**

Le site EST le portfolio. Chaque animation doit répondre à l'une de ces questions :
1. **Démontre-t-elle un savoir-faire ?** (Spline 3D, word-split, parallax — le studio fait ce que les autres ne font pas)
2. **Guide-t-elle le regard vers la conversion ?** (magnetic buttons, scroll reveals séquencés)
3. **Crée-t-elle une sensation de fluidité premium ?** (smooth scroll Lenis, easing GSAP soignés)
4. **Renforce-t-elle la narration ?** (scroll storyboard, counter animations, stagger reveals)

Si la réponse est "non" aux quatre → pas d'animation.

**Niveau d'ambition : expressive premium.** Le mouvement est visible, intentionnel, maîtrisé. Le visiteur se dit "c'est impressionnant" puis immédiatement "c'est fluide". La sophistication technique sert le luxe épuré mid-century : chaque geste est chorégraphié, jamais gratuit.

### Sélection du Tier d'animation

| Tier | Description | JS Budget | Statut pour Studio Kodo |
|------|-------------|-----------|------------------------|
| **Tier 1** | CSS-only, 0KB JS animation | 0 KB | ❌ Insuffisant — ne démontre pas le savoir-faire |
| **Tier 2** | GSAP + ScrollTrigger + Lenis | ~28 KB gz | ❌ Partiel — pas de 3D signature |
| **Tier 3** | Tier 2 + Spline 3D | +150–300 KB lazy | ✅ **SÉLECTIONNÉ** |

**Justification Tier 3 pour Studio Kodo :**
- Le site est la vitrine-preuve du studio — il DOIT démontrer la maîtrise maximale
- Les prospects jugent le studio sur ce qu'ils voient — les animations sont le différenciateur
- Audience tech-savvy (fondateurs startup, entrepreneurs) qui apprécie la qualité technique
- Le luxe épuré se manifeste dans la retenue du design ET la qualité des easing, pas dans l'absence d'effets
- Trade-off perf assumé : Lighthouse > 90 (au lieu de > 95), JS ~28KB + 150–300KB lazy Spline

---

## 1. SIGNATURE MOMENTS (5 moments — étendu de 3 à 5 pour Tier 3)

### Moment 1 — Spline 3D Island + Word-split Hero (Accueil)
**Tier minimum : 3**

**Objectif :** Impact immédiat. En 3 secondes, le visiteur sait que ce n'est pas un template. Le Spline 3D et le word-split disent "ce studio maîtrise ce que les autres ne tentent pas".

**Séquence d'entrée (timeline GSAP) :**

```
t=0ms     Spline 3D skeleton visible, contenu masqué
t=0ms     Spline commence son lazy-load en arrière-plan
t=100ms   H1 word-split commence (GSAP SplitText)
          → chaque mot apparaît : from({y: 40, opacity: 0, rotateX: -10})
          → stagger: 0.06s, duration: 0.8s, ease: "power3.out"
t=400ms   Sous-titre fade-in + translateY(20→0), duration: 0.6s, ease: "power2.out"
t=600ms   CTAs fade-in + translateY(20→0), stagger: 0.1s
          → CTA primaire = magnetic button activé après apparition
t=800ms   Scroll indicator fade-in (bounce subtil vertical, ease: "power1.inOut", yoyo)
t=~1500ms Spline 3D chargé → skeleton fade-out, scène fade-in (duration: 0.8s)
```

**Spline 3D island :**
- Composition géométrique mid-century interactive (formes flottantes, palette teal/mustard/crème)
- Position : zone droite du hero (5-6 col) ou arrière-plan semi-transparent
- Lazy-loaded : ne bloque pas le LCP
- WebGL detection : si absent → image statique fallback
- Skeleton : forme géométrique animée CSS pendant le chargement
- Interaction : hover/touch déclenche des micro-rotations sur les formes
- Microcopy skeleton : "Chargement de la scène 3D…" (sr-only: "Scène 3D interactive en cours de chargement")
- Microcopy fallback WebGL : "Votre navigateur ne supporte pas les éléments 3D interactifs. L'expérience reste complète."

**Word-split H1 :**
- GSAP SplitText sur le H1 "Votre site. Sur-mesure. Livré en 3 jours."
- Split par mot (pas par lettre — lisibilité préservée)
- Chaque mot : `from({y: 40, opacity: 0, rotateX: -10})`, stagger 60ms
- Easing : `power3.out`, durée totale ~800ms
- Le texte est dans le DOM et lisible même sans JS (progressive enhancement)

**Magnetic button CTA :**
- CTA "Demander un devis" réagit au curseur dans un rayon de 80px
- Déplacement max : 12px en X/Y, ease: `power2.out`
- Focus clavier : pas de mouvement magnétique, hover standard conservé
- Mobile : pas d'effet magnétique (pas de curseur), hover/active standard

**Budget :** Spline ne bloque pas le LCP (lazy). Word-split ne retarde pas le FCP (texte dans le DOM). Animation commence APRÈS le premier paint.

**Reduced motion :** H1 apparaît d'un bloc (opacity 0→1, 100ms). Sous-titre + CTAs instantanés. Spline → image statique. Magnetic → bouton standard.

---

### Moment 2 — Scroll Storyboard Process (Accueil §5, À propos §4, Case study §4)
**Tier minimum : 2**

**Objectif :** Le process en 3 étapes se "dessine" au scroll — la ligne de progression et les étapes se révèlent séquentiellement. Le visiteur vit le process comme une narration, pas comme une liste.

**Effet :**

```js
// Timeline ScrollTrigger — Process frise
const tl = gsap.timeline({
  scrollTrigger: {
    trigger: ".process-section",
    start: "top 70%",
    end: "bottom 30%",
    scrub: 0.8
  }
})

// Ligne de progression se dessine
tl.fromTo(".process-line",
  { scaleX: 0, transformOrigin: "left" },
  { scaleX: 1, duration: 1, ease: "none" }
)

// Chaque étape se révèle quand la ligne l'atteint
tl.from(".process-step-1", { y: 30, opacity: 0, duration: 0.3 }, 0.1)
tl.from(".process-step-2", { y: 30, opacity: 0, duration: 0.3 }, 0.4)
tl.from(".process-step-3", { y: 30, opacity: 0, duration: 0.3 }, 0.7)
```

- Scrub lié au scroll (pas d'autoplay) — le visiteur contrôle le rythme
- Ligne de progression : `scaleX` (composited, 0 layout cost)
- Étapes : `translateY` + `opacity` (composited)
- Desktop : frise horizontale. Mobile : frise verticale (scaleY au lieu de scaleX)

**Reduced motion :** Toutes les étapes visibles immédiatement, ligne pleine. Pas de scrub.

---

### Moment 3 — Parallax Gallery (Réalisations §2, Case study §5, À propos §2)
**Tier minimum : 2**

**Objectif :** Les visuels créent une profondeur éditoriale mid-century. Les images et le texte se déplacent à des vitesses différentes, renforçant la sensation de magazine premium.

**Effet :**

```js
// Parallax sur les images de la galerie
gsap.utils.toArray(".parallax-image").forEach((img) => {
  gsap.fromTo(img,
    { yPercent: -15 },
    {
      yPercent: 15,
      ease: "none",
      scrollTrigger: {
        trigger: img.closest(".parallax-container"),
        start: "top bottom",
        end: "bottom top",
        scrub: true
      }
    }
  )
})
```

- Ratio parallax : 0.3x (subtil — pas de motion sickness)
- Images dans un conteneur `overflow: hidden` (pas de CLS)
- Uniquement sur éléments décoratifs/visuels (jamais sur du texte de contenu)
- Case study galerie : chaque image a un `yPercent` légèrement différent (crée de la variété)
- À propos : photo fondateur parallax + texte récit à vitesse normale

**Reduced motion :** Images statiques, pas de parallax. Contenu identique.

---

### Moment 4 — Counter Animation Chiffres (Accueil §6, Case study §6)
**Tier minimum : 2**

**Objectif :** Les chiffres s'incrémentent au scroll — ancre l'attention, crée un "wow moment" sur les métriques.

**Effet :**

```js
// Counter animation — chiffres qui s'incrémentent
gsap.utils.toArray(".counter").forEach((el) => {
  const target = parseFloat(el.dataset.target)
  const prefix = el.dataset.prefix || ""
  const suffix = el.dataset.suffix || ""

  gsap.from(el, {
    textContent: 0,
    duration: 1.5,
    ease: "power2.out",
    snap: { textContent: 1 },
    scrollTrigger: {
      trigger: el,
      start: "top 80%",
      toggleActions: "play none none none"
    },
    modifiers: {
      textContent: (v) => `${prefix}${Math.round(v)}${suffix}`
    }
  })
})
```

- Trigger : `onEnter` quand l'élément entre dans le viewport (80%)
- Durée : 1.5s, easing `power2.out` (accélère au début, décélère à la fin)
- Snap à l'entier pour éviter les décimales flottantes
- Préfixe/suffixe gérés via data-attributes ("+", "%", "K", etc.)

**Reduced motion :** Chiffre final affiché immédiatement, pas d'incrémentation.

---

### Moment 5 — Magnetic Buttons sur tous les CTA primaires
**Tier minimum : 2**

**Objectif :** Chaque CTA "Demander un devis" attire le curseur — le mouvement magnétique dirige physiquement l'attention vers la conversion.

**Effet :**

```js
// Magnetic button effect
function initMagneticButton(btn) {
  const strength = 0.3 // 30% de déplacement relatif
  const radius = 80 // rayon d'activation en px

  btn.addEventListener("mousemove", (e) => {
    const rect = btn.getBoundingClientRect()
    const cx = rect.left + rect.width / 2
    const cy = rect.top + rect.height / 2
    const dx = e.clientX - cx
    const dy = e.clientY - cy
    const dist = Math.sqrt(dx * dx + dy * dy)

    if (dist < radius) {
      gsap.to(btn, {
        x: dx * strength,
        y: dy * strength,
        duration: 0.3,
        ease: "power2.out"
      })
    }
  })

  btn.addEventListener("mouseleave", () => {
    gsap.to(btn, { x: 0, y: 0, duration: 0.5, ease: "elastic.out(1, 0.4)" })
  })
}
```

- Rayon d'activation : 80px autour du bouton
- Force : 30% du déplacement relatif (subtil, pas agressif)
- Retour élastique au mouseleave : `elastic.out(1, 0.4)` — signature premium
- Focus clavier : aucun mouvement magnétique (le bouton reste en place)
- Mobile : pas d'effet magnétique (pas de mousemove), comportement hover/active standard
- Microcopy sr-only : "Ce bouton réagit au mouvement de votre curseur"

**Pages concernées :** Tous les CTA "Demander un devis" — header, sections de conversion Accueil §7, Services §2-4/§8, Case study §8, À propos §5, Contact §2 (CTA final). Un seul CTA magnétique visible par viewport.

**Reduced motion :** Bouton standard, pas d'effet magnétique. Hover classique (scale 1.02 + shadow).

---

## 2. AUTHORIZED EFFECTS (catalogue complet Tier 3)

| # | Effet | Où | Easing GSAP / CSS | Duration | Properties | Purpose | **Min Tier** |
|---|-------|-----|-------------------|----------|------------|---------|-------------|
| 1 | **Word-split entrance** | Accueil §1 (H1), Accueil §7 (headline clôture), À propos §1 (H1), Case study §1 (H1 nom projet) | `power3.out` | 800ms, stagger 60ms/mot | transform(y, rotateX), opacity | Signature premium, démonstration technique | **2** |
| 2 | **Spline 3D island** | Accueil §1 (hero, zone droite/arrière-plan) | — | lazy load ~1.5s | WebGL canvas | Proof by demonstration, signature 3D | **3** |
| 3 | **Magnetic button** | Tous CTA "Demander un devis" (1 par viewport max) | `power2.out` (approche), `elastic.out(1, 0.4)` (retour) | 300ms approche, 500ms retour | transform(x, y) | Attire l'attention vers la conversion | **2** |
| 4 | **Smooth scroll (Lenis)** | Toutes les pages | — | système (duration: 1.2) | scroll velocity | Fluidité premium globale | **2** |
| 5 | **Parallax scroll** | Accueil §3 (réalisations), Case study §5 (galerie), À propos §2 (récit fondateur) | `none` (scrub) | scroll-linked | transform(yPercent) | Profondeur éditoriale mid-century | **2** |
| 6 | **ScrollTrigger storyboard** | Accueil §5 (process), À propos §4 (process détaillé), Case study §4 (timeline) | `none` (scrub) | scroll-linked | transform(y, scaleX), opacity | Narration au scroll, ligne de progression | **2** |
| 7 | **Stagger reveal** | Accueil §2 (3 piliers), §3 (grille réalisations), §4 (3 cartes services), Services §2-4 (bullets), Réalisations §2 (4 vignettes), Case study §3 (items scope), À propos §3 (convictions) | `power2.out` | 500ms, stagger 100-150ms | transform(y: 30→0), opacity | Guide le regard dans la hiérarchie | **2** |
| 8 | **Counter animation** | Accueil §6 (chiffres clés), Case study §6 (métriques résultats) | `power2.out` | 1500ms | textContent | Ancre l'attention sur les résultats | **2** |
| 9 | **ScrollTrigger reveal** | Toutes sections below fold (fade-in au scroll) | `power2.out` | 600ms | transform(y: 20→0), opacity | Rythme la découverte du contenu | **2** |
| 10 | **Card hover depth** | Service cards, case study vignettes | `power2.out` | 300ms | transform(y: -4px, scale: 1.02), box-shadow | Feedback tactile premium | **1** |
| 11 | **Card parallax interne** | Case study vignettes (Réalisations §2) | `power2.out` | mouse-linked | transform(x, y) sur image dans le cadre | L'image bouge dans le cadre au hover | **2** |
| 12 | **Accordion expand** | FAQ Services §7 | CSS `ease-entrance` | 300ms | grid-template-rows: 0fr→1fr | Transition naturelle | **1** |
| 13 | **Chevron rotation** | Accordion triggers | CSS `ease-state-change` | 200ms | transform: rotate(90deg) | Indicateur d'état | **1** |
| 14 | **Button press** | Tous les boutons | — | 50ms | transform: scale(0.98) | Feedback immédiat | **1** |
| 15 | **Button hover** | Tous les boutons (non-magnétiques) | CSS `ease-state-change` | 150ms | transform: scale(1.02), box-shadow | Invitation à cliquer | **1** |
| 16 | **Focus ring** | Tous éléments interactifs | — | instant | outline | Accessibilité | **1** |
| 17 | **Link underline offset** | Liens inline | CSS `ease-state-change` | 150ms | text-underline-offset | Feedback subtil | **1** |
| 18 | **Form step transition** | Contact §2 (formulaire multi-étapes) | `power2.inOut` | 400ms | transform(translateX), opacity | Progression fluide premium | **2** |
| 19 | **Progress bar fill** | Contact §2 (barre de progression) | `power2.out` | 400ms | scaleX (transform) | Feedback de progression | **2** |
| 20 | **Selection bounce** | Contact §2 (étapes 1, 4 — boutons de sélection) | `back.out(1.7)` | 200ms | transform: scale(0.95→1) | Feedback ludique sur sélection | **2** |
| 21 | **Input border focus** | Champs de formulaire | CSS `ease-state-change` | 150ms | border-color | Feedback d'état | **1** |
| 22 | **Dark mode switch** | Toutes surfaces et textes | CSS `ease-state-change` | 200ms | background-color, color | Transition douce entre thèmes | **1** |
| 23 | **Nav shadow on scroll** | Header sticky | CSS `ease-state-change` | 200ms | opacity on pseudo-element | Indique le scrolling | **1** |
| 24 | **Hamburger → X** | Menu mobile | CSS `ease-state-change` | 300ms | transform (rotate+translate) | Feedback d'état du menu | **1** |
| 25 | **Mobile menu slide** | Menu overlay | `power2.out` | 300ms | transform: translateX | Transition contextuelle | **1** |
| 26 | **CTA arrow nudge** | Liens "Voir le projet →" | CSS `ease-state-change` | 200ms | transform: translateX(4px) | Direction du regard | **1** |
| 27 | **Image LQIP reveal** | Toutes images lazy | CSS `ease-entrance` | 300ms | filter: blur(20px→0), opacity | Chargement progressif élégant | **1** |
| 28 | **Confirmation checkmark** | Contact §4 (post-soumission) | `power2.out` + `back.out(1.7)` | 600ms | path strokeDashoffset, scale | Feedback de succès premium | **2** |
| 29 | **Filter layout animation** | Réalisations §3 (filtres optionnels) | `power2.inOut` | 400ms | transform(x, y, scale), opacity | Transition fluide lors du filtrage | **2** |
| 30 | **Scroll indicator bounce** | Accueil hero | `power1.inOut` | 1500ms, yoyo repeat -1 | transform(y: 0→8) | Invite au scroll | **1** |

---

## 3. EFFECTS TO AVOID (anti-cliché)

| # | Effet interdit | Raison | Alternative autorisée | **Tier Override** |
|---|----------------|--------|----------------------|------------------|
| 1 | **Parallax sur contenu texte** | Motion sickness, CLS risk, lisibilité dégradée | Parallax sur images/visuels uniquement | Aucun |
| 2 | **Hover animations sur mobile** | `hover` n'existe pas sur touch | Tap feedback via `:active` state | Aucun |
| 3 | **Auto-play vidéo** | Poids LCP, data mobile, intrusif | Image statique + play button | **Jamais (tous tiers)** |
| 4 | **Slider / carrousel** | < 1% interaction après slide 1, CLS | Grille statique ou scroll horizontal natif | **Jamais (tous tiers)** |
| 5 | **Curseur custom** | Inaccessible, poids JS, fatigue | Cursor: pointer natif | **Jamais (tous tiers)** |
| 6 | **Animations lettre par lettre** | Inaccessible screen readers, trop lent | Word-split (par mot, pas par lettre) | Autorisé Tier 2 : word-split |
| 7 | **Gradient animé sur boutons** | Poids paint, non-composited | Flat color + magnetic effect | Aucun |
| 8 | **Floating elements** | Distraction, CLS risk, motion sickness | Éléments statiques + parallax au scroll | Aucun |
| 9 | **Page transition full-screen** | Lourd, SPA uniquement, bloque la navigation | Astro View Transitions (natif, léger) | Aucun |
| 10 | **Glassmorphism / blur surfaces** | Poids GPU mobile, cliché 2020 | Surfaces plates avec shadow token | **Jamais (tous tiers)** |
| 11 | **Scroll-jacking** | Accessibility nightmare, UX détesté | Lenis = smooth, pas jacking (scroll natif augmenté) | **Jamais (tous tiers)** |
| 12 | **Mouse-follow global** | Poids JS, pas de sens sur touch, distraction | Magnetic sur CTAs uniquement (local, pas global) | Aucun |
| 13 | **3D sur chaque page** | Poids perf, fatigue visuelle | Spline 3D sur hero Accueil uniquement (1 island) | Aucun |
| 14 | **Animation au load sur toutes les pages** | Fatigue, ralentit la navigation | Word-split H1 sur Accueil + À propos + Case study. Autres pages : reveal simple au scroll. | Aucun |

---

## 4. 3D DECISION FRAMEWORK

### Tier 3 — Spline 3D Island (SÉLECTIONNÉ pour Studio Kodo)

**Justification business :**
- Studio Kodo vend du web design premium — la 3D interactive prouve la maîtrise technique
- Différenciateur immédiat : aucun concurrent freelance ne propose de Spline 3D sur son portfolio
- L'audience (fondateurs startup, entrepreneurs tech) valorise l'innovation visuelle

**Spécifications de l'island :**
- **Scène :** Composition géométrique mid-century — formes flottantes (sphères, cylindres, plans) avec la palette Studio Kodo (teal, mustard, crème, charcoal)
- **Position :** Hero Accueil, zone droite (5-6 col) ou arrière-plan semi-transparent
- **Interaction :** Micro-rotations au hover/touch. Pas de drag-and-drop ni de navigation 3D complexe
- **Chargement :** Lazy-load via dynamic import. Ne bloque pas le LCP
- **Skeleton :** Placeholder animé CSS (formes géométriques abstraites qui pulsent doucement) avec texte "Chargement de la scène 3D…"
- **Fallback :** Image statique si WebGL indisponible (détection canvas.getContext('webgl'))
- **Timeout :** Si chargement > 5s, afficher le fallback image + message discret
- **Perf :** Lighthouse mobile ≥ 85 après lazy load. Desktop ≥ 90
- **Isolation :** Island Astro — ne contamine pas le bundle principal. Import dynamique uniquement quand le hero est visible

**Profondeur CSS (complément — toutes pages) :**
- Shadows graduées (`shadow-subtle` → `shadow-card` → `shadow-elevated`) pour hiérarchie de surfaces
- `translateY(-4px)` + shadow lift sur hover cartes
- scale(1.02-1.03) sur images au hover
- Overlay gradients pour séparation texte/image

---

## 5. REDUCED MOTION FALLBACK (complet Tier 3)

Quand `prefers-reduced-motion: reduce` est actif :

**Implémentation :** `gsap.matchMedia()` pour désactiver toutes les animations GSAP. Lenis détruit. Spline remplacé par fallback image.

| Ce qui est SUPPRIMÉ | Ce qui est CONSERVÉ | Ce qui est REMPLACÉ |
|---------------------|---------------------|---------------------|
| Word-split text (stagger, rotateX) | Focus ring (instant) | → texte apparaît d'un bloc, opacity 0→1, 100ms |
| Parallax scroll | Hover state changes (color, shadow) | → images statiques, pas de yPercent |
| ScrollTrigger storyboard (scrub) | Input border transitions | → toutes les étapes visibles d'emblée |
| Counter animation | Loading spinners | → chiffre final affiché directement |
| Magnetic buttons | Button active press (feedback essentiel) | → bouton standard, hover classique |
| Smooth scroll (Lenis) | Form validation feedback | → scroll natif du navigateur |
| Spline 3D island | Dark mode transition (200ms) | → image statique fallback |
| Stagger reveals | Accordion expand/collapse (réduit à 100ms) | → tous éléments visibles d'emblée |
| Card parallax interne | Nav shadow on scroll | → pas de mouvement image au hover |
| Form step slide (GSAP) | — | → swap instantané (opacity 100ms) |
| Scroll indicator bounce | — | → indicateur statique |
| Selection bounce | — | → sélection instantanée |
| Confirmation checkmark animation | — | → checkmark statique |
| Filter layout animation | — | → layout instantané |
| CTA arrow nudge | — | → flèche statique |
| Image LQIP blur transition | — | → image affichée directement |

**Implémentation GSAP matchMedia :**

```js
// Reduced motion — disable all GSAP animations
gsap.matchMedia().add("(prefers-reduced-motion: reduce)", () => {
  // Kill all existing ScrollTriggers
  ScrollTrigger.getAll().forEach(st => st.kill())

  // Set all animated elements to their final state
  gsap.set("[data-animate]", { clearProps: "all" })

  // Destroy Lenis
  if (lenis) {
    lenis.destroy()
    lenis = null
  }

  // Replace Spline with fallback
  const splineContainer = document.getElementById("spline-container")
  if (splineContainer) {
    splineContainer.innerHTML = '<img src="/hero-fallback.webp" alt="Composition 3D géométrique — formes mid-century flottantes, palette teal et mustard sur fond crème" loading="eager" />'
  }

  // Disable magnetic buttons
  document.querySelectorAll("[data-magnetic]").forEach(btn => {
    btn.style.transform = ""
  })

  return () => {
    // Cleanup when preference changes back
  }
})
```

**CSS fallback supplémentaire :**

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

### Timing par catégorie (Tier 3)

| Catégorie | Durée | Easing GSAP | Propriétés autorisées |
|-----------|-------|-------------|----------------------|
| Micro-interaction (press, toggle) | 50–150ms | — (CSS) | transform, opacity |
| State transition (hover, focus) | 150–300ms | `power2.out` / CSS `ease-state-change` | transform, opacity, background-color |
| Content entrance (scroll reveal) | 400–600ms | `power2.out` | transform(y), opacity |
| Word-split entrance | 600–800ms | `power3.out` | transform(y, rotateX), opacity |
| Content exit (dismiss) | 200–400ms | `power2.in` | transform, opacity |
| Layout change (accordion, menu) | 200–400ms | `power2.inOut` / CSS | transform, grid-template-rows |
| Counter animation | 1500ms | `power2.out` | textContent |
| Parallax / scroll-linked | scroll-driven | `none` (scrub) | transform(yPercent) |
| Form step transition | 400ms | `power2.inOut` | transform(translateX), opacity |
| Magnetic button | 300ms approach / 500ms return | `power2.out` / `elastic.out(1, 0.4)` | transform(x, y) |

### GSAP Easing Palette (named references)

| Nom | GSAP String | CSS Equivalent | Usage |
|-----|-------------|---------------|-------|
| `ease-entrance` | `"power2.out"` | `cubic-bezier(0, 0, 0.2, 1)` | Scroll reveals, apparitions |
| `ease-entrance-dramatic` | `"power3.out"` | — | Word-split, entrées signature |
| `ease-exit` | `"power2.in"` | `cubic-bezier(0.4, 0, 1, 1)` | Disparitions, form step exit |
| `ease-state-change` | `"power2.inOut"` | `cubic-bezier(0.4, 0, 0.2, 1)` | Hover, focus, transitions d'état |
| `ease-bounce-subtle` | `"back.out(1.7)"` | `cubic-bezier(0.34, 1.56, 0.64, 1)` | Selection bounce, micro-interactions |
| `ease-elastic-return` | `"elastic.out(1, 0.4)"` | — | Retour magnetic button |
| `ease-scrub` | `"none"` | — | Parallax, scroll storyboard |

### JS Budget détaillé

| Bibliothèque | Taille (gz) | Chargement | Pages |
|-------------|-------------|------------|-------|
| gsap (core) | ~8 KB | Eager — toutes pages | Toutes |
| ScrollTrigger | ~8 KB | Eager — toutes pages | Toutes |
| SplitText | ~4 KB | Eager — pages avec word-split | Accueil, À propos, Case study |
| Lenis | ~8 KB | Eager — toutes pages | Toutes |
| **Sous-total Tier 2** | **~28 KB gz** | — | — |
| @splinetool/runtime | 150–300 KB | **Lazy** — dynamic import | Accueil uniquement |
| **Total max** | **~328 KB** | 28 KB eager + 300 KB lazy | — |

### Core Web Vitals gates

| Métrique | Budget | Ce qui le casse | Mitigation |
|----------|--------|-----------------|------------|
| **INP** | ≤ 200ms | JS bloquant pendant animation, handlers lourds | RequestAnimationFrame, debounce mouse events (magnetic) |
| **CLS** | ≤ 0.1 | Éléments animés qui déplacent le contenu, Spline skeleton sans dimensions | Réserver l'espace (min-height), overflow:hidden sur parallax |
| **LCP** | ≤ 2.5s | Spline bloquant le render, fonts non préchargées | Spline lazy, font-display: swap, hero image en fallback |

---

## 7. SIGNATURE ANIMATION SPEC PAR PAGE

### Page : Accueil (/)
**Tier : 3**

| Scroll position | Section | Animation | Trigger | GSAP Config |
|----------------|---------|-----------|---------|-------------|
| 0% (load) | §1 Hero | Word-split H1 | Page load | `SplitText`, stagger 0.06, `power3.out`, 800ms |
| 0% (load) | §1 Hero | Sous-titre + CTAs fade-in | Page load (staggered après H1) | `from({y: 20, opacity: 0})`, stagger 0.1, `power2.out` |
| 0% (load) | §1 Hero | Scroll indicator bounce | Page load (t=800ms) | `to({y: 8})`, yoyo, repeat: -1, `power1.inOut` |
| ~0% (lazy) | §1 Hero | Spline 3D island load | Intersection hero visible | Dynamic import, skeleton → scene fade |
| ~15% | §2 Différenciation | 3 blocs stagger reveal | ScrollTrigger `top 75%` | `from({y: 30, opacity: 0})`, stagger 0.15, `power2.out` |
| ~25% | §3 Réalisations | Grille parallax + stagger | ScrollTrigger `top 80%` | Parallax `yPercent: -15→15` scrub + stagger reveal |
| ~40% | §4 Services | 3 cartes stagger | ScrollTrigger `top 75%` | `from({y: 30, opacity: 0})`, stagger 0.2, `power2.out` |
| ~55% | §5 Process | Scroll storyboard | ScrollTrigger scrub 0.8 | Ligne scaleX + steps reveal séquentiel |
| ~70% | §6 Chiffres | Counter animation | ScrollTrigger `top 80%` | textContent tween 1.5s, `power2.out`, snap |
| ~85% | §7 Conversion | Word-split headline + magnetic CTA | ScrollTrigger `top 70%` | SplitText + magnetic init |

**Perf budget page :** Max 8 animations simultanées. Spline lazy (pas dans le budget eager). LCP < 2.5s. INP < 200ms.

---

### Page : Services (/services)
**Tier : 2 (pas de Spline, pas de word-split)**

| Scroll position | Section | Animation | Trigger | GSAP Config |
|----------------|---------|-----------|---------|-------------|
| 0% (load) | §1 Header | H1 + sous-titre fade-in | Page load | `from({y: 20, opacity: 0})`, `power2.out`, 500ms |
| ~15% | §2 Site vitrine | Section reveal + bullets stagger + magnetic CTA | ScrollTrigger `top 70%` | Stagger bullets 100ms, magnetic init on CTA |
| ~35% | §3 Branding | Section reveal + bullets stagger + magnetic CTA | ScrollTrigger `top 70%` | Idem |
| ~55% | §4 Automatisation | Section reveal + bullets stagger + magnetic CTA | ScrollTrigger `top 70%` | Idem |
| ~70% | §6 Pour qui | Reveal simple | ScrollTrigger `top 75%` | `from({y: 20, opacity: 0})` |
| ~80% | §7 FAQ | Accordion GSAP | Click | `grid-template-rows: 0fr→1fr`, 300ms |
| ~90% | §8 Conversion | Magnetic CTA | ScrollTrigger `top 70%` | Magnetic init |

**Perf budget page :** Max 5 animations simultanées. Pas de parallax. LCP < 2.0s.

---

### Page : Réalisations (/realisations)
**Tier : 2**

| Scroll position | Section | Animation | Trigger | GSAP Config |
|----------------|---------|-----------|---------|-------------|
| 0% (load) | §1 Header | H1 fade-in | Page load | `from({y: 20, opacity: 0})`, 500ms |
| ~20% | §2 Grille | 4 vignettes stagger + hover parallax interne | ScrollTrigger `top 80%` | Stagger 0.15. Hover: image `x/y` mouse-follow dans le cadre |
| ~60% | §3 Filtres | Layout animation GSAP | Click filtre | `power2.inOut`, 400ms, position animate |
| ~80% | §4 Conversion | Magnetic CTA | ScrollTrigger `top 70%` | Magnetic init |

**Perf budget page :** Max 5 animations simultanées. LCP < 2.0s.

---

### Page : Case Study (×4)
**Tier : 2 (+ word-split H1)**

| Scroll position | Section | Animation | Trigger | GSAP Config |
|----------------|---------|-----------|---------|-------------|
| 0% (load) | §1 Hero projet | Word-split H1 + image parallax vertical | Page load + scroll | SplitText 800ms + parallax `yPercent: -10→10` scrub |
| ~10% | §2 Brief | Reveal | ScrollTrigger `top 75%` | `from({y: 20, opacity: 0})`, 500ms |
| ~20% | §3 Solution | Items stagger | ScrollTrigger `top 75%` | Stagger 0.1, `power2.out` |
| ~35% | §4 Process | Scroll storyboard (frise timeline) | ScrollTrigger scrub 0.8 | Ligne scaleX + steps reveal |
| ~50% | §5 Galerie | Parallax images (vitesses différentes) | ScrollTrigger scrub | `yPercent` varié par image |
| ~70% | §6 Résultats | Counter animation | ScrollTrigger `top 80%` | textContent tween 1.5s |
| ~85% | §8 CTA | Magnetic CTA | ScrollTrigger `top 70%` | Magnetic init |

**Perf budget page :** Max 6 animations simultanées. Parallax galerie = max 4 images visibles. LCP < 2.5s (hero image).

---

### Page : À propos (/a-propos)
**Tier : 2 (+ word-split H1)**

| Scroll position | Section | Animation | Trigger | GSAP Config |
|----------------|---------|-----------|---------|-------------|
| 0% (load) | §1 Header | Word-split H1 | Page load | SplitText 800ms, `power3.out` |
| ~15% | §2 Récit fondateur | Parallax photo/texte + reveal | ScrollTrigger scrub + `top 75%` | Photo `yPercent: -10→10`, texte reveal |
| ~40% | §3 Convictions | 4 blocs stagger | ScrollTrigger `top 75%` | Stagger 0.15, `power2.out` |
| ~60% | §4 Process détaillé | Scroll storyboard (version détaillée) | ScrollTrigger scrub 0.8 | Ligne + steps + mini-pin optionnel |
| ~85% | §5 Conversion | Magnetic CTA | ScrollTrigger `top 70%` | Magnetic init |

**Perf budget page :** Max 5 animations simultanées. 1 zone parallax. LCP < 2.0s.

---

### Page : Contact (/contact)
**Tier : 2 (animations fonctionnelles uniquement)**

| Scroll position | Section | Animation | Trigger | GSAP Config |
|----------------|---------|-----------|---------|-------------|
| 0% (load) | §1 Header | H1 fade-in | Page load | `from({y: 20, opacity: 0})`, 400ms |
| — | §2 Formulaire | Step transitions | Click next/prev | `power2.inOut`, 400ms, slideX |
| — | §2 Formulaire | Progress bar fill | Step change | `power2.out`, scaleX tween |
| — | §2 Formulaire | Selection bounce (étapes 1, 4) | Click option | `back.out(1.7)`, scale 0.95→1 |
| — | §2 Formulaire | CTA final magnetic | Étape 5 atteinte | Magnetic init |
| — | §4 Confirmation | Checkmark animation | Form submit success | SVG strokeDashoffset + scale, 600ms |

**Perf budget page :** Max 2 animations simultanées. Pas de parallax, pas de scroll effects. INP ≤ 100ms (formulaire = interaction critique). LCP < 1.5s.

---

### Pages : Mentions légales, Politique de confidentialité
**Tier : 1 (CSS-only)**

Aucune animation GSAP. Smooth scroll Lenis actif. Pas de scroll reveals. Contenu statique.

---

## 8. TECHNICAL IMPLEMENTATION NOTES (for Agent 5)

### GSAP + ScrollTrigger Init (Astro pattern)

```ts
// src/scripts/gsap-init.ts
import { gsap } from "gsap"
import { ScrollTrigger } from "gsap/ScrollTrigger"
import { SplitText } from "gsap/SplitText"

gsap.registerPlugin(ScrollTrigger, SplitText)

// Defaults GSAP globaux
gsap.defaults({
  duration: 0.6,
  ease: "power2.out"
})
```

### Lenis Init + ScrollTrigger Sync

```ts
// src/scripts/lenis-init.ts
import Lenis from "lenis"
import { ScrollTrigger } from "gsap/ScrollTrigger"

let lenis: Lenis | null = null

export function initLenis() {
  lenis = new Lenis({
    duration: 1.2,
    easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
    orientation: "vertical",
    smoothWheel: true
  })

  lenis.on("scroll", ScrollTrigger.update)

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

### Spline 3D Island (Astro component)

```astro
---
// src/components/SplineHeroIsland.astro
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

  <!-- Fallback image -->
  <noscript>
    <img src="/hero-fallback.webp" alt="Composition 3D géométrique — formes mid-century flottantes, palette teal et mustard sur fond crème" loading="eager" />
  </noscript>
</div>

<script>
  // Lazy load Spline uniquement si WebGL disponible
  const canvas = document.createElement("canvas")
  const gl = canvas.getContext("webgl") || canvas.getContext("experimental-webgl")

  if (gl && !window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    const timeout = setTimeout(() => {
      // Timeout 5s — afficher fallback
      showFallback()
    }, 5000)

    import("@splinetool/runtime").then(({ Application }) => {
      clearTimeout(timeout)
      const splineCanvas = document.getElementById("spline-canvas")
      const app = new Application(splineCanvas)
      app.load("https://prod.spline.design/[scene-id]/scene.splinecode")
        .then(() => {
          splineCanvas.style.display = "block"
          gsap.to(".spline-skeleton", { opacity: 0, duration: 0.5, onComplete: () => {
            document.querySelector(".spline-skeleton")?.remove()
          }})
        })
        .catch(() => showFallback())
    }).catch(() => showFallback())
  } else {
    showFallback()
  }

  function showFallback() {
    const container = document.getElementById("spline-container")
    const skeleton = container?.querySelector(".spline-skeleton")
    if (skeleton) {
      skeleton.innerHTML = '<img src="/hero-fallback.webp" alt="Composition 3D géométrique — formes mid-century flottantes, palette teal et mustard sur fond crème" loading="eager" />'
    }
  }
</script>
```

### Cleanup pour Astro View Transitions

```ts
// Cleanup obligatoire à chaque navigation
document.addEventListener("astro:before-swap", () => {
  // Kill all ScrollTriggers
  ScrollTrigger.getAll().forEach(t => t.kill())

  // Kill all GSAP tweens
  gsap.killTweensOf("*")

  // Destroy Lenis
  destroyLenis()

  // Reset SplitText instances
  // (SplitText revert automatically on element removal)
})

// Re-init après navigation
document.addEventListener("astro:after-swap", () => {
  initLenis()
  initPageAnimations() // fonction qui détecte la page et init les animations appropriées
})
```

### Word-split Pattern

```ts
// src/scripts/word-split.ts
export function initWordSplit(selector: string) {
  const elements = document.querySelectorAll(selector)

  elements.forEach((el) => {
    const split = new SplitText(el, { type: "words" })

    gsap.from(split.words, {
      y: 40,
      opacity: 0,
      rotateX: -10,
      stagger: 0.06,
      duration: 0.8,
      ease: "power3.out",
      scrollTrigger: el.dataset.splitOnScroll ? {
        trigger: el,
        start: "top 75%",
        toggleActions: "play none none none"
      } : undefined
    })
  })
}
```

### Magnetic Button Pattern

```ts
// src/scripts/magnetic-button.ts
export function initMagneticButtons() {
  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return
  if ("ontouchstart" in window) return // Skip on touch devices

  document.querySelectorAll("[data-magnetic]").forEach((btn) => {
    const strength = 0.3
    const radius = 80

    btn.addEventListener("mousemove", (e: MouseEvent) => {
      const rect = (btn as HTMLElement).getBoundingClientRect()
      const cx = rect.left + rect.width / 2
      const cy = rect.top + rect.height / 2
      const dx = e.clientX - cx
      const dy = e.clientY - cy
      const dist = Math.sqrt(dx * dx + dy * dy)

      if (dist < radius) {
        gsap.to(btn, {
          x: dx * strength,
          y: dy * strength,
          duration: 0.3,
          ease: "power2.out"
        })
      }
    })

    btn.addEventListener("mouseleave", () => {
      gsap.to(btn, { x: 0, y: 0, duration: 0.5, ease: "elastic.out(1, 0.4)" })
    })
  })
}
```

### Animation Dependencies List

| Library | Version | Import | Tree-shakeable ? | License |
|---------|---------|--------|-------------------|---------|
| `gsap` | ^3.12 | `gsap` | Oui | GSAP Standard (free for most uses) |
| `@gsap/ScrollTrigger` | ^3.12 | `gsap/ScrollTrigger` | Plugin | Inclus avec gsap |
| `@gsap/SplitText` | ^3.12 | `gsap/SplitText` | Plugin | **Club GSAP** (paid) — alternative gratuite : split-type |
| `lenis` | ^1.1 | `lenis` | Oui | MIT |
| `@splinetool/runtime` | ^2.x | `@splinetool/runtime` | Non (WebGL) | Spline free tier OK |

**Note SplitText :** Si la licence Club GSAP n'est pas disponible, utiliser `split-type` (MIT, ~3KB gz) comme alternative gratuite. L'API est similaire.

---

## 9. ANIMATION-DEPENDENCIES SUMMARY (for Agent 5 Gate)

```
Tier sélectionné : 3

Libraries requises :
- gsap@^3.12 (~8KB gz)
- gsap/ScrollTrigger (~8KB gz)
- gsap/SplitText (~4KB gz) — ou split-type@^0.3 comme alternative MIT
- lenis@^1.1 (~8KB gz)
- @splinetool/runtime@^2.x (150-300KB, LAZY ONLY)

JS budget total :
- Eager : ~28KB gz (toutes pages)
- Lazy : +150-300KB (Accueil uniquement, Spline 3D)

Perf targets :
- Lighthouse Performance : > 90 (desktop), > 85 (mobile avec Spline)
- LCP : < 2.5s
- CLS : < 0.1
- INP : < 200ms (< 100ms sur Contact)

Mandatory patterns :
- gsap.matchMedia() pour prefers-reduced-motion
- Lenis sync avec ScrollTrigger.update
- Astro View Transitions cleanup (astro:before-swap / astro:after-swap)
- Spline lazy island avec WebGL detection + fallback + timeout 5s
- data-magnetic attribute sur CTAs primaires
- data-animate attribute sur éléments ScrollTrigger
- [data-split] attribute sur éléments word-split
```

---

*Fin de la motion strategy v3.0. Ce document accompagne `design-system-v1-Studio-Kodo.md`, `tokens.json`, et `component-handoff-Studio-Kodo.md` pour l'agent 5.*
