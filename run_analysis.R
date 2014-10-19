run_analysis <- function(base_dir = ".", sub_dir = "\\UCI_HAR_Dataset")
## Include libraries
library(tidyr)
library(dplyr)
library(qdap)
library(reshape)
        
        
## Path Variables:
## base_dir: First half of path to files, e.g. "/home/user" or "."
## sub_dir: Specific subfolder to files, e.g. "/UCI_HAR_Dataset/"


        
## Step 1: First load the files into memory  
## path is a string (character vector) containing the path to the UCI HAR Dataset
## fileList stores a list of character vectors with the contents of the folder in sub_dir
## dataList stores a list of data.frames with the loaded data (using read.csv)
path <- paste(base_dir, sub_dir, sep = "")
fileList <- list.files(path, pattern="*.txt", recursive = TRUE)
dataList <- as.list(1:length(fileList)) ## Init variables
path <- paste(path, "\\\\", sep = "")
        print(fileList)
for (i in 1:length(fileList)) {
        print(i)
        fileList[i] <- gsub("/", "\\\\", fileList[i])
        dataList[[i]] <- read.csv(paste(path, fileList[i], sep = ""), header = FALSE, sep = "", stringsAsFactors = FALSE)

}

## Step 2: Re-arrange and create tidy data set
##
## Unify training set and test set
##
tidy <- data.frame()
tidy <- union(dataList[[27]], dataList[[15]])
##
## Rename resulting columns using feature.txt
##
names(tidy) <- dataList[[2]][, 2]
##
## Integrate subjects
subjects <- data.frame()
subjects <- rbind(dataList[[26]], dataList[[14]])
names(subjects) <- "subjects"
## Integrate activities
activities <- data.frame()
activities <- rbind(dataList[[28]], dataList[[16]])
## Rename activities
activities <- as.data.frame(activities %l% dataList[[1]])
names(activities) <- "activities"

## Step 3: Select columns of interest and bind them together
#
## Select columns for STD, MEAN
#
tidy <- cbind(select(tidy, contains("-std\\()")), select(tidy, contains("-mean\\()") ) )

## Bind all columns together
tidy <- cbind(tidy, subjects, activities)

## Step 4: Reshape data frame using melt and cast
mtidy <- melt(tidy, id=c("activities","subjects"))
avgData <- cast(mtidy, activities + subjects ~ variable, mean)

## Free some memory
# rm(dataList)
# rm(tidy)
# rm(mtidy)

## Step 5: Write results to file
write.table(avgData, file = "UCI_data_summary.txt", row.names = FALSE)