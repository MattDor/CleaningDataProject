# CleaningDataProject
R Cleaning Data Course

The script performs the following steps to run the analysis

1. It reads the actual data, the subjects and the activities for both the train and the test dataset
2. It reads reference data, i.e. the variable names (from feature.txt) and the list of activity codes and the corresponding labels
3. It merges the test and the train data sets
4. It sets the variable names from feature.txt as variable names in the merged data set
5. It extracts all variables with std() or mean()
6. It adds the subjects to the merged data set
7. It adds activity labels to the merged data set
8. It calculates the mean for all variables, grouped by subject and activity
9. It writes the merged data set and the average data set to file
