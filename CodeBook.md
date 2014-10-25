#Code Book


Data for this project represented data collected from the accelerometers from the Samsung Galaxy S smartphone.  The orgiinal dataset can be obtained at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

As indicated in the original CodeBook from above file, data originates from the accelerometer and gyroscope 3-axial raw signals timeAcc-XYZ and timeGyro-XYZ. 
These time domain signals were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.   
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals.
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing the frequency domain signal variables.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

Source:  features_info.txt from UCIHARDataset.zip (source file cited above)


For this dataset, only values of mean (Mean) and standard deviation (Std) are present.

As described in the ReadMe.md file, variable names have been edited/cleaned from the original source file.


Variables of UCIHARDatasetTidy.txt:

- subjectId
- activityId
- activityType
- timeBodyAccMeanX
- timeBodyAccMeanY
- timeBodyAccMeanZ
- timeBodyAccStdX
- timeBodyAccStdY
- timeBodyAccStdZ
- timeGravityAccMeanX
- timeGravityAccMeanY
- timeGravityAccMeanZ
- timeGravityAccStdX
- timeGravityAccStdY
- timeGravityAccStdZ
- timeBodyAccJerkMeanX
- timeBodyAccJerkMeanY
- timeBodyAccJerkMeanZ
- timeBodyAccJerkStdX
- timeBodyAccJerkStdY
- timeBodyAccJerkStdZ
- timeBodyGyroMeanX
- timeBodyGyroMeanY
- timeBodyGyroMeanZ
- timeBodyGyroStdX
- timeBodyGyroStdY
- timeBodyGyroStdZ
- timeBodyGyroJerkMeanX
- timeBodyGyroJerkMeanY
- timeBodyGyroJerkMeanZ
- timeBodyGyroJerkStdX
- timeBodyGyroJerkStdY
- timeBodyGyroJerkStdZ
- timeBodyAccMagMean
- timeBodyAccMagStd
- timeGravityAccMagMean
- timeGravityAccMagStd
- timeBodyAccJerkMagMean
- timeBodyAccJerkMagStd
- timeBodyGyroMagMean
- timeBodyGyroMagStd
- timeBodyGyroJerkMagMean
- timeBodyGyroJerkMagStd
- freqBodyAccMeanX
- freqBodyAccMeanY
- freqBodyAccMeanZ
- freqBodyAccStdX
- freqBodyAccStdY
- freqBodyAccStdZ
- freqBodyAccJerkMeanX
- freqBodyAccJerkMeanY
- freqBodyAccJerkMeanZ
- freqBodyAccJerkStdX
- freqBodyAccJerkStdY
- freqBodyAccJerkStdZ
- freqBodyGyroMeanX
- freqBodyGyroMeanY
- freqBodyGyroMeanZ
- freqBodyGyroStdX
- freqBodyGyroStdY
- freqBodyGyroStdZ
- freqBodyAccMagMean
- freqBodyAccMagStd
- freqBodyAccJerkMagMean
- freqBodyAccJerkMagStd
- freqBodyGyroMagMean
- freqBodyGyroMagStd
- freqBodyGyroJerkMagMean
- freqBodyGyroJerkMagStd
