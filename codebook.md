Codebook for the tidy data set produced by run_analysis.R
========================================================

The script run_analysis.R processes the Human Activity Recognition Using Smartphones Dataset available from UCI. Please see the features.txt file associated with this dataset for a complete description of the raw data collection procedure, and initial transformations (i.e. fast fourier transform) used to process the data provided in the raw data set.

Inputing the raw data sets, the processing script produces a tidy data set with the following variables:

1. Subject: A integer code (from 1:30) indicating the participant in the study.
2. Activity: The name of the phyiscal activity conducted by the participant.
3-81. Average_: Averages for the means and standard deviations of replicated physical measurements recorded using the Smartphone's accelerometer and 3-axial gyroscope. These averages include average means, mean frequencies, and standard deviations (where applicable) of the variables listed below (note the suffix '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

For more information about the physical significance of these variables, please reference the original features.txt file associated witht the UCI dataset.