---
title: "data.table: a must have!"
authors:
  - jplecavalier
event: "R à Québec 2017"
event_url: http://raquebec.ulaval.ca/2017
related_contents: "R Conference"

location: "Université Laval, Desjardins Building, Hydro-Québec Room"
address:
  street: "2325 Rue de l'Université"
  city: "Québec"
  region: "QC"
  postcode: "G1V 0A6"
  country: "Canada"
  
summary: "This talk is an introduction to basic features of the data.table package."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2017-05-26T17:00:00Z
date_end: 2017-05-26T17:30:00Z
all_day: false

# Schedule page publish date (NOT talk date).
# publishDate: 2017-01-01T00:00:00Z

tags:
  - r
  - r-package
  - data.table

# Is this a featured talk? (true/false)
featured: false

links:
- icon: images
  icon_pack: fas
  name: "Slides"
  url: https://jplecavalier.github.io/r-quebec-2017/20170526_r_a_quebec.html

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

*Please note that this talk was given in French.*

La classe prédestinée à stocker des données structurées en <i class="fab fa-r-project"></i> est le `data.frame`. Conformément à chaque classe développée dans
le coeur de <i class="fab fa-r-project"></i>, on ne peut accéder à un objet de classe `data.frame` directement en référence. On doit créer une copie de l’objet
à chaque fois où on veut en modifier une partie et ensuite le réassigner.

Introduite en 2006 par Matt Dowle, la classe `data.table`, provenant du *package* du même nom, est une extension du `data.frame` permettant de contourner cette
obligation. En effet, un objet de classe `data.table` permet une modification de lui-même en référence, ce qui devient nécessaire lorsque le jeu de données
utilisé s’approche de l’espace disponible en mémoire sur un poste de travail. De plus, un concept de clés, permettant d’effectuer une recherche par arbres
binomiaux, a été introduit afin de rendre la jointure d’objets de classe `data.table` beaucoup plus efficace que la méthode utilisée d’emblée pour une jointure
de deux objets équivalents de classe `data.frame`.

Ma présentation vise à faire une introduction de la classe `data.table` à des utilisateurs qui ne l’ont jamais utilisée. Les concepts de base seront illustrés
à l’aide d’exemples simples.
