# UX ARCHITECTURE v1 — SITE TEST
**Agent :** vitrine-ux-architecture
**Date :** 2026-03-25
**Statut :** v1 — à valider avant transmission copy/design

---

## CONTEXTE (5 LIGNES)

**Objectif :** Déclencher 10–20 leads/mois qualifiés + 4–8 RDV découverte — le site est le premier commercial de l'agence.
**Audience :** Dirigeant PME 2–50 pers, services B2B/premium, conscience **intermédiaire-élevée** — sait qu'il a un problème, compare des solutions, a peur de se tromper de prestataire.
**Promesse :** "Votre site actuel vous coûte des clients. On change ça." — différenciateur : business-first, périmètre clair, IA concrète, vision hybride complète.
**CTA primaire :** Réserver un appel découverte 30 min — gratuit, sans engagement — via calendrier ou formulaire 3 champs max.
**Contrainte preuves :** 0 chiffre disponible aujourd'hui. Stratégie = crédibilité par le **process documenté** + qualité perçue + FAQ objections.

---

## A. ARCHITECTURE DE SITE (SITEMAP + NAV)

### Sitemap v1

```
SITE
├── / Home                          → Filtre + promesse + crédibilité + CTA
├── /offre                          → Périmètre, process, pour qui / pas pour qui
├── /realisations                   → Portfolio (3–5 cas) + preuve de capacité
├── /contact                        → Prise de RDV découverte (page dédiée)
├── /a-propos         [optionnel]   → Qui on est, pourquoi cette approche
│
└── SUPPORT LÉGAL
    ├── /mentions-legales
    ├── /politique-confidentialite
    └── /[page-cookies si tracking actif]
```

**Règle de profondeur :** 1 niveau. Pas de sous-pages dans la v1. Chaque URL doit être justifiable par un objectif de conversion ou une obligation légale.

**Pages différées (post-lancement) :**
- `/blog` — uniquement si production de contenu réelle planifiée
- `/ressources` — si lead magnet constitué
- Pages sectorielles SEO — si volume de recherche justifié

---

### Rôle de chaque page

| Page | Rôle principal | KPI |
|------|---------------|-----|
| **Home** | Filtrer + convaincre le visiteur qualifié + déclencher CTA | Taux scroll 75% / clic CTA primaire |
| **Offre** | Clarifier le périmètre + lever les objections sur le contenu | Temps sur page >90s / clic CTA |
| **Réalisations** | Preuves de capacité — crédibilité visuelle concrète | Clic sur cas / clic CTA depuis page |
| **Contact / RDV** | Convertir — frictionner le moins possible | Taux soumission formulaire / réservation calendrier |
| **À propos** *(opt.)* | Humaniser + valider la légitimité de l'approche | Temps sur page / rebond vers offre ou contact |

---

### Principes de navigation

**Ce qu'on montre (nav principale) :**
- Logo (lien vers Home)
- Offre
- Réalisations
- CTA sticky : "Réserver un appel" (bouton plein, toujours visible)

**Ce qu'on cache ou reporte :**
- À propos : accessible mais pas mis en avant en navigation principale v1 (optionnel — à arbitrer)
- Blog / Ressources : hors nav jusqu'à l'existence de contenu
- Pricing : absent (pricing non affiché — CTA diagnostic)

**Règles navigation :**
- Header **sticky** sur scroll — le CTA ne disparaît jamais
- Max 4 liens + 1 CTA en navigation — au-delà, dispersion de l'attention
- Mobile : hamburger avec CTA prioritaire en premier
- Pas de mega-menu, pas de dropdown — structure plate

**Footer :**
- Liens nav secondaires (Offre, Réalisations, Contact, À propos)
- CTA répété : "Réserver un appel découverte"
- Liens légaux : Mentions légales / Politique de confidentialité / Cookies
- Copyright + nom/marque

---

## B. PARCOURS DE DÉCISION

### Parcours principal — ICP "compare des solutions"

