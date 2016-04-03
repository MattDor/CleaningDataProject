#
# Get test data set
#
testData <- read.delim("test/X_test.txt",header=F,sep="")
testActivity <- read.delim("test/y_test.txt",header=F,sep="")
testSubject <- read.delim("test/subject_test.txt",header=F,sep="")
#
# Get the train data set
#
trainData <- read.delim("train/X_train.txt",header=F,sep="")
trainActivity <- read.delim("train/y_train.txt",header=F,sep="")
trainSubject <- read.delim("train/subject_train.txt",header=F,sep="")
#
# Get activity labels and feature names
#
activityLabels <- read.delim("activity_labels.txt",header=F,sep="",colClasses=c("integer","character"))
featureNames <- read.delim("features.txt",header=F,sep="",colClasses=c("integer","character"))

#
# Merge test and train data set
#
mergedData  <- rbind(testData,trainData)

#
# Set activity labels as variable names
#
names(mergedData) <- featureNames[,2]

# 
# Create dataset with only mean and stddev
#
meanAndStdCols <- grep("std\\(\\)|mean\\(\\)",names(mergedData))
meanAndStdData <- mergedData[,meanAndStdCols]

#
# Merge subjects and add them to dataset
#
mergedSubject  <- rbind(testSubject,trainSubject)
names(mergedSubject) <- "Subject"
meanAndStdData <- cbind(meanAndStdData,mergedSubject)

#
# Merge activities, translate them to labels and add them to dataset
#
mergedActivity  <- rbind(testActivity,trainActivity)
for (i in 1:6) {
  mergedActivity[mergedActivity == i,] <- activityLabels[activityLabels$V1==i,2]
}
names(mergedActivity) <- "ActivityLabel"
meanAndStdData <- cbind(meanAndStdData,mergedActivity)

#
# Create new data set with average for each variable by activity and subject
#

avgData <- aggregate(. ~ Subject + ActivityLabel, data=meanAndStdData, FUN=mean)

#
# Write both data sets to file
#
write.table(meanAndStdData,"meanAndStdData.txt")
write.table(avgData,"avgData.txt",row.name = FALSE)
