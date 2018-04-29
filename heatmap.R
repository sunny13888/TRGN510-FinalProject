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
library(shiny)
library(ggplot2)
library(reshape2)
library('plotly')
library("dplyr")
library(ComplexHeatmap)
library(circlize)
library(colorspace)
library(GetoptLong)
library(MASS)
library(pvclust)



# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Gene expression"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         colourInput("col",
                     "Select colour", "red"),
         colourInput("col2",
                     "Select colour", "blue")
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
    
      
      # heatmap
     Heatmap(finaldataAW2.log.small, name = "expression", km = 5, top_annotation = ha, top_annotation_height = unit(4, "mm"), show_row_names = FALSE, show_column_names = FALSE)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

