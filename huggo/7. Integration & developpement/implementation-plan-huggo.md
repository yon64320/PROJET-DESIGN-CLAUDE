# Implementation Plan — HUGGO

> **Projet** : Site vitrine premium HUGGO
> **Version** : v1.0
> **Date** : 2026-04-09
> **Statut** : PLAN VALIDATED — ready to build

---

## 1. Pages Inventory

| # | Page | Route FR | Route EN | Tier | Source Specs |
|---|------|----------|----------|------|-------------|
| 1 | Accueil | `/fr/` | `/en/` | 3 | UX-Arch S.Accueil, Copy S.Accueil, Motion S.Accueil |
| 2 | Retail | `/fr/retail` | `/en/retail` | 2 | UX-Arch S.Retail, Copy S.Retail, Motion S.Retail |
| 3 | Franchise | `/fr/franchise` | `/en/franchise` | 2 | UX-Arch S.Franchise, Copy S.Franchise, Motion S.Franchise |
| 4 | Collectivity | `/fr/collectivity` | `/en/collectivity` | 2 | UX-Arch S.Collectivity, Copy S.Collectivity, Motion S.Collectivity |
| 5 | Comment ca marche | `/fr/how-it-works` | `/en/how-it-works` | 2 | UX-Arch S.How-it-works, Copy S.How-it-works, Motion S.How-it-works |
| 6 | Tarifs | `/fr/pricing` | `/en/pricing` | 2 | UX-Arch S.Tarifs, Copy S.Tarifs, Motion S.Tarifs |
| 7 | A propos | `/fr/about` | `/en/about` | 2 | UX-Arch S.About, Copy S.About, Motion S.About |
| 8 | Contact | `/fr/contact` | `/en/contact` | 1 | UX-Arch S.Contact, Copy S.Contact, Motion S.Contact |

**Total: 8 pages x 2 langues = 16 routes**

---

## 2. Components Inventory

### Global Components

| Component | File | States | Key Tokens | Animation | Responsive | A11y | Source |
|-----------|------|--------|------------|-----------|------------|------|--------|
| Header | `Header.astro` | Top (72px), Scrolled (56px, blur), Mobile (hamburger + overlay) | `surface.brand`, `text.on-brand`, `shadow.lg` | Compact 200ms ease-out, mobile menu 250ms ease-in-out | Desktop: horizontal links. < 1024px: hamburger. CTA always visible | `<nav aria-label>`, skip-to-content, `aria-expanded` hamburger | Component handoff |
| Footer | `Footer.astro` | Default (4 columns) | `surface.brand`, `text.on-brand`, `type.body-md`, `type.caption` | Hover links 150ms | 4 cols desktop, 1 col mobile | `<footer>` semantic | Component handoff |
| WhatsApp Button | `WhatsAppButton.astro` | Default, Hover, Focused, Pressed | #25D366, `shadow.md/lg/sm`, `radius.full` | Hover scale(1.05) 150ms, Pressed scale(0.95) 100ms | Fixed bottom-right 24px all breakpoints | `aria-label` FR/EN, `target="_blank"`, `rel="noopener"` | Component handoff |
| PreFooter CTA | `PreFooterCTA.astro` | Default | `surface.brand`, `text.on-brand`, `accent.action` | Fade-up 400ms on scroll enter | Full width, padding responsive | `<section aria-label>` | UX-Arch |
| SEO Head | `SEOHead.astro` | N/A | N/A | N/A | N/A | hreflang, canonical, OG | Tech stack S.E.6 |
| Dark Mode Toggle | inline in Header | Light/Dark | `border.focus` | 150ms transition | Same all breakpoints | `aria-label` FR/EN | Design system |
| Language Toggle | inline in Header | FR/EN | `text.on-brand` | 150ms transition | Same all breakpoints | `aria-label` FR/EN | Copy microcopy |

### UI Components

