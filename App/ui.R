library(shiny)

fluidPage(
  theme=shinytheme("flatly"),
  tags$head(
    tags$style(HTML("
          .navbar .navbar-header {float: right}
        "))
  )
)