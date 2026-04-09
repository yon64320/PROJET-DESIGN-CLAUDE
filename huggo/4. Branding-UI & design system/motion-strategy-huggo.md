# Motion Strategy — HUGGO

> **Projet** : Site vitrine premium HUGGO
> **Version** : v1.0
> **Date** : 2026-04-09
> **Statut** : READY FOR TECH — validation requise avant Gate 5

---

## C) PREMIUM EFFECTS STRATEGY + SELECTION DE TIER

### Table des tiers

| Tier | Label | JS Budget (gzipped) | Libraries | Lighthouse mobile cible |
|------|-------|---------------------|-----------|------------------------|
| 1 | CSS-only | 0 KB | None (CSS animations + transitions) | ≥ 95 |
| 2 | GSAP + Scroll + Smooth | ~28 KB gz | gsap, ScrollTrigger, lenis | ≥ 90 |
| 3 | Tier 2 + Spline 3D | +150-300 KB lazy | gsap, ScrollTrigger, lenis, @splinetool/react-spline | ≥ 85 |

### Evaluation de la recommandation Tier 3

Le PRD recommande **Tier 3** pour le smartphone 3D interactif dans le hero. Evaluation :

**Arguments POUR Tier 3 :**

1. **Ancrage produit immédiat** — Le smartphone 3D avec conversation WhatsApp à l'écran EST le produit. C'est la démonstration visuelle la plus directe de ce que fait HUGGO. Aucune image statique ne communique aussi clairement "votre commerce + WhatsApp + IA" en 3 secondes.

2. **Différenciation concurrentielle** — Les concurrents (Chataigne, Obypay) n'ont pas de hero 3D interactif. C'est un "signature moment" qui ancre HUGGO comme technologiquement supérieur dans l'esprit du visiteur, même inconsciemment.

3. **Cohérence marque/produit** — HUGGO est un produit technologique (IA sur WhatsApp). Un site avec un hero 3D interactif communique "nous maîtrisons la tech" sans le dire en mots. Un site avec une image statique communique "nous sommes un produit B2B classique".

4. **Le coût est gérable** — Le runtime Spline est lazy-loadé, ne bloquant pas le LCP. Le fallback statique garantit la performance mobile. Le budget +150-300 KB est acceptable pour un site vitrine avec max 8 pages et une audience desktop majoritaire (décideurs B2B qui consultent sur laptop).

**Risques et mitigations :**

| Risque | Mitigation |
|--------|-----------|
| LCP impacté | Spline en lazy island — le H1, le sous-titre et les CTA sont rendus en HTML statique. Le 3D charge après le LCP |
| Mobile performance | Fallback image statique du smartphone sur mobile (pas de 3D). Lighthouse mobile ≥ 85 |
| Navigateurs anciens / WebGL absent | Fallback image statique + alt text "Smartphone affichant une conversation WhatsApp avec l'assistant HUGGO" |
| Accessibilité | Le 3D est décoratif (aria-hidden="true"). Toute l'information est dans le texte HTML |
| Temps de développement | Le modèle Spline est pré-construit dans l'éditeur Spline — l'intégration se limite à un embed React |

### **Tier 3 — SÉLECTIONNÉ**

**Justification business** : le smartphone 3D interactif est le "signature moment" du site HUGGO. Il transforme un hero classique (titre + image) en une démonstration immersive du produit qui ancre la compréhension et la différenciation en 3 secondes. Le coût en JS est absorbé par le lazy-loading et le fallback image sur mobile. Le ROI en conversion attendu (compréhension produit + mémorabilité) justifie les 150-300 KB supplémentaires.

**Condition de maintien Tier 3** : si les tests Lighthouse montrent un score mobile < 85 avec le lazy-load Spline actif, downgrade à Tier 2 + image statique haute qualité du smartphone. Le Tier 2 reste le plancher non-négociable pour les animations scroll et micro-interactions.

---

### 3 Signature Moments

