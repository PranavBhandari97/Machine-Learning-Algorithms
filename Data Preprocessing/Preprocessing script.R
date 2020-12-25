
#Setting the working directory
getwd()
setwd('E:/Pranav/Portfolio/Github/Machine Learning/Data Preprocessing')

#Importing the dataset
dataset = read.csv('Data.csv')

#Exploring the dataset
head(dataset)
tail(dataset)
nrow(dataset)
ncol(dataset)
str(dataset)
summary(dataset)

#There is some missing data
#Handling the missing data
dataset$Age = ifelse( is.na(dataset$Age), 
                      ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                      dataset$Age)
dataset$Salary = ifelse( is.na(dataset$Salary), 
                         ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                         dataset$Salary)

#Check
head(dataset)
tail(dataset)

#Encoding Categorical Data
dataset$Country = factor(dataset$Country,
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No','Yes'),
                           labels = c(0,1))

#Check
head(dataset)

#Splitting the data into training and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Check
training_set
test_set

#Feature Scaling
training_set[, 2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])

#Check
training_set
test_set
