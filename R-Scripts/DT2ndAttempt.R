library("ggplot2")
library("dplyr")
library(lubridate)
library(tidyr)
library(caret)
library(randomForest)
library(adabag)
library(e1071)
library(party)
library(rpart)
library(pROC)
library(corrplot)
library(rattle)
library(randomForest)
library(class)
library(kernlab)
library(rpart)

X_test <- read.csv("X_test.csv")
X_train <- read.csv("X_train.csv")
y_train <- read.csv("y_train.csv")
y_test <- read.csv("y_test.csv")

X_test2 <- X_test[1:1500, ]
X_train2 <- X_train[1:3000, ]
y_test2 <- y_test[1:1500, ]
y_train2 <- y_train[1:3000, ]

y_test3 <- y_test[1:79, ]

train_data <- data.frame(y_train2, X_train2)

# Create the Decision Tree classifier
clf_gini <- rpart(y_train2 ~ ., data = train_data, method = "class", parms = list(split = "gini"))

# Make predictions on the test data
gini_predict <- predict(clf_gini, X_test2, type = "class")


# Calculate accuracy
accuracy <- sum(y_test2 == gini_predict) / length(y_test2)

# Print the accuracy
cat("Accuracy (gini):", accuracy, "\n")

# Load the required packages
library(caret)
library(e1071)

#testing
unique_levels_gini <- levels(gini_predict)
unique_levels_y_test <- levels(y_test2)

extra_levels_in_gini <- setdiff(unique_levels_gini, unique_levels_y_test)
gini_predict <- factor(gini_predict, levels = unique_levels_y_test)

# Ensure that gini_predict and y_test2 are factors with the same levels
gini_predict <- factor(gini_predict, levels = levels(y_test2))
# Create a confusion matrix
conf_matrix <- confusionMatrix(gini_predict, y_test3)

# Generate the classification report
classification_report <- data.frame(
  Precision = conf_matrix$byClass["Pos Pred Value"],
  Recall = conf_matrix$byClass["Sensitivity"],
  F1_Score = conf_matrix$byClass["F1"],
  Support = conf_matrix$byClass["Detection Rate"]
)

# Print the classification report
print(classification_report)


temp <- names(X_test2)

# Create and fit the decision tree
fit <- rpart(y_train2 ~ ., data = X_train2, method = "class")

# Print the decision tree
text_representation <- as.character(fit)
cat(text_representation)

install.packages("rpart.plot")

# Load the required library
library(rpart.plot)



# Assuming you have already trained your decision tree model (clf_gini) and named it "tree_model"



# Create a plot of the decision tree
rpart.plot(clf_gini, extra=101, type=4, branch=0.2, under=TRUE, cex=0.8, box.palette="RdBu", shadow.col="gray", fallen.leaves=TRUE)