| Component | File | Variants | States (8) | Key Tokens | Source |
|-----------|------|----------|------------|------------|--------|
| Button | `Button.astro` | Primary, Secondary, Tertiary | Default, Hover, Focused, Pressed, Disabled, Loading, Error, Success | `accent.action` family, `brand.primary` family, `radius.lg`, `type.button` | Component handoff |
| Card | `Card.astro` | Verticale, Palier, Benefice | Default, Hover, Focused, Pressed, Disabled, Loading, Error, Success | `surface.elevated`, `border.default`, `shadow.sm/md`, `radius.md` | Component handoff |
| Badge | `Badge.astro` | Default, Status | Default, Hover, Focused, Pressed, Disabled, Loading, Error, Success | `accent.subtle`, `accent.action`, `radius.sm`, `type.body-sm` | Component handoff |
| Accordion | `Accordion.astro` | FAQ item | Default (closed), Hover, Focused, Pressed, Disabled, Open | `surface.elevated`, `surface.secondary`, `border.default`, `type.heading-md` | Component handoff |
| FormInput | `FormInput.astro` | Input, Select, Textarea | Default, Hover, Focused, Pressed, Disabled, Loading, Error, Success | `surface.elevated`, `border.default/focus`, `feedback.error/success`, `radius.sm` | Component handoff |
| Link | inline styles | Default | Default, Hover, Focused, Active, Disabled | `brand.primary`, `brand.primary-hover` | Design system |

### Section Components

| Component | File | Used On | Content Source |
|-----------|------|---------|---------------|
| HeroHome | `HeroHome.astro` | Accueil | Copy S1 (H1, subtitle, baseline, CTAs, micro-text) |
| HeroPage | `HeroPage.astro` | All internal pages | Copy S1 per page (H1, subtitle, CTA) |
| MetricsSection | `MetricsSection.astro` | Accueil S2, Retail S6, Franchise S5, Collectivity S2, How-it-works S6, Pricing S4, About S5 | Copy metrics per page |
| LogoBar | `LogoBar.astro` | Accueil S3 | 46 logos from assets/logos-hubrise/ |
| BenefitsGrid | `BenefitsGrid.astro` | Accueil S4, Collectivity S4 | Copy benefits blocks |
| VerticalsCards | `VerticalsCards.astro` | Accueil S5 | Copy cards (Retail, Franchise, Collectivity) |
| StepsSection | `StepsSection.astro` | Accueil S6 (summary), How-it-works S2 (detailed) | Copy 4 steps |
| FaqSection | `FaqSection.astro` | Accueil, Retail S8, Franchise FAQ, Collectivity FAQ, How-it-works FAQ, Pricing S6 | Copy FAQ per page |
| TestimonialBlock | `TestimonialBlock.astro` | Accueil S7, Retail S7, Franchise S6, Collectivity S6 | Placeholder + fallback |
| PricingTiers | `PricingTiers.astro` | Retail S4, Pricing S2 | Copy tiers (Essentiel, Smart, Marketing, Analytics) |
| VideoEmbed | `VideoEmbed.astro` | How-it-works S5 | Facade pattern, configurable URL |
| PartnersLogos | `PartnersLogos.astro` | Accueil S7, About S4 | Partner logos (GCP, ACSEO, Centrale, Orisha, Contodeo) |
| RSESection | `RSESection.astro` | Collectivity S5, About S6 | Copy RSE (6 commitments About, 5 Collectivity) |
| MascotSection | `MascotSection.astro` | Accueil S8 | Copy mascot + CTA WhatsApp |
| DemoConversation | `DemoConversation.astro` | How-it-works S3 | Copy conversation bubbles |
| BasketDiagram | `BasketDiagram.astro` | Retail S5, How-it-works S4 | Copy 360 basket (6 channels) |
| PainPoints | `PainPoints.astro` | Retail S2 | Copy 3 pain points |
| HuggoResponse | `HuggoResponse.astro` | Retail S3, Franchise S3 | Copy 3 responses |
| NetworkFeatures | `NetworkFeatures.astro` | Franchise S4 | Copy network features list |
| CircuitCourtCases | `CircuitCourtCases.astro` | Collectivity S3 | Copy 3 use cases |
| IncludedEverywhere | `IncludedEverywhere.astro` | Pricing S3 | Copy included features |
| NetworkOffer | `NetworkOffer.astro` | Pricing S5 | Copy network offer encadre |
| VisionMission | `VisionMission.astro` | About S2, About S3 | Copy vision + Atidgo |
| ContactForms | `ContactForms.astro` | Contact S2, S3 | Copy form fields, labels, messages |
| ContactInfo | `ContactInfo.astro` | Contact S4 | Copy coordinates (placeholders via env) |
| ReassuranceBlocks | `ReassuranceBlocks.astro` | Contact S5 | Copy 3 micro-blocks |

### Island Components (client-side JS)

