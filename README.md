GettingAndCleaningDataProject
=============================

Course Project for Getting and Cleaning Data
Source:  Coursera Project Assignment

This R script assumes you have downloaded the Human Activity Recognition (HAR) Using Smartphones data set.
The dataset can be obtained at the following  url:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This R script will perform the following steps:

###Note:  set working directory to location of above downloaded dataset
Line 15 in script should be edited if needed.

### 1. Merge the training and the test sets to create one data set.
Data from training and test sets are read and merged to finalData variable.

### 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Data is subsetted to only keep the mean (Mean) and standard deviation (Stdev) for each measurement; subsetData.

### 3. Use descriptive activity names to name the activities in the data set
Dplyr package is loaded (installed if necessary)
Left_join is used to bring in activityType to add desciptive activity names.
Using select, data is reorganized to improve readibilit, bring subjectID, activityID, and activityType to the beginning of the new set, subsetFinalData.


### 4. Appropriately label the data set with descriptive activity names. 
Using a loop, column names are cleaned up by the following
- "()" are removed
- beginning with "t" is edited to "time"
- beginning with "f" is edited to "freq"
- "mean" is edited to "Mean"
- "std" is edited to "Std"
- "BodyBody" is edited to "Body"
- "-X" is edited to "X"
- "-Y" is edited to "Y"
- "-Z" is edited to "Z"


### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Data is grouped by subject and activity and using summarise_each, is grouped by the mean.  
The result is an average of each variable for each activity and each subject.
This tidy dataset is nameed UCIHARDatasetTidy.txt and is written to the working directory indicated on line 15.
