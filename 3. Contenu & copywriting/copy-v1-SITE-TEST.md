# COPY v1 — SITE TEST
**Agent :** vitrine-copywriting
**Date :** 2026-03-25
**Statut :** v1 — preuves manquantes balisées, prêt pour UI sous réserve de fourniture des placeholders prioritaires

---

## A. GUIDE DE TON & TERMINOLOGIE

### Voix — 3 adjectifs précis

1. **Direct** — On va au fait. On dit ce qu'on fait, ce qu'on ne fait pas, et pourquoi. Pas de périphrase. Pas d'euphémisme.
2. **Crédible** — Chaque claim est ancré dans un mécanisme (comment ça marche), une contrainte (pour qui / pas pour qui) ou une preuve (résultat, process, exemple). Rien n'est affirmé sans base.
3. **Intelligent** — On s'adresse à un dirigeant qui a déjà vu des prestataires décevoir. Il détecte le jargon vide. On lui parle comme à un pair — pas comme à un prospect à convaincre.

### Ce que ça N'EST PAS

- Enthousiaste sans fondement ("Nous sommes passionnés par votre succès !")
- Jargon marketing passe-partout ("solution innovante, clé en main, boost de croissance")
- Corporate froid ("Nous accompagnons nos clients dans leur transformation digitale")
- Humble jusqu'à l'invisibilité ("nous faisons de notre mieux pour vous satisfaire")
- Agressif ou pressant ("Ne ratez pas cette opportunité")

### Niveau de preuve attendu

**Règle :** Chaque claim dit implicitement "parce que [mécanisme]" ou "par exemple [cas]". Si ni l'un ni l'autre ne peut être fourni, on retire le claim ou on le remplace par un placeholder.

| Type de claim | Format attendu | Exemple |
|---------------|----------------|---------|
| Différenciation | Claim + mécanisme | "On commence par le business, pas le design — parce que le process de cadrage précède toute maquette" |
| Résultat | Claim + contexte | "Un client [secteur] a réduit son temps de qualification de 3h à 20min" |
| Objection-handling | Objection + réponse ancrée | "Si ce n'est pas ROI-positif, on vous le dit avant de commencer" |
| Engagement | Formulation contrainte | "30 minutes, sans engagement — on évalue ensemble si on peut vous aider" |

### Lexique

**Mots à utiliser :**
- Conversion, leads qualifiés, demandes entrantes, RDV, appel découverte
- Cadrage, process, étapes, livrables, périmètre
- Résultats, mesurable, trackable, identifiable
- Automatisation (concrète), intégration IA, gain de temps (chiffré si possible)
- Partenaire, interlocuteur unique, accompagnement défini
- Premium, crédible, clair, direct, structuré

**Mots à bannir :**
- "Innovant", "disruptif", "révolutionnaire", "de pointe"
- "Clé en main" seul (sans détailler le périmètre)
- "Sur-mesure" sans préciser ce qui est sur-mesure et pourquoi
- "Expertise de X ans" sans preuve associée
- "Passionné", "à votre écoute", "réactif" (attendus = valeur différenciante nulle)
- "Boost", "décollage", "croissance exponentielle"
- "IA avancée", "IA de pointe" — remplacer toujours par le cas d'usage concret
- "Site vitrine" — trop réducteur, remplacer par "présence digitale orientée conversion"

### Règles microcopy CTA

| Règle | Application |
|-------|-------------|
| **Verbe d'action à la 1ère personne** | "Réserver mon appel" (pas "Prendre RDV") |
| **Promesse incluse dans le label quand possible** | "Réserver mon appel découverte (30 min)" |
| **Réduction de friction sous le bouton** | "Gratuit — sans engagement — réponse sous 24h" |
| **Texte réassurance ≠ texte de vente** | Sur la page Contact : pas de copy commerciale supplémentaire |
| **Éviter les formulations transactionnelles** | "Parlons de votre projet" > "Demandez votre devis" |
| **RGPD : texte court, lien vrai** | "En soumettant ce formulaire, vous acceptez notre [politique de confidentialité]. Pas de spam." |

---

## B. CONTENT BRIEFS + COPY

---

## PAGE 1 — HOME (`/`)

### Content brief

- **Intention de page :** Filtrer les visiteurs qualifiés, résonner avec leur problème, démontrer la légitimité de l'approche, déclencher la prise de RDV.
- **Audience :** Dirigeant PME 2–50 pers, services B2B ou positionnement premium, conscience intermédiaire-élevée — sait qu'il a un problème, compare des solutions, a peur de se tromper de prestataire.
- **Objectif de conversion :** Clic CTA primaire → prise de RDV découverte.
- **KPI :** `scroll_75` / `cta_primary_click` / `form_rdv_submitted`
- **CTA primaire :** "Réserver mon appel découverte"
- **CTA secondaire :** "Demander un audit de mon site actuel"
- **Angle :** Le problème de l'ICP n'est pas "je n'ai pas de site" — c'est "mon site existe mais ne génère rien". On attaque ce problème réel. La solution n'est pas un "beau site" mais une méthode de conversion documentée.
- **Preuves disponibles :** Process (à fournir), FAQ objections (disponible), différenciation via mécanismes (disponible)
- **Message hierarchy :**
  - H1 : Problème de l'ICP + promesse de résolution
  - Subhead : Différenciateur mécanisme (business-first + IA concrète + périmètre clair)
  - Proof signal 1 : Process chiffré (remplace social proof absent)
  - Proof signal 2 : Pour qui c'est (qualification positive)
  - Proof signal 3 : Levée objection "beau mais inutile"

---

### Navigation sticky (microcopy)

```
[Logo] — [Offre] — [À propos] — [CTA: "Réserver un appel →"]
```

*Note UI : le CTA "Réserver un appel" est un bouton plein (couleur primaire), toujours visible au scroll. Sur mobile : hamburger avec CTA en premier item.*

---

### SECTION 1 — HERO

**H1 :**
> Votre site actuel vous coûte des clients. On change ça.

**Subhead :**
> On conçoit des présences digitales qui génèrent des leads qualifiés — avec une méthode documentée, un périmètre clair, et l'automatisation quand c'est utile.

**Signal crédibilité (remplace social proof absent) :**
`[PLACEHOLDER: approche process chiffrée — formule à choisir parmi les options ci-dessous une fois le process fourni :]`

