library(extrafont)

options(
  blogdown.author = "J.P. Le Cavalier",
  blogdown.ext = ".Rmd",
  blogdown.subdir = "post",
  blogdown.yaml.empty = TRUE,
  blogdown.new_bundle = TRUE,
  datatable.print.nrows = 10L,
  width = 1000L,
  DT.options = list(
    dom = "lrtip",
    buttons = c("copy", "csv"),
    scrollX = TRUE
  )
)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  out.width = "100%",
  dev = "png",
  dpi = 300L
)

emoji <- function(keyword) {
  htmltools::tags$span(class="emoji", emo::ji(keyword))
}

datatable <- function(data, class = "display nowrap", rownames = FALSE, ...) {
  
  if(!"DT"%in%.packages()) {
    stop("The package 'DT' is not attached to the session")
  }
  
  DT::datatable(...,
    data = data,
    class = class,
    rownames = rownames
  )
  
}

ggplot2::theme_set(ggplot2::theme_minimal(base_family = "Open Sans", base_size = 14L))
ggplot2::theme_update(
  
  plot.title = ggplot2::element_text(
    family = "Ubuntu",
    face = "bold"
  ),
  plot.subtitle = ggplot2::element_text(
    family = "Ubuntu",
    face = "bold"
  )
  
)
ggplot2::update_geom_defaults("text", list(family = ggplot2::theme_get()$text$family))
ggplot2::update_geom_defaults("label", list(family = ggplot2::theme_get()$text$family))
