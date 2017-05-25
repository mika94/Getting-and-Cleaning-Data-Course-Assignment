# Description

Information about the data, variables, and transformations used in the course assignment for the Johns Hopkins "Getting and Cleaning Data" course.

## Source Data

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The source data for this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### Data Set Information

The following is paraphrased from the README file from the above url. This data provided data on a group of 30 volunteers between the ages of 19-48 years. Each subject performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a Samsung Galaxy SII smartphone on their waist. The experimenters measured the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz and video-recorded the experiments to label the data manually. The resulting dataset was randomly split into two sets, where 70% of subjects were used to generate the training data and 30% the test data. 

### Attribute Information

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- The corresponding activity label.
- The subject identifier for each experiment.

## Study Design

1. The run_analysis function first creates a directory, ./data, and downloads the zip file url into that file. It then unzips the dataset to the ./data directory. This creates a directory called "UCI HAR Dataset". 
  
2. Next, all the relevant files from the "UCI HAR Dataset" are read by read.table into variables for manipulation within the function:
..- features.txt - this file is read and stored into the variable "features"
..- activity_labels.txt - this file is read and stored in the variable "activity_labels"
..- subject_test.txt - this file is read and stored in the variable "subject_test" and the column name is renamed from "V1" to "subject" using the rename function from dplyr
..- y_test.txt - this file is read and stored in the variable "y_test"
..- X_test.txt - this file is read and stored in the variable "x_test", calling col.names = features[[2]] to use the terms in the features dataset as the column names
..- subject_train.txt - this file is read and stored in the variable "subject_train" and the column name is renamed from "V1" to "subject" using the rename function from dplyr
..- y_train.txt - this file is read and stored in the variable "y_train"
..- X_train.txt - this file is read and stored in the variable "x_train", calling col.names = features[[2]] to use the terms in the features dataset as the column names

3. Rename the columns in the activity_labels, subject_test, y_test, subject_train, and y_train datasets using the rename function from dplyr
..- for the subject_test and subject_train datasets, rename the column from "V1" to "subject"
..- for the y_test and y_train datasets, rename the column from "V1" to "activity_label"
..- for the activity_labels dataset, rename the "V1" and "V2" columns as "activity_label" and "activity_type", respectively

4. Merge the train and test sets to create one data set
..- Column bind the subject_test, y_test, and x_test datasets and call this the "test" dataset
..- Column bind the subject_train, y_train, and x_train datasets and call this the "train" dataset
..- Row bind the "test" and "train" datasets to get the full dataset

5. Extract the measurements on the mean and standard deviation for each measurement
..- Use grepl to only include the strings: "subject", "activity_label", "mean", or "std" (std represents "standard deviation"), accounting for capitalizations by writing the words "mean" and "std" as [Mm][Ee][Aa][Nn] and [Ss][Tt][Dd], respectively.

6. Use descriptive activity names to appropriately label the dataset
..- Merge the subsetted data from the previous step with the activity_labels data, correlating the two datasets with the common factor 'activity_label'

7. Create a second, independent tidy data set with the average of each variable for each activity and each subject
..- Now, use the aggregate function to get the mean of each variable for each activity and each subject.

Please refer to [run_analysis.R](https://github.com/mika94/Getting-and-Cleaning-Data-Course-Assignment/blob/master/run_analysis.R) for further implementation details.

## Variables

- subject: the numerical representation of a participant in the study (labelled by the numbers 1 to 30)
- activity_label: the activity label (numbers 1 to 6) representing the type of activity the subject performed during measurement 
- activty_type: the activity type the subject performed during measurement (walking, walking upstairs, walking downstairs, sitting, standing, or laying)
- tBodyAcc-mean-X
- tBodyAcc-mean-Y
- tBodyAcc-mean-Z
- tBodyAcc-std-X
- tBodyAcc-std-Y
- tBodyAcc-std-Z
- tGravityAcc-mean-X
- tGravityAcc-mean-Y
- tGravityAcc-mean-Z
- tGravityAcc-std-X
- tGravityAcc-std-Y
- tGravityAcc-std-Z
- tBodyAccJerk-mean-X
- tBodyAccJerk-mean-Y
- tBodyAccJerk-mean-Z
- tBodyAccJerk-std-X
- tBodyAccJerk-std-Y
- tBodyAccJerk-std-Z
- tBodyGyro-mean-X
- tBodyGyro-mean-Y
- tBodyGyro-mean-Z
- tBodyGyro-std-X
- tBodyGyro-std-Y
- tBodyGyro-std-Z
- tBodyGyroJerk-mean-X
- tBodyGyroJerk-mean-Y
- tBodyGyroJerk-mean-Z
- tBodyGyroJerk-std-X
- tBodyGyroJerk-std-Y
- tBodyGyroJerk-std-Z
- tBodyAccMag-mean
- tBodyAccMag-std
- tGravityAccMag-mean
- tGravityAccMag-std
- tBodyAccJerkMag-mean
- tBodyAccJerkMag-std
- tBodyGyroMag-mean
- tBodyGyroMag-std
- tBodyGyroJerkMag-mean
- tBodyGyroJerkMag-std
- fBodyAcc-mean-X
- fBodyAcc-mean-Y
- fBodyAcc-mean-Z
- fBodyAcc-std-X
- fBodyAcc-std-Y
- fBodyAcc-std-Z
- fBodyAccJerk-mean-X
- fBodyAccJerk-mean-Y
- fBodyAccJerk-mean-Z
- fBodyAccJerk-std-X
- fBodyAccJerk-std-Y
- fBodyAccJerk-std-Z
- fBodyGyro-mean-X
- fBodyGyro-mean-Y
- fBodyGyro-mean-Z
- fBodyGyro-std-X
- fBodyGyro-std-Y
- fBodyGyro-std-Z
- fBodyAccMag-mean
- fBodyAccMag-std
- fBodyBodyAccJerkMag-mean
- fBodyBodyAccJerkMag-std
- fBodyBodyGyroMag-mean
- fBodyBodyGyroMag-std
- fBodyBodyGyroJerkMag-mean
- fBodyBodyGyroJerkMag-std