> *Option A (process chiffré) :* "Un process en 5 étapes. Des livrables nommés à chaque étape. [X] heures de votre temps sur l'ensemble du projet."
>
> *Option B (engagement) :* "On commence par le cadrage stratégique — pas par la maquette. Si ça ne tient pas la route, vous le saurez avant qu'on commence à designer."
>
> *Option C (contrainte honnête) :* "Ce n'est pas pour tout le monde. C'est pour les dirigeants qui veulent un site qui travaille, pas un site qui impressionne."

**CTA primaire :** `[Bouton] Réserver mon appel découverte (30 min)`
**Microcopy sous CTA :** Gratuit — sans engagement

**CTA secondaire :** `[Lien texte] → Demander un audit de mon site actuel`

---

### SECTION 2 — PROBLEM ECHO

**H2 :** Votre site existe. Mais est-ce qu'il travaille ?

Beaucoup de dirigeants de PME ont un site. Peu ont un site qui génère activement des demandes entrantes. La plupart ont investi dans quelque chose de "correct" — qui n'a rien changé.

**Reconnaissez-vous l'une de ces situations ?**

- "Mon site ne me représente plus — mais le refaire semble un chantier énorme."
- "On reçoit moins de contacts que nos concurrents, pourtant moins bons que nous."
- "J'ai un site fonctionnel, mais il ne génère aucun lead depuis des mois."
- "J'entends parler d'automatisation et d'IA, mais je ne sais pas par où commencer concrètement."
- "J'ai déjà refait mon site une fois — il était beau, mais n'a rien changé au business."

*Si vous vous reconnaissez dans au moins une de ces phrases, vous êtes exactement le type de dirigeant qu'on peut aider.*

---

### SECTION 3 — SOLUTION + DIFFÉRENCIATION

**H2 :** Design, automatisation et IA — dans un seul projet, avec un seul interlocuteur.

Pas trois prestataires à coordonner. Pas d'agence qui livre un site "beau" sans stratégie de conversion. Pas d'IA intégrée pour faire moderne.

**[Bloc 3 piliers — affichage en colonnes ou cards]**

**Pilier 1 — Site orienté conversion**
Un site pensé pour déclencher des contacts, pas pour décorer. Chaque section a un job précis. Chaque CTA a une raison d'être. Le design suit la stratégie — pas l'inverse.

**Pilier 2 — Automatisation des tâches répétitives**
On automatise ce que vous faites déjà manuellement : qualification de leads entrants, réponses aux demandes récurrentes, tri et traitement de données. Chaque automatisation est justifiée par une tâche existante avec un gain de temps identifiable.

**Pilier 3 — IA intégrée sur des cas concrets**
Pas d'"IA de pointe". Des intégrations sur des problèmes réels : triage de demandes, assistance à la réponse client, analyse de données entrantes. Le critère : est-ce que ça résout un problème que vous avez déjà ? Si non, on ne le propose pas.

---

### SECTION 4 — LE PROCESS

**H2 :** Une méthode. Pas du flou.

**Subhead :** Vous saurez ce qui se passe à chaque étape, ce que vous avez à faire, et ce que vous recevez.

`[PLACEHOLDER: Process en 5 étapes nommées — à fournir. Structure attendue par étape : nom / ce qu'on fait / ce que vous faites (en heures) / livrable à l'issue. Voici la structure copy à remplir :]`

---

**ÉTAPE 1 — `[PLACEHOLDER: Nom de l'étape — ex: "Cadrage stratégique"]`**
`[PLACEHOLDER: Description en 2-3 lignes de ce qu'on fait à cette étape]`
Votre temps : `[PLACEHOLDER: X heures]` — `[PLACEHOLDER: format : session unique ou asynchrone]`
Livrable : `[PLACEHOLDER: ex: "Brief stratégique validé + architecture de messages"]`

---

**ÉTAPE 2 — `[PLACEHOLDER: Nom de l'étape — ex: "Architecture & UX"]`**
`[PLACEHOLDER: Description en 2-3 lignes]`
Votre temps : `[PLACEHOLDER: X heures]` — 1 point de validation
Livrable : `[PLACEHOLDER: ex: "Plan de site + wireframes annotés"]`

---

**ÉTAPE 3 — `[PLACEHOLDER: Nom de l'étape — ex: "Design & rédaction"]`**
`[PLACEHOLDER: Description en 2-3 lignes]`
Votre temps : `[PLACEHOLDER: X heures]` — 1 round de retours
Livrable : `[PLACEHOLDER: ex: "Maquettes validées + textes complets"]`

---

**ÉTAPE 4 — `[PLACEHOLDER: Nom de l'étape — ex: "Intégration & automatisations"]`**
`[PLACEHOLDER: Description en 2-3 lignes]`
Votre temps : `[PLACEHOLDER: X heures]` — accès aux comptes existants + validation fonctionnelle
Livrable : `[PLACEHOLDER: ex: "Site intégré + automatisations actives + tracking configuré"]`

---

**ÉTAPE 5 — `[PLACEHOLDER: Nom de l'étape — ex: "Lancement & suivi"]`**
`[PLACEHOLDER: Description en 2-3 lignes]`
Votre temps : `[PLACEHOLDER: X heures]` — validation finale + formation édition
Livrable : `[PLACEHOLDER: ex: "Site live + tableau de suivi des KPI + guide d'édition"]`

---

**Réassurance temps total :**
> Au total : `[PLACEHOLDER: X heures de votre temps sur X semaines]`. Le reste, on s'en occupe.

---

### SECTION 5 — POUR QUI / PAS POUR QUI

**H2 :** C'est fait pour vous si...

- Vous avez une PME de services et votre présence digitale ne génère pas de contacts qualifiés régulièrement.
- Vous voulez une image en ligne à la hauteur de votre positionnement réel.
- Vous perdez du temps sur des tâches répétitives qui pourraient être automatisées.
- Vous cherchez un interlocuteur qui pense business avant de penser design.
- Vous êtes prêt à `[PLACEHOLDER: X heures]` sur le projet — pas plus.

**H2 (séparation visuelle ou bloc distinct) :** Ce n'est pas pour vous si...

- Vous cherchez un site au prix le plus bas, le plus vite possible.
- Votre projet n'a pas encore d'objectif commercial défini.
- Vous souhaitez décider de chaque détail visuel et chaque formulation.
- Vous avez besoin d'un logiciel métier ou d'une application complexe.
- Vous n'avez ni contenus disponibles ni bande passante pour les points d'étape du process.

---

### SECTION 6 — RÉALISATIONS (version placeholder v1)

