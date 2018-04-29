#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# load data
setwd("~/Desktop/510final")
load("final.RData")

# load libraries
library(colourpicker)
library(shiny)
library(ggplot2)
library('plotly')
library("dplyr")


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Gene Expression"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         colourInput("col",
                     "Select colour", "navy"),
         colourInput("col2",
                     "Select colour", "white"),
         colourInput("col3",
                     "Select colour", "purple")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
 
      
      # ggplot
     ggplot(finaldataAW2.log.small2_m , aes(x = variable, y = Gene)) + geom_raster(aes(fill = value)) +
       scale_fill_gradient2(low=input$col, mid=input$col2, high=input$col3, midpoint=0.5) + 
       theme( plot.title = element_blank(),axis.text.x = element_blank(), axis.text.y = element_blank(), axis.title.y = element_blank(), axis.title.x = element_blank())
     
   })
   
}

# Run the application 
shinyApp(ui = ui, server = server)




