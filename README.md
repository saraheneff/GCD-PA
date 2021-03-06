# GCD-PA
Repo containing the materials (README, script, and code book) for Getting &amp; Cleaning Data, Peer Assessment (course project)

# Getting & Cleaning Data, Peer Assessment

## The Assignment
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

## Data Processing

1. First, data was obtained from the Getting & Cleaning Data course project webpage (the link above).
2. The files were unzipped and stored in the working directory and uploaded into R Studio as a table.
3. An ordered plan of data cleaning, merging, and tidying operations was formulated and is as depicted below:

![GACD_PA_Data_Plan](https://drive.google.com/uc?id=0B8Cec8SOGFjhSkN5TGUxendIRDA&authuser=0?raw=true "GCD_PA_Data_Plan copy")

### Outline of the plan:
1.  Add the features data to x.train.data and x.test.data to create headers
2.  Add a column for the variable "group" to the train and test data with the values of "train" and "test," respectively.
3.  Bind the train and test x data into one dataset
4.  Bind the y train and test data into one dataset
5.  Apply the activity labels to the y dataset and add column name "activity"
6.  Bind the subject train and test data into one dataset and add column name "subject"
7.  Merge the x, activity, and subject datasets into one dataset

Steps taken to tidy the data as outlined above and the code to fulfill the project goals outlined in "The Assignment" section above are included and detailed in the included R script.


