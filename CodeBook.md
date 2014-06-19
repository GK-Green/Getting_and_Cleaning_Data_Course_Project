CodeBook for run_analysis.R
===========================

The original data information
-----------------------------

The original raw data is obtain from Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data of the project can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The full description of the data is included in the downloaded files. Please check README.txt first in the downloaded files.

Variable reference in run_analysis.R
-----------------------------------
The variables used in run_analysis.R are described here. The class of every variable are data frame if not specified. The references here are not for variables in the data set. The data set reference will be presented later.
* <b>X_labels</b>: Feature names of the measurements.
* <b>X_test</b>: Features in the test set.
* <b>y_test</b>: Activities in the test set.
* <b>sub_test</b>: Subject ids in the test set.
* <b>X_train</b>: Features in the training set.
* <b>y_train</b>: Activities in the training set.
* <b>X</b>: Features including both test and training set.
* <b>y</b>: Activities including both test and training set.
* <b>subject</b>: Subject ids including both test and training set.
* <b>sub_train</b>: Subject id in the training set.
* <b>data</b>: Combined data set including all information.
* <b>tidy_data</b>: Subset data set extracted from the data that contains only the mean and standard deviation measurements and corresponding activities and subjects.
* <b>group_data</b>: Grouped list data of the tidy_data by subjects and activities.
* <b>mdat</b>: Temperory data set of the average of each variable for each activity and each subject in the tidy_data in matrix form.
* <b>mean_data</b>: A second tidy data with the average of each variable for each activity and each subject. 

Processes of the original data
------------------------------
The data was downloaded and saved as getdata_projectfiles_UCI HAR Dataset.zip. The file was unzipped by 7-zip in windows 8.1 64x system. The following process was done with RStudio Version 0.98.507 and R Version 3.1.0 64x at the working directory pointing to the unzipped folder. Detailed procedures are described as the following:

1. The features, subjects, and activities raw data of both training and test set was imported into R by using read.table with header = FALSE. The feature names was imported by using read.table with rownames = 1 and colClass = "character" to treat the first column as row names and second column as characters.  
2. The training set and the test set were combined by rows separately for features, subjects, and activities data. These three data sets was subsequently combined by columns into one data.frame (data).
3. Columns of the complete data was labeled with descriptive names. The special characters from the original column names ("-", ",", "(", and ")") were replaced by underscore "_" if they are in the middle, and were removed if they are at the end.
4. A tidy data was created by extracting mean and standard deviation measurements. The mean and standard deviation measurements were identified by "mean" or "std" string in the column names. The activities and subjects information was also extracted.
5. Activities in the tidy data was converted to factors with descriptive names.
6. A second tidy data was created by calculation the average of each variable for each activity and each subject in the first tidy data. The activities were converted to numeric for calculation and then converted back to factors with descriptive names.
7. Both tidy data sets were saved in text format.  

Note that intermediate data like X_test was removed when it is not needed to save memory. Please refer to run_analysis.R for details.

Variable reference in final data sets
------------------------------------
The detailed information of the variables are available in the README.txt and features_info.txt in the original data files. A brief reference of the variable names are described as the following:

* <b>SubjectID</b>: ID of the person who did the measurements.
* <b>Activity</b>: Activity of a sample person during a measurement.
* <b>t</b> prefix: Time domain signals.
* <b>f</b> prefix: Frequency domain signals.
* <b>Acc</b>: Acceleration.
* <b>Mag</b>: Magnitude three-dimensional signals.
* <b>Jerk</b>: Jerk signals.
* <b>_XYZ</b>: 3-axial signals in the X, Y and Z directions.
* <b>mean</b>: Mean value.
* <b>std</b>: Standard deviation.
* <b>mad</b>: Median absolute deviation.
* <b>max</b>: Largest value in array.
* <b>min</b>: Smallest value in array.
* <b>sma</b>: Signal magnitude area.
* <b>energy</b>: Energy measure. Sum of the squares divided by the number of values. 
* <b>iqr</b>: Interquartile range.
* <b>entropy</b>: Signal entropy.
* <b>arCoeff</b>: Autoregression coefficients with Burg order equal to 4.
* <b>correlation</b>: correlation coefficient between two signals.
* <b>maxInds</b>: Index of the frequency component with largest magnitude.
* <b>meanFreq</b>: Weighted average of the frequency components to obtain a mean frequency.
* <b>skewness</b>: Skewness of the frequency domain signal.
* <b>kurtosis</b>: Kurtosis of the frequency domain signal.
* <b>bandsEnergy</b>: Energy of a frequency interval within the 64 bins of the FFT of each window.
* <b>angle</b>: Angle between to vectors.
* <b>Ave</b>: The average of each variable for each activity and each subject.

Example: "fBodyAccJerk_meanFreq_Y" stands for the weight average of body acceleration Jerk signal in Y axis in frequency domain.






