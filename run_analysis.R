#library(Hmisc)
library(dplyr)

# Combine the three datasets into one for both the test and train folders
test_subject_df <- read.table("./Dataset/test/subject_test.txt")
test_df <- read.table("./Dataset/test/X_test.txt")
test_y_df <- read.table("./Dataset/test/y_test.txt")
test_df$y <- test_y_df
test_df$subject <- test_subject_df

train_subject_df <- read.table("./Dataset/train/subject_train.txt")
train_df <- read.table("./Dataset/train/X_train.txt")
train_y_df <- read.table("./Dataset/train/y_train.txt")
train_df$y <- train_y_df
train_df$subject <- train_subject_df