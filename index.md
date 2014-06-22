---
title       : Exploring the Beta Density
subtitle    : betaDensityApp - Shiny Application
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny, interactive]  # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Shiny Application Components

The components the Shiny application "Exploring the Beta Density" are

1. ui.R
2. server.R

---

## ui.R


```r
library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Exploring The Beta Density"),
  sidebarPanel(
    sliderInput('alpha', 'Alpha',value = 1, min = 0.01, max = 10, step = 0.5,),
    sliderInput('beta', 'Beta',value = 1, min = 0.01, max = 10, step = 0.5,)
  ),
  mainPanel(
    plotOutput('betaDensity')
  )
))
```

---

## server.R


```r
library(shiny)

pvals <<- seq(0.01, 0.99, length = 1000)

shinyServer(
  function(input, output) {
    output$betaDensity <- renderPlot({
      alpha <- max(input$alpha,0.01)
      beta <- max(input$beta,0.01)
      plot(pvals, dbeta(pvals, alpha, beta), type = "l", lwd = 3, col=4, frame = FALSE)
      title(paste0("The Beta distribution with parameters alpha=",alpha," and beta=",beta," has density"))
    })
  }
)
```

---

## Showcase

1. App in shinyapps.io

https://fdoperezi.shinyapps.io/betaDensityApp/

---

## Interactive Chart with Controls

Finally, we will use Shiny to add interactive controls to the chart we created previously. Suppose that we want to control `Alpha` and the `Beta` of plot. Let us first add the UI. `slidifyUI` behaves almost like `shinyUI` except that it outputs a character vector.


```r
library(shiny)

slidifyUI(
  headerPanel('Exploring The Beta Density'),
  sidebarPanel(
    sliderInput('alpha', 'Alpha',value = 1, min = 0.01, max = 10, step = 0.5,),
    sliderInput('beta', 'Beta',value = 1, min = 0.01, max = 10, step = 0.5,)
  ),
  mainPanel(
    #plotOutput('betaDensity')
  )
)
```

```
## Error: could not find function "slidifyUI"
```
---
