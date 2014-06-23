library(shiny)

output$betaDensity <- renderChart({
      pvals <<- seq(0.01, 0.99, length = 1000)
      alpha <- max(input$alpha,0.01)
      beta <- max(input$beta,0.01)
      df <- data.frame(x=pvals, y=dbeta(pvals, alpha, beta))
      n1 <- nPlot(y~x, data=df, type = 'lineChart')
      n1$set(dom = 'betaDensity', width = 600)
      n1
})
