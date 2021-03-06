# Getting_Cleaning_Data

This repository contains the R code and documentation files for the course "Getting and Cleaning data".

## Assumptions

* It is assumed that the raw data and folder structure will remain as-is when downloaded and unzipped from the URL.
* The folder UCI HAR Dataset is assumed to be present in the working directory with all sub-folders and files unchanged from      source

## Files
'CodeBook.md' describes the variables, the data, and any transformations or work that was performed to clean up the data.

'run_analysis.R' contains all the code to perform the below steps

* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each          activity and each subject

The final output file is 'Averages_Dataset.txt', and uploaded in the course project submission page.

