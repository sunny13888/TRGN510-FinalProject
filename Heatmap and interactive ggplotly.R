#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Data Transformation

finaldataAW2.log <-log2(finaldataAW2+8.05e-12)
finaldataAW2.log.small <- finaldataAW2.log[seq(1, nrow(finaldataAW2.log), 20), ]
pca <- prcomp(finaldataAW2.log.small,center = TRUE,scale. = TRUE)
finaldataAW2.log.small2 <- finaldataAW2.log[seq(1, nrow(finaldataAW2.log), 1000), ]


# Load Packages 

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

# Heatmap 

type = gsub("s\\d+_", "", colnames(finaldataAW2.log.small2))
ha = HeatmapAnnotation(df = data.frame(type = type))
Heatmap(finaldataAW2.log.small2, name = "expression", km = 5, top_annotation = ha, top_annotation_height = unit(4, "mm"), show_row_names = FALSE, show_column_names = FALSE)


# ggplotly (interactive)

finaldataAW2.log.small2$Gene <- rownames(finaldataAW2.log.small2)
melted_corr <- melt(finaldataAW2.log.small2, id.vars = c("Gene"))
p<-ggplot(melted_corr , aes(x = variable, y = Gene)) + geom_raster(aes(fill = value)) + scale_fill_gradient2(low="navy", mid="white", high="red", midpoint=0.5) + theme( plot.title = element_blank(),axis.text.x = element_blank(), axis.text.y = element_blank(), axis.title.y = element_blank(), axis.title.x = element_blank())

ggplotly(p)