| Component | File | Technology | Loading | Used On |
|-----------|------|-----------|---------|---------|
| SplineHero | `SplineHero.tsx` | React + @splinetool/react-spline | Lazy island: desktop (>= 768px) + WebGL only | Accueil hero |
| CounterAnimation | `CounterAnimation.ts` | Vanilla JS + GSAP | Eager (bundled with GSAP) | All metrics sections |

---

## 3. Animations Inventory

### Per-page Animation Effects

| Page | # Effects | Effects List | Tier |
|------|-----------|-------------|------|
| Accueil | 14 | Word-split H1, subtitle fade-up, CTAs fade-up+scale, micro-text fade, Spline 3D load+scroll+hover, counter x4, logo bar CSS, benefits stagger, verticals stagger, steps fade-up, social proof fade-up, mascot parallax+fade-up, pre-footer fade-up | 3 |
| Retail | 11 | H1 fade-up, subtitle fade-up, CTA fade-up+scale, pains stagger, responses stagger, tiers stagger, basket parallax, counters, testimonial fade-up, FAQ accordion, pre-footer fade-up | 2 |
| Franchise | 9 | H1 fade-up, CTA fade-up, enjeux stagger, responses stagger, features fade-up, counters, testimonial fade-up, FAQ accordion, pre-footer fade-up | 2 |
| Collectivity | 9 | H1 fade-up, CTA fade-up, counters x4, circuit court stagger, benefits stagger, RSE stagger, testimonial fade-up, FAQ accordion, pre-footer fade-up | 2 |
| How-it-works | 9 | H1 fade-up, CTA fade-up, 4-step reveal (signature), demo bubbles stagger, basket channels stagger, video fade-up, counters, FAQ accordion, pre-footer fade-up | 2 |
| Pricing | 8 | H1 fade-up, CTA fade-up, tiers stagger, included fade-up, ROI counters, network fade-up, FAQ accordion, pre-footer fade-up | 2 |
| About | 8 | H1 fade-up, CTA fade-up, vision fade-up, Atidgo fade-up, partners stagger, counters, RSE stagger, pre-footer fade-up | 2 |
| Contact | 11 | H1 fade-up (CSS), subtitle fade-up (CSS), form1 fade-up (CSS), form2 fade-up (CSS), field focus (CSS), button hover glow (CSS), button loading (CSS), success message (CSS), error shake (CSS), coordinates fade-up (CSS), reassurance stagger (CSS) | 1 |

**Total: 79 animation effects across 8 pages**

### Signature Moments

| # | Name | Page | Tier | Implementation |
|---|------|------|------|---------------|
| 1 | Hero 3D Smartphone | Accueil | 3 | Spline lazy island, scroll-linked rotateY(0-15deg), mouse-follow rotateX/Y(+/-5deg) |
| 2 | Staggered Proof Counter | Accueil S2 | 2 | GSAP counter 0 to value, 1200ms, 150ms stagger between 4 metrics |
| 3 | 4-Step Reveal | How-it-works S2 | 2 | GSAP translateX(-40px to 0) + opacity, 500ms/step, 200ms stagger, vertical progress line |

### Global Effects

| Effect | Implementation | Where |
|--------|---------------|-------|
| Smooth scroll | Lenis init in BaseLayout, synced with ScrollTrigger | All pages except Contact |
| Magnetic button | GSAP translate(Xmouse, Ymouse) limited +/-8px | Hero CTA primary (Accueil only) |
| Logo bar scroll | CSS @keyframes translateX(-33.33%), linear 30s infinite | Accueil S3 |

---

## 4. Integrations Inventory

| Integration | Type | Implementation | Config |
|-------------|------|---------------|--------|
| Formulaire demo | fetch() POST JSON to env var `FORM_ENDPOINT_DEMO` | Honeypot anti-spam, HTML5 + JS validation, success/error messages | Env var |
| Formulaire contact | fetch() POST JSON to env var `FORM_ENDPOINT_CONTACT` | Same pattern, separate endpoint | Env var |
| Plausible Analytics | `<script>` < 1KB, 12 custom events | No cookies, GDPR compliant | Env var `PLAUSIBLE_DOMAIN` |
| WhatsApp flottant | `<a href="https://wa.me/{WHATSAPP_NUMBER}">` | Env var fallback to # if empty | Env var `WHATSAPP_NUMBER` |
| Video demo | YouTube/Vimeo facade pattern (poster + play button) | Lazy iframe load on click | Env var `VIDEO_DEMO_URL` |
| Spline 3D | @splinetool/react-spline lazy island | WebGL detection, mobile fallback image | Env var `SPLINE_SCENE_URL` |
| Sitemap XML | @astrojs/sitemap with hreflang | Auto-generated at build | astro.config.mjs |
| Schema.org | JSON-LD in SEOHead | Organization, WebSite, FAQPage, BreadcrumbList | Per-page data |

