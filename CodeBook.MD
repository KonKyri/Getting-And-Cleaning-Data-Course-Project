# Getting and Cleaning Data Project

### Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Data Files
* x_train.txt
* y_train.txt
* x_test.txt
* y_test.txt
* subject_test.txt
* subject_train.txt
* features.txt
* activity_labels.txt

### Strategy
* Download the files and unzip them in our working directory.
* Load the training and the test sets.
* Assign column names to the data frames according to the features.txt file.
* Add columns to the data frames according to the Subject,Category and Activity of each row.
* Replace the values of the Activity variable with the proper descriptions.
* Merge the two data frame into one big data frame
* Retrieve the collumns which refer to mean and standard deviation by using the grepl function
* Create a new tidy data set with the average of each variable for each activity and each subject with the help of melt and dcast functions.
