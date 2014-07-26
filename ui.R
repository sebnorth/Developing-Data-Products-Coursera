library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Colorful histogram"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
   sidebarPanel(
      # Simple integer interval
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      
      # Decimal interval with step value
      sliderInput("color", "choose the color of bins:", 
                  min = 1, max = 8, value = 4, step= 1)),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"), 
      tableOutput("values"),
      helpText("This app is a simple extension of example from Shiny tutorial. We have some data, one variable(numeric 	Waiting time to next eruption (in mins) from 'Old Faithful Geyser Data'). "),
      helpText("Use slider 1 to set number of bins of histogram"),
      helpText("Use slider 2 to set colour of bins"),
      helpText("After setting these two parameters you see the values in table under the graph")
    )
  )
))
