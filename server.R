#################################################
#          Google Trends                        #
#################################################

shinyServer(function(input, output,session) {

  query = reactive({
    Sys.setenv(TZ = "UTC")
    q = setdiff(unique(c(input$topic1,input$topic2,input$topic3,input$topic4)),"")
    google.trends = gtrends(q, geo=input$geo ,
                            gprop = "web", time = paste0(input$dates[1]," ",input$dates[2]))[[1]]
    google.trends = dcast(google.trends, date ~ keyword + geo, value.var = "hits")
    google.trends
    # geo = c(input$geo)
  })
  
  output$plot = renderPlot({
    
    Google_Trends <- xts(query()[,-1], order.by=as.Date(query()[,1], "%Y-%m-%d"))
    
    plot(Google_Trends, auto.legend = TRUE,screens = factor(1, 1), title(main = "Intrest Over Time"))
    

  })
  
  output$out = renderPrint({
    
    query()
    
  })

  output$downloadData <- downloadHandler(
    filename = function() { "Image_to_text.txt" },
    content = function(file) {
      
      writeLines(unlist(strsplit(text(),"\n")), file)
    })
  
  })