```
Entrée : Home (recherche organique / bouche-à-oreille / LinkedIn)
  │
  ↓
[Hero] — Promesse percute, se reconnaît dans le problème
  │
  ↓
[Problem echo] — "C'est exactement mon cas"
  │
  ↓
[Process] — "Ils ont une méthode, pas du flou"
  │
  ↓
[Offre / Piliers] — "Je comprends ce qu'ils font et ce que ça inclut"
  │
  ↓
[Preuves / Réalisations] — "Ils l'ont déjà fait" (ou section process si 0 portfolio)
  │
  ↓
[FAQ objections] — "Mes doutes sont levés"
  │
  ↓
[CTA final] — "Je réserve un appel découverte"
  └──→ Page Contact / Calendly
```

**Durée cible :** L'ICP doit pouvoir prendre sa décision en une seule page (Home). Les pages internes sont des **portes d'entrée alternatives** ou des **approfondissements** — pas des étapes obligatoires.

---

### Parcours alternatifs

**Parcours B — Entrée directe page Offre** *(LinkedIn, recommandation avec lien direct)*
```
/offre → Comprend le périmètre → FAQ → CTA → Contact
```
La page Offre doit être **autonome** : promesse + process + CTA sans avoir lu la Home.

**Parcours C — Entrée directe page Réalisations** *(recherche SEO, partage d'un cas)*
```
/realisations → Découvre un cas → CTA contextuel → Contact
```
Chaque cas doit contenir un CTA intégré ("Votre projet ressemble à ça ? Parlons-en.")

**Parcours D — Visiteur "froid mais curieux"** *(début du tunnel, pas encore décidé)*
```
Home → Scroll partiel → Sortie
  → Retargeting (si tracking actif) ou newsletter/ressource secondaire
```
CTA secondaire activer pour ce segment : "Télécharger le guide" ou "Demander un audit"

**Parcours E — Referral fort** *(recommandation directe)*
```
Arrivée directe /contact → Formulaire → RDV
```
La page Contact doit être rassurante et rapide — pas de friction inutile.

---

### Points de friction et traitement

| Friction | Niveau | Traitement |
|----------|--------|------------|
| "Est-ce que ça marche vraiment ?" | Haute | Section process documenté + mini-cas. Si 0 portfolio : démo d'un flux ou avant/après anonymisé |
| "Je ne sais pas si c'est pour moi" | Haute | Section "Pour qui / Pas pour qui" explicite sur Home ET page Offre |
| "J'ai peur que ce soit trop cher" | Haute | Ne pas cacher l'objection : la traiter dans la FAQ ("calculons le ROI ensemble") |
| "Je ne veux pas être relancé" | Moyenne | Copie CTA : "sans engagement", "30 min", "on évalue ensemble si on peut vous aider" |
| "Formulaire = perte de temps" | Moyenne | Max 3 champs. Option calendrier direct = 0 formulaire |
| "Qui sont ces gens ?" | Moyenne | Éléments de crédibilité visibles dès la Home (nom, photo si applicable, approche) |
| "Pas le temps maintenant" | Basse | CTA secondaire accessible (ressource, audit asynchrone) |

---

## C. PAGE SPECS v1

---

### PAGE 1 — HOME (`/`)

**Intention de page :** Filtrer les visiteurs qualifiés, résonner avec leur problème, prouver la légitimité de l'approche, déclencher une prise de RDV.
**Audience visée :** Dirigeant PME, conscience intermédiaire-élevée, arrivée diverse (SEO, réseau, LinkedIn).
**Objectif de conversion :** Clic sur CTA primaire → prise de RDV.
**KPI :** Scroll 75%+ / `cta_primary_click` / `form_rdv_submitted`.

**CTA primaire :** "Réserver mon appel découverte" — ancre vers section Contact ou lien Calendly
**CTA secondaire :** "Demander un audit de l'existant" — formulaire 2–3 champs (email + URL site)

---

**Message hierarchy :**

| Niveau | Contenu |
|--------|---------|
| **H1** | Promesse principale : "Votre site actuel vous coûte des clients. On change ça." |
| **Subhead** | Sous-promesse : [problème → solution → différenciateur en 1–2 phrases] — placeholder : "On conçoit des sites qui génèrent des leads qualifiés — avec une méthode, un périmètre clair, et l'IA quand c'est utile." |
| **Proof signal 1** | Process documenté / nombre d'étapes / première signal de méthode |
| **Proof signal 2** | "Pour qui c'est" — qualification positive de l'ICP |
| **Proof signal 3** | Levée d'objection principale (preuve de non-gadget, non-générique) |

---

**Sections — ordre et job :**

| # | Section | Job | Preuve requise |
|---|---------|-----|----------------|
| 0 | **Nav sticky** | Accès CTA permanent | — |
| 1 | **Hero** | Accrocher l'ICP / exclure les non-ICP / premier CTA | H1 + subhead + CTA primaire + signal social proof minimal |
| 2 | **Problem echo** | Miroir du problème ICP — "vous reconnaissez-vous ?" | Liste 4–5 frustrations verbatim ICP (issues du brief) |
| 3 | **Solution + différenciation** | Annoncer l'approche differentée, les 3 piliers | Description courte des 3 piliers (site + auto + IA) |
| 4 | **Le process** | Remplacer les preuves chiffrées par la crédibilité de méthode | **Process en 5 étapes nommées + livrables** [PRIORITÉ PROOF — à fournir] |
| 5 | **Pour qui / Pas pour qui** | Qualification active — réduire les leads non qualifiés | Liste inclus/exclus issue du brief |
| 6 | **Réalisations (aperçu)** | Preuve de capacité — crédibilité visuelle | 3 cas mini (anonymisés si nécessaire) OU placeholder explicite |
| 7 | **FAQ objections** | Lever les freins avant le CTA final | 5–7 objections issues du brief stratégique |
| 8 | **CTA final** | Déclencher la conversion | Formulaire 3 champs OU embed Calendly + texte réassurance |
| 9 | **Footer** | Navigation secondaire + légal | Liens légaux obligatoires |

**Règle de la section :** toute section sans job défini est supprimée. Pas de section "nos valeurs", "notre vision", "notre équipe" sauf si chaque élément prouve la différenciation.

---

**Preuves requises par section (référence Proof Inventory) :**

| Section | Preuve référencée | Statut |
|---------|------------------|--------|
| Hero | Signal social proof minimal (logo, chiffre ou formule qualitative) | À définir |
| Process | Process en 5 étapes nommées avec livrables | **Priorité 1 — À fournir** |
| Réalisations (aperçu) | 3 mini-cas (anonymisés acceptés) | **Priorité 1 — À constituer** |
| FAQ | 9 objections + réponses | Disponible (brief stratégique) |
| CTA final | Aucune preuve requise — réassurance copie | — |

---

**FAQ objections à couvrir (Home) — 6 prioritaires :**
1. "On a déjà un site, pourquoi le refaire ?"
2. "Est-ce que ça va vraiment nous apporter des clients ?"
3. "J'ai peur que ce soit beau mais inutile."
4. "On n'a pas le temps de gérer un gros projet."
5. "J'ai peur que ce soit trop cher."
6. "L'IA, je ne veux pas d'un gadget."

---

**SEO structurel v0 — Home :**

| Élément | Contenu recommandé |
|---------|-------------------|
| **Title** | `[Nom agence] — Site vitrine conversion, automatisation et IA pour PME` |
| **Meta description** | `Agence spécialisée en sites vitrines qui génèrent des leads qualifiés. Design premium, stratégie de conversion, automatisation et IA intégrée. Réservez un appel découverte.` |
| **H1** | Promesse principale (une seule occurrence) |
| **H2** | Titres de chaque section majeure (Problem / Offre / Process / Réalisations / FAQ) |
| **H3** | Sous-sections (étapes du process, questions FAQ) |
| **Liens internes** | → /offre (section offre), → /realisations (section réalisations), → /contact (CTA) |
| **Priorité SEO** | Mots-clés cibles : "agence site vitrine PME", "site web conversion leads", "automatisation PME" |

---

**Anti-template — ce qu'on ne fait PAS sur la Home :**
- Section "Qui sommes-nous" en position 2 ou 3 (l'ICP se fiche de qui vous êtes avant de savoir si vous pouvez l'aider)
- Slider/carousel d'images générique sans légende ni contexte
- Section "Nos valeurs" sans preuve (intégrité, passion, réactivité = valeurs attendues = sans différenciation)
- Liste de technologies ou logos d'outils sans explication de la valeur client
- Compteurs de style "X clients satisfaits" si chiffres non vérifiables ou faibles
- Formulaire avec plus de 4 champs sur la Home
- Navigation avec plus de 5 liens + CTA

---

### PAGE 2 — OFFRE (`/offre`)

**Intention de page :** Détailler le périmètre de l'offre, documenter le process, qualifier activement (pour qui / pas pour qui), lever les objections spécifiques à la décision d'achat.
**Audience visée :** Visiteur ayant un intérêt confirmé — vient de la Home ou d'un lien direct (LinkedIn, referral).
**Objectif de conversion :** Déclencher une prise de RDV après avoir compris et accepté le cadre.
**KPI :** Temps sur page >120s / `cta_primary_click` depuis /offre.

**CTA primaire :** "Réserver mon appel découverte"
**CTA secondaire :** "Demander un audit de mon site actuel"

---

**Message hierarchy :**

| Niveau | Contenu |
|--------|---------|
| **H1** | Ce que contient l'offre (titre de page orienté bénéfice) — placeholder : "Un accompagnement complet, un périmètre clair, des résultats mesurables" |
| **Subhead** | Rappel de la promesse + différenciateur périmètre : "Pas de prestataire flou. Ce qu'on fait, ce qu'on ne fait pas — et comment on le fait." |
| **Proof signal 1** | Process propriétaire détaillé |
| **Proof signal 2** | Périmètre inclus/exclus exhaustif |
| **Proof signal 3** | Garantie ou engagement explicite (à définir) |

---

**Sections — ordre et job :**

| # | Section | Job | Preuve requise |
|---|---------|-----|----------------|
| 1 | **Hero offre** | Promesse de la page + rappel de différenciation + CTA haut de page | Subhead fort |
| 2 | **Les 3 piliers** | Clarifier les 3 dimensions de l'offre (Site/Image / Automatisation / IA) | Description détaillée par pilier + ce qui est inclus |
| 3 | **Ce qui est inclus / exclus** | Cadrage explicite — réduit l'ambiguïté et qualifie | Liste claire inclus vs exclus (issue du brief) |
| 4 | **Le process en détail** | Prouver la méthode + rassurer sur la charge de travail client | **Process 5 étapes détaillées avec : livrables, nombre de points d'étape, heures client estimées** [À FOURNIR] |
| 5 | **Pour qui c'est / pas pour qui** | Qualification active — réduire friction post-RDV | Liste tirée du brief stratégique |
| 6 | **FAQ objections** | Lever les derniers freins avant décision | 6–9 objections avec réponses (brief disponible) |
| 7 | **CTA final** | Conversion avec contexte rassurant | Texte : "En 30 min, on évalue ensemble si on peut vous aider." |

---

**Preuves requises :**

| Section | Preuve | Statut |
|---------|--------|--------|
| Les 3 piliers | Exemple concret par pilier (mini-cas ou démonstration) | À constituer |
| Process détail | Nombre d'heures client requis, livrables par étape | **À fournir — Priorité 1** |
| FAQ | 9 objections disponibles | Disponible |
| Garantie/engagement | À définir (révisions incluses ? satisfaction process ?) | À définir |

---

**FAQ objections à couvrir (Offre) — 6 prioritaires :**
1. "Je ne veux pas dépendre d'un système compliqué."
2. "Qui pourra modifier le site après ?"
3. "Est-ce que vous comprenez vraiment notre métier ?"
4. "On n'a pas le temps de gérer un gros projet." (version détaillée avec heures)
5. "J'ai peur que ce soit trop cher." (version ROI calculé)
6. "L'automatisation, c'est vraiment utile pour nous ?"

---

**SEO structurel v0 — Offre :**

| Élément | Contenu recommandé |
|---------|-------------------|
| **Title** | `Notre offre — Site vitrine, automatisation et IA pour PME \| [Nom agence]` |
| **Meta description** | `Découvrez notre offre complète : site web orienté conversion, automatisation des tâches répétitives et intégration IA. Périmètre clair, process documenté.` |
| **H1** | Titre de page bénéfice |
| **H2** | Titres des 3 piliers, "Pour qui", "Comment ça marche", FAQ |
| **H3** | Étapes du process, questions FAQ |
| **Liens internes** | → / (Home), → /realisations, → /contact |

---

**Anti-template — ce qu'on ne fait PAS sur la page Offre :**
- Lister des technologies ou logiciels en vrac (Webflow, Notion, Zapier…) sans expliquer le bénéfice client
- Page générique "nos services" avec icônes et phrases vides
- Pricing caché derrière un formulaire complexe (le CTA "appel découverte" EST le déclencheur)
- Section de blog ou d'articles en bas de page (dispersion)
- "Demandez votre devis" comme CTA principal — trop transactionnel, frein pour l'ICP

---

### PAGE 3 — RÉALISATIONS (`/realisations`)

**Intention de page :** Démontrer la capacité concrète — "ils l'ont déjà fait, pour des gens comme moi."
**Audience visée :** Visiteur en phase de validation — compare des prestataires, cherche la preuve.
**Objectif de conversion :** Engagement (clic sur un cas, lecture approfondie) → CTA → Contact.
**KPI :** `portfolio_item_click` / temps sur page / `cta_primary_click` depuis /realisations.

**CTA primaire :** "Votre projet ressemble à ça ? Parlons-en." (contextuel par cas) + "Réserver un appel découverte" (page générale)
**CTA secondaire :** "Demander un audit de l'existant"

---

**Message hierarchy :**

| Niveau | Contenu |
|--------|---------|
| **H1** | Titre de page — placeholder : "Des projets pensés pour convertir, pas pour décorer" |
| **Subhead** | Positionnement : "Chaque réalisation commence par un objectif business — voici comment on l'a atteint." |

---

**Sections — ordre et job :**

| # | Section | Job | Preuve requise |
|---|---------|-----|----------------|
| 1 | **Hero réalisations** | Positionner la page comme preuve de résultats, pas d'esthétique | H1 + subhead |
| 2 | **Grille de cas** | Crédibilité visuelle + secteurs variés | 3–5 cas minimum avec : secteur, problème initial, solution, résultat (même qualitatif) |
| 3 | **CTA interstitiel** | Convertir après chaque cas | CTA contextuel |
| 4 | **Si 0 portfolio disponible** | Placeholder honnête : "Notre premier projet public arrive bientôt — en attendant, parlons du vôtre." + CTA | — |

---

**Format de chaque cas (spec minimale) :**

```
[Capture d'écran ou visuel représentatif]
Secteur : [X]
Contexte : [Problème initial en 1 phrase]
Solution : [Ce qu'on a fait en 2–3 points]
Résultat : [Résultat qualitatif OU chiffre si disponible]
[CTA : "Un projet similaire ? Parlons-en."]
```

**Si 0 cas disponible au lancement :** ne pas publier la page Réalisations vide. Options :
- Option A : Page placeholder honnête avec CTA fort
- Option B : Masquer /realisations de la nav et la page Home jusqu'à 1 cas disponible — remplacer par section process renforcée sur Home
- Option C : Afficher uniquement la démonstration d'automatisation (screencast ou gif) comme preuve de capacité technique

---

**Preuves requises :**

| Section | Preuve | Statut |
|---------|--------|--------|
| Grille cas | 3–5 réalisations avec captures | **À constituer — Priorité 2** |
| Résultats | Au moins 1 résultat qualitatif par cas | **À constituer** |
| Démo automatisation | Screencast ou gif d'un flux automatisé | **À constituer — fort différenciateur** |

---

**SEO structurel v0 — Réalisations :**

| Élément | Contenu recommandé |
|---------|-------------------|
| **Title** | `Réalisations — Sites vitrines conversion et automatisation PME \| [Nom agence]` |
| **Meta description** | `Découvrez nos réalisations : sites web orientés conversion, automatisation et IA pour PME. Contexte, solution et résultats pour chaque projet.` |
| **H1** | Titre de page |
| **H2** | Titres de chaque cas (secteur ou nom de projet) |
| **H3** | Sous-sections par cas (contexte / solution / résultat) |
| **Liens internes** | → / (Home), → /offre, → /contact |
| **Opportunité SEO** | Chaque cas peut devenir une page dédiée `/realisations/[slug]` en V2 pour du trafic long-tail |

---

**Anti-template — ce qu'on ne fait PAS sur la page Réalisations :**
- Galerie de captures sans contexte ni résultat (portfolio "beau" = portfolio inutile à la conversion)
- Cas sans mention du problème initial (l'ICP doit se reconnaître dans le problème, pas dans l'esthétique)
- Filtres sectoriels si moins de 6 cas (complexité inutile)
- Page de réalisations vide ou avec "Coming soon" uniquement sans CTA

---

### PAGE 4 — CONTACT / RDV (`/contact`)

**Intention de page :** Minimiser la friction de la prise de RDV. Rassurer sur le "sans engagement". Convertir un visiteur en lead qualifié en moins de 60 secondes.
**Audience visée :** Visiteur en phase de décision — a déjà évalué, veut passer à l'étape suivante.
**Objectif de conversion :** Soumission formulaire ou réservation calendrier.
**KPI :** `form_rdv_submitted` / `calendly_booked` / `calendly_opened`.

**CTA primaire :** Bouton de soumission formulaire OU bouton de réservation Calendly
**CTA secondaire :** — (pas de CTA secondaire sur cette page — focus total sur la conversion)

---

**Message hierarchy :**

| Niveau | Contenu |
|--------|---------|
| **H1** | Invitation directe — placeholder : "Parlons de votre projet" OU "Réservez votre appel découverte" |
| **Subhead** | Réassurance : "30 minutes, sans engagement. On évalue ensemble si et comment on peut vous aider." |
| **Proof signal** | Ce qui se passe pendant l'appel (transparence = réduction de la peur) |

---

**Sections — ordre et job :**

| # | Section | Job | Preuve requise |
|---|---------|-----|----------------|
| 1 | **Hero contact** | H1 + subhead réassurance + ancrage vers formulaire | — |
| 2 | **Ce qui se passe pendant l'appel** | Lever la peur de la "démarchage" — rendre l'appel concret et utile | Description en 3 points : "on écoute / on évalue / on propose ou pas" |
| 3 | **Formulaire OU Calendly embed** | Conversion — friction minimale | Max 3 champs si formulaire : Prénom / Email / "Votre besoin en 2 lignes" |
| 4 | **Éléments de réassurance** | Réduire l'hésitation de dernière minute | "Pas de vente forcée", "Confidentialité", "Réponse sous 24h" |

---

**Spec formulaire (si pas de Calendly) :**

```
Champ 1 : Prénom (texte court, obligatoire)
Champ 2 : Email professionnel (email, obligatoire)
Champ 3 : "Décrivez votre besoin en 2 lignes" (textarea, optionnel)
--- OPTIONNEL ---
Champ 4 : Téléphone (si qualification importante)

Bouton : "Envoyer ma demande" ou "Réserver mon appel"
Texte sous bouton : RGPD + lien politique de confidentialité
```

**Règle de friction :** Si Calendly ou outil équivalent est intégré, supprimer le formulaire — une seule option de conversion par page pour éviter la paralysie du choix.

---

**SEO structurel v0 — Contact :**

| Élément | Contenu recommandé |
|---------|-------------------|
| **Title** | `Réserver un appel découverte \| [Nom agence]` |
| **Meta description** | `Prenez 30 minutes pour discuter de votre projet. Appel découverte gratuit, sans engagement. On évalue ensemble si on peut vous aider.` |
| **H1** | Titre de page |
| **H2** | "Ce qui se passe pendant l'appel" |
| **Liens internes** | → / (Home), → /offre, → /mentions-legales (depuis formulaire RGPD) |
| **Indexation** | À indexer — page de conversion principale |

---

**Anti-template — ce qu'on ne fait PAS sur la page Contact :**
- Formulaire avec 6+ champs (budget, délai, secteur, comment nous avez-vous connu…)
- Deux options de conversion concurrentes (formulaire + calendrier + email + téléphone)
- Texte de vente sur la page Contact — l'ICP est déjà convaincu, ne pas le reconvaincre ici
- "Nous vous répondrons dans les meilleurs délais" sans engagement de délai précis
- Afficher l'adresse physique si non pertinente (agence digitale, pas de showroom)

---

### PAGE 5 — À PROPOS (`/a-propos`) — *Optionnelle, à arbitrer*

**Note :** Cette page est recommandée uniquement si la crédibilité personnelle du fondateur est un différenciateur activable (parcours atypique, expertise reconnue, positionnement "fondateur visible"). Si l'agence est multi-personnes ou préfère une identité de marque dépersonnalisée, la déprioritiser en v1.

**Intention de page :** Humaniser l'offre + valider la légitimité de l'approche "business-first".
**Audience visée :** Visiteur qui a aimé l'offre mais cherche "qui est derrière tout ça".
**Objectif de conversion :** Pas de conversion directe — pont vers /contact ou /offre.
**KPI :** Rebond vers /offre ou /contact depuis /a-propos.

---

**Sections — ordre et job :**

| # | Section | Job |
|---|---------|-----|
| 1 | **Pourquoi cette approche** | Légitimer l'angle business-first (parcours, problème personnel observé) |
| 2 | **Qui on est** | Présentation courte, ton direct, sans CV académique |
| 3 | **Ce qu'on ne fait pas et pourquoi** | Différenciation par la restriction — crédibilité du positionnement |
| 4 | **CTA** | → /contact ou → /offre |

---

**Anti-template — À propos :**
- Photo de stock "équipe souriante"
- Timeline de l'historique de l'entreprise si fondée il y a <3 ans
- "Notre mission" / "Notre vision" en jargon marketing
- Logos de certifications non reconnaissables par l'ICP

---

## D. CHECKLIST "PRÊT POUR COPY"

### Pages et sections figées

- [x] Home — 9 sections définies avec job + ordre
- [x] Offre — 7 sections définies avec job + ordre
- [x] Réalisations — Structure définie (format cas + grille)
- [x] Contact — 4 sections définies avec spec formulaire
- [x] À propos — Structure définie (optionnel — à arbitrer)
- [x] Footer — Structure définie (liens + CTA + légal)

### Preuves requises identifiées

| Preuve | Priorité | Statut | Bloquant copy ? |
|--------|----------|--------|-----------------|
| Process en 5 étapes nommées + livrables | **1 — Critique** | À fournir | **OUI** — sans ça, sections 4 (Home) et 4 (Offre) ne peuvent être rédigées |
| Heures client estimées par étape | **1 — Critique** | À fournir | OUI — objection "pas le temps" non levable |
| 3 mini-cas clients (anonymisés acceptés) | **1 — Critique** | À constituer | OUI pour section Réalisations — contournable sur Home avec process renforcé |
| 2–3 témoignages clients écrits | **2 — Important** | À constituer | Non bloquant en v1 si FAQ est forte |
| Démonstration flux automatisé | **2 — Important** | À constituer | Non bloquant copy — bloquant pour section IA crédible |
| Garantie ou engagement explicite | **2 — Important** | À définir | Non bloquant — mais fort différenciateur |
| Logos clients | **3 — Optionnel** | À vérifier | Non bloquant |
| Ressource téléchargeable | **3 — Optionnel** | À constituer | Non bloquant v1 |

### Objections principales couvertes

- [x] "Mon site marche bien, pourquoi refaire ?" → Home FAQ + Hero (résonnance problème)
- [x] "Ça va vraiment apporter des clients ?" → Process + Cas clients + Section résultats
- [x] "Beau mais inutile ?" → Différenciation business-first + Process
- [x] "Trop cher ?" → FAQ Home + Offre (ROI calculé ensemble)
- [x] "Pas le temps ?" → Process avec heures client (À FOURNIR)
- [x] "L'IA c'est gadget ?" → Pilier IA Offre + FAQ + Démo (À constituer)
- [x] "Dépendance technique ?" → Section "zones éditables" dans Offre
- [x] "Qui peut modifier après ?" → Offre + FAQ
- [x] "Vous comprenez notre métier ?" → Process cadrage + Cas secteurs variés

### CTA et friction validés

- [x] CTA primaire unique : "Réserver mon appel découverte"
- [x] CTA secondaire : "Demander un audit de l'existant" (si ressource non disponible)
- [x] Formulaire : max 3 champs actifs
- [x] Calendly (ou équivalent) = option 0-friction à privilégier
- [x] Texte réassurance CTA : "30 min, sans engagement, on évalue ensemble"
- [x] RGPD : mention obligatoire sous chaque formulaire + lien politique confidentialité
- [x] Nav sticky avec CTA permanent
- [x] CTA présent en : header / hero / fin de chaque section majeure / footer

### Points d'arbitrage à valider avant copy

| Point | Options | Impact |
|-------|---------|--------|
| Page À propos : inclure v1 ou différer ? | Oui (si fondateur visible) / Non (marque dépersonnalisée) | Structure nav + section Home |
| Calendly vs formulaire sur /contact | Calendly recommandé (0 friction) | Spec formulaire copy |
| CTA secondaire : audit vs ressource ? | Audit si 0 contenu dispo / Ressource si guide constitué | Section Home bas de page |
| Réalisations page v1 : publier vide ou masquer ? | Masquer + renforcer section process sur Home | Sitemap v1 |
| Signal social proof Hero : quoi afficher si 0 logo client ? | Supprimer / Remplacer par approche chiffrée du process | Copy hero |

---

## PAQUET POUR COPY/UI

*Éléments à transmettre dans cet ordre à l'agent vitrine-copywriting et vitrine-ui-design-system :*

1. **Brief stratégique** (du pack stratégie v1 — non modifié)
2. **Sitemap v1** — 4–5 pages définies + support légal
3. **Principes de navigation** — sticky / 4 liens max / CTA permanent
4. **Parcours de décision** — principal + 4 alternatifs documentés
5. **Page Specs v1 — Home** — 9 sections avec jobs, preuves, FAQ, SEO v0
6. **Page Specs v1 — Offre** — 7 sections avec jobs, preuves, FAQ, SEO v0
7. **Page Specs v1 — Réalisations** — format cas + options si 0 portfolio
8. **Page Specs v1 — Contact/RDV** — spec formulaire + Calendly option
9. **Page Specs v1 — À propos** — optionnel à arbitrer
10. **Checklist "prêt pour copy"** — preuves prioritaires + points d'arbitrage ouverts

**Actions bloquantes avant démarrage copy :**
- [ ] Valider les 5 points d'arbitrage (section Checklist)
- [ ] Fournir le process en 5 étapes nommées (PRIORITÉ 1)
- [ ] Confirmer : Calendly ou formulaire sur /contact ?
- [ ] Confirmer : page À propos en v1 ou différée ?

---

*Fin UX Architecture v1 — SITE TEST*
*Prêt pour Gate 3 (Copy) sous réserve de validation des points d'arbitrage et fourniture du process.*
