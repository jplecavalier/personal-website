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
  warning = FALSE
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
