##1.Merges the training and the test sets to create one data set.

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./getclean.zip")

unzip("./getclean.zip")

subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
test <- cbind(subjecttest,ytest,xtest)

subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
train <- cbind(subjecttrain,ytrain,xtrain)

data <- rbind(test,train)


##2.Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
newname <- c("subject","test")
names <- c(newname, features$V2)
colnames(data) <- names

search <- data[,grepl("mean\\(\\)|std\\(\\)",names(data))]
result <- cbind(data[,1:2],search)


##3.Uses descriptive activity names to name the activities in the data set

activity <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
colnames(activity) <- c("test","activity")
merge <- merge(activity,result,by="test")
result <- cbind(subject= merge$subject, activity = merge$activity, merge[,4:69])


##4.Appropriately labels the data set with descriptive variable names.

names <- names(result)
names <- gsub("\\(\\)","",names)
names <- gsub("^t", "time",names)
names <- gsub("^f", "frequence",names)
names <- gsub("-mean", "Mean",names)
names <- gsub("-std", "Std",names)

colnames(result) <- names


##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
group <- result %>% 
        group_by(subject,activity) %>%
        summarise_each(funs(mean))

