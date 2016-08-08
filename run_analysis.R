# Combine the three datasets into one for test data
test_subject_df <- read.table("./Dataset/test/subject_test.txt")
test_df <- read.table("./Dataset/test/X_test.txt")
test_y_df <- read.table("./Dataset/test/y_test.txt")
test_df$y <- test_y_df$V1
test_df$subject <- test_subject_df$V1

# Combine the three datasets into one for training data
train_subject_df <- read.table("./Dataset/train/subject_train.txt")
train_df <- read.table("./Dataset/train/X_train.txt")
train_y_df <- read.table("./Dataset/train/y_train.txt")
train_df$y <- train_y_df$V1
train_df$subject <- train_subject_df$V1

# Add the test data onto the traing data
main_df <- rbind(train_df, test_df)

# Pivot the features.txt into a column name vector
