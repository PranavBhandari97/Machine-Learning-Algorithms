# Natural Language Processing (NLP)
#### NLP is used to derive information from text-based data.

## Business Problem
#### The given dataset contained reviews for a restaurant. The goal was to classify whether the review was positive or negative with the help of an ML model and achieve accuracy as high as possible.

## Model
#### The initial steps of the model revolved around cleaning the text data.
#### All the words were converted to lowercase, punctuations, and numbers were removed.
#### This was followed by stemming, and the unnecessary words were removed by using the stopwords set.
#### Tokenization was then performed, and the top 1500 words were selected to build the bag of words.
#### In Python, Naive Bayes (Gaussian) was used for classification.
#### In R, Random Forest was used for classification.

## Accuracy
#### Python : 73%
#### R : 79.5%

## Other Models
#### Naive Bayes, Random Forest, and Decision Tree are generally used for classification in NLP problems. The above problem can be solved by using any of these with suitable parameter tuning steps.
