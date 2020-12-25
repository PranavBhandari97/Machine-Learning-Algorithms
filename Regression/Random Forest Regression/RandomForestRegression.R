# Decision Tree Regression

#Setting the working directory
getwd()
setwd('E:/Pranav/Portfolio/Github/Machine Learning/Regression/Random Forest Regression')

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')

#Exploring the Dataset
head(dataset)
tail(dataset)
nrow(dataset)
ncol(dataset)
str(dataset)
summary(dataset)

#As Position column is not needed, we remove it.
dataset = dataset[2:3]

# Fitting Random Forest Regression to the dataset
#install.packages("randomForest")
library(randomForest)
set.seed(123)
regressor = randomForest(x = dataset[1], 
                         y= dataset$Salary, 
                         ntree = 10)

# Predicting a new result with Decision Tree Regression
y_pred = predict(regressor, data.frame(Level = 6.5))

#Check
y_pred

# re-fitting Random Forest Regression with 100 trees
#install.packages("randomForest")
#library(randomForest)
#set.seed(123)
regressor = randomForest(x = dataset[1], 
                         y= dataset$Salary, 
                         ntree = 100)

# Predicting a new result with Decision Tree Regression
y_pred = predict(regressor, data.frame(Level = 6.5))

#Check
y_pred

# Visualising the Decision Tree Regression results
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Random Forest Regression)') +
  xlab('Level') +
  ylab('Salary')