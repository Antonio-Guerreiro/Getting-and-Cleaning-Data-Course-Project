Coursera / Johns Hopkins / Getting and Cleaning Data / Course Project

A. GUERREIRO
2015/07/22


Code Book for the Getting and Cleaning Data Course Project
==========================================================

This document is a code book that describes the tidy data set
we've obtained at the end of the course project.

It describes the data, the variables and the transformations and work
that was performed to get this tidy data set that can be used 
for later analysis (machine learning).

Raw data description
--------------------

A full description of the raw data is available here: 

[raw data description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Raw data for the project was downloaded here (with additional information): 
[download link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

Raw data collected from the accelerometers and gyroscopes of the Samsung
Galaxy S smartphone.

For each record in the initial dataset it is provided: 

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
3. Its activity label. 
4. An identifier of the subject who carried out the experiment.

In this work, we used the 561 feature vectors (not the inertial signals).

Work that was performed to build the tidy data set
--------------------------------------------------

To prepare the final tidy data set, we developped a R script "run_analysis.R".
We don't replicate here the details: **please see the companion README.md file**.

Data set description
---------------------

One table with 180 observations of 68 variables.

This data set contains the means, **after grouping by activity and by subject**, 
of selected features of the original raw data set features files:
"mean" and "std" variables only. 

From both the training and test parts of the raw data which have been merged.

List of the variables of the tidy data set
------------------------------

"activitynames"             "subject"                   "tbodyacc-mean-x"           "tbodyacc-mean-y"          
"tbodyacc-mean-z"           "tbodyacc-std-x"            "tbodyacc-std-y"            "tbodyacc-std-z"           
"tgravityacc-mean-x"        "tgravityacc-mean-y"        "tgravityacc-mean-z"        "tgravityacc-std-x"        
"tgravityacc-std-y"         "tgravityacc-std-z"         "tbodyaccjerk-mean-x"       "tbodyaccjerk-mean-y"      
"tbodyaccjerk-mean-z"       "tbodyaccjerk-std-x"        "tbodyaccjerk-std-y"        "tbodyaccjerk-std-z"       
"tbodygyro-mean-x"          "tbodygyro-mean-y"          "tbodygyro-mean-z"          "tbodygyro-std-x"          
"tbodygyro-std-y"           "tbodygyro-std-z"           "tbodygyrojerk-mean-x"      "tbodygyrojerk-mean-y"     
"tbodygyrojerk-mean-z"      "tbodygyrojerk-std-x"       "tbodygyrojerk-std-y"       "tbodygyrojerk-std-z"      
"tbodyaccmag-mean"          "tbodyaccmag-std"           "tgravityaccmag-mean"       "tgravityaccmag-std"       
"tbodyaccjerkmag-mean"      "tbodyaccjerkmag-std"       "tbodygyromag-mean"         "tbodygyromag-std"         
"tbodygyrojerkmag-mean"     "tbodygyrojerkmag-std"      "fbodyacc-mean-x"           "fbodyacc-mean-y"          
"fbodyacc-mean-z"           "fbodyacc-std-x"            "fbodyacc-std-y"            "fbodyacc-std-z"           
"fbodyaccjerk-mean-x"       "fbodyaccjerk-mean-y"       "fbodyaccjerk-mean-z"       "fbodyaccjerk-std-x"       
"fbodyaccjerk-std-y"        "fbodyaccjerk-std-z"        "fbodygyro-mean-x"          "fbodygyro-mean-y"         
"fbodygyro-mean-z"          "fbodygyro-std-x"           "fbodygyro-std-y"           "fbodygyro-std-z"          
"fbodyaccmag-mean"          "fbodyaccmag-std"           "fbodybodyaccjerkmag-mean"  "fbodybodyaccjerkmag-std"  
"fbodybodygyromag-mean"     "fbodybodygyromag-std"      "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std"

Variable description
---------------------


#### "activitynames": descriptive names of the activities in the data set

6 Levels: LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, WALKING UPSTAIRS


#### "subject": the ids of the subjects who carried out the experiments 
(a group of 30 volunteers within an age bracket of 19-48 years).

1 to 30.


#### Features

Recall: in the final data set, we additionally grouped by activity and subject
and compute the mean for each group.

Accelerations are in g units.

Interpretation of the features names (quite self explanatory):

* "t": time domain, f: frequency domain (after FFT)

* "body": body separated signal, "gravity": gravity separated signal

* "acc" : linear, "gyro" : angular

* "jerk": jerk

* "mean": mean, estimated from the signals, for each observation

* "std": standard deviation, estimated from the signals, for each observation

* "x", "y", "z" : axes

* "mag" : magnitude using euclidian norm




 