---

## 5. Build Order (Dependency Graph)

```
Phase 1 — FOUNDATION (no page content)
  1.1 Scaffold Astro 5 project
  1.2 Install dependencies (Tailwind 4, GSAP, Lenis, React, Spline)
  1.3 tokens.json -> CSS custom properties (global.css)
  1.4 Tailwind config (@theme from tokens)
  1.5 Font loading (Plus Jakarta Sans, DM Sans, JetBrains Mono)
  1.6 BaseLayout (HTML head, fonts, analytics script, dark mode inline script, skip-to-content)
  1.7 Dark mode CSS ([data-theme="dark"] overrides)
  1.8 Reduced motion CSS fallbacks
  1.9 CSS animations (fade-up keyframes, logo bar, accordion, button hover)
  1.10 i18n utility + content JSON structure

Phase 2 — SHARED COMPONENTS (buildable independently)
  2.1 Button (3 variants, 8 states)
  2.2 Badge
  2.3 Card (3 variants)
  2.4 Accordion (FAQ item)
  2.5 FormInput (Input, Select, Textarea)
  2.6 Link styles

Phase 3 — GLOBAL COMPONENTS (depend on Phase 2)
  3.1 Header (sticky, compact, mobile menu, CTA, lang toggle, dark toggle)
  3.2 Footer (4 columns, links, Atidgo mention, copyright)
  3.3 WhatsApp floating button
  3.4 PreFooter CTA band
  3.5 SEOHead (meta, OG, Twitter, Schema.org, hreflang)
  3.6 PageLayout (Header + main + Footer + WhatsApp)

Phase 4 — SECTION COMPONENTS (depend on Phase 2+3)
  4.1 HeroHome + HeroPage
  4.2 MetricsSection
  4.3 LogoBar (CSS-only scroll)
  4.4 BenefitsGrid
  4.5 VerticalsCards
  4.6 StepsSection
  4.7 FaqSection
  4.8 TestimonialBlock
  4.9 PricingTiers
  4.10 VideoEmbed (facade)
  4.11 PartnersLogos
  4.12 RSESection
  4.13 MascotSection
  4.14 DemoConversation
  4.15 BasketDiagram
  4.16 PainPoints + HuggoResponse
  4.17 NetworkFeatures + CircuitCourtCases
  4.18 IncludedEverywhere + NetworkOffer
  4.19 VisionMission
  4.20 ContactForms + ContactInfo + ReassuranceBlocks

Phase 5 — PAGES (depend on Phase 4, use copy VERBATIM)
  5.1 Accueil FR + EN (index.astro)
  5.2 Retail FR + EN
  5.3 Franchise FR + EN
  5.4 Collectivity FR + EN
  5.5 How-it-works FR + EN
  5.6 Pricing FR + EN
  5.7 About FR + EN
  5.8 Contact FR + EN

Phase 6 — ANIMATIONS (depend on Phase 5)
  6.1 GSAP + ScrollTrigger init (gsap-init.ts)
  6.2 Lenis smooth scroll init (lenis-init.ts)
  6.3 Scroll-triggered fade-up animations per section
  6.4 Staggered card entrances
  6.5 Counter animations (CounterAnimation.ts)
  6.6 4-Step Reveal sequence (How-it-works)
  6.7 Word-split heading (Accueil H1)
  6.8 Magnetic button (Accueil hero CTA)
  6.9 Parallax (mascot, decorative elements)

Phase 7 — TIER 3 + INTEGRATIONS (depend on Phase 6)
  7.1 SplineHero island (React, lazy, WebGL check, fallback image)
  7.2 Form handler (fetch POST, honeypot, success/error)
  7.3 Plausible events (analytics.ts)
  7.4 Dark mode toggle logic (dark-mode.ts)
  7.5 Language toggle redirect

Phase 8 — SEO & POLISH
  8.1 Sitemap.xml (@astrojs/sitemap)
  8.2 robots.txt
  8.3 Schema.org JSON-LD per page
  8.4 Meta tags from copy SEO sections
  8.5 OG images (placeholder)
  8.6 Favicon
  8.7 404 page
  8.8 vercel.json (headers, redirects)
  8.9 .env.example
```