| # | Signature Moment | Page | Description | Tier requis |
|---|-----------------|------|-------------|-------------|
| 1 | **Hero 3D Smartphone** | Accueil | Smartphone 3D Spline, incliné en perspective, écran affichant conversation WhatsApp HUGGO. Réagit au scroll (rotation Y subtile 0-15°, parallax Z, contenu écran change). Au hover desktop : rotation X/Y subtile suivant le curseur (±5°). | Tier 3 |
| 2 | **Staggered Proof Counter** | Accueil (section 2) | Les 4 chiffres-clés (15M, +15-30%, 60%, 0%) comptent depuis 0 jusqu'à leur valeur finale, déclenchés au scroll quand la section entre dans le viewport. Stagger de 150ms entre chaque chiffre. Police mono (JetBrains Mono), couleur accent (orange). | Tier 2 |
| 3 | **4-Step Reveal** | Comment ça marche (section 2) | Les 4 étapes d'onboarding se révèlent séquentiellement au scroll : chaque étape glisse depuis la gauche (translateX -40px, opacity 0 → 1) avec un stagger de 200ms. Une ligne de progression verticale connecte les étapes et se remplit au fur et à mesure. | Tier 2 |

---

### Table des effets autorisés

| Effet | Où | Easing | Durée | Propriétés | But conversion | Tier Min |
|-------|-----|--------|-------|------------|----------------|----------|
| **Fade-up** (translateY + opacity) | Toutes les sections, entrée au scroll | `spring` (0.16, 1, 0.3, 1) | 400ms | `transform: translateY(20px→0)`, `opacity: 0→1` | Guider l'attention descendante, récompenser le scroll | 1 (CSS) |
| **Staggered fade-up** | Cards (verticales, paliers, bénéfices) | `spring` | 400ms + 100ms stagger | `transform`, `opacity` | Donner du rythme, éviter le mur de texte | 2 (GSAP) |
| **Counter animation** | Chiffres-clés (15M, 0%, etc.) | `ease-out` | 1200ms | Compteur numérique (JS) | Ancrage data, crédibilité | 2 (GSAP) |
| **Button hover — arrow slide** | CTA primaires avec flèche | `ease-out` | 150ms | `transform: translateX(0→4px)` sur l'icône flèche | Signal d'interactivité, invitation au clic | 1 (CSS) |
| **Button hover — glow** | CTA primaires | `ease-out` | 150ms | `box-shadow: accent-glow` | Attraction visuelle vers le CTA | 1 (CSS) |
| **Button press — scale** | Tous les boutons | `ease-out` | 100ms | `transform: scale(0.98)` | Feedback tactile | 1 (CSS) |
| **Card hover — lift** | Cards (verticales, paliers) | `ease-out` | 200ms | `transform: translateY(-2px)`, `box-shadow: shadow.md` | Signal d'interactivité | 1 (CSS) |
| **Accordion open/close** | FAQ, paliers mobile | `ease-in-out` | 250ms | `max-height`, `opacity`, chevron `rotate(90deg)` | Reveal progressif, pas de jump | 1 (CSS) |
| **Header compact** | Header sticky au scroll | `ease-out` | 200ms | `height: 72px→56px`, `backdrop-filter: blur(12px)` | Libérer l'espace de lecture | 1 (CSS) |
| **Logo bar scroll** | Barre logos HubRise | `linear` | 30s par cycle (infini) | `transform: translateX()` | Preuve d'écosystème (effet de masse) | 1 (CSS) |
| **Parallax decoratif** | Mascotte, visuels de fond | `linear` (scroll-driven) | N/A (scroll-linked) | `transform: translateY()` à 0.3x vitesse scroll | Profondeur visuelle | 2 (GSAP) |
| **Word-split heading** | H1 hero accueil (optionnel) | `spring` | 500ms + 30ms/word stagger | `transform`, `opacity` par mot | Entrée dramatique du message principal | 2 (GSAP) |
| **Magnetic button** | CTA primaire hero | `ease-out` | 150ms | `transform: translate(Xmouse, Ymouse)` limité ±8px | Attraction magnétique, premium feel | 2 (GSAP) |
| **3D smartphone scroll** | Hero accueil | Physics-based (Spline) | Continu (scroll-linked) | `rotateY(0→15°)`, `translateZ()`, contenu écran | Démonstration produit immersive | 3 (Spline) |
| **3D smartphone hover** | Hero accueil (desktop) | Physics-based (Spline) | Continu (mouse-linked) | `rotateX/Y(±5°)` suivant curseur | Interactivité premium | 3 (Spline) |
| **Smooth scroll** | Navigation globale | `ease-out` (Lenis) | Variable | `scrollTo` smooth | Expérience premium, transitions douces | 2 (Lenis) |

