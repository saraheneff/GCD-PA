## Getting & Cleaning Data
## Course Project R script
 
# You should create one R script called run_analysis.R that does the following. 
        # 1. Merges the training and the test sets to create one data set.
        # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        # 3. Uses descriptive activity names to name the activities in the data set
        # 4. Appropriately labels the data set with descriptive variable names. 
        # 5. From the data set in step 4, creates a second, independent tidy data set with the 
        # average of each variable for each activity and each subject.

## See README file for information on how the data was downloaded, unzipped, and saved.

library(dplyr)
library(car)
library(reshape2)

## Load data
features <- read.table("./Getting&CleaningPA/UCI HAR Dataset/features.txt")
activity.labels <- read.table("./Getting&CleaningPA/UCI HAR Dataset/activity_labels.txt")

subject.test <- read.table("./Getting&CleaningPA/UCI HAR Dataset/test/subject_test.txt")
subject.train <- read.table("./Getting&CleaningPA/UCI HAR Dataset/train/subject_train.txt")

x.test.data <- read.table("./Getting&CleaningPA/UCI HAR Dataset/test/X_test.txt")
x.train.data <- read.table("./Getting&CleaningPA/UCI HAR Dataset/train/X_train.txt")

y.test.data <- read.table("./Getting&CleaningPA/UCI HAR Dataset/test/Y_test.txt")
y.train.data <- read.table("./Getting&CleaningPA/UCI HAR Dataset/train/Y_train.txt")

# Check dimensions of the data to see how it might fit together
dim(features)
dim(activity.labels)
dim(subject.test)
dim(subject.train)
dim(x.test.data)
dim(x.train.data)
dim(y.test.data)
dim(y.train.data)

# 1. Merge the training and the test sets to create one data set.
        # From the dimensions above, an ordered plan of operations 
        # to merge and mutate the tables above was formulated 
        # (see the README file).  The code to realize this plan is as follows. 
        
        # (1) Add the features data to x.train.data 
        # and x.test.data to create headers
        colnames(x.train.data) = features$V2
        colnames(x.test.data) = features$V2
        
        # (2) Add a column for the variable "group" to the train and test data
        # with the values of "train" and "test," respectively.
        x.train.data$group = "train"
        x.test.data$group = "test"
        
        # (3) Bind the train and test x data into one dataset
        x.data <- rbind(x.train.data, x.test.data)
        
        # (4) Bind the y train and test data into one dataset
        y.data <- rbind(y.train.data, y.test.data)
        
        # (5) Apply the activity labels to the y dataset and add column name "activity"
        colnames(activity.labels) = c("value", "label")
        recoder.fxn <- function(data, old.value, new.value) {
                if(is.factor(data)) data <- as.character(data)
                if(is.factor(old.value)) old.value <- as.character(old.value)
                if(is.factor(new.value)) new.value <- as.character(new.value)
                new.vec <- data
                for(i in unique(old.value))
                        new.vec[data == i] <- new.value[old.value == i]
                new.vec
        }
        y.data.label <- recoder.fxn(y.data, activity.labels$value, activity.labels$label)
        
        colnames(y.data.label) = "activity" ## Give the column a heading
        
        # (6) 6.  Bind the subject train and test data into one dataset and add column name "subject
        subject <- rbind(subject.train, subject.test)
        
        colnames(subject) = "subject" ##Give the columnn a heading
        
        # (7) Merge the x, activity, and subject datasets into one dataset
        data <- cbind(x.data, y.data.label, subject)

# 2. Extract only the measurements on the mean and standard 
        # deviation for each measurement
        mean.std.data <- data[ , grep("mean|std|activity|subject", colnames(data))]
        dim(mean.std.data) ## check

# 3. Use descriptive activity names to name the activities 
# in the data set
        # See 1.(5) above for process and "mean.std.data" for results.
        # Assuming the steps build upon one another, so using 
        # the dataset from step2 (mean.std.data)

# 4. Appropriately label the data set with descriptive variable names. 
        # See 1.(1) above for process and "mean.std.data" for results.
        # Assuming the steps build upon one another, so using 
        # the dataset from step2 (mean.std.data)
        # The most current tidied dataset is "mean.std.data"

# 5. From the data set in step 4, create a second, independent 
        # tidy data set with the average of each variable for each 
        # activity and each subject.
        melted.data <- melt(mean.std.data, id=c("activity", "subject"))
        data2 <- dcast(melted.data, activity + subject ~ variable, mean, na.rm=TRUE)
        write.table(data2, file = "/Users/saraheneff/Desktop/Coursera R Directory/Getting&CleaningPA/GCD_PA_tidy_data.txt", row.names = FALSE)
