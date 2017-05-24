# Getting and Cleaning Data Course Assignment

## Overview

This course project for the Getting and Cleaning Data Coursera course is meant to demonstrate the ability to collect, work with, and clean a data set for subsequent analysis. Using a data set provided by the course, a zip file containing all data for this project was downloaded from the url [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). A full description of the data used in this project can be found at 
[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Project Summary

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1. Download the dataset if it does not already exist in the working directory
2. Read and store the activity_labels and features text files as data frames
3. Read and store the training and test datasets, X_train and X_test, respectively, as data frames and using the features data frame to label the columns
4. Read and store the activity and subject data for the train and test data sets: y_train, subject_train, y_test, and subject_test
5. Rename the columns as "activity_label" and "subject", respectively, for the activity and subject data
5. Bind the columns of the training and test datasets with the activity and subject data
6. Bind the rows of the training and test datasets
7. Extract the columns that include the strings "subject", "activity_label", "mean", or "std" (for standard deviation) and store as a new data frame
8. Rename the columns of activity_labels as "activity_label" and "activity_type"
9. Merge the activity_labels data frame with the new data frame using "activity_label" as the identifier
10. Creates a tidy dataset that consists of the mean value of each variable for each subject and activity type
11. Order the tidy dataset by subject and activity label
12. Write a text file table of the data and call it TidySet2.txt
13. Read TidySet2.txt, setting header = TRUE, and store in the variable TidySet2
14. View TidySet2 using the View() function
15. When the function is run, the dataset will be saved as a text file, TidySet2.txt, in the working directory and displayed in a new window of R

*Additional information about the variables, data, and transformations can be found in the CodeBook.MD file.* 
  
  The following is paraphrased from the README file from the above url. This data provided data on a group of 30 volunteers between the ages of 19-48 years. Each subject performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a Samsung Galaxy SII smartphone on their waist. The experimenters measured the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz and video-recorded the experiments to label the data manually. The resulting dataset was randomly split into two sets, where 70% of subjects were used to generate the training data and 30% the test data. 
  
  The run_analysis function first creates a directory, ./data, and downloads the zip file url into that file. It then unzips the dataset to the ./data directory. This creates a directory called "UCI HAR Dataset". 
  
  Next, all the relevant files from the "UCI HAR Dataset" are read by read.table into variables for manipulation within the function:
  - features.txt - this file is read and stored into the variable "features"
  - activity_labels.txt - this file is read and stored in the variable "activity_labels"
  - subject_test.txt - 
  - y_test.txt - 
  - X_test.txt - 
  
Repository containing the run_analysis R script, a ReadMe markdown document, a Codebook markdown document, and a tidy data text file for the final assignment of the Getting and Cleaning Data course on Coursera.

The README that explains the analysis files is clear and understandable.



One Paragraph of project description goes here

Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

Prerequisites

What things you need to install the software and how to install them

Give examples
Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

Give the example
And repeat until finished
End with an example of getting some data out of the system or using it for a little demo

Running the tests

Explain how to run the automated tests for this system

Break down into end to end tests

Explain what these tests test and why

Give an example
And coding style tests

Explain what these tests test and why

Give an example
Deployment

Add additional notes about how to deploy this on a live system

Built With

Dropwizard - The web framework used
Maven - Dependency Management
ROME - Used to generate RSS Feeds
Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

Versioning

We use SemVer for versioning. For the versions available, see the tags on this repository.

Authors

Billie Thompson - Initial work - PurpleBooth
See also the list of contributors who participated in this project.

License

This project is licensed under the MIT License - see the LICENSE.md file for details

Acknowledgments

Hat tip to anyone who's code was used
Inspiration
etc
===
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================



For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. No 2012.
