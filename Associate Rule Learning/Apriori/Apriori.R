# Apriori

#Setting working directory
getwd()
setwd('E:/Apriori')

#Data Preprocessing
#install.packages('arules')
library(arules)

#Importing the dataset
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)

#Exploring the dataset
head(dataset)
tail(dataset)
nrow(dataset)
ncol(dataset)
str(dataset)
summary(dataset)

#Building the Sparse Matrix
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)

#Viewing details of Sparse Matrix
summary(dataset)

#Plotting the 10 highest bought products
itemFrequencyPlot(dataset, topN = 10)

#Training Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

#Visualising the results
inspect(sort(rules, by = 'lift')[1:10])