### Table des effets interdits

| Effet | Raison | Alternative | Override Tier |
|-------|--------|-------------|---------------|
| **Carousel / Slider** | Taux d'interaction < 1% sur les slides 2+. Cache du contenu. CLS risk. Anti-pattern UX validé par le PRD | Contenu statique visible, grid de cards | Aucun — DEFINITIVEMENT INTERDIT |
| **Scroll-jacking** | Confisque le contrôle utilisateur, désorientation, a11y violation | Scroll natif avec animations scroll-triggered | Aucun — DEFINITIVEMENT INTERDIT |
| **Auto-play vidéo avec son** | Agression sensorielle, data mobile, a11y violation | Vidéo embed avec contrôles utilisateur, poster image | Aucun — DEFINITIVEMENT INTERDIT |
| **Custom cursor** | Confusion UX, surcharge cognitive, a11y violation (cursor non standard) | Cursor natif + hover states expressifs | Aucun — DEFINITIVEMENT INTERDIT |
| **Full glassmorphism** | Performance (backdrop-filter coûteux sur surfaces larges), lisibilité compromise | Backdrop-blur subtil (12px) sur header sticky uniquement, avec fond quasi-opaque (90%) | Aucun — interdit sur éléments autres que header |
| **Parallax scroll sur texte** | Lisibilité dégradée, CLS risk, motion sickness | Parallax uniquement sur éléments décoratifs (images, mascotte) | Tier 2+ uniquement |
| **Infinite scroll content** | Pas de contenu paginé dans le scope. Hors pattern site vitrine | Structure de pages fixes avec navigation claire | Aucun |
| **Text animation sur body** | Lisibilité dégradée, distraction du contenu | Animations limitées aux headings (H1 hero uniquement) | Tier 2+ uniquement |
| **Bounce / elastic easing** | Perçu comme ludique/non-professionnel pour du B2B commerçant | Spring easing subtil (0.16, 1, 0.3, 1) — pas de rebond visible | Aucun |
| **Rotation continue (spin)** | Distraction, aucune valeur informative | Utiliser des transitions directionnelles (translateY, opacity) | Aucun |

### NOTE sur le backdrop-blur (navigation sticky)

Le PRD cite Obypay comme inspiration avec glass-morphism sur la navigation. L'analyse du rapport bénéfice/coût :

- **Bénéfice** : lisibilité améliorée quand du contenu défile sous le header compacté. Signal de modernité visuelle.
- **Coût** : `backdrop-filter: blur()` est composited mais peut impacter le FPS sur mobile si la surface est grande.
- **Décision** : un `backdrop-filter: blur(12px)` est autorisé UNIQUEMENT sur le header sticky en état compacté (scrolled). Le fond reste quasi-opaque (`surface.brand` à 90% opacité) — le blur est une couche de sécurité pour la lisibilité, pas un effet esthétique principal. Ce n'est PAS du full glassmorphism (qui implique des surfaces larges semi-transparentes avec blur fort).
- **Fallback** : si `backdrop-filter` n'est pas supporté, fond 100% opaque. Détection via `@supports`.

### Framework 3D — Tier 3