*Note : section Réalisations masquée de la nav en v1. Cette section sur la Home est la version allégée. Si 0 cas disponible au lancement, utiliser la version B ci-dessous.*

**Version A — si mini-cas disponibles :**

**H2 :** Des projets pensés pour convertir — pas pour décorer

`[PLACEHOLDER: 3 mini-cas clients. Format par cas :]`
```
Secteur : [X]
Problème : [en 1 phrase — problème que l'ICP reconnaît]
Ce qu'on a fait : [2-3 bullets]
Résultat : [résultat qualitatif OU chiffre — même approximatif et anonymisé]
[CTA contextuel : "Un projet similaire ? Parlons-en."]
```

**Version B — si 0 cas disponible au lancement (recommandée v1) :**

**H2 :** Ce qu'on vous livre à chaque projet

*Bloc process renforcé (voir Section 4 ci-dessus — développer en détail ici si les cas ne sont pas disponibles.)*

Texte de transition :
> Nos premières réalisations publiques arrivent. En attendant, la façon la plus directe de voir si notre approche correspond à votre projet : un appel de 30 minutes.

`[CTA : "Réserver mon appel découverte →"]`

---

### SECTION 7 — FAQ OBJECTIONS

**H2 :** Ce qu'on nous demande souvent

---

**"On a déjà un site, pourquoi le refaire ?"**

On commence par un audit de l'existant — gratuit et sans engagement. Si votre site génère des leads qualifiés régulièrement, on vous le dit. S'il ne le fait pas, ou moins qu'il ne devrait, on vous explique pourquoi et quelles sont les options. Pas de refonte par défaut.

---

**"Est-ce que ça va vraiment nous apporter des clients ?"**

On ne peut pas le garantir contractuellement — et quiconque le ferait mentirait. Ce qu'on peut garantir : chaque page est conçue avec un objectif de conversion mesurable, le tracking est en place dès le lancement, et les résultats sont visibles. On évalue les attentes réalistes ensemble lors de l'appel découverte.

---

**"J'ai peur que ce soit beau mais inutile."**

C'est l'erreur la plus fréquente dans le secteur. Notre réponse est structurelle : on ne commence pas par la maquette. On commence par le cadrage business — objectifs, audience, messages prioritaires. Le design suit cette stratégie. Si un élément visuel ne sert pas la conversion, il n'est pas là.

---

**"On n'a pas le temps de gérer un gros projet."**

Notre process est calibré pour demander le minimum de votre temps. `[PLACEHOLDER: "Au total, entre X et X heures de votre temps sur X semaines — réparties en Y sessions de Z heures chacune. Entre les sessions, vous avez des livrables à valider, pas à produire."]` On produit. Vous validez.

---

**"J'ai peur que ce soit trop cher."**

Un site qui génère 2 nouveaux clients qualifiés par mois se finance en quelques semaines selon votre ticket moyen. On calcule ça ensemble lors de l'appel découverte. Si le retour sur investissement n'est pas tangible à votre niveau, on vous le dit franchement avant de commencer.

---

**"L'IA, je ne veux pas d'un gadget."**

On n'intègre pas l'IA pour faire moderne. On l'intègre quand elle résout un problème que vous avez déjà : trier des demandes, répondre aux questions récurrentes, traiter des données. Le critère est simple : est-ce que ça économise du temps mesurable sur une tâche que vous faites manuellement aujourd'hui ? Si non, on ne le propose pas. `[PLACEHOLDER: ajouter ici une démonstration concrète — screencast ou gif d'un flux automatisé — à constituer]`

---

### SECTION 8 — CTA FINAL

**H2 :** Un appel. 30 minutes. On évalue ensemble.

> Pas de présentation commerciale. Pas de présentation de nos "offres". On écoute votre situation, on évalue si notre approche correspond, et on vous dit franchement si ce n'est pas le bon fit.

**Option A — si Calendly :**
`[PLACEHOLDER: Embed widget Calendly]`
*Texte sous le widget :* Vous préférez écrire d'abord ? → `[Lien texte : utilisez le formulaire]`

**Option B — formulaire fallback :**

| Champ | Type | Obligatoire | Placeholder |
|-------|------|-------------|-------------|
| Prénom | Texte court | Oui | "Votre prénom" |
| Email professionnel | Email | Oui | "votre@email.com" |
| Votre projet en 2 lignes | Textarea | Non | "Ex : PME de conseil, site existant mais 0 leads depuis 6 mois. On veut comprendre pourquoi." |

`[Bouton] Envoyer ma demande →`

**Microcopy RGPD :**
> En soumettant ce formulaire, vous acceptez notre [politique de confidentialité]. Vos données ne sont pas transmises à des tiers. Réponse sous 24h ouvrées.

**Microcopy erreur formulaire :**
- Email invalide : "Ce n'est pas un email valide — vérifiez le format."
- Champ obligatoire vide : "Ce champ est obligatoire pour vous répondre."

**Microcopy confirmation (page ou message post-envoi) :**
> Votre demande est bien reçue. On revient vers vous sous 24h ouvrées pour confirmer le créneau (ou proposer des alternatives si aucun ne convenait).
> En attendant, si vous voulez en savoir plus sur notre approche : `[Lien : voir notre offre →]`

---

### SEO structurel v0 — Home

| Élément | Contenu |
|---------|---------|
| **Title** | `[PLACEHOLDER: Nom agence] — Présence digitale, conversion et automatisation pour PME` |
| **Meta description** | `Agence spécialisée en sites orientés conversion, automatisation et IA pour PME. Méthode documentée, périmètre clair, résultats trackés. Réservez un appel découverte gratuit.` (149c) |
| **H1** | "Votre site actuel vous coûte des clients. On change ça." (1 seule occurrence) |
| **H2** | "Votre site existe. Mais est-ce qu'il travaille ?" / "Design, automatisation et IA — dans un seul projet" / "Une méthode. Pas du flou." / "C'est fait pour vous si..." / "Ce qu'on nous demande souvent" / "Un appel. 30 minutes. On évalue ensemble." |
| **H3** | Piliers (Site orienté conversion / Automatisation / IA concrète) / Étapes du process / Questions FAQ |
| **Liens internes** | → /offre depuis section piliers ("Voir le détail de notre offre →") / → /contact depuis tous les CTA / → /a-propos depuis section "qui on est" (si mentionné) |
| **Mots-clés cibles** | "agence site web PME conversion", "site web qui génère des leads", "automatisation PME", "intégration IA PME" |

---

### Assets requis — Home

