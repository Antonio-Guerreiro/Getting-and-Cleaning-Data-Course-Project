# run_analysis.R

# load packages
library(dplyr)

# Q1: Merges the training and the test sets to create one data set

# Import training data (trainortest = 0)
labels_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
features_train  <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
# Change to decriptive variable name
labels_train <- rename(labels_train, labels = V1)
subject_train <- rename(subject_train, subject = V1)
# Create a variable to keep track of the origin of the observation (training or test)
train_or_test <- as.data.frame(matrix(0, ncol = 1, nrow = dim(labels_train)[1]))
train_or_test <- rename(train_or_test, trainortest = V1)
# Merge training data (TrainOrTest = 0), bind columns 
tidy_data_set_train <- bind_cols(labels_train, train_or_test)
tidy_data_set_train <- bind_cols(tidy_data_set_train, subject_train)
tidy_data_set_train <- bind_cols(tidy_data_set_train, features_train)
# Import test data (trainortest = 1)
labels_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
features_test  <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
# Change to decriptive variable name
labels_test <- rename(labels_test, labels = V1)
subject_test <- rename(subject_test, subject = V1)
# Create a variable to keep track of the origin of the observation (training or test)
train_or_test <- as.data.frame(matrix(1, ncol = 1, nrow = dim(labels_test)[1]))
train_or_test <- rename(train_or_test, trainortest = V1)
# Merge test data
tidy_data_set_test <- bind_cols(labels_test, train_or_test)
tidy_data_set_test <- bind_cols(tidy_data_set_test, subject_test)
tidy_data_set_test <- bind_cols(tidy_data_set_test, features_test)
# Merge training and test data
tidy_data_set <- bind_rows(tidy_data_set_train, tidy_data_set_test)

# Q2: Extracts only the measurements on the mean and standard deviation for each measurement

features <- read.table("./UCI HAR Dataset/features.txt", quote="\"")
features2keep <- filter(features, grepl("mean()|std()", V2))
features2keep <- filter(features2keep, !grepl('Freq', V2))
column2keep <- c(c(1,2,3),features2keep$V1 + 3)
tidy_data_set <- tidy_data_set[, column2keep]

# Q3: Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
tidy_data_set <- merge(tidy_data_set, activity_labels, by.x="labels", by.y="V1")
tidy_data_set <- rename(tidy_data_set, V2 = V2.x)
tidy_data_set <- rename(tidy_data_set, activitynames = V2.y)

# Q4: Appropriately labels the data set with descriptive variable names

# Remove parenthesis
features2keep$V2 <- gsub("\\(|\\)", "", features2keep$V2)
# Lower all characters. 
features2keep$V2 <- tolower(features2keep$V2)
names(tidy_data_set)[4:69]<-features2keep$V2

# Q5 From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject

activities_subject <- group_by(tidy_data_set, activitynames, subject)
my_averages <- summarise_each(activities_subject, funs(mean), -labels, -trainortest)

# Write to disk

write.table(my_averages, "./my_averages.txt", row.names = FALSE)


