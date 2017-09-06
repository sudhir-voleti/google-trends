#################################################
#          Google Trends                        #
#################################################

shinyServer(function(input, output,session) {

  query = reactive({
    Sys.setenv(TZ = "UTC")
    q = unique(c(input$topic1,input$topic2,input$topic3,input$topic4))
    google.trends = gtrends(q, gprop = "web", time = paste0(input$dates[1]," ",input$dates[2]))[[1]]
    google.trends = dcast(google.trends, date ~ keyword + geo, value.var = "hits")
    google.trends
    # geo = c(input$geo)
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

