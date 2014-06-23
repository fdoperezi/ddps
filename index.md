---
title       : Exploring the Beta Density
subtitle    : betaDensityApp - Shiny Application
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny, interactive]  # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/nvd3, libraries/highcharts]}
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

<div class="row-fluid">
  <div class="span12" style="padding: 10px 0px;">
    <h1>Exploring The Beta Density</h1>
  </div>
  <div class="span4">
    <form class="well">
      <div>
        <label class="control-label" for="alpha">Alpha</label>
        <input id="alpha" type="slider" name="alpha" value="1" class="jslider" data-from="0.01" data-to="10" data-step="0.5" data-skin="plastic" data-round="FALSE" data-locale="us" data-format="#,##0.#####" data-scale="|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|" data-smooth="FALSE"/>
      </div>
      <div>
        <label class="control-label" for="beta">Beta</label>
        <input id="beta" type="slider" name="beta" value="1" class="jslider" data-from="0.01" data-to="10" data-step="0.5" data-skin="plastic" data-round="FALSE" data-locale="us" data-format="#,##0.#####" data-scale="|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|" data-smooth="FALSE"/>
      </div>
    </form>
  </div>
  <div class="span8">
    <div id="betaDensity" class="shiny-html-output nvd3 rChart"></div>
  </div>
</div>
---
