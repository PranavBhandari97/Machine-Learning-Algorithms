# Multiple Linear Regression

#Setting the working directory
getwd()
setwd('E:/Multiple Linear Regression')

# Importing the dataset
dataset = read.csv('50_Startups.csv')

#Exploring the dataste
head(dataset)
tail(dataset)
nrow(dataset)
ncol(dataset)
str(dataset)
summary(dataset)

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

#Check
head(dataset)

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)

#Checking performance of Regressor
summary(regressor)

#Improving the model
regressor = lm(formula = Profit ~(R.D.Spend+Administration+Marketing.Spend),
               data = training_set)
summary(regressor)
regressor = lm(formula = Profit ~(R.D.Spend+Marketing.Spend),
               data = training_set)
summary(regressor)
regressor = lm(formula = Profit ~(R.D.Spend),
               data = training_set)
summary(regressor)
# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)


#Viewing comparing the results
compare = list(test_set$Profit, y_pred)
compare
