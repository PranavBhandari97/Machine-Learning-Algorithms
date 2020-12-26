# Convolutional Neural Networks(CNN)

## Problem:
#### The problem was to build a classifier using CNN to classify objects into various categories.

## Model
#### For this project, images of cats and dogs, were used to train the model. However, other objects can be classified as well using this model by adding new images to the dataset and re-training the model.
#### The input layer had 32 filters, and ‘relu’ activation was used.
#### The hidden layer had 128 nodes, and ‘relu’ activation was used.
#### The output layer had a single node, and ‘sigmoid’ activation was used.
#### As we need to classify between only two objects, ‘binary_crossentropy’ was used as loss, with ‘accuracy’ as a metric and ‘adam’ as the optimizer.

## Accuracy
#### Python: A training accuracy of 88% was achieved, and when tried predicting using certain images, a 100% accuracy was seen.
#### R: CNN was not implemented in R.

## Dataset
#### The dataset can be downloaded from the following link.
#### https://drive.google.com/file/d/1OwYs3PHYbTp8nNEHdNnDoQ_1WPlYrylV/view?usp=sharing
