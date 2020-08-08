library(shiny)
library(shinydashboard)
library(plotly)
library(shinythemes)
merge4 <- readr::read_csv("./merge4.csv")
mapdata = merge4 %>% group_by(year, Country.Name, Country.Code) %>%
  summarise(tot=sum(prod))
