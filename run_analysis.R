############### Script for The Getting and Cleaning Data Course Project ###############
library(plyr)
library(reshape2)

if(!file.exists("data.zip")){
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip") # Download the zip file
unzip("data.zip") #Extract the file in your working directory
}

features <- read.table("UCI HAR Dataset/features.txt") # Load the features
labels <- read.table("UCI HAR Dataset/activity_labels.txt") # Load the labels of the activities
activity_vector <- unique(labels$V1) # Extract the numbers used in activity labels 
activity_labels <- unique(labels$V2) # Extract the labels in order to use them in the mapValues function


train_set <- read.table("UCI HAR Dataset/train/X_train.txt") # Load the training sets (header = FALSE,sep = "" by default)
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt") #Load the training labels
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt") # Load the subject identifier for training


test_set <- read.table("UCI HAR Dataset/test/X_test.txt") # Load the test sets (header = FALSE,sep = "" by default)
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt") #Load the test labels
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt") # Load the subject identifier for test

colnames(test_set) <- features$V2 # Add titles to the columns
colnames(train_set) <- features$V2 # Add titles to the columns
colnames(train_subject) <- "Subject" #Add title to the column
colnames(test_subject) <- "Subject" #Add title to the column
colnames(train_labels) <- "Activity" #Add title to the column
colnames(test_labels) <- "Activity" #Add title to the column

test_set <- cbind(Category="Test",test_set) # Add a column which describes whether it is a test or a training record
test_set <- cbind(test_subject,test_labels,test_set) # Bind the three data frames together for the final test datframe

train_set <- cbind(Category="Training",train_set) # Add a column which describes whether it is a test or a training record
train_set <- cbind(train_subject,train_labels,train_set) # Bind the three data frames together for the final training dataframe

test_set$Activity <- mapvalues(test_set$Activity, from = as.vector(activity_vector),to = as.vector(activity_labels)) # Replace the number with the descrption of the activity
train_set$Activity <- mapvalues(train_set$Activity, from = as.vector(activity_vector),to = as.vector(activity_labels)) # Replace the number with the descrption of the activity

combined_data <- rbind(train_set, test_set) # combine the two data frames(train,test) into a dataframe

names <- colnames(combined_data) # retrieve the column names from the dataframe

proper_names <- (grepl("Subject",names) | grepl("Activity",names) | grepl("Category",names) | grepl(".*mean.*|.*std.*",names)) # create logical vector

result_data <- combined_data[proper_names == TRUE ] # get the proper data frame

View(result_data) # View the final table

processed_data <- melt(result_data, id  = c("Subject", "Activity","Category")) # Melting the data frame

new_data <- dcast(processed_data, Subject + Activity ~ variable, mean) # Casting the data frame

View(new_data) # View the new table

write.table(new_data, './tidy_data.txt',row.names = FALSE,sep='\t') # Save as a txt file

