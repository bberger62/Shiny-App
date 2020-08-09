library(shiny)
library(shinydashboard)
library(plotly)

function(input, output) {



  output$GDP = renderPlotly({merge4 %>% filter(year==input$slider3 & Element=='Food') %>%
      group_by(Country.Name) %>%
      summarise(output=sum(prod), GDP=mean(GDP)) %>%
      ggplot(aes(x=output, y=GDP, label=Country.Name)) +
      geom_point() +
      ggtitle('Total Output vs. GDP') +
      ylab('GDP ($bn)') +
      xlab('Output (1000 tonnes)')+
      geom_smooth(method = "lm")
    })
  
  output$pop1 = renderPlotly({merge4 %>% filter(year==input$slider3 & Element=='Food') %>%
    group_by(Country.Name) %>%
    summarise(output=sum(prod), popu=mean(Population)) %>%
    ggplot(aes(x=output, y=popu, label=Country.Name)) +
    geom_point() + 
    ggtitle('Total Output vs. Population') +
    ylab('Population (millions)') +
    xlab('Output (1000 tonnes)')+
      geom_smooth(method = "lm")
  })
  
  output$gdpcc1 = renderPlotly({merge4 %>% filter(year==input$slider3 & Element=='Food') %>%
      group_by(Country.Name) %>%
      summarise(output=sum(prod), gdppc=mean(GDPperCap)) %>%
      ggplot(aes(x=output, y=gdppc, label=Country.Name)) +
      geom_point() + 
      ggtitle('Total Output vs. GDPPC') +
      ylab('GDPPC ($)') +
      xlab('Output (1000 tonnes)')+
      geom_smooth(method = "lm")
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
          z = mapdata1$output, color = mapdata1$output, colors = 'Blues',
          text = mapdata1$Country.Name, locations = mapdata1$Country.Code, marker = list(line = l)
      )
      fig <- fig %>% colorbar(title = '', tickprefix = '')
      fig <- fig %>% layout(
        title = 'Global Production by Year',
        geo= g
      )
    })


    
    # mapdata1 = mapdata %>% filter(., year==input$slider)
    # 
    # plot_geo(mapdata1) %>% 
    #   add_trace(z = mapdata1[, input$worldmap_data], color = clean1[, input$worldmap_data], 
    #             colors = 'Greens',
    #             text = clean1$Country, 
    #             locations = clean1$Code, 
    #             marker = list(line = list(color = toRGB("grey"), width = 0.5))) %>% 
    #   colorbar(title = '', ticksuffix = '') %>% 
    #   layout(geo = list(
    #     showframe = FALSE,
    #     showcoastlines = FALSE,
    #     projection = list(type = 'Mercator')
    
    
    output$yoy11 = renderPlotly({
      merge4 %>% filter(Income.Group==input$incomegroup & (year=='2013'|year=='2012') & Element=='Food') %>%
        group_by(Country.Name, year) %>%
        summarise(output=sum(prod), gdppc=mean(GDPperCap)) %>%
        group_by(Country.Name) %>%
        summarise(outyy=(output[year=='2013']-output[year=='2012'])/output[year=='2012'], 
                  gdppcyy=(gdppc[year=='2013']-gdppc[year=='2012'])/gdppc[year=='2012']) %>%
        ggplot(aes(x=outyy, y=gdppcyy, label=Country.Name)) +
        geom_point() + 
        ggtitle('YoY Output Growth vs. YoY GDPPC Growth') +
        ylab('YoY GDPPC Growth (%)') +
        xlab('YoY Output Growth (%)') +
        geom_smooth(method = "lm")
    })
    
    
    output$yoy22 = renderPlotly({
      merge4 %>% filter(Region==input$region1 & (year=='2013'|year=='2012') & Element=='Food') %>%
        group_by(Country.Name, year) %>%
        summarise(output=sum(prod), gdppc=mean(GDPperCap)) %>%
        group_by(Country.Name) %>%
        summarise(outyy=(output[year=='2013']-output[year=='2012'])/output[year=='2012'], 
                  gdppcyy=(gdppc[year=='2013']-gdppc[year=='2012'])/gdppc[year=='2012']) %>%
        ggplot(aes(x=outyy, y=gdppcyy, label=Country.Name)) +
        geom_point() + 
        ggtitle('YoY Output Growth vs. YoY GDPPC Growth') +
        ylab('YoY GDPPC Growth (%)') +
        xlab('YoY Output Growth (%)') +
        geom_smooth(method = "lm")
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    output$gdppercapi = renderPlotly({
      merge4 %>% filter(Country.Name==input$country) %>%
        group_by(year) %>%
        summarise(GDPcap = mean(GDPperCap)) %>%
        ggplot(., aes(x=year, ymax=GDPcap, ymin=0)) +
        geom_linerange(color='red4', size=0.9) +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
        ggtitle('GDP per capita by year') +
        ylab('GDP per capita ($)') +
        xlab('Year')
    })
    output$productprod = renderPlotly({
      merge4 %>% filter(Country.Name==input$country & Item==input$product) %>%
        group_by(year) %>%
        summarise(outp = sum(prod)) %>%
        ggplot(., aes(x=year, ymax=outp, ymin=0)) +
        geom_linerange(color='red4', size=0.9)+
        ggtitle('Output by year') +
        ylab('Output (1000 tonnes)') +
        xlab('Year')
    })

    output$top5 = renderPlotly({
      merge4 %>% filter(Country.Name==input$country2 & year==input$year1) %>%
        group_by(Item) %>%
        summarise(outp = sum(prod)) %>%
        arrange(desc(outp)) %>%
        top_n(5) %>%
        ggplot() +
        geom_bar(aes(x=reorder(Item, -outp),y=outp), stat='identity') +
        theme(axis.text.x=element_text(angle=45, hjust=1)) +
        ggtitle('Top 5') +
        ylab('Output (1000 tonnes)') +
        xlab('Item')
    })

    output$top52 = renderPlotly({
      merge4 %>% filter(Country.Name==input$country2 & year==input$year2) %>%
        group_by(Item) %>%
        summarise(outp = sum(prod)) %>%
        arrange(desc(outp)) %>%
        top_n(5) %>%
        ggplot() +
        geom_bar(aes(x=reorder(Item, -outp),y=outp), stat='identity') +
        theme(axis.text.x=element_text(angle=45, hjust=1))+
        ggtitle('Top 5') +
        ylab('Output (1000 tonnes)') +
        xlab('Item')
    })
}
    
  
 

  
  
  
  
  
  
  
  
  
  
  
  