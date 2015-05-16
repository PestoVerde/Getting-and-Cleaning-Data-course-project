#ABOUT SCRIPT RUN_ANALISYS.R 

This script is created for Getting and Cleaning Data course project. You need just to run it and all the rest it will do by itself. What exactly:

1. It recognize your operating system to apply correct method of uploading and correct pathes.
2. It takes raw data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
3. If you already have raw data set it renames it in case you have something useful in it.
4. It upload raw data into your working directory, unzip it and remove zip file to keep your disk clean.
5. It combine to sets of raw data into one.
6. It adds columns with the id of  volunteers and activities they perform
7. It extracts only the measurements on the mean and standard deviation for each measurement.
8. It checks do you have dplyr library and if not it uploads it. Then it attaches it. 
8. It creates a tidy data set with the average of each variable for each activity and each subject.
9. And finally it write "averaged_data_set.txt" file with tidy data into your working directory. It overwrites his old output to be sure you always have fresh tidy data.

For descriprions of variables please see CodeBook.ms in this repo.