| Aspect | Spec |
|--------|------|
| **Runtime** | @splinetool/react-spline (Spline 3D) |
| **Chargement** | Lazy island — le composant 3D ne charge QUE quand le hero est dans le viewport ET que le device supporte WebGL. Sur mobile : jamais chargé (fallback image) |
| **Fallback** | Image statique haute qualité du smartphone HUGGO avec conversation WhatsApp à l'écran. Alt text : "Smartphone affichant une conversation WhatsApp avec l'assistant HUGGO" |
| **Seuil mobile** | < 768px viewport width → pas de chargement Spline. Image statique |
| **Seuil WebGL** | Si `WebGLRenderingContext` absent → image statique |
| **Lighthouse mobile** | Cible ≥ 85. Si < 85 avec Spline lazy → downgrade à Tier 2 + image |
| **Aria** | `aria-hidden="true"` sur le canvas Spline. L'information est dans le HTML (H1, sous-titre) |
| **Interaction** | Scroll-linked (rotateY 0-15°, translateZ parallax) + mouse-follow (rotateX/Y ±5° desktop) |
| **Loading state** | Texte "Chargement de l'expérience 3D..." en `type.body-sm` + skeleton rectangle. Disparaît au load complet |

### Reduced motion fallback par tier

| Tier | Comportement avec `prefers-reduced-motion: reduce` |
|------|---------------------------------------------------|
| **Tier 1 (CSS)** | Toutes les animations CSS désactivées. Les hover states conservent les changements de couleur/ombre mais pas de `transform`. Les accordéons s'ouvrent/ferment instantanément (pas de transition). La logo bar s'arrête (position fixe, montrant les logos visibles) |
| **Tier 2 (GSAP)** | Toutes les animations GSAP sont désactivées (pas de scroll-triggered, pas de stagger, pas de counters). Les éléments sont visibles immédiatement (opacity 1, transform none). Lenis smooth scroll désactivé (scroll natif). Les magnetic buttons sont désactivés |
| **Tier 3 (Spline)** | Le modèle 3D est chargé mais statique (pas de rotation au scroll/hover). Position fixe à l'angle de vue par défaut. Si reduced-motion, le modèle Spline peut être remplacé par l'image statique pour économiser les ressources |

### Animation dependencies list

| Library | Version min | Size (gzip) | Tier | Purpose | Tree-shakeable |
|---------|-------------|-------------|------|---------|---------------|
| **gsap** | 3.12+ | ~24 KB | 2+ | Core animation engine | Oui (modular imports) |
| **gsap/ScrollTrigger** | 3.12+ | ~4 KB | 2+ | Scroll-triggered animations | Oui (plugin import) |
| **lenis** | 1.0+ | ~5 KB | 2+ | Smooth scroll | Oui |
| **@splinetool/react-spline** | 2.2+ | ~150-300 KB | 3 | 3D smartphone embed | N/A (lazy island, loaded conditionally) |

**Total JS budget animation** :
- Tier 1 : 0 KB (CSS only)
- Tier 2 : ~33 KB gzipped (gsap + ScrollTrigger + lenis)
- Tier 3 : ~33 KB + 150-300 KB lazy (Spline loaded only on desktop + WebGL)

---

## E) SIGNATURE ANIMATION SPEC (par page)

### PAGE : ACCUEIL (/)

