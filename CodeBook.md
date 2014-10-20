---
title: "CodeBook.md"
author: "iNLyze"
date: "Saturday, September 13, 2014"
output: html_document
---

#### Original Data

The original data source is found at

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">source</a>

A description of the original data set is available at

<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">description</a>

For details on the features please refer to the features.txt provided along with the data set. README.md provides more detail on the respective processing steps, how variables were selected and on the organization of the processed data file UCI_data_summary.txt, which is the output of run_analysis.R

#### Activities
> These are the 6 activities performed by the subjects
>
> > LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS

#### Subjects
> Unique identifier for subjects: 
>
> >       1..30


#### Variables

The resulting data frame has the format 180 x 68. 
The 68 columns correspond to 66 variables listed below + 1 for subjects + 1 for activities. The variable names were chosen to resemble those in the original data set so as to facilitate comparisons. Variables containing the string ````-std()```` represent standard deviations. Variables containing the string ````-mean()```` represent average values. All numeric values are floating point values. 

````
 tBodyAcc-std()-X
 tBodyAcc-std()-Y
 tBodyAcc-std()-Z
 tGravityAcc-std()-X
 tGravityAcc-std()-Y
 tGravityAcc-std()-Z
 tBodyAccJerk-std()-X
 tBodyAccJerk-std()-Y
 tBodyAccJerk-std()-Z
 tBodyGyro-std()-X
 tBodyGyro-std()-Y
 tBodyGyro-std()-Z
 tBodyGyroJerk-std()-X
 tBodyGyroJerk-std()-Y
 tBodyGyroJerk-std()-Z
 tBodyAccMag-std()
 tGravityAccMag-std()
 tBodyAccJerkMag-std()
 tBodyGyroMag-std()
 tBodyGyroJerkMag-std()
 fBodyAcc-std()-X
 fBodyAcc-std()-Y
 fBodyAcc-std()-Z
 fBodyAccJerk-std()-X
 fBodyAccJerk-std()-Y
 fBodyAccJerk-std()-Z
 fBodyGyro-std()-X
 fBodyGyro-std()-Y
 fBodyGyro-std()-Z
 fBodyAccMag-std()
 fBodyBodyAccJerkMag-std()
 fBodyBodyGyroMag-std()
 fBodyBodyGyroJerkMag-std()
 tBodyAcc-mean()-X
 tBodyAcc-mean()-Y
 tBodyAcc-mean()-Z
 tGravityAcc-mean()-X
 tGravityAcc-mean()-Y
 tGravityAcc-mean()-Z
 tBodyAccJerk-mean()-X
 tBodyAccJerk-mean()-Y
 tBodyAccJerk-mean()-Z
 tBodyGyro-mean()-X
 tBodyGyro-mean()-Y
 tBodyGyro-mean()-Z
 tBodyGyroJerk-mean()-X
 tBodyGyroJerk-mean()-Y
 tBodyGyroJerk-mean()-Z
 tBodyAccMag-mean()
 tGravityAccMag-mean()
 tBodyAccJerkMag-mean()
 tBodyGyroMag-mean()
 tBodyGyroJerkMag-mean()
 fBodyAcc-mean()-X
 fBodyAcc-mean()-Y
 fBodyAcc-mean()-Z
 fBodyAccJerk-mean()-X
 fBodyAccJerk-mean()-Y
 fBodyAccJerk-mean()-Z
 fBodyGyro-mean()-X
 fBodyGyro-mean()-Y
 fBodyGyro-mean()-Z
 fBodyAccMag-mean()
 fBodyBodyAccJerkMag-mean()
 fBodyBodyGyroMag-mean()
 fBodyBodyGyroJerkMag-mean()
````