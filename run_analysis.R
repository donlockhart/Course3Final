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
subsetted_df = main_df[, which(grepl("mean()|std()|subject|activity_id", names(main_df)))]

# Join to the activities dataset to show descriptive name
activities_df <- read.table("./Dataset/activity_labels.txt", col.names = c("id", "activity_description"))
subsetted_df <- merge(subsetted_df, activities_df, by.x="activity_id", by.y="id")

# Tidy up the frame
subsetted_df <- subsetted_df[, !(names(subsetted_df) %in% c("activity_id"))]
names(subsetted_df) <- gsub("-", "", names(subsetted_df))
names(subsetted_df) <- gsub("\\(\\)", "", names(subsetted_df))
#subsetted_df <- subset(subsetted_df, select = c(subject, activity_description, tBodyAccmeanX:fBodyBodyGyroJerkMagmeanFreq))
#subject_column_index <- grep("subject", names(subsetted_df))
#subsetted_df <- subsetted_df[, c(subject_column_index, 1:ncol(subsetted_df))[-subject_column_index]]
#activity_column_index <- grep("activity_description", names(subsetted_df))
#subsetted_df <- subsetted_df[, c(activity_column_index, 1:ncol(subsetted_df))[-activity_column_index]]
View(subsetted_df)

# Create final dataset with averages per user activity
#final_df <- subsetted_df %>% group_by(subject, activity_id)
#  %>% summarize(mean())
