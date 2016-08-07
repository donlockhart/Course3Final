[Description of experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The X_Train.txt is the main dataset with 561 columns of observations/features and 7352 row.
There are no labels - they are in a separate file named features.txt.

The y_train.txt file has 7352 rows with one column for the activity id - the activity description is in activity_labels.txt.

The subject-test.txt has 7352 rows with once column indicating the person/subject id - there is no corresponding description file.


Pseudo:
For both the test and train folders, merge the three datasets into one.
Combine the merged test and train datasets into one master dataset.
Pivot the features.txt into a column name vector.
Add the subject and activities to the vector.
Add the name vector onto the master dataset.
Subset the master dataset so that it only has the subject, activity name, and features with the "mean" and "stdev" in their name.

Last dataset has subject, activity, and avg of each variable


Don | Walking | tons of measurements
Don | Sitting | tons of measurements
Don | Walking | tons of measurements
Don | Walking | tons of measurements
Don | Sitting | tons of measurements