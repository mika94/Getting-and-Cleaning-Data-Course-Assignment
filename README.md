# Getting and Cleaning Data Course Assignment

*This is a repository containing the run_analysis R script, a README markdown document, a Codebook markdown document, and a TidySet2 text file for the final assignment of the Getting and Cleaning Data course on Coursera.*

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

## Prerequisites

To run this, you should have R installed from [here](https://www.r-project.org/). You should also have the dplyr package installed so that you can run the rename functions when renaming column names in the dataset. You can install the dplyr package by writing install.packages("dplyr"). 

## License

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. No 2012.

## Authors

Caroline Seiler

## Acknowledgments

Thank you to the information provided in the post by [David Hood](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) for helping guide me during the assignment.
Thank you to everyone on Coursera and in the Getting and Cleaning Data course for the great learning experience and help on discussion board!

*Additional information about the variables, data, and transformations can be found in the CodeBook.MD file.*