| Asset | Usage | Statut |
|-------|-------|--------|
| Logo agence | Nav + hero | `[PLACEHOLDER: à fournir]` |
| Process 5 étapes nommées | Section 4 | **PRIORITÉ 1 — à fournir** |
| Heures client par étape | Section 4 + FAQ | **PRIORITÉ 1 — à fournir** |
| 3 mini-cas clients (anonymisés acceptés) | Section 6 | À constituer — contournable en v1 avec version B |
| Screencast ou gif d'un flux automatisé | FAQ IA + Section 3 | À constituer |
| Photo fondateur (si applicable) | Potentiellement Section 3 ou À propos | `[PLACEHOLDER: à fournir si fondateur visible]` |

---

## PAGE 2 — OFFRE (`/offre`)

### Content brief

- **Intention de page :** Détailler le périmètre, documenter le process, qualifier activement (pour qui / pas pour qui), lever les objections spécifiques à la décision.
- **Audience :** Visiteur avec intérêt confirmé — vient de la Home, d'un lien direct (LinkedIn, referral) ou d'une recherche ciblée.
- **Objectif de conversion :** Déclencher une prise de RDV après avoir compris et accepté le cadre de l'offre.
- **KPI :** Temps sur page >120s / `cta_primary_click` depuis /offre
- **CTA primaire :** "Réserver mon appel découverte"
- **CTA secondaire :** "Demander un audit de mon site actuel"
- **Angle :** La clarté est notre différenciation. "Vous savez exactement ce que vous achetez — et ce que vous n'achetez pas." La transparence sur le périmètre est une preuve de sérieux, pas une limitation.
- **Message hierarchy :**
  - H1 : Promesse de clarté + livraison complète
  - Subhead : Opposition explicite au "flou prestataire"
  - Proof signal 1 : Process propriétaire détaillé
  - Proof signal 2 : Périmètre inclus/exclus exhaustif
  - Proof signal 3 : Garantie ou engagement (à définir)

---

### SECTION 1 — HERO OFFRE

**H1 :**
> Un accompagnement complet — et un périmètre qui ne changera pas en cours de route.

**Subhead :**
> Pas de prestataire flou. Voici ce qu'on fait, ce qu'on ne fait pas, et comment on le fait.

**CTA haut de page :** `[Bouton] Réserver mon appel découverte`
**Microcopy :** 30 min — sans engagement

---

### SECTION 2 — LES 3 PILIERS (détail)

**H2 :** Ce que couvre notre accompagnement

---

**H3 : Site orienté conversion**

Ce n'est pas un template mis à vos couleurs. C'est une structure conçue spécifiquement pour vos objectifs, votre audience et vos messages prioritaires.

Ce qu'on livre :
- Audit et cadrage stratégique (objectifs, audience, messages)
- Architecture UX et spécifications de conversion par page
- Design sur mesure non basé sur des templates
- Intégration, déploiement, configuration du tracking
- Optimisation conversion post-lancement (premier bilan à J+30)
- Guide d'édition des zones éditables (inclus)

Ce que ce n'est pas : un site "beau" sans objectif mesurable. Si un élément de design ne sert pas la conversion ou la crédibilité, il n'est pas là.

---

**H3 : Automatisation des tâches répétitives**

On automatise ce que vous faites déjà — pas ce qu'on imagine que vous devriez faire.

Ce qu'on livre :
- Identification des tâches répétitives manuelles avec potentiel d'automatisation
- Mise en place de formulaires intelligents (qualification intégrée)
- Automatisation des réponses aux demandes récurrentes
- Connexion et traitement de données entre vos outils

`[PLACEHOLDER: exemple concret d'automatisation livrée — format : "Un [secteur] passait [X h/semaine] à [tâche]. On l'a réduit à [Y min] grâce à [mécanisme court]." À fournir ou constituer à partir d'un premier projet.]`

Ce que ce n'est pas : des automatisations génériques "pour gagner du temps en général". Chaque automatisation proposée répond à une tâche existante identifiée lors du cadrage.

---

**H3 : Intégration IA sur des cas concrets**

Le critère d'une intégration IA dans un projet : résoudre un problème que vous avez aujourd'hui, avec un gain mesurable.

Cas d'usage que l'on traite :
- Qualification automatique des leads entrants (triage par critères définis)
- Assistance à la réponse client (FAQ automatisée, premier niveau de traitement)
- Analyse et tri de données entrantes
- `[PLACEHOLDER: autre cas d'usage si applicable à votre projet]`

Ce qu'on ne fait pas : intégration IA "pour impressionner" ou pour pouvoir dire qu'on fait de l'IA. Si ça ne résout pas un problème réel avec un ROI identifiable, on ne le propose pas.

`[PLACEHOLDER: démonstration screencast ou gif d'un flux IA concret — fort différenciateur — à constituer]`

---

### SECTION 3 — CE QUI EST INCLUS / EXCLU

**H2 :** Le périmètre, clairement posé

**INCLUS dans chaque projet :**
- Audit et cadrage stratégique initial
- Architecture UX et spécifications de conversion
- Design sur mesure (non basé sur des templates)
- Intégration et déploiement
- Configuration du tracking (GA4 minimum)
- Optimisation conversion post-lancement (bilan J+30)
- Automatisations simples à intermédiaires selon besoins identifiés
- Intégration IA sur cas d'usage validés lors du cadrage
- Accompagnement post-livraison défini (durée : `[PLACEHOLDER: X semaines/mois]`)
- Guide d'édition des zones éditables

**NON INCLUS — explicitement hors périmètre :**
- Développement d'application SaaS ou de logiciel métier complexe
- Stratégie marketing 360° ou gestion de campagnes publicitaires (SEA, Social Ads, SEO long terme)
- Maintenance illimitée ou support 24/7 post-livraison
- R&D IA ou développement de modèles spécifiques
- Production de contenu rédactionnel autre que le copy du site
- Shooting photo ou production vidéo

*Note : si votre projet implique l'un des éléments "hors périmètre", on vous dit en appel découverte vers qui vous orienter — sans vous laisser gérer ça seul.*

---

### SECTION 4 — LE PROCESS EN DÉTAIL

**H2 :** Comment on travaille — du premier appel à la livraison

**Subhead :** `[PLACEHOLDER: "X heures de votre temps sur X semaines — réparties en Y étapes. Voici le détail."]`

`[PLACEHOLDER: Process complet en 5 étapes — format détaillé. Chaque étape doit inclure :
- Nom de l'étape (title H3)
- Ce qu'on fait (2-4 bullets)
- Ce que vous faites (temps en heures + format : session, asynchrone, validation)
- Livrable à l'issue de l'étape
- Durée estimée de l'étape

Structure hypothétique à enrichir et valider :]`

