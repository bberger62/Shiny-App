library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "World Agricultural Output, 1983-2013"),
  dashboardSidebar(
    sidebarUserPanel("By: Ben Berger"),
    sidebarMenu(
      menuItem('World Map',tabName = 'map',icon=icon('map')),
      menuItem('Production vs GDP', tabName = 'scatter', icon=icon('map')),
      menuItem('Side by Side', tabName = 'sbs', icon = icon('map')),
      menuItem('Top 5 Produce', tabName = 'Top5', icon = icon('map'))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "scatter",
              h2('Agricultural Output vs. GDP'),
              box(plotlyOutput('GDP'), width=10)),
      
      
      
      
      tabItem(tabName = 'sbs',
              h2('Comparing GDPPC and Item Production Over Time'),
              fluidRow(
                box(plotlyOutput('gdppercapi'), width=10),
                  selectizeInput(inputId='country',
                                 label="Select Country:",
                                 choices=unique(merge4$Country.Name)),
                box(plotlyOutput('productprod'), width=10),
                  selectizeInput(inputId='product',
                                 label="Select Product:",
                                 choices=unique(merge4$Item)),
              )
      ),
      
      
      
      
      
      
      
      tabItem(tabName='Top5',
              h2('Top Five Outputs in Different Years'),
              fluidRow(
                selectizeInput(inputId='country2',
                               label="Select Country:",
                               choices=unique(merge4$Country.Name)),
                box(plotlyOutput('top5'), width=10),
                    selectizeInput(inputId='year1',
                                   label='Select Year:',
                                   choices=unique(merge4$year)),
                box(plotlyOutput('top52'), width=10),
                  selectizeInput(inputId='year2',
                                 label='Select Year:',
                                 choices=unique(merge4$year)),
              )
      ),
      
      
      tabItem(tabName='map',
              h2('Output Around the World'),
              fluidRow(
                box(plotlyOutput("map", height=150)),
                box(title= 'Year',
                    sliderInput("slider", "Year:", 1983, 2013, 1983))
              )
              )
    )
  )
)



#                         fluidRow(
#                           box(plotlyOutput("map", height=150)),
# 
#                           box(title = 'Year',
#                               sliderInput("slider", "Year:", 1983, 2013, 1983)
#                               )





      #                           tabItem(tabName='Top5',
      #                                   h2('Top Five Ouputs in Different Years'),
      #                                   fluidRow(
      #                                     column(2,
      #                                            br(),
      #                                            selectizeInput(
      #                                              inputId='year1',
      #                                              label='Select Year:',
      #                                              choices = unique(merge4$year)
      #                                            ),
      #                                            br(),
      #                                            selectizeInput(
      #                                              inputId='year2',
      #                                              label='Select Year:',
      #                                              choices = unique(merge4$year)
      #                                            ),
      #                                            br(),
      #                                            selectizeInput(
      #                                              inputId='country2',
      #                                              label='Select Country:',
      #                                              choices = unique(merge4$Country.Name)
      #                                            )
      #                                     ),
      #                                     column(5,
      #                                            br(),
      #                                            plotlyOutput('top5')),
      #                                     column(5,
      #                                            br(),
      #                                            plotlyOutput('top52')),
      #                                     )
      #                                   ),
      #                           )
      #                       )
      # )
      #       
      
      


















# dashboardPage(skin = "red",
#             dashboardHeader(
#               title = "World Agricultural Output, 1983-2013",
#               titleWidth = 300
#               ),
# 
#             dashboardSidebar(
#               sidebarUserPanel("By: Ben Berger"),
#               
#             ),
#             
#             dashboardBody(
#               
#               
#             )
# )

#                         
#                         sidebarMenu(
                          # menuItem('World Map',
                          #   tabName='Map', icon=icon("map")),
#                           
#                           menuItem('Production vs GDP',
#                             tabName = 'Scatter', icon=icon("map")),
#                           
#                           menuItem('Side by Side',
#                                    tabName='Sbs', icon=icon("map")),
#                           
#                           
#                           menuItem('Top 5 Produce',
#                                    tabName = 'Top5', icon=icon('trophy')),
#                         )
#                       )
# )

                      

# 
#                         sidebarMenu(
#                           menuItem('World Map',
#                                     tabName='Map', icon=icon("map")),
# 
#                           menuItem('Production vs GDP',
#                                     tabName = 'Scatter', icon=icon("map")),
# 
                          # menuItem('Side by Side',
                          #           tabName='Sbs', icon=icon("map")),
# 
                          # menuItem('Top 5 Produce',
                          #          tabName = 'Top5', icon=icon('trophy'))
#                         )
#                       ),
#                       dashboardBody(
#                         tabItems(
#                           
#                     
#                           tabItem(tabName='Scatter',
#                                   h2('Agricultural Output vs. GDP'),
#                                   box(plotlyOutput('GDP'), width=10))
#                         ),
#                       
#                           
#                           tabItem(tabName='Sbs',
#                                   h2('Comparing GDPPC and Item Production Over Time'),
#                                   fluidRow(
#                                     column(2,
#                                            br(),
#                                            selectizeInput(
#                                              inputID='country',
#                                              label="Select Country:",
#                                              choices=unique(merge4$Country.Name)
#                                            ),
#                                            br(),
#                                            selectizeInput(
#                                              inputID='product',
#                                              label="Select Product:",
#                                              choices = unique(merge4$Item)
#                                            )
# 
#                                     ),
#                                     column(5,
#                                            br(),
#                                            plotlyOutput('gdppercapi')),
#                                     column(5,
#                                            br(),
#                                            plotlyOutput('productprod')),
#                                   )
#                           ),
# 
#                           tabItem(tabName='Top5',
#                                   h2('Top Five Ouputs in Different Years'),
#                                   fluidRow(
#                                     column(2,
#                                            br(),
#                                            selectizeInput(
#                                              inputId='year1',
#                                              label='Select Year:',
#                                              choices = unique(merge4$year)
#                                            ),
#                                            br(),
#                                            selectizeInput(
#                                              inputId='year2',
#                                              label='Select Year:',
#                                              choices = unique(merge4$year)
#                                            ),
#                                            br(),
#                                            selectizeInput(
#                                              inputId='country2',
#                                              label='Select Country:',
#                                              choices = unique(merge4$Country.Name)
#                                            )
#                                     ),
#                                     column(5,
#                                            br(),
#                                            plotlyOutput('top5')),
#                                     column(5,
#                                            br(),
#                                            plotlyOutput('top52')),
#                                     )
#                                   ),
#                           )
#                       )
# )
# 
#                                   
#                                     
#                                       
#     
                                           
                                    
 










































                                   
                                    
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
                        
                        
                      





