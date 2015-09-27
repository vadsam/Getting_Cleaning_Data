library(plyr)

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
names(subject_data) <- "Volunteer"

features <- read.table("UCI HAR Dataset/features.txt")
mean_var <- features[features$V1 %in% grep("mean", features$V2),]
std_var <- features[features$V1 %in% grep("std", features$V2),]
mean_std_list <- rbind(mean_var,std_var)

x_mean_std <- x_data[,mean_std_list$V1]
names(x_mean_std) <- mean_std_list$V2

activity <- read.table("UCI HAR Dataset/activity_labels.txt")
y_data[,1] <- activity[y_data[,1],2]
names(y_data) <- "activity"

combined_data <- cbind(x_mean_std, y_data, subject_data)
avrg_data <- ddply(combined_data,.(Volunteer, activity), function(x) colMeans(x[, 1:79]))
write.table(avrg_data, "Averages_Dataset.txt", row.name=FALSE)