---

**H3 : Étape 1 — `[PLACEHOLDER: Nom]`**
Ce qu'on fait :
- `[PLACEHOLDER: bullet 1]`
- `[PLACEHOLDER: bullet 2]`
- `[PLACEHOLDER: bullet 3]`

Ce que vous faites : `[PLACEHOLDER: X heures]` — `[PLACEHOLDER: format]`
Livrable : `[PLACEHOLDER: description du livrable]`
Durée : `[PLACEHOLDER: X jours ouvrés]`

---

**H3 : Étape 2 — `[PLACEHOLDER: Nom]`**
*(même structure)*

---

**H3 : Étape 3 — `[PLACEHOLDER: Nom]`**
*(même structure)*

---

**H3 : Étape 4 — `[PLACEHOLDER: Nom]`**
*(même structure)*

---

**H3 : Étape 5 — `[PLACEHOLDER: Nom]`**
*(même structure)*

---

**Encadré réassurance temps :**
> **Au total :** `[PLACEHOLDER: X heures de votre temps sur X semaines]`
> Réparties en `[PLACEHOLDER: Y sessions de Z heures]` — jamais plus de `[PLACEHOLDER: X heures]` d'un coup.
> Entre les sessions : vous avez des livrables à valider, pas à produire.

---

### SECTION 5 — POUR QUI / PAS POUR QUI (version détaillée)

**H2 :** Pour qui c'est — et pour qui ce n'est pas

**C'est fait pour vous si :**
- Vous dirigez une PME de services (2–50 pers) et votre présence digitale actuelle ne génère pas de demandes entrantes qualifiées.
- Vous avez un positionnement premium réel que votre image en ligne ne reflète pas encore.
- Vous voulez déléguer la partie digitale à un interlocuteur unique qui pense business — pas seulement design.
- Vous êtes prêt à passer `[PLACEHOLDER: X heures]` structurées sur le projet — et pas plus.
- Vous voulez comprendre ce que vous achetez, étape par étape, avant de vous lancer.

**Ce n'est pas pour vous si :**
- Vous cherchez le site le moins cher et le plus rapide.
- Votre activité ou offre n'a pas encore d'objectif commercial clair.
- Vous devez valider chaque décision créative et chaque ligne de texte.
- Vous avez besoin d'un logiciel métier, d'une application mobile ou d'une plateforme SaaS.
- Vous n'avez ni contenus existants ni disponibilité pour les points d'étape.

---

### SECTION 6 — FAQ OFFRE

**H2 :** Questions sur l'offre

---

**"Je ne veux pas dépendre d'un système compliqué après la livraison."**

Les zones éditables sont identifiées dès la phase de cadrage — pas en fin de projet. Tout ce qui est destiné à évoluer (témoignages, cas clients, FAQ, textes de section, photos) est éditable sans compétence technique. Ce qui est fixe (structure de conversion, CTA, blocs de performance) est documenté dans le guide d'édition — et cette fixité a une raison précise.

`[PLACEHOLDER: capture ou exemple du guide d'édition livré — à constituer après premier projet]`

---

**"Qui pourra modifier le site après la livraison ?"**

On livre un guide d'édition avec chaque projet. Les zones éditables sont clairement identifiées et documentées. Vous n'avez pas besoin de nous pour changer un témoignage, une photo, un texte de section ou une entrée FAQ. Pour les modifications structurelles (qui impactent la conversion), on peut intervenir — c'est dans l'accompagnement post-livraison.

---

**"Est-ce que vous comprenez vraiment notre métier ?"**

La phase de cadrage est conçue pour ça — et elle précède toute maquette. On part de vos objectifs commerciaux, de vos clients réels, de vos preuves disponibles. On ne part pas d'un template sectoriel. Si à l'issue du cadrage on ne comprend pas votre marché et vos enjeux, on vous le dit.

`[PLACEHOLDER: exemples de projets dans secteurs variés — à constituer]`

---

**"On n'a vraiment pas le temps de gérer un projet en ce moment."**

`[PLACEHOLDER: "Notre process demande au total entre X et X heures de votre temps sur X semaines. C'est réparti en Y sessions de Z heures — jamais plus d'X heures d'un coup. Entre ces sessions, vous avez des livrables à valider, pas à produire. Si X heures sur X semaines n'est pas réaliste maintenant, on peut le planifier sur une fenêtre différente."]`

---

**"Comment vous calculez le prix d'un projet ?"**

Chaque projet est évalué selon sa complexité : nombre de pages, automatisations souhaitées, intégrations nécessaires, niveau de design. On ne donne pas de devis en aveugle. Lors de l'appel découverte (30 min), on peut vous donner une fourchette précise et les variables qui l'impactent. Si ça ne correspond pas à votre enveloppe, on vous le dit honnêtement.

---

**"L'automatisation, c'est vraiment utile pour une PME comme nous ?"**

Ça dépend de ce que vous faites manuellement aujourd'hui. Si vous passez plus d'une heure par semaine à qualifier des demandes, répondre aux mêmes questions, ou trier des données — la réponse est très probablement oui. On identifie ces cas ensemble lors du cadrage, avant de proposer quoi que ce soit. Pas d'automatisation pour l'automatisation.

---

**"Il y a une garantie ?"**

`[PLACEHOLDER: définir et formuler l'engagement ou garantie — ex: "X rounds de révisions inclus", "satisfaction process garantie", "on ne facture pas la totalité avant validation de chaque étape", etc. À définir en interne avant de publier.]`

---

### SECTION 7 — CTA FINAL OFFRE

**H2 :** Un appel pour évaluer ensemble.

> En 30 minutes, vous savez si notre approche correspond à votre projet. Et si ce n'est pas le bon fit, on vous le dit clairement.

`[Bouton] Réserver mon appel découverte`
**Microcopy :** Gratuit — sans engagement — réponse sous 24h

**CTA secondaire :** `[Lien texte] → Demander un audit de mon site actuel`

---

### SEO structurel v0 — Offre

