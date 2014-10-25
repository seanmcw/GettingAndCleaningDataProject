# This R script assumes you have downloaded the Human Activity Recognition (HAR) Using Smartphones data set.
# The dataset can be obtained at the following url:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# This R script will perform the following steps:

# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#set working directory
setwd("./data/UCI HAR Dataset/")

#read the features and activityType data
features <- read.table("./features.txt", header=F)
activityType <- read.table("./activity_labels.txt",header=F)

#read the training data
subjectTrain <-  read.table("./train/subject_train.txt", header=F)
xTrain <-  read.table("./train/X_train.txt", header=F)
yTrain <-  read.table("./train/Y_train.txt", header=F)

#read the test data
subjectTest <-  read.table("./test/subject_test.txt", header=F)
xTest <-  read.table("./test/X_test.txt", header=F)
yTest <-  read.table("./test/Y_test.txt", header=F)

#assign column names
colnames(activityType) <- c("activityId","activityType")
colnames(subjectTrain) <- "subjectId"
colnames(xTrain) <- features[,2]
colnames(yTrain) <-"activityId"
colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2]
colnames(yTest) <-"activityId"

#merge training datasets
trainData <- cbind(yTrain, subjectTrain, xTrain)

#merge test datasets
testData <- cbind(yTest, subjectTest, xTest)

#combine the merged training and test datasets
finalData <- rbind(trainData, testData)

#extracting only data elements for mean and standard deviation
activities <-  colnames(finalData)
desiredColumns <-  grepl("*activity*",activities) | grepl("subject*",activities) | 
                    grepl("*-mean*",activities) & !grepl("*-meanFreq*",activities) |
                    grepl("-std*",activities)
subsetData <-  finalData[desiredColumns==T]

#check to make sure dplyr package is installed; load dplyr package
require(dplyr) || install.packages(dplyr) 
library(dplyr)

#transform data to data frame tbl
subsetData <- tbl_df(subsetData)

#label data set with the descriptive activity types
subsetFinalData <- left_join(subsetData,activityType,by="activityId")

#rearrange columns in dataset to improve readability
subsetFinalData <- select(subsetFinalData, subjectId, activityId, activityType, 3:69)

#clean up variable names
finalColNames <- names(subsetFinalData)
for (i in 1:length(finalColNames)) {
    finalColNames[i] <- gsub("\\()","",finalColNames[i])    
    finalColNames[i] <- gsub("^(t)","time",finalColNames[i])   
    finalColNames[i] <- gsub("^(f)","freq",finalColNames[i]) 
    finalColNames[i] <- gsub("BodyBody","Body",finalColNames[i]) 
    finalColNames[i] <- gsub("-mean","Mean",finalColNames[i]) 
    finalColNames[i] <- gsub("-std","Std",finalColNames[i]) 
    finalColNames[i] <- gsub("-X$","X",finalColNames[i]) 
    finalColNames[i] <- gsub("-Y$","Y",finalColNames[i]) 
    finalColNames[i] <- gsub("-Z$","Z",finalColNames[i]) 
}

#assign new variable names
names(subsetFinalData) <- finalColNames

#group data by subject and activity
grouped <- group_by(subsetFinalData, subjectId, activityId,activityType)

#compute mean of each variable for each activity and each subject
summary <- summarise_each(grouped,funs(mean))

#create tidy data set with the average of each variable for each activity and each subject
write.table(summary,"UCIHARDatasetTidy.txt", row.name=FALSE)