---

## 6. Risk Register

| # | Risk | Severity | Decision Taken | Source |
|---|------|----------|---------------|--------|
| R1 | **Spline 3D model does not exist yet.** The Spline scene is not provided. | High | Implement the SplineHero island with a **placeholder/fallback image** and the structure ready to receive the Spline scene URL via env var `SPLINE_SCENE_URL`. The component will load Spline when a URL is set and WebGL is available; otherwise, display the fallback image. | Motion strategy, PRD, Tech stack |
| R2 | **Contact coordinates not provided (P0).** Email, phone, WhatsApp number are all `[A FOURNIR]`. | High | Use **env vars** (`CONTACT_EMAIL`, `CONTACT_PHONE`, `WHATSAPP_NUMBER`) with placeholder display text ("contact@huggo.ai", "+33 X XX XX XX XX") and conditional rendering. The site must function with or without these values. | QA report A1 |
| R3 | **Domain not decided (P0).** Cannot configure canonical URLs, sitemap, Plausible. | Medium | Use **relative paths** everywhere. Canonical URL and sitemap domain are injected via env var `SITE_URL`. Default to `https://huggo.ai` as placeholder. | QA report A2 |
| R4 | **White on green contrast may be < 4.5:1 (D1).** `#FFFFFF` on `#4A9B4A` is ~3.6:1. | Medium | For **body text on brand surfaces**, slightly darken the green in the CSS custom property to oklch(0.48 0.14 142) / approx #3B8A3B to achieve 4.5:1+. Headings (large text) at 3:1 remain fine with the original green. Create a `--color-surface-brand-text-safe` token for body text contexts. | QA report D1 |
| R5 | **Testimonials, distributor logos, screenshots, video demo all missing.** | Low | All sections have **fallback content** per copy v1 (chiffres + partner logos). Placeholder structures are built. Assets slot in without code changes. | QA report A5, B3 |
| R6 | **FAQ on Accueil not in numbered section list.** Copy has 4 FAQ items after section 9 but not numbered. | Low | **Include the FAQ as section 10** between Mascotte and Pre-footer CTA, using the same Accordion component as other pages. | QA report B4 |
| R7 | **FAQ on How-it-works missing from motion spec.** Motion strategy does not list accordion animation for this page. | Low | **Add the same accordion open/close pattern** (250ms ease-in-out, Tier 1) as used on all other pages with FAQ. | QA report B5 |
| R8 | **GSAP license verification needed.** | Low | The site is a B2B showcase that does not charge users for access. This qualifies for the GSAP Standard License (No Charge). Document in build report. | QA report E6 |
| R9 | **Missing EN meta titles/descriptions for 4 pages.** How-it-works, Pricing, About, Contact only have FR meta. | Low | **Generate EN meta from the copy patterns** already established for the other 4 pages. Include in i18n JSON. | QA report C1 |

---

## 7. Content JSON Structure

Each page has a JSON file per language containing all copy VERBATIM from copy-v1-huggo.md:

```
src/content/
  fr/
    home.json       # 10 sections (hero, metrics, logo bar, benefits, verticals, steps, social proof, mascot, FAQ, pre-footer CTA)
    retail.json     # 9 sections
    franchise.json  # 7 sections + FAQ
    collectivity.json # 7 sections + FAQ
    how-it-works.json # 7 sections + FAQ
    pricing.json    # 7 sections
    about.json      # 7 sections
    contact.json    # 5 sections
    common.json     # Header links, footer, CTA labels, aria-labels, form messages, 404
  en/
    (mirror structure)
```

---

## 8. Environment Variables

```env
# Required for production (P0)
SITE_URL=https://huggo.ai
CONTACT_EMAIL=contact@huggo.ai
CONTACT_PHONE=+33XXXXXXXXX
WHATSAPP_NUMBER=33XXXXXXXXX

# Required for forms
FORM_ENDPOINT_DEMO=https://formspree.io/f/xxxxx
FORM_ENDPOINT_CONTACT=https://formspree.io/f/xxxxx

# Required for analytics
PLAUSIBLE_DOMAIN=huggo.ai

# Optional (Tier 3)
SPLINE_SCENE_URL=
VIDEO_DEMO_URL=

# Optional prefilled WhatsApp message
WHATSAPP_MESSAGE=Bonjour, je souhaite en savoir plus sur HUGGO.
```

---

IMPLEMENTATION PLAN VALIDATED — proceeding to build.
