Coursera Getting and Cleaning Data Course Final
===============================================
The purpose of this project is to produce a tidy dataset based upon 
[data]((https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)) 
from [experiments](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
on determining human activity from smartphone datasets.  The final dataset includes:

* A subject identifier representing the person
* The name of the activity being performed
* Averages of all variable with std() and mean() in their name

See the CodeBook.md for full details on the contents of the dataset.

Files Included in Repository
----------------------------
* README.md: This file!
* CodeBook.md: Shows information about the data included in the final tidy dataset.
* run_analysis.R: The R program file that transforms the raw data into the final output. 
* The Dataset folder: The raw source data.  Refer to its README.txt file for further details.

Running the Script
------------------
To produce the final output, run the run_analysis.R program.  A file named final.txt will be written to the Dataset folder.
If you wish to load final.txt into R, execute `read.table("./Dataset/final.txt", header = TRUE)`.

How the Final Dataset Was Produced
----------------------------------
1. For both the test and train folders, combine the three datasets into one.
2. Combine the test and train datasets into one main dataset.
3. Use the contents of the features.txt file as column names for the dataset.
4. Subset the subject, activity, and all variables which include std() and mean() in their names.
5. Merge the activity descriptions into the dataset.
6. Put the variables into the desired order.
7. Create final dataset with averages for each subject and activity.


