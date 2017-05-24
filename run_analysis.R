run_analysis <- function() {
        # First, create the directory and download the file
        if(!file.exists("./data")){dir.create("./data")}
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="./data/Dataset.zip")
        # Unzip dataset to /data directory
        unzip(zipfile="./data/Dataset.zip", exdir = "./data")
        # First, read the data within the directory and assign to variables
        # Read the feature text file and assign values to "features"
        features <- read.table("./data/UCI HAR Dataset/features.txt")
        # Read the activity_labels text file and
        # assign values to "activity_labels"
        activity_labels = read.table(
                './data/UCI HAR Dataset/activity_labels.txt')
        # Read all data in the test directory
        subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
        y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
        # Assign the 'features' data as column names for x_test
        x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt",
                             col.names = features[[2]])
        
        # Read all data in the train directory
        subject_train <- read.table(
                "./data/UCI HAR Dataset/train/subject_train.txt")
        y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
        # Assign the 'features' data as column names for x_train
        x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt",
                              col.names = features[[2]])

        # rename the column names for subject_test and subject_train
        library(dplyr)
        subject_test <- rename(subject_test, subject = V1)
        subject_train <- rename(subject_train, subject = V1)
        
        # rename the column names for y_test and y_train
        y_test <- rename(y_test, activity_label = V1)
        y_train <- rename(y_train, activity_label = V1)
        
        # rename the column names for activity_labels
        activity_labels <- rename(activity_labels,
                                  activity_label = V1,
                                  activity_type = V2)
        
        # Now, combine the test data by columns so we have a complete table
        test <- cbind(subject_test, y_test, x_test)
        # Bind the train data by columns for another table
        train <- cbind(subject_train, y_train, x_train)
        # Add the 2 files together, row-binding train data to the bottom
        dat <- rbind(test, train)
        
        # Extract only the measurements on the mean and standard deviation
        # Using grepl, extract all columns which include the strings:
        # "subject", "activity_label", "mean", or "std" (std represents 
        # "standard deviation")
        # Note: to account for capitalizations, "mean" and "std" are searched
        # as [Mm][Ee][Aa][Nn] and [Ss][Tt][Dd], respectively.
        dat <- dat[, (grepl("subject", names(dat)) |
                                grepl("activity_label", names(dat)) |
                                grepl("[Mm][Ee][Aa][Nn]", names(dat)) |
                                grepl("[Ss][Tt][Dd]", names(dat)))]
        # Merge the mean and std data with the activity_labels data with
        # the common factor between the two files, 'activity_label'
        dataWithActivityName <- merge(activity_labels, dat,
                                      by='activity_label',
                                      all.x=TRUE)
        # Now, use the aggregate function to get the
        # mean of each variable for each activity and each subject.
        TidySet2 <- aggregate(.~subject + activity_type,
                              dataWithActivityName, mean)
        # Order by subject then activity label
        TidySet2 <- TidySet2[order(TidySet2$subject,
                                   TidySet2$activity_label),]
        # Write a table of the data and call it TidySet2.txt
        write.table(TidySet2, "TidySet2.txt", row.name=FALSE)
        # Read the TidySet2 text file and store it in a variable, TidySet2
        TidySet2 <- read.table("TidySet2.txt", header = TRUE)
        # Retrieve the table and display it
        View(TidySet2)
}

# Notes:
# The purpose of this project is to demonstrate your ability to
# collect, work with, and clean a data set.

# Please upload the tidy data set created in step 5 of the instructions.
# Please upload your data set as a txt file created with write.table()
# using row.name=FALSE (do not cut and paste a dataset directly into the
# text box, as this may cause errors saving your submission).

# Please submit a link to a Github repo with the code for performing your
# analysis. The code should have a file run_analysis.R in the main directory
# that can be run as long as the Samsung data is in your working directory.
# The output should be the tidy data set you submitted for part 1.
# You should include a README.md in the repo describing how the script
# works and the code book describing the variables.

# You should create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard
# deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable for
# each activity and each subject.
