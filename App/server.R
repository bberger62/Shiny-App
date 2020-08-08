library(shiny)
library(shinydashboard)
library(plotly)

function(input, output) {



  output$GDP = renderPlotly({merge4 %>% filter(year=='2013' & Element=='Food') %>%
      group_by(Country.Name) %>%
      summarise(output=sum(prod), GDP=mean(GDP)) %>%
      ggplot(aes(x=output, y=GDP, label=Country.Name)) +
      geom_point() +
      ggtitle('Total Output vs. GDP') +
      ylab('GDP ($)') +
      xlab('Output (1000 tonnes)')
    })







    output$map = renderPlotly({
      mapdata1 = mapdata %>% filter(., year==input$slider)
      l = list(color=toRGB("grey"), width=0.5)
      g <- list(
        showframe = FALSE,
        showcoastlines = FALSE,
        projection = list(type = 'Mercator')
      )
      fig <- plot_geo(mapdata1)
      fig <- fig %>% add_trace(
          z = mapdata1, color = mapdata1, colors = 'Blues',
          text = mapdata1$Country.Name, locations = mapdata1$Country.Code, marker = list(line = l)
      )
      fig <- fig %>% colorbar(title = '', tickprefix = '')
      fig <- fig %>% layout(
        title = 'Global Production by Year',
        geo= g
      )
    })



    output$gdppercapi = renderPlotly({
      merge4 %>% filter(Country.Name==input$country) %>%
        group_by(year) %>%
        summarise(GDPcap = mean(GDPperCap)) %>%
        ggplot(., aes(x=year, ymax=GDPcap, ymin=0)) +
        geom_linerange(color='red4', size=0.9) +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
    })
    output$productprod = renderPlotly({
      merge4 %>% filter(Country.Name==input$country & Item==input$product) %>%
        group_by(year) %>%
        summarise(outp = sum(prod)) %>%
        ggplot(., aes(x=year, ymax=outp, ymin=0)) +
        geom_linerange(color='red4', size=0.9)
    })

    output$top5 = renderPlotly({
      merge4 %>% filter(Country.Name==input$country2 & year==input$year1) %>%
        group_by(Item) %>%
        summarise(outp = sum(prod)) %>%
        arrange(desc(outp)) %>%
        top_n(5) %>%
        ggplot() +
        geom_bar(aes(x=reorder(Item, -outp),y=outp), stat='identity') +
        theme(axis.text.x=element_text(angle=45, hjust=1))
    })

    output$top52 = renderPlotly({
      merge4 %>% filter(Country.Name==input$country2 & year==input$year2) %>%
        group_by(Item) %>%
        summarise(outp = sum(prod)) %>%
        arrange(desc(outp)) %>%
        top_n(5) %>%
        ggplot() +
        geom_bar(aes(x=reorder(Item, -outp),y=outp), stat='identity') +
        theme(axis.text.x=element_text(angle=45, hjust=1))
    })
}
    
  
  #map potentially?
    


 





# fig <- plot_ly(df, type='choropleth', locations=merge4$Country.Code, z=merge4$prod=df$COUNTRY, colorscale="Blues")

  
  
  
  
  
  
  
  
  
  
  
  