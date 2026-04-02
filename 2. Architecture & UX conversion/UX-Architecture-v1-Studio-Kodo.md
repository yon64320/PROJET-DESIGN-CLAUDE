# UX Architecture v1 — Studio Kodo

> **Version :** v1.1
> **Date :** 2026-04-01
> **Agent :** vitrine-ux-architecture
> **Inputs :** PRD-Studio-Kodo.md (v1.2), pack-strategie-Studio-Kodo.md
> **Statut :** Draft — en attente de validation
> **Changement v1.1 :** Annotations Tier 3 (GSAP + ScrollTrigger + Lenis + Spline 3D) ajoutées aux page specs. Structure de conversion inchangée.

---

## 0. CONTEXTE (5 lignes)

1. **Objectif :** Générer 10+ demandes de devis qualifiées/mois à M+6 via un site vitrine premium qui EST la preuve de compétence.
2. **Audience :** Fondateurs de startup (ICP), PME locales, artisans premium — tous décideurs, tous frustrés par les agences lentes ou les templates génériques.
3. **Promesse :** "Votre site. Sur-mesure. Livré en 3 jours." — un seul interlocuteur du branding au déploiement.
4. **CTA primaire :** Formulaire multi-étapes 5 steps (~1min30) → "On vous rappelle sous 24h." CTA secondaire : appel téléphonique direct.
5. **Contrainte clé :** Aucune preuve réelle au lancement — les 4 case studies concept et le site lui-même sont les seules preuves disponibles. Tout doit être labelé "Projet concept".

---

## 0bis. TIER 3 MOTION STRATEGY — ANNOTATIONS UX

> **Tier sélectionné :** Tier 3 — GSAP + ScrollTrigger + Lenis + Spline 3D
> **Justification :** Le site est la vitrine-preuve du studio. La maîtrise technique est un différenciateur.
> **Contrainte :** JS < 80KB (hors Spline lazy). Lighthouse Perf > 90. `prefers-reduced-motion` respecté (GSAP matchMedia).

### Principes UX des animations

1. **Toute animation a un "job" UX** — guider l'attention, signaler l'interactivité, renforcer la hiérarchie. Pas d'effet décoratif gratuit.
2. **Smooth scroll (Lenis)** — actif globalement, désactivé si `prefers-reduced-motion`.
3. **ScrollTrigger** — révèle le contenu au bon rythme, crée un storyboard narratif. Pas de scroll-jacking (interdit par le PRD).
4. **Spline 3D** — un seul island, lazy-loaded, avec fallback image statique si pas de WebGL.
5. **Word-split** — réservé aux titres à fort impact émotionnel (H1 hero, titres de section "peak"). Max 4-5 instances sur tout le site.
6. **Magnetic buttons** — réservés aux CTA primaires ("Demander un devis"). Le mouvement attire l'œil vers la conversion.

### Inventaire des effets par type

| Effet | Où (pages/sections) | Fréquence max |
|-------|----------------------|---------------|
| **Spline 3D island** | Accueil — Hero (§1) | 1 seul sur tout le site |
| **Parallax scroll** | Accueil §3 (réalisations aperçu), Case study §5 (galerie visuelle), À propos §2 (récit fondateur) | 3-4 zones max |
| **ScrollTrigger storyboard** | Accueil (sections 1→7 reveal séquentiel), Case study (sections 1→8 narration), Services (offres 2→4 reveal) | Toutes les pages à scroll long |
| **Word-split text** | Accueil §1 (H1 hero), Accueil §7 (headline de clôture), À propos §1 (H1), Case study §1 (H1 nom du projet) | 4-5 max site-wide |
| **Magnetic buttons** | Tous les CTA "Demander un devis" (header, sections de conversion) | Chaque CTA primaire |
| **Stagger reveals** | Accueil §2 (3 piliers), Services §2-4 (scope bullets), Réalisations §2 (grille projets) | Listes et grilles |
| **Counter animation** | Case study §6 (métriques résultats), Accueil §6 (chiffres clés) | Zones de chiffres |
| **Transition entre étapes formulaire** | Contact §2 (formulaire multi-étapes) | 5 transitions |

### Règles d'accessibilité motion

- `prefers-reduced-motion: reduce` → toutes les animations GSAP désactivées via `gsap.matchMedia()`, Lenis désactivé, Spline remplacé par l'image fallback
- Focus visible conservé sur les magnetic buttons (le `hover` magnétique ne s'active qu'au pointeur, pas au clavier)
- Aucune animation ne bloque la lecture du contenu — le texte est lisible même si l'animation n'a pas joué

---

## A. SITE ARCHITECTURE (SITEMAP + NAV)

### A.1 Sitemap v1

```
Studio Kodo
├── Accueil                          /
├── Services                         /services
├── Réalisations                     /realisations
│   ├── Maison Levain                /realisations/maison-levain
│   ├── Flowtrack                    /realisations/flowtrack
│   ├── Durand & Fils               /realisations/durand-et-fils
│   └── Ōm Studio                   /realisations/om-studio
├── À propos                         /a-propos
├── Contact                          /contact
├── Mentions légales                 /mentions-legales
└── Politique de confidentialité     /politique-confidentialite
```

**Total :** 7 pages principales + 4 sous-pages case studies = 11 pages.

### A.2 Rôle de chaque page

