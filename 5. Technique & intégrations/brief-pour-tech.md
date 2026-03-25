# BRIEF POUR TECH STACK — SITE TEST

## Sources à lire (dans cet ordre)

1. `c:/00 - CLAUDE/Sites_vitrines/2. Architecture & UX conversion/UX-Architecture-v1.md` — pages, structure, besoins édition
2. `c:/00 - CLAUDE/Sites_vitrines/4. Branding-UI & design system/design-system-v1-SITE-TEST.md` — design system, premium effects strategy, exigences stack

## Contexte projet

- Site de l'agence elle-même — accompagnement premium de digitalisation pour PME
- Pages : Home, Offre, Contact/RDV, À propos + pages légales (5-6 pages en v1)
- Structure jeune, lancement rapide souhaité, avancement par étapes

## Besoins d'édition (post-livraison)

Zones éditables par le client sans compétences techniques :
- Témoignages (texte)
- Études de cas / réalisations
- FAQ
- Contenu blog / actualités (différé post-lancement)
- Textes simples de certaines sections

Zones NON éditables (à verrouiller) :
- Structure de pages, blocs conversion, CTA
- Design system (tokens, composants)
- SEO structurel

Éditeur : le fondateur lui-même — non-technique. Pas de développeur dédié post-livraison.

## Intégrations requises

- **Prise de RDV** : Calendly (ou équivalent) — embed sur page Contact + lien dans CTA
- **Formulaire contact** : fallback si pas de Calendly (3 champs max)
- **Analytics** : Google Analytics 4 (événements custom selon tracking plan)
- **Conformité** : RGPD — bandeau cookies, liens politique de confidentialité
- **Email** : notification formulaire → boîte mail du fondateur
- **CRM** : à définir (simple à ce stade — peut être juste l'email)

## Contraintes design (depuis agent 4)

- LCP < 2.5s
- Fonts self-hosted (DM Serif Display + DM Sans)
- Pas de Three.js ni librairies 3D
- IntersectionObserver natif pour scroll reveals (pas de GSAP lourd)
- Zones éditables balisées dans le CMS
- Effets : hero word stagger, scroll reveal, nav sticky — animations légères uniquement

## Contraintes projet

- Pas de développeur dédié post-livraison (fondateur non-technique)
- Budget : non spécifié — recommande le minimum viable au bon niveau de qualité
- Délais : mise en ligne rapide souhaitée
- Localisation : France — RGPD obligatoire
- Hébergement : à recommander

## Mission

Lis les deux fichiers sources ci-dessus, puis produis tes 6 livrables (Tech Requirements Summary, Cadre décision frontend, Cadre décision backend, CMS & modèle de contenu, Integrations Plan, Execution Brief Tech) en suivant les instructions de ton CLAUDE.md.