**Tier** : Tier 3 (smartphone 3D dans le hero)

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 "Vos clients commandent..." | Word-split fade-up | 500ms + 30ms/word stagger | Load (DOMContentLoaded) | 2 |
| 2 | Sous-titre + Baseline | Fade-up | 400ms, delay 300ms after H1 | Load | 2 |
| 3 | CTA primaire + CTA secondaire | Fade-up + scale 0.95→1 | 400ms, delay 500ms after H1, 100ms stagger | Load | 2 |
| 4 | Micro-texte sous CTA | Fade (opacity) | 300ms, delay 700ms after H1 | Load | 1 |
| 5 | Smartphone 3D | Spline load + fade-in | 800ms fade after Spline loaded | Load (lazy, after LCP) | 3 |
| 6 | Smartphone 3D scroll | RotateY(0→15°), translateZ parallax | Continu, lié au scroll 0-50vh | Scroll 0-50% viewport | 3 |
| 7 | Chiffres-clés (15M, +15-30%, 60%, 0%) | Counter animation 0→valeur | 1200ms, 150ms stagger entre les 4 | Scroll enter (section top at 80% viewport) | 2 |
| 8 | Logo bar | CSS scroll horizontal infini | 30s/cycle, linear, infini | Viewport enter (1 seule fois) | 1 |
| 9 | Bénéfices (4 blocs) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (section top at 75% viewport) | 2 |
| 10 | Verticales (3 cards) | Staggered fade-up + card lift on hover | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 11 | Comment ça marche (4 étapes résumé) | Fade-up séquentiel | 400ms, 150ms stagger | Scroll enter (75%) | 1 |
| 12 | Social proof (logos partenaires) | Fade-up | 400ms | Scroll enter (80%) | 1 |
| 13 | Mascotte | Parallax (0.3x scroll) + fade-up | 400ms entrée, parallax continu | Scroll enter (80%) | 2 |
| 14 | Pré-footer CTA | Fade-up | 400ms | Scroll enter (85%) | 1 |

#### Scroll storyboard

| Viewport % scrolled | Animation déclenchée |
|---------------------|---------------------|
| 0% (top) | H1 word-split, sous-titre, CTAs, micro-texte (séquence load) |
| 5-50% | Smartphone 3D rotation au scroll (continu) |
| ~20% | Chiffres-clés counter animation |
| ~30% | Logo bar visible (CSS scroll actif) |
| ~40% | Bénéfices staggered fade-up |
| ~55% | Verticales cards staggered fade-up |
| ~65% | Comment ça marche étapes fade-up |
| ~75% | Social proof fade-up |
| ~80% | Mascotte parallax + fade-up |
| ~90% | Pré-footer CTA fade-up |

#### Budget perf — Accueil

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 3 (hors logo bar CSS) |
| Poids JS animation total | ~33 KB (Tier 2) + 150-300 KB lazy (Spline, desktop only) |
| LCP | < 2.5s (H1 text ou hero image — PAS le 3D) |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |

---

### PAGE : RETAIL (/retail)

**Tier** : Tier 2 (pas de 3D — animations scroll et micro-interactions)

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 Retail | Fade-up | 400ms | Load | 1 |
| 2 | Sous-titre + preuves | Fade-up | 400ms, delay 200ms | Load | 1 |
| 3 | CTA hero | Fade-up + scale | 400ms, delay 400ms | Load | 1 |
| 4 | Douleurs (3 blocs) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 5 | Réponses HUGGO (3 blocs) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 6 | Paliers fonctionnalités (4 cards) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 7 | Panier 360° schéma | Fade-up + parallax léger sur les icônes canaux | 400ms entrée, parallax 0.2x | Scroll enter (75%) | 2 |
| 8 | Résultats chiffrés | Counter animation | 1200ms, 150ms stagger | Scroll enter (80%) | 2 |
| 9 | Témoignage | Fade-up | 400ms | Scroll enter (80%) | 1 |
| 10 | FAQ objections (accordéons) | Accordion open/close | 250ms ease-in-out | Clic sur question | 1 |
| 11 | Pré-footer CTA | Fade-up | 400ms | Scroll enter (85%) | 1 |

#### Budget perf — Retail

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 3 |
| Poids JS animation total | ~33 KB (Tier 2 uniquement) |
| LCP | < 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |

---

### PAGE : FRANCHISE (/franchise)

