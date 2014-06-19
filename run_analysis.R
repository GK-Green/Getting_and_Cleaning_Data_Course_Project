# This script reads, cleans and extracts mean and standard diviation 
# measurements of the dataset from Human Activity Recognition Using 
# Smartphones Dataset: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

# The dataset should be downloaded and unzipped before running this script
# The working directory should be set to the unzipped folder of the dataset


# Read the raw data from downloaded and unzipped files

X_labels  <- read.table("./features.txt", header = FALSE, row.names = 1, 
                        colClasses = "character")

X_test    <- read.table("./test/X_test.txt", header = FALSE)
y_test    <- read.table("./test/y_test.txt", header = FALSE)
sub_test  <- read.table("./test/subject_test.txt", header = FALSE)

X_train   <- read.table("./train/X_train.txt", header = FALSE)
y_train   <- read.table("./train/y_train.txt", header = FALSE)
sub_train <- read.table("./train/subject_train.txt", header = FALSE)

# Combine the training set and the test set

X         <- rbind(X_train,X_test)
y         <- rbind(y_train,y_test)
subject   <- rbind(sub_train,sub_test)

# Remove the raw data to save memory

rm(X_test,y_test,sub_test,X_train,y_train,sub_train)

# Combine the features, activities and subject into one data frame

data           <- cbind(subject, y, X)

# Name each column with descriptive varible names 
# Remove special charaters at the end of each name
# Replace special charaters in the middle of each name with underscore


X_labels       <- gsub("\\(\\)" ,"", as.matrix(X_labels))
X_labels       <- gsub("-|,|\\(", "_", X_labels)
X_labels       <- gsub("\\)", "", X_labels)

colnames(data) <- c("SubjectID", "Activity", t(X_labels))

# Remove the temporary data to save memory

rm(X, y, subject)

# Extract only the measurements on the mean and standard deviation

tidy_data     <- data[,grep("mean|std|SubjectID|Activity",names(data))]

# Label the activities with discriptive names

tidy_data$Activity         <- factor(tidy_data$Activity)
levels(tidy_data$Activity) <- c("walking", "walking_upstairs", "walking_downstairs", 
                                  "sitting", "standing", "laying")

# Output the first tidy data into a csv file

write.table(tidy_data,"./tidy_data.txt", row.names = FALSE)


# Calculate the the average of each variable for each activity and each subject.

tidy_data$Activity <- as.numeric(tidy_data$Activity)
group_data         <- split(tidy_data,list(tidy_data$SubjectID,tidy_data$Activity))
mdat               <- sapply(group_data,colMeans)
colnames(mdat)     <- NULL
mean_data          <- data.frame(t(mdat))

# Remove the temporary data to save memory

rm(group_data, mdat)

# Label the activities with discriptive names

mean_data$Activity           <- factor(mean_data$Activity)
levels(mean_data$Activities) <- c("walking", "walking_upstairs", "walking_downstairs", 
                                 "sitting", "standing", "laying")

# Output the final tidy data into a csv file

names(mean_data)    <- paste("Ave_", names(mean_data), sep = "")
names(mean_data)[1] <- "SubjectID"
names(mean_data)[2] <- "Activity"

write.table(mean_data,"./mean_data.txt", row.names = FALSE)

