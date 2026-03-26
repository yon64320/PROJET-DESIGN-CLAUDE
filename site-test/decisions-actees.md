# DÉCISIONS ACTÉES — SITE TEST
Date : 2026-03-25

---

## Décisions de structure

| Point | Décision |
|-------|----------|
| Page Réalisations v1 | **Placeholder honnête** avec CTA — page existante, message "Nos premiers cas arrivent — parlons du vôtre" + bouton Calendly |
| Page À propos | **Oui, en v1** — fondateur visible, photo + récit + "pourquoi cette approche" |
| Contact / RDV | **Calendly** — lien à ajouter par le client. Spec d'intégration ci-dessous. |

## Navigation unifiée (tous agents alignés)

```
Logo | Offre | À propos | [CTA sticky : Réserver mon appel]
```

- Réalisations : absente de la nav en v1 (page placeholder accessible via footer uniquement)
- Mobile : hamburger avec CTA en premier

---

## Process en 5 étapes (validé par le client)

| # | Nom | Ce qu'on fait | Livrable client | Temps demandé au client |
|---|-----|--------------|-----------------|------------------------|
| 1 | Cadrage | Audit de l'existant + définition des objectifs business | Brief stratégique | 1h |
| 2 | Architecture | Structure du site + parcours de conversion | Sitemap validé | 30 min |
| 3 | Design | Maquettes sur mesure + design system | Maquettes à valider | 1h |
| 4 | Intégration | Développement + automatisations + outils IA | Site en staging | 1h (recette) |
| 5 | Lancement | Déploiement + tracking + accompagnement | Site en ligne | — |

**À compléter par le client avant intégration :**
- Délais indicatifs par étape (ex : "Étape 1 : 3 jours / Étape 4 : 2 semaines")
- Prix ou fourchette si communication souhaitée (optionnel)

---

## Spec Calendly — intégration prête à brancher

### Configuration à faire sur calendly.com

1. Créer un compte sur [calendly.com](https://calendly.com) (plan gratuit suffisant)
2. Créer un **Event Type** avec ces paramètres :
   - Nom : "Appel découverte — 30 min"
   - Durée : 30 minutes
   - Type : 1-on-1
   - Description : "On évalue ensemble si et comment on peut vous aider. Sans engagement."
   - Questions à poser au prospect (optionnel) :
     - "Décrivez votre besoin en 2 lignes" (texte libre, optionnel)
     - "URL de votre site actuel" (texte court, optionnel)
3. Récupérer le lien de l'event : `https://calendly.com/[votre-nom]/appel-decouverte`

### Où l'intégrer (le dev s'en charge)

| Emplacement | Méthode | Note |
|-------------|---------|------|
| Page `/contact` | Embed inline (widget Calendly dans la page) | Prioritaire — chargement au scroll pour la perf |
| CTA header sticky | Lien direct vers l'URL Calendly | Ouvre Calendly dans un nouvel onglet |
| CTA Hero (Home) | Lien direct | Idem |
| CTA fin de chaque section | Lien direct | Idem |
| Page Réalisations (placeholder) | Lien direct dans le bouton | Idem |

### Placeholder à utiliser partout jusqu'à ce que vous ajoutiez le lien

```
https://calendly.com/VOTRE-NOM/appel-decouverte
```

Le dev placera cette URL en variable dans le projet — vous n'aurez à changer qu'une seule valeur pour mettre à jour tous les CTAs en même temps.

---

## Statut placeholders restants (pour le client)

| Élément | Où | Action |
|---------|-----|--------|
| Lien Calendly | Variable globale du projet | À ajouter après création du compte |
| Logo agence | Assets / dossier images | À fournir au dev (SVG ou PNG @2x) |
| Photo fondateur | Page À propos | À fournir (photo pro ou bonne qualité) |
| Récit fondateur | Page À propos | À rédiger (3-5 paragraphes) |
| Mentions légales | Page `/mentions-legales` | À rédiger (nom, adresse, SIRET) |
| Politique de confidentialité | Page `/politique-confidentialite` | À rédiger ou générer (RGPD) |
