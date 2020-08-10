library(shiny)
library(shinydashboard)
library(plotly)
library(shinythemes)
library(tidyverse)
merge4 <- readr::read_csv("./merge4.csv")
mapdata = merge4 %>%
  group_by(Country.Name, Country.Code, year) %>%
  summarise(tot=sum(prod))
