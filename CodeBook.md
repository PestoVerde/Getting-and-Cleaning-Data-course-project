#CODE BOOK FOR DATA SET
###for Human Activity Recognition Using Smartphones

##RAW DATA

Raw data and explanations of how it was collected can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

Original data contains 10299 observations in 561 variables.

The studies were made by:
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory DITEN - Universit? degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living Universitat Polit?cnica de Catalunya (BarcelonaTech). Vilanova i la Geltr? (08800), Spain (activityrecognition '@' smartlab.ws)

##SCRIPT AND ITS MANIPULATIONS WITH RAW DATA

Tidy data contains 180 rows (30 volunteers by 6 acrivities) with 66 measurement plus two columns with ids and activities.  It is a result of running  "run_analysis.R" script of R language, which can be found in this repo. The script do the following:

* downloads raw data file, unzip it and removes it to keep directory clean.

* reads two sets (test and train) from raw data and combines them into one data set.

* adds columns with the id of volunteers and activities they perform

* extracts only the measurements on the mean and standard deviation for each measurement.

* creates a tidy data set with the average of each variable for each activity and each subject.

##VARIABLES DESCRIPTIONS

Tidy data can be found in averaged_data_set.txt in your working directory. Letters X, Y and Z in variable names indicate expansion in the axes.


| Variables name                | Position (numbers of columns) | Explanations                                                                                                                     |
|-------------------------------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| id                            | 1                             | Number of volunteers participated in experiment.                                                                                 |
| Activity                      | 2                             | Physical activities performed by subjects, which are LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS |
| tBodyAcc.mean X, Y and Z      | 3-5                           | Means of accelerometer measurements related to body movements (time domain signal)                                               |
| tBodyAcc.std X, Y and Z       | 6-8                           | Standard deviations of accelerometer measurements related to body movements (time domain signal)                                 |
| tGravityAcc.mean X, Y and Z   | 9-11                          | Means of accelerometer measurements related to gravity (time domain signal)                                                      |
| tGravityAcc.std X, Y and Z    |                               |                                                                                                                                  |
|                               | 12-14                         | Standard deviations of accelerometer measurements related to gravity (time domain signal)                                        |
| tBodyAccJerk.mean X, Y and Z  | 15-17                         | Means of accelerometer measurements related to sudden movements (time domain signal)                                             |
| tBodyAccJerk.std X, Y and Z   | 18-20                         | Standard deviations of accelerometer measurements related to sudden movements (time domain signal)                               |
| tBodyGyro.mean X, Y and Z     | 21-23                         | Means of gyroscoping measurements related (time domain signal)                                                                   |
| tBodyGyro.std X, Y and Z      | 24-26                         | Standard deviations of gyroscoping measurements (time domain signal)                                                             |
| tBodyGyroJerk.mean X, Y and Z | 27-29                         | Means of gyroscoping measurements related to sudden movements (time domain signal)                                               |
| tBodyGyroJerk.std X, Y and Z  | 30-32                         | Standard deviations of gyroscoping measurements related to sudden movements (time domain signal)                                 |
| tBodyAccMag.mean              | 33                            | Mean of magnitude of movement (time domain signal)                                                                               |
| tBodyAccMag.std               | 34                            | Standard deviation of magnitude of movement (time domain signal)                                                                 |
| tGravityAccMag.mean           | 35                            | Mean of magnitude of magnitude of gravity (time domain signal)                                                                   |
| tGravityAccMag.std            | 36                            | Standard deviation of magnitude of gravity (time domain signal)                                                                  |
| tBodyAccJerkMag.mean          | 37                            | Mean of magnitude of body movements (time domain signal)                                                                         |
| tBodyAccJerkMag.std           | 38                            | Standard deviation of magnitude of body movements (time domain signal)                                                           |
| tBodyGyroMag.mean             | 39                            | Mean of magnitude of giroscoping measurements (time domain signal)                                                               |
| tBodyGyroMag.std              | 49                            | Standard deviation magnitude of giroscoping measurements (time domain signal)                                                    |
| tBodyGyroJerkMag.mean         | 41                            | Mean of magnitude of giroscoping measurements of sudden movements (time domain signal)                                           |
| tBodyGyroJerkMag.std          | 42                            | Standard deviation of magnitude of giroscoping measurements of sudden movements (time domain signal)                             |
| fBodyAcc.mean X, Y and Z      | 43-45                         | Means of accelerometer measurements related to body movements (frequency domain signal)                                          |
| fBodyAcc.std X, Y and Z       | 46-48                         | Standard deviations of accelerometer measurements related to body movements (frequency domain signal)                            |
| fBodyAccJerk.mean X, Y and Z  | 49-51                         | Means of accelerometer measurements related to sudden movements (frequency domain signal)                                        |
| fBodyAccJerk.std X, Y and Z   | 52-54                         | Standard deviations of accelerometer measurements related to sudden movements (frequency domain signal)                          |
| fBodyGyro.mean X, Y and Z     | 55-57                         | Means of gyroscoping measurements related (frequency domain signal)                                                              |
| fBodyGyro.std X, Y and Z      | 58-60                         | Standard deviations of gyroscoping measurements (frequency domain signal)                                                        |
| fBodyAccMag.mean              | 61                            | Mean of magnitude of movement (frequency domain signal)                                                                          |
| fBodyAccMag.std               | 62                            | Standard deviation of magnitude of movement (frequency domain signal)                                                            |
| fBodyBodyAccJerkMag.mean      | 63                            | Mean of magnitude of body movements (frequency domain signal)                                                                    |
| fBodyBodyAccJerkMag.std       | 64                            | Standard deviation of magnitude of body movements (frequency domain signal)                                                      |
| fBodyBodyGyroMag.mean         | 65                            | Mean of magnitude of giroscoping measurements (frequency domain signal)                                                          |
| fBodyBodyGyroMag.std          | 66                            | Standard deviation magnitude of giroscoping measurements (frequency domain signal)                                               |
| fBodyBodyGyroJerkMag.mean     | 67                            | Mean of magnitude of giroscoping measurements of sudden movements (frequency domain signal)                                      |
| fBodyBodyGyroJerkMag.std      | 68                            | Standard deviation of magnitude of giroscoping measurements of sudden movements (frequency domain signal)                        |
