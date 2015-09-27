# this file contains to code to perform all steps described in the project definition

# load dplyr package
library(plyr)

# load data from downloaded files in train folder
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# load data from downloaded files in test folder
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# combine the respective datasets using rbind()
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# load the data feature file
features <- read.table("UCI HAR Dataset/features.txt")

# identify columns with mean measurements
mean_var <- features[features$V1 %in% grep("mean", features$V2),]
# identify columns with SD measurements
std_var <- features[features$V1 %in% grep("std", features$V2),]
# merge mean and SD columns into one 
mean_std_list <- rbind(mean_var,std_var)

# subsetx dataset for columns containing only mean and SD measurements
x_mean_std <- x_data[,mean_std_list$V1]

# load activities from activity file
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
# update y dataset with correct activity names
y_data[,1] <- activity[y_data[,1],2]

# label all 3 data sets with variable names
names(x_mean_std) <- mean_std_list$V2
names(subject_data) <- "Volunteer"
names(y_data) <- "activity"

#merge all 3 datas sets into a single data frame
combined_data <- cbind(x_mean_std, y_data, subject_data)

# user plyr package to calcualte the mean for all variables per person per activity
avrg_data <- ddply(combined_data,.(Volunteer, activity), function(x) colMeans(x[, 1:79]))

# write the averages to an output file
write.table(avrg_data, "Averages_Dataset.txt", row.name=FALSE)
