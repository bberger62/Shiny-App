library(shiny)
library(shinydashboard)
library(DT)

dashboardPage(
  dashboardHeader(title = "World Agricultural Output, 1983-2013", titleWidth = 350),
  dashboardSidebar(
    sidebarUserPanel("By: Ben Berger"),
    sidebarMenu(
      menuItem('World Map',tabName = 'map',icon=icon('map')),
      menuItem('Production vs GDP', tabName = 'scatter', icon=icon('chart-area')),
      
      menuItem('Comparing Growth', tabName = 'growth', icon=icon('chart-line')),
      
      menuItem('Top 5 Produce', tabName = 'Top5', icon = icon('balance-scale')),
      menuItem('Side by Side', tabName = 'sbs', icon = icon('book')),
      menuItem('Data', tabName = 'data', icon = icon('map'))
    
      
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "scatter",
              h2('Agricultural Output vs. GDP'),
              h4('How has the importance of agriculture in the global economy changed over time? One would assume it has shrunk, but can we see that trend in this data? Select a year and see the total ag output of each country plotted against population, GDP and GDP per capita.'),
              box(title= 'Year',
                  sliderInput("slider3", "", 1983, 2013, 1983, sep=""), width = 10),
              box(plotlyOutput('pop1'), width=4),
              box(plotlyOutput('GDP'), width=4),
              box(plotlyOutput('gdpcc1'), width=4)),
      
      
      
      
      tabItem(tabName = 'sbs',
              h2('Comparing GDPPC and Item Production Over Time'),
              h3("Toggle between country and product to plot a country's GDP per capita and production of a given commodity over time, side by side"),
              fluidRow(
                selectizeInput(inputId='country',
                               label="Select Country:",
                               choices=unique(merge4$Country.Name)),
                selectizeInput(inputId='product',
                               label="Select Product:",
                               choices=unique(merge4$Item)),
                
                
                box(plotlyOutput('gdppercapi'), width=6),
                box(plotlyOutput('productprod'), width=6),
                
              )
      ),
      

      tabItem(tabName='growth',
              h2('Year over year growth in production and GDP per capita, 2013'),
              h3('We can take a closer look at global trends by plotting year over year growth in agricultural production against year over year GDP per capita growth. Toggle between income groups and region.'),
              fluidRow(
                selectizeInput(inputId='incomegroup',
                               label="Select Income Group:",
                               choices=unique(merge4$Income.Group)),
                selectizeInput(inputId='region1',
                               label="Select Region:",
                               choices=unique(merge4$Region)),
                box(plotlyOutput('yoy11'), width=6),
                box(plotlyOutput('yoy22'), width=6),

              )
      ),


      

      
      tabItem(tabName='Top5',
              h2('Top Five Outputs in Different Years'),
              h4('Select a country and different years to see the five largest produce categories.'),
              fluidRow(
                selectizeInput(inputId='country2',
                               label="Select Country:",
                               choices=unique(merge4$Country.Name)),
                selectizeInput(inputId='year1',
                               label='Select Year:',
                               choices=unique(merge4$year)),
                box(plotlyOutput('top5'), width=10),
                selectizeInput(inputId='year2',
                               label='Select Year:',
                               choices=unique(merge4$year)),
                box(plotlyOutput('top52'), width=10),

              )
      ),
      
      tabItem(tabName = 'data',
              h2('Data/sources'),
              h4("Population and GDP data taken form World Bank's data depository: https://data.worldbank.org/ "),
              h4("Agriculture data taken from Kaggle: https://www.kaggle.com/dorbicycle/world-foodfeed-production")),
      
      
      tabItem(tabName='map',
              h2('Output Around the World'),
              h3('Dashboard Intro'),
              h4('This dashboard uses GDP, Population and Agricultural Ouput data gathered by the World Bank between 1983 and 2013.'),
              h4('What trends can we identify in global agriculture and how do they play into economic development around the world?'),
              h4('**missing countries denote absent data in a given year.'),
              fluidRow(
        
                box(title= 'Year',
                    sliderInput("slider", "", 1983, 2013, 1983, sep="")),
                box(plotlyOutput("map", height=450), width = 12)
              )
              )
    )
  )
)



                                 
                                    
 










































                                   
                                    
#                                     box(plotlyOutput('gdppercapi'), width=15),
#                                     box(h4('Pick item to plot against GDPPC over time'),
#                                         )
#                                   ))
#                         
#                         
#                         
#                         fluidRow(
#                           box(plotlyOutput("map", height=150)),
# 
#                           box(title = 'Year',
#                               sliderInput("slider", "Year:", 1983, 2013, 1983)
#                               )
#                         )
#                       )
# )
# )
# 
#                         
                        
                        
                      





