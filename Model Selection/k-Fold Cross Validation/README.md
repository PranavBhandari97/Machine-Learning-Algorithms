# k – Fold Cross-Validation
#### k-fold cross-validation is a method used to calculate the actual parameters like accuracy, standard deviation, etc. of a model.
#### When a model is implemented, without kfold, due to parameters like Random Seed and others, the accuracy may vary by significant amounts if the model is re-run.
#### Thus, to determine the actual accuracy of the model, kfold is used, and the model is re-run various times. Then an average of all the accuracies is computed to see the mean accuracy.

## Business Problem
#### The dataset contains information for a Social Media platform. Companies can advertise their products on this platform. Recently, one of the advertisers launched a highly-priced SUV, and its ads were shown on the platform. The goal is to build a classification model that can predict which users brought the car.

## Model
#### Kernel SVM is used in both Python&R for classification.

## Accuracy
#### Python: 89.72% (Standard Deviation: 6.80%)
#### R: 91.05%

## Visualization
#### The folder contains the visuals generated in R. The visuals produced in Python can be found in the Python notebook.
