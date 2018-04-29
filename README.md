# TRGN510-FinalProject
  Author: Ying Sun
  
  USCID: 5682161995
  
  Date: 04/12/2018
  
# Project Title: Heatmap and Gene Expression
# Load Libraries 
```{r}
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
```
# Load Data
```{r}
setwd("~/Desktop/510final")
load("finaldata.RData")
```

# Save useful data
```{r}
save(finaldata, file = "c:/data/foo.Rdata")
# Heatmap
```{r}
type = gsub("s\\d+_", "", colnames(finaldataAW2.log.small2))
ha = HeatmapAnnotation(df = data.frame(type = type))
Heatmap(finaldataAW2.log.small2, name = "expression", km = 5, top_annotation = ha, top_annotation_height = unit(4, "mm"), show_row_names = FALSE, show_column_names = FALSE)
```
# ggplotly (interactive)
```{r}
finaldataAW2.log.small2$Gene <- rownames(finaldataAW2.log.small2)
melted_corr <- melt(finaldataAW2.log.small2, id.vars = c("Gene"))
p<-ggplot(melted_corr , aes(x = variable, y = Gene)) + geom_raster(aes(fill = value)) + scale_fill_gradient2(low="navy", mid="white", high="red", midpoint=0.5) + theme( plot.title = element_blank(),axis.text.x = element_blank(), axis.text.y = element_blank(), axis.title.y = element_blank(), axis.title.x = element_blank())

ggplotly(p)
```
