---
title: "Travail reproductible avec packrat"
authors:
  - jplecavalier
event: "R à Montreal 2018"
event_url: http://rmontreal2018.ca
related_contents: "R Conference"

location: "UQAM, Pavillon Sherbrooke, Salle 2800"
address:
  street: "200 Rue Sherbrooke O"
  city: "Montréal"
  region: "QC"
  postcode: "H2X 1X5"
  country: "Canada"
  
summary: "Cette conférence se veut une introduction aux fonctionnalités de base du package packrat."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2018-07-05T14:45:00Z
date_end: 2018-07-05T15:15:00Z
all_day: false

# Schedule page publish date (NOT talk date).
# publishDate: 2017-01-01T00:00:00Z

tags:
  - r
  - r-package
  - packrat

# Is this a featured talk? (true/false)
featured: false

links:
- icon: images
  icon_pack: fas
  name: "Présentation"
  url: https://jplecavalier.github.io/r-montreal-2018/travail-reproductible-packrat.html
- icon: github
  icon_pack: fab
  name: "Code"
  url: https://github.com/jplecavalier/r-montreal-2018

# Markdown Slides (optional).
#   Associate this talk with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
# slides: example

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
# projects:
# - internal-project

# Enable math on this page?
math: false
---

Bien que l'utilisation des langages de programmation *open-source* soit de plus en plus acceptée au sein d'organisations historiquement craintives, on entend
souvent des critiques face à l'évolution rapide de ces langages entraînant un manque de stabilité dans un contexte professionnel. Certaines compagnies ont
d'ailleurs lancé des produits un peu plus conventionnels pour faciliter l'intégration de <i class="fab fa-r-project"></i> en entreprise. J'en conviens,
certaines de ces solution fonctionnent bien, assurent un grand niveau de reproductibilité et sont bien adaptées pour les utilisateurs qui recherchent un
produit clé en main.

Mon humble opinion est que ce genre de solution commerciale propose certe une facilité de reproductibilité, mais au détriment de l'agilité habituelle à
intégrer les toutes dernières versions de *packages* toujours en développement actif. Le *package* [`packrat`](https://rstudio.github.io/packrat/) assure la
reproductibilité d'un projet dans le temps sans n'avoir aucun désavantage collatéral. L'idée derrière [`packrat`](https://rstudio.github.io/packrat/) est
d'attacher à un projet sa propre librairie de *packages* plutôt que d'utiliser les *packages* de l'utilisateur, ce qui est le comportement par défaut lorsqu'on
exécute du code <i class="fab fa-r-project"></i>.

Ma présentation se veut donc une introduction au *package* [`packrat`](https://rstudio.github.io/packrat/), à son intégration dans RStudio et à l'interraction
qu'il peut y avoir entre l'utilisation combinée de [`packrat`](https://rstudio.github.io/packrat/) et <i class="fab fa-git"></i> dans un même projet.