| Élément | Contenu |
|---------|---------|
| **Title** | `Notre offre — Site web, automatisation et IA pour PME \| [Nom agence]` |
| **Meta description** | `Site orienté conversion, automatisation des tâches répétitives et intégration IA concrète. Périmètre clair, process documenté, interlocuteur unique. Découvrez notre offre.` (151c) |
| **H1** | "Un accompagnement complet — et un périmètre qui ne changera pas en cours de route." |
| **H2** | "Ce que couvre notre accompagnement" / "Le périmètre, clairement posé" / "Comment on travaille" / "Pour qui c'est — et pour qui ce n'est pas" / "Questions sur l'offre" / "Un appel pour évaluer ensemble." |
| **H3** | Titres des 3 piliers / Étapes du process (5 × H3) / Questions FAQ |
| **Liens internes** | → / (Home) depuis hero ou breadcrumb / → /contact depuis tous les CTA / → /realisations (si publiée) depuis section piliers |

---

### Assets requis — Offre

| Asset | Usage | Statut |
|-------|-------|--------|
| Process 5 étapes avec livrables | Section 4 | **PRIORITÉ 1 — à fournir** |
| Heures client par étape | Section 4 + FAQ | **PRIORITÉ 1 — à fournir** |
| Exemple concret d'automatisation | Section 2 (pilier 2) | À constituer |
| Screencast/gif flux IA | Section 2 (pilier 3) | À constituer |
| Garantie ou engagement | Section FAQ / CTA | **À définir avant publication** |
| Exemples secteurs variés | FAQ "vous comprenez notre métier ?" | À constituer |

---

## PAGE 3 — CONTACT / RDV (`/contact`)

### Content brief

- **Intention de page :** Minimiser la friction de la prise de RDV. L'ICP est déjà convaincu — ne pas le reconvaincre ici. Convertir en moins de 60 secondes.
- **Audience :** Visiteur en phase de décision. A évalué l'offre. Prêt à franchir le pas.
- **Objectif de conversion :** Soumission formulaire OU réservation Calendly.
- **KPI :** `form_rdv_submitted` / `calendly_booked` / `calendly_opened`
- **CTA primaire :** Bouton de soumission formulaire OU réservation Calendly
- **CTA secondaire :** Aucun sur cette page — focus total sur la conversion
- **Règle :** Pas de vente sur cette page. Pas de sections offre ou différenciation. Juste la conversion et la réassurance.

---

### SECTION 1 — HERO CONTACT

**H1 :**
> Parlons de votre projet.

**Subhead :**
> 30 minutes, sans engagement. On écoute votre situation, on évalue si notre approche correspond — et on vous dit franchement si ce n'est pas le bon fit.

---

### SECTION 2 — CE QUI SE PASSE PENDANT L'APPEL

**H2 :** Ce qui se passe pendant ces 30 minutes

**[Bloc 3 points — icônes ou numérotation simple]**

**1. On écoute**
Vous nous parlez de votre activité, de vos objectifs, de votre situation digitale actuelle. Pas de présentation de nos "offres". Pas d'interruption pour pitcher.

**2. On évalue**
On vous dit honnêtement si votre problème entre dans notre périmètre — et si notre approche est adaptée à votre situation et à votre timing.

**3. On propose — ou on dit non**
Si le fit est là, on vous présente une approche concrète et les prochaines étapes. Si ce n'est pas le bon moment ou la bonne solution, on vous le dit clairement. Pas de relance. Pas de pression.

---

### SECTION 3 — FORMULAIRE / CALENDLY

**Option A — principale (si Calendly intégré) :**

*Texte au-dessus du widget :* Choisissez un créneau :
`[PLACEHOLDER: Embed widget Calendly]`

*Texte sous widget :*
> Vous préférez écrire d'abord ? `[Lien : utilisez le formulaire ci-dessous →]`

---

**Option B — formulaire fallback (si Calendly non disponible ou en complément) :**

**H2 :** Ou envoyez-nous un message :

| Champ | Type | Obligatoire | Placeholder |
|-------|------|-------------|-------------|
| Prénom | Texte court | Oui | "Votre prénom" |
| Email professionnel | Email | Oui | "votre@email.com" |
| Votre projet en 2 lignes | Textarea | Non | "Ex : PME de conseil B2B, site existant mais 0 leads depuis 6 mois. On veut comprendre pourquoi." |

*Bouton :* `Envoyer ma demande →`

*Microcopy RGPD :*
> En soumettant ce formulaire, vous acceptez notre [politique de confidentialité]. Vos données ne sont pas transmises à des tiers. Réponse sous 24h ouvrées.

---

**Microcopy erreurs formulaire :**
- Prénom vide : "Votre prénom nous permet de vous répondre personnellement."
- Email invalide : "Ce format d'email ne semble pas valide — vérifiez l'adresse."
- Email vide : "On a besoin de votre email pour vous répondre."

**Microcopy confirmation (post-envoi — page ou message inline) :**
> Votre message est bien reçu. On vous répond sous 24h ouvrées pour confirmer un créneau.
> En attendant : `[Lien : voir notre offre en détail →]`

---

### SECTION 4 — RÉASSURANCE

*Bloc court — pas de copy de vente.*

- Pas de relance commerciale après l'appel si ce n'est pas le bon fit.
- Vos informations restent confidentielles.
- Si on ne peut pas vous aider, on vous le dit en début d'appel — pas en fin.
- `[PLACEHOLDER: logo ou badge RGPD si disponible]`

---

### SEO structurel v0 — Contact

| Élément | Contenu |
|---------|---------|
| **Title** | `Réserver un appel découverte \| [Nom agence]` |
| **Meta description** | `Prenez 30 minutes pour parler de votre projet. Appel découverte gratuit, sans engagement. On évalue ensemble si on peut vous aider.` (131c) |
| **H1** | "Parlons de votre projet." |
| **H2** | "Ce qui se passe pendant ces 30 minutes" |
| **Liens internes** | → / (Home) / → /offre / → /mentions-legales (depuis lien RGPD) |
| **Indexation** | À indexer — page de conversion principale |

---

### Assets requis — Contact

| Asset | Usage | Statut |
|-------|-------|--------|
| Lien Calendly ou outil de réservation | Widget embed | `[PLACEHOLDER: à intégrer]` |
| Lien politique de confidentialité | Microcopy RGPD | À créer (page légale) |
| Configuration confirmation formulaire | Message post-envoi | À configurer côté technique |

---

## PAGE 4 — À PROPOS (`/a-propos`)

### Content brief

