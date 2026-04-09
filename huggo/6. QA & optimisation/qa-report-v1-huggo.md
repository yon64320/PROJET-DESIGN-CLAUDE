# QA Report v1 — HUGGO

> **Projet** : Site vitrine premium HUGGO
> **Version** : v1.0
> **Date** : 2026-04-09
> **Mode** : DELIVERABLES QA (pas de build)
> **Statut** : NO-GO — 2 bloqueurs P0 identifiés

---

## 1) QA REPORT — Table d'issues

### A) Conversion & UX

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|-----------------|----------|----------------|-------|
| A1 | **Coordonnees de contact absentes sur toutes les pages.** L'email, le telephone et le numero WhatsApp Business sont tous marques `[A FOURNIR]`. Sans ces coordonnees, le bouton WhatsApp flottant (present sur les 8 pages), la section coordonnees de la page Contact et le footer sont non fonctionnels. Aucun visiteur ne peut contacter HUGGO par un canal autre que le formulaire. | P0 | **Leads perdus directement.** Le bouton WhatsApp flottant est un canal de conversion zero-friction present sur chaque page. Sans numero, il ne fonctionne pas. Le footer sans email/telephone casse la credibilite. Les visiteurs mobiles qui preferent appeler ne trouvent aucun numero. Perte estimee : 15-25% des leads potentiels (ceux qui ne veulent pas remplir un formulaire). | `UX-Architecture-v1-huggo.md §A — Elements globaux` : "Bouton WhatsApp flottant [...] Ouvre WhatsApp avec numero pre-rempli `[A FOURNIR]`". `copy-v1-huggo.md §Contact section 4` : "Email `[A FOURNIR]`, telephone `[A FOURNIR]`". `tech-stack-v1-huggo.md §E.4` : "WHATSAPP_NUMBER" variable d'environnement sans valeur. `pack-strategie-huggo.md §Hypotheses` : "Numero WhatsApp Business pour le bouton flottant — `[A FOURNIR]` — Bouton non fonctionnel". | **Le fondateur doit fournir : (1) le numero WhatsApp Business, (2) l'adresse email de contact, (3) le numero de telephone affiche.** Ces trois elements sont prerequis bloquants pour le lancement. Effort : 5 minutes de decision cote fondateur, puis injection dans les env vars et le copy. | **Fondateur** |
| A2 | **Domaine non decide.** Le nom de domaine (huggo.fr, huggo.ai, autre) n'est pas arrete. | P0 | **Bloquant deploiement.** Sans domaine, le site ne peut pas etre deploye en production. Les URLs canoniques, le sitemap, les hreflang, l'OG image, la config Vercel, et le Plausible domain sont tous dependants du domaine choisi. Un changement tardif de domaine apres lancement impacte le SEO acquis. | `pack-strategie-huggo.md §Hypotheses` : "Domaine (huggo.fr, huggo.ai, autre) — A decider — Bloquant pour le deploiement". `tech-stack-v1-huggo.md §F — Deployment` : redirect `/` vers `/fr/` depend du domaine. | **Le fondateur doit decider le domaine avant le demarrage du developpement.** Verifier la disponibilite, acheter, configurer le DNS. Effort fondateur : 1h de decision + achat. | **Fondateur** |
| A3 | **Garantie / periode d'essai non fournie — objection "Et si ca ne marche pas" sans reponse.** Sur les pages Retail et Accueil, la FAQ contient la question "Et si ca ne marche pas ?" avec la reponse `[GARANTIE / PERIODE D'ESSAI A FOURNIR]`. C'est la derniere question de la FAQ — celle que le visiteur lit juste avant de decider. | P1 | **Frein conversion direct.** L'absence de reponse a cette objection finale laisse le visiteur sur un doute non resolu au moment le plus critique du parcours (juste avant le CTA de conversion). La FAQ est conçue pour lever les objections progressivement — une question sans reponse brise cette mecanique. Impact estime : 5-10% de drop additionnel sur le formulaire. | `copy-v1-huggo.md §Retail FAQ` : "Q : Et si ca ne marche pas ? R : `[GARANTIE / PERIODE D'ESSAI A FOURNIR]`". `pack-strategie-huggo.md §Objections` : meme placeholder. | **Le fondateur decide la politique (essai gratuit 30 jours, satisfaction ou rembourse, engagement sans frais, etc.).** L'Agent 3 redige la reponse FR/EN une fois la politique definie. Effort fondateur : decision business (1h). Effort Agent 3 : 15 min de copy. | **Fondateur** (decision) puis **Agent 3** (copy) |
| A4 | **Engagement contractuel non clarifie.** Sur la page Tarifs, la FAQ "Y a-t-il un engagement ?" et "Y a-t-il une periode d'essai ?" ont toutes deux des reponses `[A CONFIRMER]` / `[A FOURNIR]`. | P1 | **Frein conversion sur la page la plus proche de l'achat.** Un visiteur sur la page Tarifs est en phase finale de decision. L'absence de reponse sur l'engagement et la periode d'essai genere de l'incertitude qui pousse a reporter la decision. | `copy-v1-huggo.md §Tarifs FAQ` : "Y a-t-il un engagement ? `[A CONFIRMER — engagement ou sans engagement]`" et "Y a-t-il une periode d'essai ? `[A FOURNIR]`". `UX-Architecture-v1-huggo.md §Tarifs` : "sans engagement `[A CONFIRMER]`". | **Le fondateur clarifie : engagement ou non, duree, conditions de resiliation, existence d'un essai gratuit.** L'Agent 3 redige les reponses FAQ. Effort : decision fondateur + 20 min copy. | **Fondateur** (decision) puis **Agent 3** (copy) |
| A5 | **Temoignages clients totalement absents.** Les sections temoignage sur les 4 pages verticales (Retail, Franchise, Collectivity) et l'Accueil sont toutes en placeholder `[A FOURNIR]`. Des fallbacks textuels existent (chiffres + mention "3 distributeurs CHR"), mais aucune voix client n'est presente. | P1 | **Credibilite reduite.** En B2B, les temoignages sont le 2e facteur de decision apres les resultats chiffres. L'absence totale de voix client sur un site qui presente des chiffres forts (15M commandes) cree un desequilibre : les chiffres sont affirmatifs mais pas confirmes par un tiers. Les fallbacks mitigent partiellement, mais ne remplacent pas un vrai temoignage. | `pack-strategie-huggo.md §Proof Inventory #14` : "Temoignages clients — `[A FOURNIR]` — Conversion reduite — pas de voix client (P0)". `copy-v1-huggo.md §Accueil section 7` : "`[A FOURNIR]`". Memes placeholders sur Retail section 7, Franchise section 6, Collectivity section 6. | **Le fondateur collecte au minimum 1 temoignage commerçant (priorite Retail) avec photo, citation verbatim, prenom/metier/ville.** Les emplacements existent deja dans le copy et l'architecture — il suffit de remplir. Les fallbacks actuels sont acceptables pour le lancement si les temoignages ne sont pas disponibles immediatement, a condition que les emplacements soient visuellement presents (pas de section manquante). Effort : 2-3 jours de collecte par le fondateur. | **Fondateur** |
| A6 | **Le CTA secondaire du hero Accueil utilise un libelle different entre copy et UX.** Le copy v1 dit "Je suis distributeur / reseau — Nous contacter" (formule en premiere personne). L'UX dit "Je suis distributeur/reseau — Nous contacter". La difference est mineure (slash vs slash-espace) mais le pack strategie utilisait "Nous contacter" sans la premiere partie. Le formulaire Contact a un CTA distinct "Envoyer ma demande". | P2 | Incoherence mineure dans le wording — le visiteur comprendra, mais la regle copy dit "un meme CTA = un meme libelle partout sur le site". | `copy-v1-huggo.md §Accueil Hero FR` : "CTA secondaire : Je suis distributeur / reseau — Nous contacter". `pack-strategie-huggo.md §Conversions` : "CTA secondaire : Nous contacter". | **L'Agent 3 harmonise le libelle exact du CTA secondaire a travers tous les documents.** S'assurer que le CTA de bifurcation ("Je suis distributeur") est utilise UNIQUEMENT dans le hero de l'Accueil, et que "Nous contacter" est le libelle standard sur les autres pages. Effort : 15 min. | **Agent 3** |

### B) Contenu / Credibilite

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|-----------------|----------|----------------|-------|
| B1 | **Sources des chiffres France (Collectivity) non citees.** Les 4 chiffres de la section 2 (400K exploitations, 62% communes, 6M Français, 10K camions) sont presentes comme des faits mais les sources ne sont pas citees dans le copy. Le copy indique explicitement `[SOURCES A CITER]`. | P1 | **Risque de credibilite.** En B2G (collectivites), les decideurs attendent des sources verifiables (INSEE, rapports ministeriels). Des chiffres sans source sont percus comme du marketing, surtout sur une page qui s'adresse a des elus et fonctionnaires. | `copy-v1-huggo.md §Collectivity section 2 FR` : "Sources a confirmer — donnees sectorielles France. `[SOURCES A CITER]`". `pack-strategie-huggo.md §Proof Inventory #21` : "Chiffres ruraux France — Disponible (PRD) — sources a confirmer". | **L'Agent 3 recherche et ajoute les sources (INSEE, rapports Senat, DGAL) en micro-texte sous les chiffres.** Format : "Source : INSEE, Recensement agricole 2020" en type.caption. Effort : 2h de recherche + ajout dans le copy v1. | **Agent 3** |
| B2 | **Resultats quantifies de l'IA predictive absents.** Le palier Marketing mentionne un "modele predictif" base sur la meteo et les evenements locaux, mais les resultats concrets ne sont pas fournis. Le partenariat Centrale Paris est cite mais sans donnees chiffrees. | P1 | **Claim non prouvable.** Un claim d'IA predictive sans resultat mesurable est percu comme du marketing. Le palier Marketing se vend plus cher que Smart — il doit prouver une valeur superieure avec des chiffres, pas juste avec un nom de partenaire academique. | `pack-strategie-huggo.md §Proof Inventory #19` : "Resultats quantifies IA predictive — `[A FOURNIR]` — Claim predictif non prouvable (P1)". `pack-strategie-huggo.md §Differenciation #5` : "Resultats quantifies A FOURNIR". | **Le fondateur fournit des resultats chiffres (ex : "reduction de X% des invendus", "augmentation de Y% des ventes les jours de pluie").** Si les resultats ne sont pas disponibles, attenuer le claim dans le copy : remplacer "modele predictif" par "modele predictif en cours de deploiement, developpe avec Centrale Paris" — signaler l'honnetete plutot que le vide. Effort : fondateur fournit les chiffres OU Agent 3 atenue le claim. | **Fondateur** (chiffres) ou **Agent 3** (attenuation) |
| B3 | **Logos des 3 distributeurs CHR non fournis et autorisation non obtenue.** Le claim "3 distributeurs CHR deploient HUGGO a l'echelle nationale" est un argument de poids, mais aucun logo ni nom n'est affiche. | P1 | **Social proof distributeurs incomplete.** La page Franchise repose fortement sur ce claim (sections 3, 5, 6) mais sans logo ni nom, le visiteur n'a aucun moyen de verifier. Un chiffre sans preuve visuelle est percu comme une affirmation marketing. | `pack-strategie-huggo.md §Proof Inventory #15` : "Logos 3 distributeurs CHR — `[A FOURNIR]` — autorisation requise — Social proof distributeurs absente". `component-handoff-huggo.md §Assets` : non liste. | **Le fondateur obtient l'autorisation d'afficher les logos (ou au minimum les noms).** En attendant, le fallback actuel ("3 distributeurs CHR font confiance a HUGGO") est acceptable mais le fondateur devrait prioriser cette autorisation. Effort : 1-3 jours de negociation commerciale. | **Fondateur** |
| B4 | **Copy bilingue FR/EN : absence de FAQ sur la page Accueil dans la structure scannable.** Le plan scannable de l'Accueil (copy v1) liste 9 sections mais la FAQ objections de l'Accueil est fournie separement, hors du plan scannable numerote. L'UX page spec (Agent 2) ne liste pas non plus de section FAQ pour la page Accueil. | P2 | **Incoherence structurelle.** Les 4 FAQ objections de l'Accueil existent dans le copy mais ne sont pas referees dans la structure de page. Risque qu'elles ne soient pas implementees par l'Agent 7 faute de section correspondante dans l'architecture. | `copy-v1-huggo.md §Accueil Plan scannable` : 9 sections listees, aucune "Objection handling" ou "FAQ". Mais 4 questions/reponses FR/EN sont ecrites apres la section 9. `UX-Architecture-v1-huggo.md §Accueil Sections` : 9 sections, pas de FAQ. | **L'Agent 2 et l'Agent 3 harmonisent : soit la FAQ Accueil est ajoutee comme section 10 (entre Social proof et Pre-footer CTA ou apres Mascotte), soit elle est explicitement marquee comme integree dans une section existante (ex: apres Social proof).** Effort : 15 min de clarification. | **Agent 2** + **Agent 3** |
| B5 | **Le copy de la page How-it-works mentionne une FAQ "Comment ça marche" mais l'UX spec prevoit aussi une FAQ.** La page How-it-works a une FAQ dans le copy (3 questions) ET dans l'UX spec. Cependant la motion strategy pour cette page ne mentionne pas d'accordion pour la FAQ — elle mentionne les 4 etapes comme signature moment mais pas les accordions FAQ. | P2 | **Risque d'omission de la FAQ lors de l'implementation.** Si le motion spec pour How-it-works ne liste pas les accordions, l'Agent 7 pourrait oublier les interactions FAQ. | `motion-strategy-huggo.md §How-it-works Sequence` : pas d'item "FAQ accordeons" dans la liste des 9 elements animes. Les accordeons sont mentionnes pour Retail, Franchise, Collectivity, Tarifs mais pas pour How-it-works. `copy-v1-huggo.md §How-it-works` : 3 FAQ questions presentes. `UX-Architecture-v1-huggo.md §How-it-works sections` : section 7 = "Pre-footer CTA" mais pas de section FAQ numerotee (les FAQ sont dans "FAQ objections" hors structure). | **L'Agent 4 ajoute un item "FAQ accordeons" dans la sequence d'animation de la page How-it-works.** Meme pattern que les autres pages (Accordion open/close, 250ms ease-in-out, Clic, Tier 1). Et l'Agent 2 ajoute une section FAQ dans le page spec. Effort : 10 min. | **Agent 4** + **Agent 2** |

### C) SEO structurel

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|-----------------|----------|----------------|-------|
| C1 | **Titles et meta descriptions presents pour toutes les pages FR, mais les EN ne sont documentes que pour certaines pages dans le copy v1.** Les SEO meta FR/EN sont presents pour Accueil, Retail, Franchise, Collectivity dans le copy v1. Pour les pages How-it-works, Pricing, About et Contact, les meta sont dans l'UX spec (Agent 2) mais uniquement en FR. | P1 | **SEO EN incomplet.** Sans meta descriptions EN, les pages anglaises apparaitront dans Google avec des extraits auto-generes souvent incoherents. Le marche EN est secondaire mais les hreflang impliquent que les pages EN seront indexees. | `copy-v1-huggo.md` : les SEO blocks pour How-it-works, Pricing, About et Contact ne contiennent PAS de version EN (pas de Title EN / Meta description EN fournis). Les 4 premieres pages (Accueil, Retail, Franchise, Collectivity) ont les meta FR + EN. | **L'Agent 3 complete les meta titles et descriptions EN pour les 4 pages manquantes (How-it-works, Pricing, About, Contact).** Suivre le meme format que les pages deja couvertes (longueur, structure). Effort : 30 min. | **Agent 3** |
| C2 | **Hierarchie Hn coherente sur toutes les pages — un seul H1 par page, H2 par section.** Verifie et conforme. | -- | Pas d'issue. | Toutes les page specs et le copy respectent un H1 unique + H2 par section + H3 pour les sous-elements. | Aucun fix requis. | -- |
| C3 | **Liens internes crawlables — coherents entre UX et copy.** Chaque page spec definit des liens internes vers les pages connexes. Les CTA pointent vers /contact, /pricing, /how-it-works. La navigation header offre toutes les pages. | -- | Pas d'issue. | `UX-Architecture-v1-huggo.md §SEO structurel v0` de chaque page. | Aucun fix requis. | -- |
| C4 | **Sitemap XML et robots.txt planifies dans le tech stack.** Confirme : `@astrojs/sitemap` genere le sitemap avec hreflang. robots.txt bloque les pages placeholder (legal, privacy, blog). Schema.org prevu (Organization, WebSite, FAQPage, BreadcrumbList). | -- | Pas d'issue. | `tech-stack-v1-huggo.md §E.6 — SEO technique`. | Aucun fix requis. | -- |

### D) Accessibilite & Motion

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|-----------------|----------|----------------|-------|
| D1 | **Contraste texte blanc sur fond vert brand (#4A9B4A) : ratio a verifier.** Le token `color.text.on-brand` est blanc pur (#FFFFFF) sur `color.surface.brand` (#4A9B4A). Le ratio calcule est environ 3.6:1 en sRGB — en dessous du seuil WCAG AA de 4.5:1 pour le texte normal. Les headings en texte large (18px bold ou 24px regular) passent le seuil 3:1, mais le body text normal (16px 400) ne passe pas 4.5:1. | P1 | **Non-conformite WCAG AA pour le texte body sur fond brand.** Le header sticky, le footer, les hero sections et les bandes pre-footer CTA utilisent tous ce fond vert avec du texte blanc. Le body text (liens header en `type.body-md` 16px regular) sur ce fond echoue a 4.5:1. Le Lighthouse Accessibility cible > 95 serait impacte. Risque legal en France (RGAA). | `tokens.json` : `color.surface.brand` = oklch(0.58 0.14 142) / fallback #4A9B4A. `color.text.on-brand` = oklch(1.0 0 0) / #FFFFFF. Le design system dit "Contraste texte blanc/fond vert >= 4.5:1 verifie" (`component-handoff-huggo.md §Section Brand`), mais le ratio reel #FFFFFF sur #4A9B4A est ~3.6:1 selon les calculateurs WCAG. | **L'Agent 4 doit verifier le ratio exact avec la valeur Oklch reelle et, si inferieur a 4.5:1, assombrir le vert brand de 1-2 crans de lightness** (ex : passer de oklch(0.58) a oklch(0.50) pour `surface.brand`). Alternative : utiliser le vert brand uniquement pour les large text (H1, CTA labels en 16px bold) et assombrir specifiquement pour le body text. Effort : 1h de verification + ajustement tokens. | **Agent 4** |
| D2 | **Contraste texte sombre sur fond accent orange en dark mode.** En dark mode, `text.on-accent` passe a oklch(0.13 0.01 70) / #1A1208 (texte sombre) sur `accent.action` oklch(0.70 0.15 70) / #E58A0A. Ce ratio doit etre verifie : #1A1208 sur #E58A0A est environ 6.5:1 — suffisant. Toutefois, pour les etats hover et pressed (couleur accent plus sombre), le ratio peut descendre. | P2 | Le CTA primaire en dark mode est un element de conversion critique. Si le contraste est insuffisant sur les etats hover/pressed, le texte devient illisible momentanement. | `tokens.json §theme.dark` : `text.on-accent` #1A1208 sur `accent.action-hover` #D07A09 (~5.2:1 — OK) et `accent.action-pressed` #BB6B08 (~4.5:1 — limite). | **L'Agent 4 verifie le ratio pour chaque paire text.on-accent / accent.action-*, accent.action-hover, accent.action-pressed en dark mode.** Si `action-pressed` tombe sous 4.5:1, eclaircir legerement le texte ou assombrir le fond pressed. Effort : 30 min. | **Agent 4** |
| D3 | **Navigation clavier et focus visible correctement specifies.** Focus ring 2px `border.focus` offset 2px sur tous les composants interactifs. Skip-to-content premier element focusable. Tab order logique. | -- | Conforme. | `component-handoff-huggo.md` : chaque composant a un etat "Focused" avec ring specs. `design-system-v1-huggo.md §Accessibilite` : "Skip-to-content premier element focusable". `tech-stack-v1-huggo.md` : "Skip-to-content premier focusable". | Aucun fix requis. | -- |
| D4 | **Labels formulaires et erreurs accessibles correctement specifies.** `for/id` label-input, `aria-describedby` messages erreur, `aria-required`, `aria-invalid`. Erreur = texte + icone + bordure (pas uniquement la couleur). | -- | Conforme. | `component-handoff-huggo.md §Form Input` : "for/id label-input. aria-describedby messages erreur. aria-required=true. aria-invalid=true si erreur." | Aucun fix requis. | -- |
| D5 | **Reduced motion correctement implemente a tous les tiers.** Tier 1 : CSS animations desactivees, hover conserve couleurs. Tier 2 : GSAP desactive, elements visibles immediatement, Lenis desactive. Tier 3 : Spline statique ou remplace par image. Logo bar arretee. | -- | Conforme. | `motion-strategy-huggo.md §Reduced motion fallback par tier`. `tech-stack-v1-huggo.md §GSAP islands pattern` : `@media (prefers-reduced-motion: reduce)` et `<noscript>` fallbacks documentes. | Aucun fix requis. | -- |
| D6 | **Budgets animation conformes aux specs.** Micro <= 150ms, transitions 200-300ms, entrees <= 500ms. Seuls transform + opacity animes (sauf cas documentes : max-height pour accordeons, box-shadow pour hover). | -- | Conforme. | `motion-strategy-huggo.md §Table des effets autorises` : toutes les durees dans les budgets. `component-handoff-huggo.md §Table effets & contraintes` : proprietes animees documentees. | Aucun fix requis. | -- |
| D7 | **8 etats de composants definis pour chaque composant principal.** Default, Hover, Focused, Pressed, Disabled, Loading, Error, Success — les 8 sont couverts pour Button Primary, Button Secondary, Button Tertiary, Badge, Card, Accordion, Form Input, Form Select, Form Textarea. | -- | Conforme. | `component-handoff-huggo.md §D et design-system-v1-huggo.md §Composants`. | Aucun fix requis. | -- |

### E) Performance & Qualite technique

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|-----------------|----------|----------------|-------|
| E1 | **Budgets perf PRD respectes dans le tech stack et le motion strategy.** LCP < 2.5s, CLS < 0.1, INP < 200ms, Lighthouse Perf > 90, A11y > 95. Le tech stack detaille les strategies pour chaque metrique. Le motion strategy est aligne (INP <= 200ms, CLS <= 0.1 sur chaque page). La page Contact a des cibles plus strictes (LCP < 2.0s, INP <= 150ms, CLS <= 0.05). | -- | Conforme. | `tech-stack-v1-huggo.md §A — Contraintes PRD` et `§F — Budgets perf`. `motion-strategy-huggo.md` : budget perf par page. | Aucun fix requis. | -- |
| E2 | **tokens.json coherent avec design-system-v1.** Chaque token reference dans le design system existe dans tokens.json avec les memes valeurs Oklch et fallback hex. Les dark mode overrides dans tokens.json correspondent a la table du component handoff. Structure W3C Design Tokens 2025.10 respectee. | -- | Conforme. Verification croisee effectuee sur les couleurs, typographie, spacing, radius, shadow, motion, grid. | `tokens.json` : tous les tokens presents. `design-system-v1-huggo.md §B` : memes valeurs. `component-handoff-huggo.md §Dark mode` : memes overrides. | Aucun fix requis. | -- |
| E3 | **Dark mode overrides complets.** Tous les tokens de couleur et d'ombre ont un override dark mode dans tokens.json. Les tokens invariants (typographie, spacing, radius, grid, motion) sont explicitement marques comme ne changeant pas. | -- | Conforme. | `tokens.json §theme.dark` : 20 tokens de couleur + 5 tokens d'ombre overrides. `design-system-v1-huggo.md §Theming — Tokens invariants`. `component-handoff-huggo.md §Dark mode token overrides` : table complete de 25+ tokens. | Aucun fix requis. | -- |
| E4 | **Stack Astro 5 coherente avec les besoins Tier 3.** Astro islands architecture permet le lazy-loading du Spline React island uniquement sur la page Accueil, uniquement sur desktop, uniquement avec WebGL. Le budget JS est gere : 0 KB framework + 33 KB GSAP/Lenis eager + 150-300 KB Spline lazy. | -- | Conforme. | `tech-stack-v1-huggo.md §B — Frontend Decision Framework` et `§F — Patterns Tier 3`. | Aucun fix requis. | -- |
| E5 | **Le PRD mentionne "FID < 100ms" mais le tech stack et le motion strategy utilisent "INP < 200ms".** FID (First Input Delay) a ete remplace par INP (Interaction to Next Paint) comme Core Web Vital par Google en mars 2024. Le tech stack a correctement adopte INP. | P2 | Incoherence mineure entre le PRD et les delivrables downstream. Pas d'impact reel car INP est la metrique actuelle et les agents ont correctement mis a jour. | `PRD-huggo.md §12` : "FID < 100ms". `tech-stack-v1-huggo.md §A` : "INP < 200ms". `motion-strategy-huggo.md` : "INP <= 200ms". | **Aucun fix necessaire.** Le PRD est un input historique. Les agents ont correctement modernise la metrique. Si le PRD est mis a jour, remplacer FID par INP. Effort : 1 min. | **Agent 5** (optionnel) |
| E6 | **La license GSAP doit etre verifiee.** Le tech stack identifie correctement ce risque : GSAP est gratuit pour les sites ou les utilisateurs ne paient pas pour acceder au site (Standard License "No Charge"), mais une verification est necessaire. | P2 | Si le site HUGGO qualifie comme un site commercial (il genere des leads pour un produit payant), la license GSAP "No Charge" pourrait ne pas s'appliquer. Cout : ~$150/an pour la Business License. Impact financier faible, mais risque legal si ignore. | `tech-stack-v1-huggo.md §Risques` : "GSAP license — Faible — Verifier que le site vitrine HUGGO qualifie pour la license gratuite GSAP". | **L'Agent 5 (ou le fondateur) verifie les conditions de la license GSAP Standard.** Un site vitrine B2B qui ne vend rien directement devrait qualifier pour la license gratuite, mais confirmer explicitement. Si non : alternatives Motion One (open source) ou CSS animations pures. Effort : 30 min de lecture de la license. | **Agent 5** |

### F) Tracking & Data

| # | Issue | Sev. | Impact business | Evidence | Fix recommandé | Owner |
|---|-------|------|-----------------|----------|----------------|-------|
| F1 | **12 evenements du tracking plan v0 (pack strategie) presents et implementes dans le tech stack.** Les 12 evenements sont documentes avec leurs triggers techniques et les appels Plausible custom correspondants. | -- | Conforme. | `tech-stack-v1-huggo.md §E.2 — Tracking plan` : 12 evenements mappes (demo_form_submit, contact_form_submit, cta_demo_click, cta_contact_click, whatsapp_click, case_study_download, newsletter_signup, page_view, scroll_depth, vertical_click, language_switch, pricing_tier_view). `pack-strategie-huggo.md §Tracking plan v0` : memes 12 evenements. | Aucun fix requis. | -- |
| F2 | **Plausible configure sans cookies — pas de banniere de consentement necessaire.** Confirme : Plausible est no-cookie par design, pas de transfert de donnees vers des tiers, GDPR-compliant sans banniere. Le tech stack justifie explicitement ce choix. | -- | Conforme. | `tech-stack-v1-huggo.md §E.2 — Analytics` : "Pas de cookies → pas de banniere consentement GDPR (conforme par design)." | Aucun fix requis. | -- |
| F3 | **Les evenements `case_study_download` et `newsletter_signup` sont prevus dans le tracking plan mais les fonctionnalites correspondantes ne sont pas dans le scope.** Le cas client PDF est marque `[A FOURNIR]` et la newsletter n'est pas prevue dans les specs. | P2 | Pas d'impact immediat — ces evenements sont P1/P2 dans le tracking plan et ne seront simplement pas declenches tant que les fonctionnalites n'existent pas. Le code de tracking devra etre ajoute quand ces fonctionnalites seront implementees. | `pack-strategie-huggo.md §Micro-conversions` : "Telechargement d'un cas client PDF `[A FOURNIR]`" et "Newsletter / actualites HUGGO". `tech-stack-v1-huggo.md §E.2` : les deux evenements sont documentes mais les triggers ne seront pas actifs sans les fonctionnalites. | **Aucun fix bloquant.** Documenter dans le backlog que ces 2 evenements seront actives quand les fonctionnalites correspondantes seront ajoutees. L'implementation du tracking est "no-op" en leur absence. | **Agent 5** (documentation) |

---

## 2) GO-LIVE GATE

### Bloqueurs P0 (a fixer AVANT tout developpement)

| # | Issue | Action requise | Responsable | Delai estime |
|---|-------|----------------|-------------|--------------|
| A1 | Coordonnees de contact absentes (email, telephone, WhatsApp) | Le fondateur fournit les 3 coordonnees | Fondateur | 1 jour |
| A2 | Domaine non decide | Le fondateur choisit, achete et configure le domaine | Fondateur | 1-3 jours |

### Issues P1 (a fixer avant le go-live)

| # | Issue | Action requise | Responsable |
|---|-------|----------------|-------------|
| A3 | Garantie/periode d'essai non fournie | Decision business fondateur + copy Agent 3 | Fondateur + Agent 3 |
| A4 | Engagement contractuel non clarifie | Decision business fondateur + copy Agent 3 | Fondateur + Agent 3 |
| A5 | Temoignages absents | Collecte d'au moins 1 temoignage commerçant | Fondateur |
| B1 | Sources chiffres Collectivity non citees | Recherche + ajout sources | Agent 3 |
| B2 | Resultats IA predictive absents | Fondateur fournit les chiffres OU Agent 3 attenue | Fondateur / Agent 3 |
| B3 | Logos distributeurs CHR non fournis | Obtenir autorisation + logos | Fondateur |
| C1 | Meta titles/descriptions EN manquants (4 pages) | Rediger les meta EN | Agent 3 |
| D1 | Contraste blanc/vert brand potentiellement insuffisant (<4.5:1) | Verifier et ajuster le token si necessaire | Agent 4 |

### Elements acceptables pour le post-launch (P2)

| # | Issue | Action |
|---|-------|--------|
| A6 | Harmonisation libelle CTA secondaire | Agent 3 clarifie la regle |
| B4 | FAQ Accueil non referencee dans la structure | Agent 2 + Agent 3 ajoutent la section |
| B5 | FAQ How-it-works absente du motion spec | Agent 4 ajoute l'item |
| D2 | Contraste text.on-accent en dark mode etats hover/pressed | Agent 4 verifie |
| E5 | FID vs INP dans le PRD | Mise a jour optionnelle du PRD |
| E6 | License GSAP a verifier | Agent 5 verifie la license |
| F3 | Evenements tracking sans fonctionnalites correspondantes | Documenter dans le backlog |

### Recommandation finale

**NO-GO** — 2 bloqueurs P0 empechent le lancement du developpement :

1. **Coordonnees de contact** (A1) — le bouton WhatsApp, le footer et la page Contact sont non fonctionnels sans numero/email/telephone.
2. **Domaine** (A2) — bloque le deploiement, les URLs canoniques, le sitemap et la configuration analytics.

**Des que les 2 P0 sont resolus** : le statut passe a **GO AVEC RESERVES** (8 issues P1 a resoudre avant le go-live, mais le developpement peut demarrer en parallele car les P1 sont principalement du contenu/copy qui peut etre integre incrementalement).

---

## 3) OPTIMIZATION BACKLOG (post-launch)

| # | Action | Priorite | Impact attendu | Effort |
|---|--------|----------|----------------|--------|
| 1 | **A/B test H1 accueil** : tester le H1 actuel ("Vos clients commandent par WhatsApp. Vous encaissez sans commission.") contre l'alternative H1-B ("Un assistant IA sur WhatsApp qui vend pour vous, 24h/24") — les deux sont dans le pack strategie | Haute | +5-15% taux de clic CTA si le meilleur H1 est identifie | 2h setup Plausible goals |
| 2 | **Ajouter les temoignages clients** des que disponibles (emplacements prevus dans le copy, sections pretes dans l'architecture). Priorite : 1 temoignage Retail, 1 temoignage Franchise | Haute | +10-20% confiance et conversion sur les pages verticales | 1-2h integration par temoignage |
| 3 | **Ajouter la video demo** sur /how-it-works (façade pattern prevu dans le tech stack). La section est placeholdee — l'embed se fait sans modification d'architecture | Haute | +15-25% comprehension produit, +temps passe sur page | 30 min integration |
| 4 | **Ajouter les screenshots conversation WhatsApp** dans le hero Retail et la section demo conversation de /how-it-works. Les placeholders sont prevus | Haute | Preuve visuelle du produit en action — impact direct sur la conversion | 1h integration |
| 5 | **Deployer le modele Spline 3D** quand il est pret (le site fonctionne avec le fallback image statique en attendant — l'architecture island le permet sans refactoring) | Moyenne | Signature moment du hero — differenciation vs concurrents | 2-4h integration |
| 6 | **Monitorer le taux de spam formulaire** avec le honeypot. Si le spam depasse un seuil acceptable (>10% des soumissions), upgrader vers Cloudflare Turnstile | Moyenne | Protection des leads sans friction utilisateur | 1h implementation Turnstile |
| 7 | **Proxy Plausible** via un sous-domaine custom pour eviter le blocage par les adblockers (~15% des visiteurs) | Moyenne | +15% de couverture analytique | 1h configuration |
| 8 | **Ajouter le cas client PDF** (micro-conversion) quand disponible. L'evenement tracking `case_study_download` est deja prevu | Basse | Micro-conversion supplementaire, contenu de nurturing pour les leads non prets | 2h production PDF + 30 min integration |
| 9 | **Page blog** : l'architecture est extensible (URL /blog reservee). Quand le contenu editorial est pret, Astro supporte nativement le Markdown/MDX | Basse | SEO long-tail, trafic organique incremental | Variable selon le volume de contenu |
| 10 | **Pages legales** : mentions legales et politique de confidentialite — URLs reservees, contenu hors scope initial mais obligatoires legalement avant lancement | Haute (legal) | Conformite legale — obligatoire en France pour tout site professionnel. Le robots.txt bloque ces URLs en attendant le contenu | 4h de redaction juridique (fondateur ou juriste) |

---

## NEXT OWNERS

### Fondateur (decisions business bloquantes)

- **[P0] A1** : Fournir email, telephone, numero WhatsApp Business
- **[P0] A2** : Decider et acheter le domaine
- **[P1] A3** : Decider la politique de garantie / periode d'essai
- **[P1] A4** : Clarifier l'engagement contractuel (avec ou sans, duree)
- **[P1] A5** : Collecter au moins 1 temoignage commerçant (photo + citation + nom/metier/ville)
- **[P1] B2** : Fournir les resultats chiffres de l'IA predictive (ou autoriser l'attenuation du claim)
- **[P1] B3** : Obtenir l'autorisation d'afficher les logos des 3 distributeurs CHR

### Agent 2 (UX Architecture)

- **[P2] B4** : Ajouter une section FAQ dans le page spec de l'Accueil (ou referencer explicitement son placement)
- **[P2] B5** : Ajouter une section FAQ dans le page spec de How-it-works

### Agent 3 (Copywriting)

- **[P1] A3** : Rediger la reponse FAQ "Et si ca ne marche pas" une fois la politique definie
- **[P1] A4** : Rediger les reponses FAQ engagement et essai une fois la politique definie
- **[P1] B1** : Rechercher et ajouter les sources INSEE/sectorielles pour les chiffres Collectivity
- **[P1] B2** : Attenuer le claim IA predictive si les resultats chiffres ne sont pas fournis
- **[P1] C1** : Rediger les meta titles et descriptions EN pour How-it-works, Pricing, About, Contact
- **[P2] A6** : Harmoniser le libelle du CTA secondaire a travers les documents

### Agent 4 (Design System)

- **[P1] D1** : Verifier le ratio de contraste blanc/vert brand et ajuster le token `surface.brand` si necessaire
- **[P2] D2** : Verifier les ratios de contraste pour `text.on-accent` en dark mode sur tous les etats du CTA
- **[P2] B5** : Ajouter un item "FAQ accordeons" dans la motion strategy de How-it-works

### Agent 5 (Tech Stack)

- **[P2] E6** : Verifier la license GSAP pour le cas d'usage site vitrine B2B
- **[P2] F3** : Documenter que les evenements `case_study_download` et `newsletter_signup` sont inactifs tant que les fonctionnalites ne sont pas implementees