**Tier** : Tier 2

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 Franchise | Fade-up | 400ms | Load | 1 |
| 2 | Sous-titre + CTA | Fade-up | 400ms, delay 200ms | Load | 1 |
| 3 | Problématique (3 enjeux) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 4 | HUGGO pour les réseaux (3 réponses) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 5 | Fonctionnalités réseau (liste) | Fade-up | 400ms | Scroll enter (75%) | 1 |
| 6 | Chiffres d'impact | Counter animation | 1200ms, 150ms stagger | Scroll enter (80%) | 2 |
| 7 | Témoignage distributeur | Fade-up | 400ms | Scroll enter (80%) | 1 |
| 8 | FAQ objections | Accordion open/close | 250ms | Clic | 1 |
| 9 | Pré-footer CTA | Fade-up | 400ms | Scroll enter (85%) | 1 |

#### Budget perf — Franchise

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 3 |
| Poids JS animation total | ~33 KB |
| LCP | < 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |

---

### PAGE : COLLECTIVITY (/collectivity)

**Tier** : Tier 2

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 Collectivity | Fade-up | 400ms | Load | 1 |
| 2 | Sous-titre + CTA | Fade-up | 400ms, delay 200ms | Load | 1 |
| 3 | Chiffres France (4 métriques) | Counter animation | 1200ms, 150ms stagger | Scroll enter (75%) | 2 |
| 4 | Circuit court (3 cas d'usage) | Staggered fade-up | 400ms, 150ms stagger | Scroll enter (75%) | 2 |
| 5 | Bénéfices (3 blocs) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 6 | Impact RSE (5 engagements) | Staggered fade-up | 400ms, 80ms stagger | Scroll enter (75%) | 2 |
| 7 | Témoignage | Fade-up | 400ms | Scroll enter (80%) | 1 |
| 8 | FAQ objections | Accordion open/close | 250ms | Clic | 1 |
| 9 | Pré-footer CTA | Fade-up | 400ms | Scroll enter (85%) | 1 |

#### Budget perf — Collectivity

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 3 |
| Poids JS animation total | ~33 KB |
| LCP | < 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |

---

### PAGE : COMMENT CA MARCHE (/how-it-works)

**Tier** : Tier 2 (signature moment #3 : 4-Step Reveal)

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 "De zéro à opérationnel..." | Fade-up | 400ms | Load | 1 |
| 2 | Sous-titre + CTA | Fade-up | 400ms, delay 200ms | Load | 1 |
| 3 | **4 étapes onboarding** (signature) | Staggered slide-in depuis la gauche (translateX -40px→0, opacity 0→1) + ligne de progression verticale qui se remplit | 500ms par étape, 200ms stagger. Ligne : 1600ms total (synced avec les étapes) | Scroll enter (70%) | 2 |
| 4 | Démo conversation (bulles) | Staggered fade-up simulant l'arrivée de messages | 300ms par bulle, 400ms stagger | Scroll enter (75%) | 2 |
| 5 | Panier 360° (schéma canaux) | Fade-up + icônes canaux apparaissent en séquence | 400ms container, puis 150ms stagger par icône canal | Scroll enter (75%) | 2 |
| 6 | Vidéo démo | Fade-up (le player apparaît, pas d'autoplay) | 400ms | Scroll enter (80%) | 1 |
| 7 | Résultats chiffrés | Counter animation | 1200ms, 150ms stagger | Scroll enter (80%) | 2 |
| 8 | FAQ objections | Accordion open/close | 250ms | Clic | 1 |
| 9 | Pré-footer CTA | Fade-up | 400ms | Scroll enter (85%) | 1 |

#### Budget perf — Comment ça marche

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 3 (dont la séquence 4-step qui est séquentielle) |
| Poids JS animation total | ~33 KB |
| LCP | < 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |

---

### PAGE : TARIFS (/pricing)

**Tier** : Tier 2

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 Tarifs | Fade-up | 400ms | Load | 1 |
| 2 | Sous-titre + CTA | Fade-up | 400ms, delay 200ms | Load | 1 |
| 3 | Paliers (4 cards) | Staggered fade-up (de gauche à droite, progression visuelle) | 400ms, 150ms stagger | Scroll enter (75%) | 2 |
| 4 | "Inclus partout" (liste) | Fade-up | 400ms | Scroll enter (75%) | 1 |
| 5 | ROI / valeur perçue | Fade-up + counter animation sur les chiffres (+15-30%, 5000€, 1250€) | 400ms container + 1200ms counters | Scroll enter (80%) | 2 |
| 6 | Offre réseau (encadré) | Fade-up | 400ms | Scroll enter (80%) | 1 |
| 7 | FAQ tarifs (accordéons) | Accordion open/close | 250ms | Clic | 1 |
| 8 | Pré-footer CTA | Fade-up | 400ms | Scroll enter (85%) | 1 |

#### Budget perf — Tarifs

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 3 |
| Poids JS animation total | ~33 KB |
| LCP | < 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |

---

### PAGE : A PROPOS (/about)

**Tier** : Tier 2

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 À propos | Fade-up | 400ms | Load | 1 |
| 2 | Sous-titre + CTA | Fade-up | 400ms, delay 200ms | Load | 1 |
| 3 | Vision / mission (paragraphe) | Fade-up | 400ms | Scroll enter (75%) | 1 |
| 4 | Atidgo (paragraphe) | Fade-up | 400ms | Scroll enter (75%) | 1 |
| 5 | Partenaires tech (logos + descriptions) | Staggered fade-up | 400ms, 100ms stagger | Scroll enter (75%) | 2 |
| 6 | Chiffres (15M, 50M€, 3, ~50) | Counter animation | 1200ms, 150ms stagger | Scroll enter (80%) | 2 |
| 7 | Engagements RSE (6 blocs) | Staggered fade-up | 400ms, 80ms stagger | Scroll enter (75%) | 2 |
| 8 | Pré-footer CTA | Fade-up | 400ms | Scroll enter (85%) | 1 |

#### Budget perf — À propos

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 3 |
| Poids JS animation total | ~33 KB |
| LCP | < 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |

---

### PAGE : CONTACT / DEMO (/contact)

**Tier** : Tier 1 (CSS-only — la page de conversion doit être la plus rapide et la plus légère)

**Justification** : la page Contact est une page de conversion pure. Le visiteur est prêt à agir. Chaque milliseconde de chargement compte. Les animations GSAP ne sont pas nécessaires ici — les CSS transitions suffisent pour les états de formulaire et les hover.

#### Séquence d'animation exacte

| # | Élément | Effet | Timing | Trigger | Tier |
|---|---------|-------|--------|---------|------|
| 1 | H1 Contact | Fade-up (CSS) | 400ms | Load | 1 |
| 2 | Sous-titre | Fade-up (CSS) | 400ms, delay 200ms | Load | 1 |
| 3 | Formulaire démo | Fade-up (CSS) | 400ms, delay 300ms | Load | 1 |
| 4 | Formulaire contact | Fade-up (CSS) | 400ms, delay 400ms | Load | 1 |
| 5 | Champs de formulaire focus | Border transition | 150ms ease-out | Focus | 1 |
| 6 | Bouton submit hover | Glow + arrow slide | 150ms ease-out | Hover | 1 |
| 7 | Bouton submit loading | Spinner + opacity | 150ms | Submit | 1 |
| 8 | Form success message | Fade-in + slide-down | 300ms ease-out | Form submit success | 1 |
| 9 | Form error shake | ShakeX (±3px) | 300ms | Form submit error | 1 |
| 10 | Coordonnées | Fade-up (CSS) | 400ms | Scroll enter (75%) | 1 |
| 11 | Rassurance (3 micro-blocs) | Fade-up (CSS) | 400ms, 100ms stagger | Scroll enter (80%) | 1 |

#### Budget perf — Contact

| Métrique | Cible |
|----------|-------|
| Max animations simultanées | 2 |
| Poids JS animation total | 0 KB (CSS-only, Tier 1) |
| LCP | < 2.0s (page légère) |
| INP | ≤ 150ms |
| CLS | ≤ 0.05 |
