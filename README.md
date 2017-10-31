# Getting-And-Cleaning-Data-Course-Project
 This repository refers to the Getting and Cleaning Data course project available on Coursera.
 
 ### Purpose
 The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to     prepare tidy data that can be used for later analysis.
 
 ### Background
 One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Summary of the script
* Merge the training and the test sets to create one data set
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Strategy
* Download the files and unzip them in our working directory.
* Load the training and the test sets.
* Assign column names to the data frames according to the features.txt file.
* Add columns to the data frames according to the Subject,Category and Activity of each row.
* Replace the values of the Activity variable with the proper descriptions.
* Merge the two data frame into one big data frame
* Retrieve the collumns which refer to mean and standard deviation by using the grepl function
* Create a new tidy data set with the average of each variable for each activity and each subject with the help of melt and dcast functions.

