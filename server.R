library(shiny)

# Define server logic required to draw a histogram
shinyServer( function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
	my_colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan") 
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("number of bins", 
               "color"),
      Value = as.character(c(input$bins, 
                             my_colors[input$color])), 
      stringsAsFactors=FALSE)
  }) 
  
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
  
  output$distPlot <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = my_colors[input$color], border = 'white', main = "Histogram of some numeric variable")
  })

})
