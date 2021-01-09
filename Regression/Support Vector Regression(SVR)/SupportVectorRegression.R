# SVR

#Setting the working directory
getwd()
setwd('E:/Support Vector Regression(SVR)')

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')

#Exploring the dataset
head(dataset)
tail(dataset)
ncol(dataset)
nrow(dataset)
str(dataset)
summary(dataset)

#As position column is not needed we remove it
dataset = dataset[2:3]

# Fitting SVR to the dataset
#install.packages("e1071")
library(e1071)
regressor = svm(Salary~Level, 
                data = dataset, 
                type = "eps-regression")

#Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

#Check
y_pred

# Visualising the SVR results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Level') +
  ylab('Salary')
