## STEP 1: Import all the data (training and test data: x- the measurements,
## recorded by the phones, y- the activity codes; and subject- participant codes)

setwd("~/Desktop/Working Directory/UCI HAR Dataset")
testX <- read.table("test/X_test.txt")
testY <- read.table("test/Y_test.txt")
testSubject <- read.table("test/subject_test.txt")
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/Y_train.txt")
trainSubject <- read.table("train/subject_train.txt")

## Left column bind the subject names and activity codes
## to the physical variables.

testData <- cbind(testSubject,testY,testX)
trainData <- cbind(trainSubject,trainY,trainX)

## Row bind the test and training sets.

completeData <- rbind(testData, trainData)

## Rename the columns- note this is STEP 4 in the prompt.
variables <- read.table("features.txt")
colnames(completeData) <- append(as.character(c("Subject", "Activity")),as.character(variables[,2]))

## Now we have all the observations on 563 variables (activity and subject codes plus original 561)

## STEP 2: Extract only the measurements on the mean and standard deviation. Note
## that the mean-frequencies were included. This decision reflects the objective
## of producing as complete a tidy data set as possible (based on a liberal interpretation
## of the requested averages for means and standard deviations).

## Also, a note on the usage of grep. grep("mean", colnames(completeData)) produces an 
## integer vector with the column numbers for each column name containing the
## substring "mean". Thus, the sorted vector "meanandSDcols" is an ordered list
## of all column numbers for variables on means and standard deviations.

meanandSDcols <- append(grep("mean",colnames(completeData)),grep("std",colnames(completeData)))
meanandSDcols <- sort(meanandSDcols)
completeData <- completeData[,c(1,2,meanandSDcols)]

## STEP 3- Reads in the activity labels from the text file, and replaces
## the numberic activity codes with descriptive names. Note that the first column
## is removed from mergeddata because it contains only the integer activity code<
## which is not needed after merging in the actual activity names.

labels <- read.table("activity_labels.txt")
colnames(labels) <- c("V1","Activity")
mergeddata<- merge(labels,completeData,by.x="V1", by.y="Activity",all=TRUE)[-1]

## STEP 5: Creating a tidy data set. First, the mergeddata data frame is melted, with subject
## and activity as IDs, and all other variables as measures. Then, dcast
## is used to average all variables for all combinations of subject and activity.
## Finally, all the variable column names are prepended with the string "Average_" to
## ensure the variable names are clear.

library(reshape2)
datamelt<- melt(mergeddata,id=c("Subject","Activity"))
tidyset<- dcast(datamelt, Subject + Activity ~ variable, mean)
averagenames<- rep("placeholder",79) ## Note there are 79 non-subject or activity variables
for(i in 1:79){ 
        averagenames[i]<- paste("Average",colnames(tidyset)[i+2],sep="_")
}
colnames(tidyset) <- c("Subject","Activity",averagenames)
write.table(tidyset, "tidy_set.txt")