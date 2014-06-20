Processing the Human Activity Recognition Using Smartphones Dataset with run_analysis.R
========================================================

The script run_analysis.R processes the Human Activity Recognition Using Smartphones Dataset available from UCI. The script works as follows:

1. First, the raw data is imported, including both the measurements recorded by the smartphones (in the "X-test" and "X-train" files), the activity codes (in the "Y-test" and "Y-train" files), and the subject codes.

2. Next, the training and test data are concatenated so the subject codes, activity codes, and measurements are all in the same data frame. Then the training and test data are concatenated to create the completeData data frame.

3. Next, the "features.txt" file is read into R, and the variable names from this code book are used as column names for completeData.

4. The next processing step involves subsetting the data, selecting only those measurements involving means and standard deviations. The method for this subset was to select variables with names including either the character substring "mean" or "std." This method includes mean frequencies, which is justified since it is the most liberal and thus most complete method of constructing the tidy data set (i.e. if the end user of the data needed the average mean frequencies, they are included in the tidy data set).

5. The next step in processing is reading in the "activity_labels.txt" file, and merging this file (which links activity codes and descriptive names) with the data frame completeData to ensure the tidy data set includes descriptive activity names.

6. Finally, melt() and dcast() are used to create the final tidy data set with averages for all the mean and std measurements for each combination of subject and activity. The column names from the original data set are retained, but the string "Average_" is prepended to the front to indicate that the values reported in the final tidy data sets are averages of all measurements.