- **Intention de page :** Humaniser l'offre, légitimer l'approche business-first, valider la crédibilité du fondateur sans CV académique.
- **Audience :** Visiteur qui a aimé l'offre et cherche "qui est derrière tout ça" avant de prendre contact. Niveau de conscience élevé — cherche confirmation de confiance, pas de conviction.
- **Objectif de conversion :** Pas de conversion directe. Pont vers /contact ou /offre.
- **KPI :** Rebond vers /offre ou /contact / `cta_primary_click` depuis /a-propos
- **Angle :** La page À propos n'est pas un CV. C'est une explication de pourquoi cette approche — pas "qui nous sommes" en premier, mais "pourquoi on fait ça comme ça". Le fondateur est visible et crédible, pas "passionné" et "enthousiaste".

---

### SECTION 1 — HERO À PROPOS

**H1 :**
> On fait ça parce qu'on a vu trop de PME excellentes avec des sites qui ne le montrent pas.

**Subhead :**
> Notre approche business-first vient d'une conviction simple : un site ne vaut que ce qu'il génère.

---

### SECTION 2 — POURQUOI CETTE APPROCHE

**H2 :** Pourquoi on est partis de la conversion — pas du design

`[PLACEHOLDER: Récit fondateur — 4-6 phrases. Structure recommandée :
1. Contexte professionnel antérieur (en 1 phrase)
2. Observation répétée qui a fondé l'approche (en 1-2 phrases)
3. Décision ou tournant (en 1 phrase)
4. Ce que ça a changé dans la façon de travailler (en 1 phrase)

Exemple de structure à remplir (ne pas publier tel quel) :
"J'ai passé X années [contexte]. À chaque projet, le même constat : les décisions de design étaient prises avant que la stratégie soit claire. Le résultat : des sites soignés, un investissement réel — et aucun impact mesurable sur les leads. J'ai décidé d'inverser le process."]`

Ce qu'on a observé dans les projets du secteur :
- Des sites refaits pour l'image, sans impact mesurable sur les contacts entrants.
- Des intégrations IA "pour faire moderne", sans cas d'usage réel ni gain de temps identifié.
- Des projets dont la durée triple parce que le brief stratégique n'existait pas au départ.

On a bâti notre approche pour corriger ces trois problèmes précisément — en commençant par les objectifs, pas par les maquettes.

---

### SECTION 3 — QUI ON EST

**H2 :** `[PLACEHOLDER: Prénom + Nom du fondateur]`

`[PLACEHOLDER: Photo du fondateur — portrait professionnel sobre, non générique]`

`[PLACEHOLDER: Présentation courte, ton direct, 4-6 phrases. Ce qu'elle doit inclure :
- Contexte professionnel en 1 phrase (sans "X ans d'expérience" sans contexte)
- Ce qui différencie cette approche d'un freelance ou d'une agence classique (en 1 phrase — mécanisme, pas adjectif)
- Optionnel : une contrainte ou une limite assumée (ex: "Je ne prends que X projets par trimestre")

Structure à remplir :
"Je m'appelle [Prénom]. [Contexte en 1 phrase]. Ce que je fais différemment : [mécanisme différenciateur en 1 phrase]. [Contrainte ou engagement personnel si applicable.]"]`

---

### SECTION 4 — CE QU'ON NE FAIT PAS — ET POURQUOI

**H2 :** Ce qu'on ne fait pas — et pourquoi c'est un choix

On ne gère pas les campagnes publicitaires. Pas parce qu'on ne sait pas. Parce que ce n'est pas dans notre périmètre de maîtrise — et un prestataire qui couvre tout fait rarement quelque chose au bon niveau.

On ne développe pas d'applications ou de logiciels métier. On travaille sur des sites de conversion, pas sur des plateformes SaaS. La frontière est claire et on la tient.

On n'intègre pas l'IA "pour que ça sonne moderne". On l'intègre quand elle résout un problème mesurable. Sinon, on dit non — même si ça aurait pu impressionner.

Cette clarté n'est pas une limitation. C'est ce qui garantit que ce qu'on livre est au bon niveau dans son périmètre.

---

### SECTION 5 — CTA

**H2 :** Une question sur notre façon de travailler ?

`[Bouton primaire] Réserver un appel découverte`
`[Bouton secondaire / lien texte] → Voir notre offre en détail`

---

### SEO structurel v0 — À propos

| Élément | Contenu |
|---------|---------|
| **Title** | `À propos — Notre approche business-first \| [Nom agence]` |
| **Meta description** | `Découvrez qui est derrière [nom agence] et pourquoi on a construit une approche qui part des objectifs de conversion, pas du design.` (~140c — à ajuster selon nom agence) |
| **H1** | "On fait ça parce qu'on a vu trop de PME excellentes avec des sites qui ne le montrent pas." |
| **H2** | "Pourquoi on est partis de la conversion — pas du design" / "[Prénom Nom]" / "Ce qu'on ne fait pas — et pourquoi c'est un choix" |
| **Liens internes** | → /offre (depuis CTA secondaire) / → /contact (depuis CTA primaire) |

---

### Assets requis — À propos

| Asset | Usage | Statut |
|-------|-------|--------|
| Photo du fondateur (portrait sobre) | Section "Qui on est" | `[PLACEHOLDER: à fournir]` |
| Récit fondateur (4-6 phrases) | Section "Pourquoi cette approche" | `[PLACEHOLDER: à rédiger avec le fondateur]` |
| Présentation personnelle courte | Section "Qui on est" | `[PLACEHOLDER: à rédiger avec le fondateur]` |
| Contrainte ou engagement assumé (optionnel) | Section "Qui on est" | À définir |

---

## C. CHECKLIST "COPY PRÊTE POUR UI"

### Test de spécificité

Pour chaque paragraphe : *"Ce texte pourrait-il être copié sur le site d'une agence concurrente sans rien changer ?"*

| Section | Test spécificité | Statut |
|---------|-----------------|--------|
| H1 Home | "Votre site actuel vous coûte des clients. On change ça." — problème spécifique, ton direct | ✅ Passe |
| Subhead Home | Mécanisme énoncé (méthode, périmètre, automatisation quand utile) | ✅ Passe |
| Pilier 2 — Automatisation | "On automatise ce que vous faites déjà manuellement" + critère | ✅ Passe |
| Pilier 3 — IA | Critère d'intégration explicite + ce qu'on ne fait pas | ✅ Passe |
| FAQ "beau mais inutile" | Réponse structurelle (cadrage avant maquette) | ✅ Passe |
| FAQ "trop cher" | Raisonnement ROI + "on calcule ça ensemble" | ✅ Passe |
| Section Process | **À valider quand les étapes réelles sont fournies** | ⚠️ En attente |
| Section Réalisations | **Contenu réel absent — placeholder honnête en v1** | ⚠️ En attente |
| À propos — Récit fondateur | **À rédiger avec le fondateur** | ⚠️ En attente |
| FAQ "pas le temps" | **Chiffres heures client absents — placeholder** | ⚠️ En attente |

