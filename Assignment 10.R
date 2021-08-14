# Assignment: ASSIGNMENT 10.2
# Name: ZAMORA, JESSE
# Date: 08/13/2021

setwd("C:/Users/14029/R Studio Projects/dsc520-master/data")

dataset1 <- read.csv("binary-classifier-data.csv", header = TRUE)

nrow(imported_data)
ncol(imported_data)
summary(imported_data)

ggplot(dataset1, aes(x=x, y=y,), color="blue") +
geom_point()

dataset2 <- read.csv("trinary-classifier-data.csv", header = TRUE)

nrow(imported_data)
ncol(imported_data)
summary(imported_data)

ggplot(dataset2, aes(x=x, y=y,), color="red") +
geom_point()

data_norm <- function(a){(a - min(a))/(max(a) - min(a))}
dataset1_norm <- as.data.frame(lapply(dataset1[,-1],data_norm))

data_norm <- function(a){(a - min(a))/(max(a) - min(a))}
dataset2_norm <- as.data.frame(lapply(dataset2[,-1],data_norm))