
#Seeting the working directory
getwd()
setwd("Path to working directory")
getwd()

#Importing the dataset
dataset <- read.csv("Data.csv")
dataset

#Importing library for creating training and test sets
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
split
training_set = subset(dataset, split == TRUE) 
test_set = subset(dataset, split==FALSE)