---

### Preuves aux points de risque

| Point de risque | Preuve requise | Statut |
|----------------|----------------|--------|
| Hero — crédibilité instantanée | Process chiffré ou signal fort | ⚠️ À substituer quand process fourni |
| Section Process | Étapes nommées + livrables + heures | **BLOQUANT — priorité 1** |
| FAQ "pas le temps" | Heures client réelles | **BLOQUANT — priorité 1** |
| Pilier IA — crédibilité | Screencast ou gif d'un flux | À constituer |
| Pilier Automatisation | Exemple concret | À constituer |
| Garantie/engagement | Formulation engagement | **À définir avant publication** |
| À propos — légitimité | Récit fondateur + photo | À fournir |

---

### CTA — cohérence et non-contradiction

| Élément | Vérification | Statut |
|---------|-------------|--------|
| CTA primaire unique | "Réserver mon appel découverte" — cohérent sur toutes les pages | ✅ |
| CTA secondaire unique | "Demander un audit de mon site actuel" — cohérent sur Home + Offre | ✅ |
| Page Contact — CTA unique | Pas de CTA concurrent (Calendly OU formulaire, pas les deux) | ✅ |
| Microcopy CTA | "30 min / gratuit / sans engagement" — répété aux points de conversion | ✅ |
| Formulation 1ère personne | "Réserver MON appel" — à maintenir partout | ✅ |

---

### Terminologie — cohérence cross-pages

| Terme | Formulation retenue | À ne pas varier |
|-------|---------------------|-----------------|
| Action principale | "appel découverte" | Pas "rendez-vous", "call", "consultation" |
| Produit | "accompagnement" ou "présence digitale" | Pas "site vitrine" |
| Automatisation | "automatisation des tâches répétitives" | Pas "automatisation intelligente" |
| IA | "IA intégrée sur des cas concrets" | Pas "IA de pointe", "IA avancée" |
| Audience | "dirigeant(e) de PME" | Pas "chef d'entreprise", "entrepreneur" (sauf si accord) |
| Durée de l'appel | "30 minutes" | Constant |

---

## PAQUET POUR UI/TECH

### Contraintes de layout critiques (par page)

**HOME :**
- Section Process (S4) : structure de type "timeline horizontale ou verticale" — 5 étapes avec étiquette, description courte, livrable. Doit supporter les placeholders sans casser la mise en page.
- Section Pour qui / Pas pour qui (S5) : deux colonnes ou deux blocs distincts — checklist visuelle (✓ / ✗). Pas de tableau.
- FAQ (S7) : accordion — ouverture au clic. Minimum 6 items. Éléments éditables post-livraison.
- CTA final (S8) : deux options de mise en page prévues — embed Calendly (prioritaire) + formulaire fallback. Prévoir les deux en design même si une seule est active au lancement.

**OFFRE :**
- Section Piliers (S2) : 3 blocs distinctifs — cards ou colonnes. Chaque pilier : titre H3 + texte + liste de ce qui est inclus + mention de ce que ce n'est pas.
- Section Inclus/Exclus (S3) : deux listes côte à côte — vert pour inclus, neutre/rouge pour exclus. Pas de tableau.
- Section Process détail (S4) : timeline ou stepper — 5 étapes. Chaque étape : titre + contenu pliable ou visible + encadré "livrable" distinct visuellement.
- Encadré réassurance temps total : bloc mis en valeur (fond coloré ou encadré) — doit être immédiatement visible.

**CONTACT :**
- Page épurée — pas de section marketing. Header sobre.
- Section "Ce qui se passe" (S2) : 3 blocs numérotés ou iconographiés — très lisible, pas de blocs trop denses.
- Option Calendly : prévoir un espace suffisant pour le widget embed (hauteur variable selon créneau sélectionné).
- Formulaire fallback : prévoir la version desktop et mobile — 3 champs max visibles, bouton bien dimensionné.
- Microcopy RGPD : petit texte (12px) sous le bouton, non intrusif.

**À PROPOS :**
- Section "Qui on est" (S3) : prévoir un layout avec photo + texte côte à côte (desktop) / photo en haut (mobile).
- Photo fondateur : format portrait, rapport 3:4 ou 1:1. Fond sobre ou naturel — pas de fond blanc studio générique.
- Section "Ce qu'on ne fait pas" (S4) : texte seul — pas de liste à puces. Ton narratif intentionnel.

---

### Assets indispensables avant go-live

| Asset | Impact si absent | Priorité |
|-------|-----------------|----------|
| Process 5 étapes nommées + livrables + heures client | Sections 4 (Home et Offre) non finalisables | **BLOQUANT — P1** |
| Logo agence | Toutes les pages | **BLOQUANT — P1** |
| Lien Calendly (ou outil équivalent) | Page Contact — CTA principal non fonctionnel | **BLOQUANT — P1** |
| Politique de confidentialité + Mentions légales | Liens RGPD formulaires — obligation légale | **BLOQUANT — P1** |
| Photo fondateur | Page À propos — section "Qui on est" | **P1 — si À propos en v1** |
| Récit fondateur (4-6 phrases) | Page À propos — Section 2 | **P1 — si À propos en v1** |
| Définition garantie ou engagement | FAQ Offre + CTA Offre | **P2 — fort différenciateur** |
| Exemple concret d'automatisation | Offre — Pilier 2 | **P2 — crédibilité IA/auto** |
| Screencast/gif flux IA | Offre — Pilier 3 + FAQ Home | **P2 — différenciateur clé** |
| 3 mini-cas clients (anonymisés) | Section Réalisations Home | **P2 — contournable en v1** |
| Témoignages clients écrits | FAQ Home / section preuve | **P3 — non bloquant v1** |

---

### Pages légales à créer (hors copy mais obligatoires)

- `/mentions-legales` — informations légales obligatoires (identité, hébergeur)
- `/politique-confidentialite` — traitement des données formulaires (RGPD)
- `/[cookies]` — si tracking GA4 ou équivalent actif (bandeau + page optout)

---

*Fin Copy v1 — SITE TEST*
*4 pages produites : Home / Offre / Contact / À propos*
*Placeholders prioritaires balisés — à fournir avant UI : process 5 étapes, heures client, logo, Calendly, photo fondateur, mentions légales.*
