+++
title = "data.table : un incontournable!"
time_start = 2017-05-26T17:00:00
time_end = 2017-05-26T17:30:00
abstract = "La classe prédestinée à stocker des données structurées en R est le data.frame. Conformément à chaque classe développée dans le coeur de R, on ne peut accéder à un objet de classe data.frame directement en référence, on doit créer une copie de l’objet à chaque fois où on veut en modifier une partie et ensuite le réassigner. Introduite en 2006 par Matt Dowle, la classe data.table, provenant du package du même nom, est une extension du data.frame permettant de contourner cette obligation. En effet, un objet de classe data.table permet une modification de lui-même en référence, ce qui devient nécessaire lorsque le jeu de données utilisé s’approche de l’espace disponible en mémoire sur un poste de travail. De plus, un concept de clés, permettant d’effectuer une recherche par arbres binomiaux, a été introduit afin de rendre la jointure d’objets de classe data.table beaucoup plus efficace que la méthode utilisée d’emblée pour une jointure de deux objets de classe data.frame. Ma présentation vise à faire une introduction de la classe data.table à des utilisateurs qui ne l’ont jamais utilisée. Les concepts de base seront illustrés à l’aide d’exemples simples."
abstract_short = ""
event = "R à Québec 2017"
event_url = "http://raquebec.ulaval.ca/2017/"
location = "Salle Hydro-Québec, Pavillon Alphonse-Desjardins, Université Laval <br> Québec, QC, Canada"

# Is this a selected talk? (true/false)
selected = false

# Projects (optional).
#   Associate this talk with one or more of your projects.
#   Simply enter the filename of your project file in `content/project/`.
#   Otherwise, set `projects = []`.
projects = []

# Links (optional).
url_slides = "https://jplecavalier.github.io/r-quebec-2017/20170526_r_a_quebec.html"
url_github = "https://github.com/jplecavalier/r-quebec-2017"

# Does the content use math formatting?
math = false

# Does the content use source code highlighting?
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = "headers/r-a-quebec-2017.png"
+++
