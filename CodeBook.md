##Code Book For Course Project

Overview
This code book will provide details as to the code used to create the TidyDataSet.txt file.

Data:
Data was extracted from the UCI HAR Dataset and involved 8 main files:
X_test.txt
y_test.txt
subject_test.txt
X_train.txt
y_train.txt
subject_train.txt
features.txt
activity_labels.txt

Data set information:

Information on the data set can be found at the link below:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data analysis Process:

1.) Read in the 8 mentioned files into specific file variables.
xtrain for X_train.txt
ytrain for y_train.txt 
Subjecttrain for subject_train
xtest for X_test.txt
ytest for y_test.txt
Subjecttest for subject_test.txt
features for features.txt
ActivityLabels for activity_labels.txt

2.) Assign column names and merge data
Assigned column names for each file variable (with exception of features)
Merged training and testing files with the following variables:
MergeTrain- combined 3 training files
MergeTest- combined 3 test files
CombineTrainTest- combined both MergeTrain and MergeTest variables

3.) Extract only the measurements on the mean and standard deviation for each measurement
Assigned ColNames variable to the column names of CombineTrainTest variable.
Defined the mean and standard deviation with variable MeanandStdDev
Subset the mean and standard deviation of variable CombineTrainTest with variable SubsetMeandandStdDev

4.) Labled activities within data set
Assigned variable ActivityNames to the merging of variables SubsetMeandandStdDev and ActivityLabels.  Merged by "activityId"

5.) Created a second data set named TidyDataSet.txt per instructions
Assigned variable TidyDataSet to generate TidyDataSet.txt file.  




