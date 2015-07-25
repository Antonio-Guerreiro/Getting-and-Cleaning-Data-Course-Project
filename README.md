Coursera / Johns Hopkins / Getting and Cleaning Data / Course Project

run_analysis.R
==============

A. GUERREIRO
2015/07/22


Introduction
------------

This R script prepares a tidy data set that can be used for later analysis
starting from raw data collected from the accelerometers and gyroscopes
of the Samsung Galaxy S smartphone. 

A full description of the raw data is available here: 
[raw data description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Data for the project can be downloaded here: 
[download link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

This R script must be a the same directory level than the "UCI HAR Dataset"
data set folder (manually unzipped). No additional script is required.

Specific R packages requirements
-----------------------

dplyr

Processing steps
----------------

### Q1 part: Merges the training and the test sets to create one data set

First the script imports the training data form the corresponding files:

* activity labels: "y_train.txt"
* subjects: "subject_train.txt"
* features: "X_train.txt"

then it binds and appropriately renames the columns with descriptive variable names. 

The script then imports the test data: 

* activity labels: "y_test.txt"
* subjects: "subject_test.txt"
* features: "X_test.txt"

and binds and appropriately renames the columns with descriptive variable names.

Additionally, we decided to create a column "trainortest" to keep track of the origin
of the observation (0 = training or 1 = test).

We finally bind the rows of the training and test parts.

### Q2 part: Extracts only the measurements on the mean and standard deviation for each measurement. 

From the data frame obtained at Q1, we extract only the columns corresponding
to mean and standard deviation for each measurement. These columns were selected
by filtering their names which are available in the file "features.txt"
using the regular expression 'mean()|std()' and then we choose to discard
the "Freq" columns.

### Q3 part: Uses descriptive activity names to name the activities in the data set.

The activity names corresponding to the activity labels are available
in the file "activity_labels.txt". The data frame obtained at Q2 was merged
with the activity names data from this file, yielding a new data frame
were activity names have been added.

### Q4 part: Appropriately labels the data set with descriptive variable names.

Columns were renamed to follow the recommandations provided in the file 
"editingTextVariables.pdf" of the Getting and Cleaning Data Course. 
At this step: we remove parenthesis and lower all characters. 
The names of the column are now rather self-explanatory.

### Q5 part: From the data set in step 4, creates a second, independent tidy
### data set with the average of each variable for each activity and each subject. 

The data was grouped by activity name and by subject using the dplyr
"group_by" command. The average for each group is computed using
the "summarise_each" command.

### Export data

In the final step of the script, the data frame obtained at Q5 is written
to disk. The file can be read back with the command 
"read.table("./my_averages.txt", header = TRUE)".

