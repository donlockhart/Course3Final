# Ensure required packages are installed
list.of.packages <- c("dplyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(dplyr)

# Combine the three datasets into one for test data
test_subject_df <- read.table("./Dataset/test/subject_test.txt", col.names = c("subject"))
test_df <- read.table("./Dataset/test/X_test.txt")
test_y_df <- read.table("./Dataset/test/y_test.txt", col.names = c("activity_id"))
test_df$y <- test_y_df$activity_id
test_df$subject <- test_subject_df$subject

# Combine the three datasets into one for training data
train_subject_df <- read.table("./Dataset/train/subject_train.txt", col.names = c("subject"))
train_df <- read.table("./Dataset/train/X_train.txt")
train_y_df <- read.table("./Dataset/train/y_train.txt", col.names = c("activity_id"))
train_df$y <- train_y_df$activity_id
train_df$subject <- train_subject_df$subject

# Add the test data onto the traing data
main_df <- rbind(train_df, test_df)

# Set the column names using the features as the labels
features_df <- read.table("./Dataset/features.txt", stringsAsFactors = FALSE, col.names = c("id", "description"))
features <- features_df$description
features <- c(features, "activity_id", "subject")
colnames(main_df) <- features

# Extract only the std deviation and mean measurements
subsetted_df = main_df[, which(grepl("mean|std|subject|activity_id", names(main_df)))]

# Join to the activities dataset to show descriptive name
activities_df <- read.table("./Dataset/activity_labels.txt", col.names = c("id", "activity_description"))
subsetted_df <- merge(subsetted_df, activities_df, by.x="activity_id", by.y="id")

# Drop unneeded column
subsetted_df <- subsetted_df[, !(names(subsetted_df) %in% c("activity_id"))]

# Get rid of funky characters in column names
names(subsetted_df) <- gsub("-", "", names(subsetted_df))
names(subsetted_df) <- gsub("\\(\\)", "", names(subsetted_df))
subsetted_df <- subset(subsetted_df, select = c(subject, activity_description, tBodyAccmeanX:fBodyBodyGyroJerkMagmeanFreq))

# Create final dataset with averages per user activity
final_df <- subsetted_df %>% group_by(subject, activity_description) %>% 
  summarize_each(funs(mean(.)), tBodyAccmeanX:fBodyBodyGyroJerkMagmeanFreq)
write.table(final_df, "./Dataset/final.txt")