| Page | Rôle principal | Rôle secondaire | KPI |
|------|---------------|-----------------|-----|
| **Accueil** | Convaincre (hook + promesse + aperçu preuves) | Orienter vers Services ou Réalisations | Taux de scroll > 60%, clics vers Réalisations, clics CTA |
| **Services** | Informer (détail des 3 offres) + Convaincre | Convertir (CTA devis) | Clics CTA "Demander un devis", temps sur page |
| **Réalisations** (index) | Prouver (galerie des 4 projets) | Orienter vers les case studies individuelles | Clics vers case studies |
| **Case study** (×4) | Prouver (démonstration par l'exemple) | Convertir (CTA en fin de case study) | Scroll > 50%, clics CTA, temps sur page |
| **À propos** | Crédibiliser (récit + méthode) | Convertir (CTA vers contact) | Temps sur page, clics CTA |
| **Contact** | Convertir (formulaire multi-étapes) | Convertir secondaire (appel) | Taux de complétion formulaire > 60%, appels |
| **Mentions légales** | Obligation légale | — | — |
| **Politique de confidentialité** | RGPD | — | — |

### A.3 Navigation

**Header (sticky, toutes pages) :**
```
[Logo Studio Kodo]   Services   Réalisations   À propos   [📞 Numéro]   [Demander un devis →]   [☀/🌙]
```

**Principes :**
- **5 items max** dans la nav principale (hors logo + CTA + dark mode toggle)
- Contact n'est PAS un item de nav : il est remplacé par le CTA "Demander un devis" (bouton primaire, toujours visible)
- Le numéro de téléphone est visible en permanence dans le header (format cliquable `tel:` sur mobile)
- Dark mode toggle visible dans le header
- Mentions légales et politique de confidentialité sont dans le footer uniquement
- Blog : emplacement prévu dans la nav (non affiché au lancement, mais slot réservé en code)
- Mobile : hamburger menu avec les mêmes items + numéro de téléphone proéminent + CTA sticky en bottom bar

**Footer :**
```
[Logo]   [Tagline courte]
Services | Réalisations | À propos | Contact
Mentions légales | Politique de confidentialité
[Icône Instagram] [Icône LinkedIn]
© 2026 Studio Kodo — Tous droits réservés
```

---

## B. DECISION JOURNEYS

### B.1 Persona 1 — Lucas, fondateur de startup (ICP)

**Contexte d'entrée :** Recherche Google "web designer freelance premium" ou recommandation LinkedIn. Arrive sur Accueil ou Réalisations. Compare activement 2-3 prestataires. Budget 3-10k€. Veut un site qui impressionne ses investisseurs.

```
ENTRÉE: Accueil (SEO/referral) ou Réalisations (réseaux sociaux)
   │
   ▼
[Accueil] ── Hook visuel + promesse "V1 en 3 jours"
   │          Job: capter l'attention, établir la différence
   │          Friction: "Encore un freelance qui promet la lune?"
   │          Réducteur: le site lui-même EST la preuve + chiffres case studies
   │
   ├──→ [Réalisations] ── Galerie des 4 projets concept
   │       │                Job: prouver par l'exemple
   │       │
   │       └──→ [Flowtrack case study] ── Deep-dive startup (son segment)
   │               │                      Job: projection ("il peut faire ça pour moi")
   │               │                      Friction: "Ce sont des projets fictifs"
   │               │                      Réducteur: label transparent + qualité irréprochable
   │               │
   │               └──→ [Contact / Formulaire]
   │                       CTA: "Demander un devis"
   │                       Conversion attendue ✓
   │
   ├──→ [Services] ── Détail offre "Site vitrine premium"
   │       │           Job: clarifier le scope + justifier le premium
   │       │           Friction: "Combien ça coûte?"
   │       │           Réducteur: "Sur devis — décrivez votre projet, on vous rappelle sous 24h"
   │       │
   │       └──→ [Contact / Formulaire]
   │               Conversion attendue ✓
   │
   └──→ [À propos] ── Récit fondateur + process en 3 étapes
           │           Job: crédibiliser la personne + rassurer sur la méthode
           │
           └──→ [Contact / Formulaire]
                   Conversion attendue ✓
```

**Parcours optimal (3-4 pages) :** Accueil → Réalisations → Flowtrack → Contact
**Temps estimé :** 4-6 minutes

---

### B.2 Persona 2 — Marie, dirigeante PME locale

**Contexte d'entrée :** Recherche Google "création site internet [ville]" ou recommandation bouche-à-oreille. Moins tech-savvy. Veut du "clé en main". Sensible au process et à la réassurance.

```
ENTRÉE: Accueil (SEO local) ou lien direct (bouche-à-oreille)
   │
   ▼
[Accueil] ── Hook + section process "3 étapes, c'est tout"
   │          Job: rassurer sur la simplicité
   │          Friction: "C'est un freelance, c'est risqué"
   │          Réducteur: process visible + "on vous rappelle sous 24h"
   │
   ├──→ [Réalisations] → [Durand & Fils case study]
   │       Job: projection (PME comme elle) + voir le booking intégré
   │       Friction: "C'est joli mais est-ce que ça marche pour mon secteur?"
   │       Réducteur: métriques du projet (+180% demandes) + contexte PME réaliste
   │
   ├──→ [À propos] ── Process détaillé + récit fondateur
   │       Job: mettre un visage sur le service, comprendre comment ça se passe
   │
   └──→ [Contact / Formulaire]  ── OU appel téléphonique direct
           Job: conversion
           Note: ce persona est plus susceptible d'appeler que de remplir le formulaire
```

**Parcours optimal (3-5 pages) :** Accueil → Durand & Fils → À propos → Contact (ou appel)
**Temps estimé :** 5-8 minutes (lit plus, a besoin de plus de réassurance)

---

### B.3 Persona 3 — Thomas, artisan premium

**Contexte d'entrée :** Instagram (découvre un projet visuellement) ou recommandation. Très visuel. Juge d'abord l'esthétique, puis l'offre.

```
ENTRÉE: Réalisations (Instagram → lien case study) ou Accueil
   │
   ▼
[Réalisations] → [Maison Levain case study]
   │                Job: coup de cœur visuel + voir le branding complet
   │                Friction: "C'est beau mais est-ce pour moi?"
   │                Réducteur: brief qui montre un artisan boulanger → projection directe
   │
   ├──→ [Autres case studies] ── Exploration visuelle
   │       Job: confirmer la polyvalence + la constance de qualité
   │
   ├──→ [Services] ── Focus "Branding complet" + "Site vitrine"
   │       Job: comprendre ce qu'il peut commander
   │
   └──→ [Contact / Formulaire]
           Conversion attendue ✓
           Note: ce persona valorise le contact humain — l'appel est souvent préféré
```

**Parcours optimal (3-4 pages) :** Maison Levain → Réalisations (explore) → Services → Contact
**Temps estimé :** 3-5 minutes (jugement visuel rapide)

---

### B.4 Matrice d'entrées × parcours

| Source de trafic | Landing page probable | Parcours type | Pages avant conversion |
|------------------|-----------------------|---------------|------------------------|
| SEO générique | Accueil | Accueil → Réalisations → Case study → Contact | 4 |
| SEO local | Accueil, Services | Accueil → Services → Contact | 3 |
| LinkedIn/Instagram | Réalisations, Case study | Case study → Réalisations → Accueil → Contact | 4 |
| Bouche-à-oreille | Accueil | Accueil → Réalisations → À propos → Contact | 4 |
| Recommandation directe | Contact | Contact (formulaire direct) | 1 |

---

## C. PAGE SPECS v1

---

### C.1 PAGE : ACCUEIL (/)

**Intent :** Première impression — convaincre en 15 secondes que Studio Kodo n'est pas un freelance comme les autres, puis guider vers les preuves ou la conversion.
**Audience cible :** Tous les personas (page d'entrée principale).
**Objectif de conversion :** Orienter vers Réalisations (preuve) ou Contact (conversion directe).
**KPIs :** Taux de scroll > 60%, clics vers Réalisations, clics CTA "Demander un devis".

**CTA primaire :** "Demander un devis" → /contact
**CTA secondaire :** "Voir les réalisations" → /realisations

**Message hierarchy :**
- **H1 :** Promesse principale — "Votre site. Sur-mesure. Livré en 3 jours." (ou alternative validée)
- **Sous-titre :** Sub-promise d'amplification — positionnement anti-agence, anti-template
- **3 preuves clés :** V1 en 3 jours (rapidité) · Interlocuteur unique (simplicité) · Designs singuliers (qualité)

#### Sections (ordre séquentiel)

| # | Section | Job | Contenu clé | Preuve requise | CTA |
|---|---------|-----|-------------|----------------|-----|
| 1 | **Hero** | Hook — capter en 5 secondes, établir le positionnement premium | H1 promesse + sous-titre + CTA primaire + CTA secondaire. Visuel : composition géométrique mid-century ou mockup de projet. Pas de slider, pas de vidéo auto-play. **🎬 Tier 3 : Spline 3D island** en arrière-plan ou côté droit du hero (lazy-loaded, WebGL detect + fallback image statique). **Word-split animation** sur le H1 (lettres/mots apparaissent séquentiellement, easing `power3.out`, durée ~800ms). **Magnetic button** sur le CTA "Demander un devis". | Le site lui-même (proof by demonstration) | "Demander un devis" + "Voir les réalisations" |
| 2 | **Bande de différenciation** | Ancrer les 3 piliers en un coup d'œil | 3 blocs iconographiques : "V1 en 3 jours" · "Interlocuteur unique" · "Sur-mesure, jamais de template". Format compact, scannable. **🎬 Tier 3 : Stagger reveal** (les 3 blocs apparaissent en cascade via ScrollTrigger, délai 150ms entre chaque, `from: {y: 30, opacity: 0}`). | Process documenté | — |
| 3 | **Réalisations (aperçu)** | Prouver par l'exemple — arrêter le scroll avec du visuel | Grid de 2-4 case studies (vignettes full-bleed, titre + catégorie + un chiffre clé). Hover : aperçu étendu. Lien vers chaque case study + lien "Toutes les réalisations". **🎬 Tier 3 : Parallax scroll** sur les vignettes (images à vitesse différente du texte, `speed: 0.3`). **Stagger reveal** sur la grille (vignettes en cascade). Hover : `scale(1.02)` + léger parallax interne via GSAP. | Case studies concept (Maison Levain, Flowtrack, Durand & Fils, Ōm Studio) | "Voir le projet →" par vignette + "Toutes les réalisations →" |
| 4 | **Services (aperçu)** | Clarifier l'offre — le visiteur comprend ce qu'il peut commander | 3 cartes : Site vitrine premium · Branding complet · Automatisation. Chaque carte : titre + 1 phrase + scope clé (3-4 bullets). Lien vers la page Services complète. **🎬 Tier 3 : Stagger reveal** sur les 3 cartes (ScrollTrigger, délai 200ms). Hover cartes : élévation + ombre dynamique via GSAP. | — | "En savoir plus →" par carte + "Voir tous les services →" |
| 5 | **Process** | Rassurer — montrer que c'est simple et maîtrisé | 3-4 étapes visuelles : Cadrage → Design → Développement → Live. Chaque étape : titre + 1 phrase + durée indicative. Accent sur le fait qu'un seul interlocuteur gère tout. **🎬 Tier 3 : ScrollTrigger storyboard** — chaque étape se révèle au scroll avec une ligne de progression animée entre les étapes (timeline horizontale ou verticale qui se "dessine" au scroll). Stagger reveal sur chaque étape. | Process documenté | — |
| 6 | **Chiffres clés** (optionnel au lancement) | Ancrer des résultats concrets | 3-4 métriques issues des case studies concept. Ex : "V1 livrée en 3 jours" · "+180% de demandes de devis" · "4 projets, 4 univers uniques". **🎬 Tier 3 : Counter animation** — les chiffres s'incrémentent au scroll (ScrollTrigger `onEnter`, GSAP `textContent` tween, durée ~1.5s, easing `power2.out`). | Métriques simulées (case studies concept) | — |
| 7 | **Section de conversion finale** | Convertir — dernier push avant le footer | Headline de clôture (angle "Why now" ou anti-objection). CTA primaire proéminent + numéro de téléphone. **🎬 Tier 3 : Word-split animation** sur la headline de clôture (même traitement que le H1 hero — crée un effet bookend). **Magnetic button** sur le CTA. | — | "Demander un devis" + numéro de téléphone |

**Objections traitées sur cette page :**
1. "C'est trop cher" → La qualité visible du site + "sur devis" (pas de sticker shock)
2. "Un freelance, c'est risqué" → Process en 3 étapes + "V1 en 3 jours" (vitesse = fiabilité)
3. "Je peux faire ça moi-même" → Gouffre visuel implicite entre le site Studio Kodo et un template

**SEO v0 :**
- **Title :** Studio Kodo — Sites vitrines premium, sur-mesure, livrés en 3 jours
- **Meta description :** Web designer freelance premium. Sites vitrines sur-mesure, branding, automatisation. Un seul interlocuteur, V1 en 3 jours. Demandez votre devis.
- **H1 :** Promesse principale
- **Liens internes :** → Services, Réalisations, À propos, Contact
- **Schema.org :** Organization, LocalBusiness

**Anti-template (NE PAS FAIRE) :**
- ❌ Pas de slider/carrousel auto-play
- ❌ Pas de "Bienvenue sur notre site"
- ❌ Pas de section "Nos valeurs" générique (qualité, innovation, proximité…)
- ❌ Pas de bandeau logos clients (aucun client réel — ne pas simuler de la social proof qui n'existe pas)
- ❌ Pas de section témoignages (pas de clients — prévoir un emplacement vide pour post-lancement)
- ❌ Pas de compteurs animés ("150+ projets livrés") — mensonger
- ❌ Pas de vidéo hero obligatoire (poids + LCP)

---

### C.2 PAGE : SERVICES (/services)

**Intent :** Détailler les 3 offres de manière claire et différenciée — le visiteur comprend exactement ce qu'il obtient, pour qui c'est fait, et comment passer à l'action.
**Audience cible :** Visiteurs en phase d'évaluation (comparent activement).
**Objectif de conversion :** Clic CTA "Demander un devis" (qualifié par l'offre consultée).
**KPIs :** Clics CTA par offre, temps sur page, taux de rebond.

**CTA primaire :** "Demander un devis" → /contact
**CTA secondaire :** "Voir les réalisations" → /realisations (pour les indécis qui veulent des preuves)

**Message hierarchy :**
- **H1 :** Titre orienté résultat — ex : "Trois services. Un seul interlocuteur."
- **Sous-titre :** Positionnement : tout est sur-mesure, rien n'est interchangeable
- **3 preuves :** Scope clair par offre + "Pour qui" + timeline

#### Sections (ordre séquentiel)

| # | Section | Job | Contenu clé | Preuve requise | CTA |
|---|---------|-----|-------------|----------------|-----|
| 1 | **Header de page** | Cadrer — le visiteur sait ce qu'il va trouver | H1 + sous-titre. Pas de hero visuel lourd. **🎬 Tier 3 : ScrollTrigger reveal** simple (fade-in du H1 + sous-titre au chargement). | — | — |
| 2 | **Offre 1 : Site vitrine premium** | Détailler l'offre principale | Titre + description (2-3 phrases) + scope inclus (6-8 bullets) + scope exclu (3-4 bullets) + "Pour qui c'est fait" (2-3 profils) + délai ("V1 en 3 jours ouvrés") + CTA. Format : section large, visuellement dominante. **🎬 Tier 3 : ScrollTrigger reveal** — la section entière se révèle au scroll. **Stagger** sur les bullets de scope. **Magnetic button** sur le CTA. | Case studies concernées (Flowtrack, Durand & Fils, Ōm Studio) | "Demander un devis pour votre site →" |
| 3 | **Offre 2 : Branding complet** | Présenter l'offre secondaire | Même structure : titre + description + scope + "Pour qui" + CTA. Positionnée comme l'amont naturel du site ("Votre identité avant votre site"). **🎬 Tier 3 : ScrollTrigger reveal** + stagger bullets + magnetic button CTA. | Case study Maison Levain (branding + site) | "Demander un devis branding →" |
| 4 | **Offre 3 : Automatisation** | Présenter le service complémentaire | Même structure. Positionnée comme l'extension du site ("Votre site travaille pour vous pendant que vous dormez"). Exemples concrets : formulaires intelligents, workflows CRM, emails automatiques. **🎬 Tier 3 : ScrollTrigger reveal** + stagger bullets + magnetic button CTA. | Case studies Durand & Fils (booking), Ōm Studio (espace membre) | "Demander un devis automatisation →" |
| 5 | **Tableau comparatif / Package** (optionnel) | Faciliter le choix | Comparaison visuelle des 3 offres OU présentation d'un "Pack complet" (branding + site + automatisation) avec avantage prix implicite. | — | "Demander un devis Pack complet →" |
| 6 | **"Pour qui / Pas pour qui"** | Qualifier — le bon prospect se reconnaît, le mauvais s'auto-élimine | 2 colonnes : "C'est pour vous si…" (4 items) / "Ce n'est pas pour vous si…" (4 items). Ton direct, pas arrogant. | — | — |
| 7 | **FAQ offres** | Réduire les objections liées au prix et au scope | 4-6 questions : "Combien ça coûte ?" · "Qu'est-ce qui est inclus exactement ?" · "Et si j'ai déjà un logo ?" · "Quelle est la différence avec une agence ?" · "Et après la livraison ?" · "V1 en 3 jours, vraiment ?" | Réponses aux objections (pack stratégie A.5) | — |
| 8 | **Section de conversion** | Convertir | Headline de clôture + CTA primaire + numéro de téléphone. **🎬 Tier 3 : Magnetic button** sur le CTA. ScrollTrigger reveal. | — | "Demander un devis" + téléphone |

**SEO v0 :**
- **Title :** Services — Site vitrine premium, branding & automatisation | Studio Kodo
- **Meta description :** Sites vitrines sur-mesure, branding complet, automatisation. Scope clair, V1 en 3 jours, un seul interlocuteur. Découvrez les offres Studio Kodo.
- **H1 :** Titre orienté résultat
- **H2 :** Un par offre (Site vitrine premium, Branding complet, Automatisation)
- **Liens internes :** → case studies pertinentes par offre, Contact, Accueil

**Anti-template :**
- ❌ Pas de pricing affiché (tout passe par le devis)
- ❌ Pas de "grille tarifaire" avec 3 colonnes Bronze/Silver/Gold
- ❌ Pas de features list interminable sans hiérarchie
- ❌ Pas de jargon technique (pas de "responsive", "SEO-friendly", "CMS" — traduire en bénéfice client)

---

### C.3 PAGE : RÉALISATIONS — INDEX (/realisations)

**Intent :** Galerie visuelle des 4 projets concept — le visiteur choisit celui qui lui ressemble le plus.
**Audience cible :** Tous les personas (chacun doit trouver "son" projet).
**Objectif de conversion :** Clic vers une case study individuelle.
**KPIs :** Clics vers case studies, temps sur page.

**CTA primaire :** Clic case study (exploration)
**CTA secondaire :** "Demander un devis" (pour les visiteurs déjà convaincus)

**Message hierarchy :**
- **H1 :** Ex : "Projets concept — la preuve par l'exemple"
- **Sous-titre :** Transparence : "4 projets concept pour démontrer notre savoir-faire. Chaque projet est un univers complet."

#### Sections (ordre séquentiel)

| # | Section | Job | Contenu clé | Preuve requise | CTA |
|---|---------|-----|-------------|----------------|-----|
| 1 | **Header de page** | Cadrer + établir la transparence | H1 + sous-titre. Mention que ce sont des "Projets concept" — pas de faux-semblant. | — | — |
| 2 | **Grille de projets** | Montrer la diversité + attirer vers le détail | 4 vignettes en grid (2×2 desktop, 1 colonne mobile). Chaque vignette : image hero full-bleed + nom du projet + catégorie (Artisan / Startup / PME / Bien-être) + services utilisés + un chiffre clé. Hover/tap : aperçu étendu ou léger effet de profondeur. Ordre recommandé : alterner les univers visuels pour montrer la polyvalence. **🎬 Tier 3 : Stagger reveal** (les 4 vignettes apparaissent en cascade au scroll, `stagger: 0.15`). Hover : `scale(1.03)` + parallax interne sur l'image GSAP (l'image bouge légèrement dans le cadre). | Les 4 case studies concept | "Voir le projet →" par vignette |
| 3 | **Section filtre** (optionnel) | Faciliter la navigation par besoin | Tags cliquables : "Site vitrine" · "Branding" · "Automatisation" · "Tous". Filtrage instantané (pas de rechargement page). **🎬 Tier 3 :** Transition de filtrage GSAP (layout animation fluide lors du filtre, pas de jump brutal). | — | — |
| 4 | **Section de conversion** | Convertir les visiteurs déjà convaincus | Headline : "Votre projet ne ressemble à aucun autre. Parlons-en." + CTA. **🎬 Tier 3 : Magnetic button** sur le CTA. | — | "Demander un devis" + téléphone |

**SEO v0 :**
- **Title :** Réalisations — Projets concept web design & branding | Studio Kodo
- **Meta description :** Découvrez 4 projets concept : branding, sites vitrines premium, automatisation. Du brief au résultat — la preuve par l'exemple.
- **H1 :** Titre galerie
- **Liens internes :** → chaque case study, Services, Contact

**Anti-template :**
- ❌ Pas de grid infini sans hiérarchie
- ❌ Pas de miniatures minuscules illisibles
- ❌ Pas de simple liste de liens sans visuel
- ❌ Pas de fausse attribution (ne jamais laisser croire que ce sont de vrais clients)

---

### C.4 PAGE : CASE STUDY (template × 4)

**Intent :** Deep-dive dans un projet — le visiteur se projette ("il peut faire ça pour moi").
**Audience cible :** Le persona correspondant au segment du projet.
**Objectif de conversion :** CTA en fin de case study → formulaire.
**KPIs :** Scroll > 50%, temps sur page > 2min, clics CTA.

**CTA primaire :** "Démarrer un projet similaire" → /contact (pré-rempli si possible avec le type de projet)
**CTA secondaire :** "Voir les autres réalisations" → /realisations

**Message hierarchy :**
- **H1 :** Nom du projet
- **Sous-titre :** Catégorie + services démontrés
- **3 preuves :** Brief réaliste + process documenté + résultat chiffré

#### Sections (ordre séquentiel — template identique pour les 4 projets)

| # | Section | Job | Contenu clé | Preuve requise |
|---|---------|-----|-------------|----------------|
| 1 | **Hero projet** | Impact visuel immédiat | Image hero full-bleed (mockup principal du projet). Nom + catégorie + badge "Projet concept". **🎬 Tier 3 : Word-split animation** sur le nom du projet (H1). Image hero avec léger **parallax vertical** (l'image se déplace au scroll initial, crée une profondeur). | Mockups haute-fidélité |
| 2 | **Brief** | Contextualiser — le visiteur comprend le "pourquoi" | Le problème du client fictif. Son secteur, sa cible, ses contraintes. Ce qu'il voulait résoudre. Format : court, narratif (5-8 lignes). **🎬 Tier 3 : ScrollTrigger reveal** (fade-in au scroll, `from: {y: 20, opacity: 0}`). | Brief fictif réaliste |
| 3 | **Solution & services** | Montrer ce qui a été fait | Liste des services appliqués. Scope : branding, pages, fonctionnalités clés. Approche différenciante (qu'est-ce qui rend ce projet unique). **🎬 Tier 3 : Stagger** sur les items de scope. | — |
| 4 | **Process & timeline** | Prouver la rapidité + la méthode | Frise chronologique : étapes du projet avec durées. Ex : Jour 1 cadrage → Jour 2 design → Jour 3 dev → Jour 4 live. Rend le "V1 en 3 jours" tangible. **🎬 Tier 3 : ScrollTrigger storyboard** — la frise se "dessine" au scroll (ligne de progression animée entre les étapes, chaque étape se révèle quand la ligne l'atteint). Point de scroll pin léger possible (la frise reste visible pendant que les étapes défilent). | Timeline documenté |
| 5 | **Galerie visuelle** | Preuve par l'objet — le travail parle | 4-8 visuels : maquettes desktop, mobile, détails UI, mockups en contexte (device mockups). Format éditorial, full-bleed, whitespace généreux. Pas de grille serrée. **🎬 Tier 3 : Parallax scroll** sur les visuels (chaque image a un `speed` légèrement différent, crée une profondeur éditoriale au scroll). ScrollTrigger reveal en cascade. | Maquettes haute-fidélité + device mockups |
| 6 | **Résultats** | Ancrer l'impact dans des chiffres | 3-4 métriques simulées réalistes. Format : gros chiffres + légende. Ex : "+180% de demandes de devis" · "Temps de chargement : 0.8s" · "Score Lighthouse : 98/100". **🎬 Tier 3 : Counter animation** — les chiffres s'incrémentent au scroll (même traitement qu'Accueil §6). | Métriques simulées réalistes |
| 7 | **Réflexion / apprentissages** (optionnel) | Humaniser + montrer l'expertise | 2-3 phrases sur ce qui a été appris, ce qui a été difficile, ce qui est transférable. Montre la profondeur de réflexion. | — |
| 8 | **CTA de conversion** | Convertir — le visiteur est au pic d'engagement | "Vous avez un projet similaire ? Parlons-en." + CTA primaire. **🎬 Tier 3 : Magnetic button** sur le CTA (pic d'engagement = le moment où le magnetic attire le plus). | — |
| 9 | **Navigation case studies** | Garder le visiteur dans les preuves | Liens vers les autres case studies (prev/next ou grille compacte). | — |

#### Déclinaison par projet

| Projet | Segment ciblé | Services montrés | Chiffre clé à mettre en avant |
|--------|--------------|------------------|-------------------------------|
| **Maison Levain** | Artisan premium | Branding + site vitrine | Identité complète en X jours |
| **Flowtrack** | Startup (ICP) | Landing page + dashboard UI | Taux de conversion landing |
| **Durand & Fils** | PME locale | Site vitrine + booking | +X% demandes de devis |
| **Ōm Studio** | Bien-être / PME | Site + réservation + communauté | Réservations en ligne / mois |

**SEO v0 (par case study) :**
- **Title :** [Nom du projet] — [Type] | Réalisations Studio Kodo
- **Meta description :** Découvrez le projet [Nom] : [services]. Du brief au résultat en [X] jours — projet concept Studio Kodo.
- **H1 :** Nom du projet
- **H2 :** Brief · Solution · Process · Résultats
- **Liens internes :** → autres case studies, Services, Contact

**Anti-template :**
- ❌ Pas de simple galerie d'images sans contexte
- ❌ Pas de texte fleuve non structuré
- ❌ Pas de métriques irréalistes (+500% conversion en 1 semaine)
- ❌ Pas d'omission du label "Projet concept"

---

### C.5 PAGE : À PROPOS (/a-propos)

**Intent :** Crédibiliser le fondateur et la méthode — mettre un visage et un process sur le service.
**Audience cible :** Visiteurs en phase de validation (ont vu l'offre, veulent valider la personne).
**Objectif de conversion :** CTA vers contact après réassurance.
**KPIs :** Temps sur page, clics CTA, scroll > 70%.

**CTA primaire :** "Demander un devis" → /contact
**CTA secondaire :** "Voir les réalisations" → /realisations

**Message hierarchy :**
- **H1 :** Ex : "Un designer. Un process. Votre site." (pas "À propos de nous")
- **Sous-titre :** Positionnement en une phrase
- **3 preuves :** Récit fondateur (crédibilité) · Process en 3-4 étapes (méthode) · Réactivité (V1 en 3 jours)

#### Sections (ordre séquentiel)

| # | Section | Job | Contenu clé | Preuve requise | CTA |
|---|---------|-----|-------------|----------------|-----|
| 1 | **Header de page** | Cadrer — éviter le "À propos" générique | H1 orienté résultat + sous-titre. **🎬 Tier 3 : Word-split animation** sur le H1 (cohérence avec Accueil). | — | — |
| 2 | **Récit fondateur** | Créer la connexion humaine + crédibiliser | Qui est le fondateur. Son parcours pertinent (pas un CV). Pourquoi cette activité (frustration face au générique + conviction). Ton : personnel, direct, pas pompeux. Photo du fondateur (à produire). Format : texte + photo côte à côte, layout asymétrique mid-century. **🎬 Tier 3 : Parallax scroll** — la photo et le texte se déplacent à des vitesses légèrement différentes (crée la profondeur mid-century). ScrollTrigger reveal sur le bloc texte. | Récit fondateur (éléments disponibles) | — |
| 3 | **Philosophie / convictions** | Différencier — ce en quoi Studio Kodo croit | 3-4 convictions formulées comme des prises de position. Ex : "Un bon site n'est pas joli. Il est efficace." · "Un seul interlocuteur, c'est moins de réunions et plus de résultat." · "V1 en 3 jours, c'est une méthode, pas un miracle." **🎬 Tier 3 : Stagger reveal** — chaque conviction apparaît au scroll avec un léger décalage. | — | — |
| 4 | **Process détaillé** | Rassurer — le visiteur sait exactement ce qui va se passer | 3-4 étapes visuelles avec détails : Cadrage (durée, ce qui se passe, ce que le client fait) → Design (idem) → Développement → Live. Accent sur : un seul interlocuteur à chaque étape. **🎬 Tier 3 : ScrollTrigger storyboard** — même traitement que Accueil §5 (ligne de progression animée, étapes révélées au scroll). Version plus détaillée ici (chaque étape peut avoir un mini-pin). | Process documenté | — |
| 5 | **Section de conversion** | Convertir après la réassurance | "Prêt à démarrer ? Décrivez votre projet." + CTA primaire + téléphone. **🎬 Tier 3 : Magnetic button** sur le CTA. | — | "Demander un devis" + téléphone |

**SEO v0 :**
- **Title :** À propos — Studio Kodo, web designer freelance premium
- **Meta description :** Découvrez Studio Kodo : un designer freelance, un process clair, des sites vitrines premium livrés en 3 jours. Du branding au code.
- **H1 :** Titre orienté résultat
- **H2 :** Récit · Convictions · Process
- **Liens internes :** → Services, Réalisations, Contact

**Anti-template :**
- ❌ Pas de "Notre mission, notre vision, nos valeurs" (triptyque générique)
- ❌ Pas de timeline biographique (CV linéaire sans intérêt)
- ❌ Pas de "Notre équipe" (freelance solo — ne pas mentir)
- ❌ Pas de photo stock pour remplacer la vraie photo (mieux vaut une illustration/avatar que du faux)
- ❌ Pas de certifications/logos sans preuve réelle

---

### C.6 PAGE : CONTACT (/contact)

**Intent :** Convertir — le visiteur a suffisamment de contexte et passe à l'action.
**Audience cible :** Visiteurs à haute intention (ont vu au moins 2-3 pages avant).
**Objectif de conversion :** Soumission du formulaire multi-étapes OU appel téléphonique.
**KPIs :** Taux de complétion formulaire > 60%, nombre de soumissions, nombre d'appels.

**CTA primaire :** Soumission formulaire (étape 5)
**CTA secondaire :** Appel téléphonique

**Message hierarchy :**
- **H1 :** Ex : "Parlons de votre projet" (pas "Contactez-nous")
- **Sous-titre :** Promesse de rappel — "Décrivez votre projet en 1min30. On vous rappelle sous 24h."
- **Réassurance :** "Pas d'engagement, pas de spam. Juste une conversation."

#### Sections (ordre séquentiel)

| # | Section | Job | Contenu clé | Preuve requise | CTA |
|---|---------|-----|-------------|----------------|-----|
| 1 | **Header de page** | Cadrer + promettre | H1 + sous-titre avec promesse de rappel. Ton accueillant, pas transactionnel. **🎬 Tier 3 :** Reveal simple au chargement. | — | — |
| 2 | **Formulaire multi-étapes** | Convertir — l'élément central de la page | 5 étapes avec barre de progression visible. Layout : formulaire centré, large, whitespace généreux. Pas de sidebar distrayante. **🎬 Tier 3 : Transitions entre étapes** animées via GSAP (slide horizontal fluide entre les steps, easing `power2.inOut`, durée ~400ms). **Barre de progression** animée (la barre se remplit avec un tween GSAP fluide). **Micro-interactions** : feedback visuel au clic sur les boutons de sélection (étapes 1, 4 — léger scale bounce). CTA final "Envoyer ma demande" = **magnetic button**. | — | Voir détail ci-dessous |
| 3 | **Réassurance latérale** (visible pendant le formulaire) | Réduire la friction pendant le remplissage | 3-4 éléments compacts : "Rappel sous 24h" · "Pas d'engagement" · "Un seul interlocuteur" · Numéro de téléphone. Position : colonne latérale (desktop) ou section collapsible (mobile). | — | Numéro de téléphone |
| 4 | **Confirmation post-soumission** | Rassurer + orienter | Message : "Merci [prénom] ! On vous rappelle sous 24h." + Suggestion : "En attendant, découvrez nos réalisations" avec liens. Pas de redirection automatique — l'utilisateur choisit. **🎬 Tier 3 :** Animation de confirmation (checkmark animé via GSAP, léger confetti ou morphing d'icône — sobre, pas de surcharge). | — | Liens vers Réalisations |

#### Détail du formulaire multi-étapes

| Étape | Titre affiché | Inputs | UX notes |
|-------|---------------|--------|----------|
| **1** | "Quel type de projet ?" | 4 boutons de sélection visuelle : Site vitrine · Branding · Automatisation · Pack complet. Un seul choix possible. | Micro-commitment : l'utilisateur s'engage avec un clic, pas un champ texte. **🎬 Tier 3 :** Boutons avec scale bounce au clic (GSAP `from: {scale: 0.95}`, `duration: 0.2`). Transition slide vers étape 2. |
| **2** | "Votre activité" | Champ texte court : "Votre secteur d'activité" + textarea court : "Décrivez votre activité en quelques mots" (placeholder utile, pas "Tapez ici"). | Les champs sont pré-labelés avec des exemples contextuels selon le choix de l'étape 1. |
| **3** | "Vos besoins" | Checkboxes groupées : nombre de pages (1-3 / 4-7 / 8+) + fonctionnalités (formulaire contact · booking · espace membre · blog · e-commerce simple · autre). Choix multiples possibles. | Pas de champs obligatoires sur les fonctionnalités (certains visiteurs ne savent pas encore). |
| **4** | "Votre timing" | 3 boutons de sélection : "Urgent (< 2 semaines)" · "Normal (2-4 semaines)" · "Flexible". | Sélection visuelle type cards. Pas de calendrier (trop de friction). |
| **5** | "Comment vous joindre ?" | Nom (obligatoire) · Email (obligatoire) · Téléphone (obligatoire — le canal est l'appel) · Textarea optionnel : "Autre chose à nous dire ?". | CTA final : "Envoyer ma demande" (pas "Soumettre" — trop froid). |

**Barre de progression :** Visible en permanence. Format : steps numérotés (1/5, 2/5…) ou barre visuelle. Le visiteur sait toujours où il en est.

**Bouton retour :** Présent à chaque étape (sauf la 1). Le visiteur peut revenir en arrière sans perdre ses données.

**Validation :** En temps réel, inline, non-bloquante (messages sous le champ, pas d'alert()).

**Gestion des erreurs :** Messages spécifiques et utiles ("Ce champ est requis" → "Votre email nous permettra de vous envoyer le devis").

**SEO v0 :**
- **Title :** Contact — Demander un devis | Studio Kodo
- **Meta description :** Décrivez votre projet en 1min30. On vous rappelle sous 24h. Formulaire simple, pas d'engagement. Studio Kodo, web designer freelance premium.
- **H1 :** Titre orienté action
- **Liens internes :** → Réalisations (post-soumission), Services

**Anti-template :**
- ❌ Pas de formulaire monolithique avec 15 champs visibles d'un coup
- ❌ Pas de CAPTCHA visuel invasif (utiliser honeypot + rate limiting)
- ❌ Pas de carte Google Maps (inutile pour un freelance remote)
- ❌ Pas de "Nos bureaux" (freelance, pas de locaux)
- ❌ Pas de champs "Objet" ou "Message" génériques (les étapes structurent la demande)
- ❌ Pas de redirection automatique après soumission (l'utilisateur doit lire la confirmation)

---

### C.7 PAGE : MENTIONS LÉGALES (/mentions-legales)

**Intent :** Obligation légale — conformité française.
**Audience cible :** Visiteurs qui vérifient (rares), robots juridiques.
**Objectif de conversion :** Aucun.

#### Sections

| # | Section | Contenu |
|---|---------|---------|
| 1 | **Éditeur du site** | Nom, statut juridique, adresse, numéro SIRET, contact |
| 2 | **Directeur de publication** | Nom du fondateur |
| 3 | **Hébergeur** | Nom, adresse, contact de l'hébergeur (Vercel/Netlify) |
| 4 | **Propriété intellectuelle** | Clause standard |
| 5 | **Crédits** | Typographies, icônes, outils utilisés |
| 6 | **Lien vers politique de confidentialité** | Lien interne |

**SEO v0 :**
- **Title :** Mentions légales | Studio Kodo
- **Meta :** noindex (optionnel)

---

### C.8 PAGE : POLITIQUE DE CONFIDENTIALITÉ (/politique-confidentialite)

**Intent :** Conformité RGPD — transparence sur le traitement des données.
**Audience cible :** Visiteurs soucieux de leur vie privée, obligation légale.
**Objectif de conversion :** Aucun.

#### Sections

| # | Section | Contenu |
|---|---------|---------|
| 1 | **Responsable du traitement** | Identité, contact, DPO si applicable |
| 2 | **Données collectées** | Formulaire de contact : nom, email, téléphone, données de projet. Analytics : données anonymisées (Plausible/Umami). |
| 3 | **Finalités du traitement** | Réponse aux demandes de devis, suivi commercial, amélioration du site |
| 4 | **Base légale** | Consentement (formulaire), intérêt légitime (analytics) |
| 5 | **Durée de conservation** | Données formulaire : 3 ans max. Analytics : anonymisées. |
| 6 | **Destinataires** | Aucun tiers (pas de revente de données). Sous-traitants techniques : hébergeur, analytics. |
| 7 | **Droits des utilisateurs** | Accès, rectification, suppression, opposition, portabilité. Contact pour exercer. |
| 8 | **Cookies** | Détail des cookies utilisés. Bandeau de consentement si analytics non-exempt. |
| 9 | **Modifications** | Date de dernière mise à jour. |

**SEO v0 :**
- **Title :** Politique de confidentialité | Studio Kodo
- **Meta :** noindex (optionnel)

---

## D. "READY FOR COPY" CHECKLIST

### D.1 Pages et sections verrouillées

| Page | Nombre de sections | Statut |
|------|--------------------|--------|
| Accueil | 7 sections | ✅ Verrouillé |
| Services | 8 sections | ✅ Verrouillé |
| Réalisations (index) | 4 sections | ✅ Verrouillé |
| Case study (template ×4) | 9 sections | ✅ Verrouillé |
| À propos | 5 sections | ✅ Verrouillé |
| Contact | 4 sections + formulaire 5 étapes | ✅ Verrouillé |
| Mentions légales | 6 sections | ✅ Verrouillé |
| Politique de confidentialité | 9 sections | ✅ Verrouillé |

### D.2 Preuves identifiées et assignées

| Preuve | Statut | Pages où elle apparaît |
|--------|--------|------------------------|
| Site Studio Kodo (proof by demonstration) | À produire (pipeline) | Toutes — implicite |
| Case study Maison Levain | À produire | Accueil §3, Réalisations, Case study dédiée, Services §3 |
| Case study Flowtrack | À produire | Accueil §3, Réalisations, Case study dédiée, Services §2 |
| Case study Durand & Fils | À produire | Accueil §3, Réalisations, Case study dédiée, Services §2, §4 |
| Case study Ōm Studio | À produire | Accueil §3, Réalisations, Case study dédiée, Services §2, §4 |
| Process documenté (3-4 étapes) | Disponible — à formaliser | Accueil §5, À propos §4, chaque case study §4 |
| Timeline documenté (dates) | À produire (via case studies) | Chaque case study §4 |
| Métriques simulées réalistes | À produire | Accueil §6, chaque case study §6 |
| Récit fondateur | Éléments disponibles — à rédiger | À propos §2 |
| Garantie "Satisfait ou on itère" | À définir | Services §7 (FAQ), Contact §3 (réassurance) |

### D.3 Objections couvertes

| # | Objection | Traitée où |
|---|-----------|------------|
| 1 | "C'est trop cher" | Services (FAQ), Accueil (proof by quality) |
| 2 | "Un freelance, c'est risqué" | Accueil (process), À propos (process détaillé), Contact (réassurance) |
| 3 | "Je peux faire ça moi-même" | Accueil (démonstration implicite), Réalisations (gouffre visuel) |
| 4 | "Je n'ai pas le temps" | Accueil (process 3 étapes), À propos (process), Services (FAQ) |
| 5 | "Les délais, j'y crois pas" | Case studies (timeline daté), Accueil (différenciation), Services (FAQ) |

### D.4 CTA et friction validés

| CTA | Label | Placement | Friction |
|-----|-------|-----------|----------|
| Primaire | "Demander un devis" | Header (toutes pages), Accueil §1+§7, Services §2-4+§8, Réalisations §4, Case study §8, À propos §5, Contact §2 | Moyenne (5 étapes) — compensée par guidage |
| Secondaire | Numéro de téléphone (cliquable) | Header (toutes pages), Contact §3, Accueil §7, Services §8, À propos §5 | Basse |
| Tertiaire | "Voir les réalisations" | Accueil §1, Services (CTA secondaire), À propos (CTA secondaire) | Très basse (exploration) |

### D.5 Éléments à fournir au copywriter

1. Ce document (page specs complètes)
2. Le pack stratégie (message architecture B, lexique B.5, objections A.5)
3. Le proof inventory (section C du pack stratégie)
4. La conversion map (section D du pack stratégie)

### D.6 Éléments à fournir à l'UI designer

1. Ce document (structure des pages, sections, hiérarchie)
2. Le pack stratégie (direction artistique, palette, typo — sections 6 du PRD)
3. La navigation (header/footer structure)
4. Le formulaire multi-étapes (5 étapes, inputs, UX notes)
5. Les anti-templates par page (ce qu'il ne faut PAS faire)
6. **Les annotations 🎬 Tier 3** par section (emplacements Spline 3D, parallax, word-split, magnetic buttons, ScrollTrigger storyboard, stagger reveals)
7. **La section 0bis** (motion strategy UX — principes, inventaire des effets, règles a11y)

---

## PACKAGE FOR COPY/UI

**Fichiers à transmettre aux agents suivants :**

### → Agent 3 (Copywriting)
- `UX-Architecture-v1-Studio-Kodo.md` (ce fichier) : structure des pages section par section, message hierarchy, job de chaque section, preuves requises, SEO v0
- `pack-strategie-Studio-Kodo.md` : message architecture, lexique, objections, ton, mots à utiliser/éviter
- `PRD-Studio-Kodo.md` : sections 7 (contenu & assets), 3 (personas), 4 (différenciation)

### → Agent 4 (UI/Design System)
- `UX-Architecture-v1-Studio-Kodo.md` (ce fichier) : sitemap, navigation, sections par page, anti-templates, formulaire multi-étapes UX
- `pack-strategie-Studio-Kodo.md` : conversion map, tracking plan
- `PRD-Studio-Kodo.md` : sections 6 (branding), 11 (inspirations), 9.4 (performance)

---

*Fin de l'architecture UX v1.1. Ce document est l'entrée des agents 3 (Copy) et 4 (UI). Les annotations 🎬 Tier 3 sont destinées principalement à l'Agent 4 pour le design brief et la motion strategy.*
