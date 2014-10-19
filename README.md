---
title: "README.md"
author: "iNLyze"
date: "Saturday, September 13, 2014"
output: html_document
---

getClean_CourseProject
======================
This repository contains the files to the course project for the course "Getting and Cleaning Data". This course is part of the Data Science specialization on Coursera. The files are:

* README.md - This document
* run_analysis.R - The R script performing the analysis
* CodeBook.md - A code book describing all variables in the tidy data set
* - A tidy data set as described in CodeBook.md named "UCI_data_summary.txt"

### Prerequisit data
The function run_analysis.R loads and processes data provided originally from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was downloaded as a ZIP file from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Prerequisit libraries
run_analysis.R uses the following libraries:
library(tidyr)
library(dplyr)
library(qdap)
library(reshape)

### Input parameters
run_analysis.R accepts two character vectors as input parameters: 
base_dir, sub_dir
They are explained in more detail inside run_analysis.R
Both input parameters default to the directory which run_analysis.R is called from. The .zip file extracts to a sub-folder called "UCI_HAR_Dataset". This is also the default for run_analysis.R

### Output parameters
run_analysis.R writes a single file called "UCI_data_summary.txt" to the folder it is called from. 
When applied to the data set mentioned above it is equivalent to a data.frame with dimensions 180 x 68.

### What run_analysis.R does:

#### Step 1: Load files into memory
Data is loaded via a file list into a list of data.frames. Each element of the list corresponds to a .txt file in sub_dir. A second list, called dataList stores one data.frame for each file in sub_dir as a list. For details on the variables used see remarks in run_analysis.R

#### Step 2: Re-arrange and create tidy data set
The data in dataList is bound together such as to create a data frame like this:
![tidy_data_frame_by_David_Hood](tidy_data_frame.png)
(Slide courtesy of David Hood)
The following entries of dataList correspont to the respective files in sub_dir:

dataList index | Corresponding file
---------------| ---------------
dataList[[1]]      |     activity_labels.txt
dataList[[2]]      |     features.txt
dataList[[27]]     |     X_train.txt
dataList[[15]]     |     X_test.txt
dataList[[26]]     |     subject_train.txt
dataList[[14]]     |     subject_test.txt
dataList[[28]]     |     y_train.txt
dataList[[16]]     |     y_test.txt

At this point the data.frame tidy has the dimensions 10299 x 563

#### Step 3: Select columns of interest and bind them together
The course project asks to select all columns with standard deviations and mean, but isn't very verbose about which ones exactly. It was chosen to use the following to strings for selection:
````
"-std\\()" 
"-mean\\()"
````
This means, e.g. "meanFeatures" will NOT be selected. The total selection leads to 68 selected columns (66 of which contain data + 1 for subjects + 1 for activities). 
At this point the data.frame tidy has the dimensions 10299 x 68

#### Step 4: Creating another tidy data set containing averages
A summary is to be created with the "average of each variable for each activity and each subject.". 
The course project asks for "average" which is interpreted as the mean. The summary is grouped for activities and subjects, respectively. It is made sure, that each subject performs every activity. 
Hence, 6 activities x 30 subjects = 180 observations. 
The resulting data.frame avgData has the dimensions 180 x 68
Details are provided in the CodeBook.md

#### Step 5: Writing tidy data set to file
The data.frame avgData is written to a file called "UCI_data_summary.txt" using
````
write.table(avgData, file = "UCI_data_summary.txt", row.names = FALSE)
````