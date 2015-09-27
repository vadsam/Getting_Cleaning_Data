# Introduction

The script 'run_analysis.R' performs all steps described in the  project definition and generates the averages file in
the working directory

# Variables

* 'x_train', 'y_train', 'x_test', 'y_test', 'subject_train' and 'subject_test' contain the data from the downloaded files
* x_data, y_data and subject_data merge the previous datasets to further analysis
* 'features' contains the correct names for the ''x_data' dataset
* 'mean_var', 'std_var' contain the list of variables having mean and SD measurements
* mean_std_list is the full list containig all measurement of mean and SD
* activity contains the correct names for the `x_data` dataset
* combined merges x_data, y_data and subject_data into a single dataframe. Cbind is used to combine the data
* avrg_data contains the relevant average of each variable for each activity and each subject

# Packages

* dplyr package is used in the code to determine the averges of each variable per activity per person 
  and write it to a file in the required format
