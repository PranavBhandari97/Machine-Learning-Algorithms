# Natural Language Processing

#Setting the working directory
getwd()
setwd('E:/Natural Language Processing')

#Importing the dataset
dataset_original = read.delim('Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

#Exploring the dataset
head(dataset_original)
tail(dataset_original)
nrow(dataset_original)
ncol(dataset_original)
str(dataset_original)
summary(dataset_original)

#Cleaning the texts
#install.packages('tm')
#install.packages('SnowballC')
library(tm)
library(SnowballC)

#Creating the corpus
corpus = VCorpus(VectorSource(dataset_original$Review))
#Check
as.character(corpus[[1]])
as.character(corpus[[841]])
#Converting to lowercase
corpus = tm_map(corpus, content_transformer(tolower))
#Check
as.character(corpus[[1]])
as.character(corpus[[841]])
#Removing the numbers in dataset
corpus = tm_map(corpus, removeNumbers)
#Check
as.character(corpus[[841]])
#Remove punctuations
corpus = tm_map(corpus, removePunctuation)
#Check
as.character(corpus[[1]])
as.character(corpus[[841]])
#Using stopwords to remove non relevant words
corpus = tm_map(corpus, removeWords, stopwords())
#Check
as.character(corpus[[1]])
as.character(corpus[[841]])
#Stemming
corpus = tm_map(corpus, stemDocument)
#Check
as.character(corpus[[1]])
as.character(corpus[[841]])
#To remove extra white spaces
corpus = tm_map(corpus, stripWhitespace)
as.character(corpus[[1]])
as.character(corpus[[841]])

#Creating the Bag of Words model
dtm = DocumentTermMatrix(corpus)
#Check
dtm
#Filtering the non-frequent terms
dtm = removeSparseTerms(dtm, 0.999)
#Checking by how much the sparsity reduced
dtm

#Building the dataframe
dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

#Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))

#Splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Naive Bayes, Decision tree and Random Forest Classification are generally used for NLP
#Over here, to try a model with entropy, Random Forest was used.
#Fitting Random Forest Classification to the Training set
#install.packages('randomForest')
library(randomForest)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)

#Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

#Building the Confusion Matrix
cm = table(test_set[, 692], y_pred)

#Checking confusion matrix
cm
