##Read the training files
xtrain<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
ytrain<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
Subjecttrain<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

##Read the testing files
xtest<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
ytest<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
Subjecttest<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

##Read the features
features<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt")

##Read the activity labels
ActivityLabels<- read.table("~/Josh Data Science/DataScienceWorkingDir/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

##Assign the column names
colnames(xtrain) <- features[,2]
colnames(ytrain) <- "activityId"
colnames(Subjecttrain) <- "subjectId"

colnames(xtest) <- features[,2]
colnames(ytest) <- "activityId"
colnames(Subjecttest)<- "subjectId"

colnames(ActivityLabels) <- c("activityId", "activityType")
                              
##Merge the training and the test sets

MergeTrain <- cbind(ytrain, Subjecttrain, xtrain)
MergeTest <- cbind(ytest, Subjecttest, xtest)
CombineTrainTest<- rbind(MergeTest, MergeTrain)

##Extract only the measurements on the mean and standard deviation for each measurement

##Read column names
ColNames <- colnames(CombineTrainTest)

##defining the mean and standard deviation
MeanandStdDev<- (grepl("activityId", ColNames)|
                 grepl("subjectId" , ColNames)|
                 grepl("mean..", ColNames)|
                 grepl("std..", ColNames))

##Subset
SubsetMeanandStdDev<- CombineTrainTest[, MeanandStdDev == TRUE]

##Name Activities
ActivityNames<- merge(SubsetMeanandStdDev, ActivityLabels, by= "activityId", all.x= TRUE)

##Create a second, independent tidy data set with the average of each variable for each activity and subject
TidyDataSet<- aggregate(. ~subjectId + activityId, ActivityNames, mean)
TidyDataSet<- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]

##Create TidyDataSet Table
write.table(TidyDataSet, "TidyDataSet.txt", row.names = FALSE)
