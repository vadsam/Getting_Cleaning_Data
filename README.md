# Getting_Cleaning_Data

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Assumption

* It is assumed that the raw data and folder structure will remain as-is when downloaded and unzipped from the URL.
* The folder UCI HAR Dataset is assumed to be present in the working directory with all sub-folders and files 

## Files
`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the below steps
    1. Merges the training and the test sets to create one data set
    2. Extracts only the measurements on the mean and standard deviation for each measurement
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each             activity and each subject

The final output file is `Averages_Dataset.txt`, and uploaded in the course project submission page.

