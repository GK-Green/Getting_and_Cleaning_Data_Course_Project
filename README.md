# Course Project 
# Getting and Cleaning Data

## System information
* System: Windows 8.1 64x
* R version: 3.1.0 64x
* RStudio version: 0.98.507
  
## File description 
The project includes the following files:
* <b>README.md</b>
* <b>CodeBook.md</b>: Describes the variables, the data, and any transformations or work performed to clean up the data.
* <b>run_analysis.R</b>: R script that performs the clean-up of the data
* <b>tidy_data.txt</b>: Resulting tidy data contains only the measurements on the mean and standard deviation for each measurement. 
* <b>mean_data.txt</b>: Resulting tidy data contains the average of each variable for each activity and each subject in tidy_data.txt. 

## Running note
In order to run the analysis, the original raw data should be downloaded and unzipped. The working directory of R/RStudio should be set to the unzipped folder. More information are available in the CodeBook.md. The result tidy data sets can be imported using read.table with header = TRUE. No other arguments are needed. The tidy_data.txt should have 81 columns and 10299 rows and the mean_data.txt should have 81 columns and 180 rows.


