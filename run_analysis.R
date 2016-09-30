library(plyr)
library(dplyr)
library(reshape2)

# Since reviewers may not have these packages already installed, install them if necessary. 
if (require(LaF) == FALSE) {
    install.packages("LaF")
    library(LaF)
}
if (require(utils) == FALSE) {
    install.packages("utils")
    library(utils)
}


fast_read <- function(file_path, col_labels){
    # http://stackoverflow.com/questions/24715894/faster-way-to-read-fixed-width-files-in-r
    # Use the laf_open_fwf function instead of read.fwf.  It is MUCH faster (seconds vs minutes) for large files.
    # Note the trailing [,] which changes the result from a laf object back into a data.frame object.
    laf_open_fwf(file_path, column_types = rep.int("double", 561), column_widths = rep.int(16,561), column_names = col_labels)[,]
}

# Download and unzip the data files.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")
unzip("Dataset.zip")


filename = file.path("UCI HAR Dataset", "features.txt")
features <- read.table(filename, sep = " ", col.names = c("feature_index", "feature"), as.is = TRUE)
# Remove any parentheses from the feature names.
features$feature <- gsub("[\\(\\)]", "", features$feature)
# Change commas and minus signs to underscores.
features$feature <- gsub("[,-]", "_", features$feature)


# Combine files using the technique from Hadley Wickham's Tidy Data paper
# https://www.jstatsoft.org/article/view/v059i10/v59i10.pdf
paths <- dir("UCI HAR Dataset", pattern = "^X_", full.names = TRUE, recursive = TRUE)
names(paths) <- basename(paths)
observations <- ldply(paths, fast_read, col_labels = features$feature, .id = NULL)


# Get the corresponding set of test subjects for each observation
paths <- dir("UCI HAR Dataset", pattern = "^subject_", full.names = TRUE, recursive = TRUE)
names(paths) <- basename(paths)
subject <- ldply(paths, read.table, header = FALSE, col.names = "subject", .id = NULL)


# Get the corresponding set of activities for each observation
filename = file.path("UCI HAR Dataset", "activity_labels.txt")
activity_labels <- read.table(filename, sep = " ", col.names = c("activity_index", "activity"))

paths <- dir("UCI HAR Dataset", pattern = "^y_", full.names = TRUE, recursive = TRUE)
names(paths) <- basename(paths)
activities <- ldply(paths, read.table, header = FALSE, col.names = "activity", .id = NULL)
activities$activity <- activity_labels[,2][match(activities$activity, activity_labels[,1])]


# Bind the test subjects and the activities to the observations that are means or standard deviations.
means_stds <- grep("mean|std", features[,2])
observations <- cbind(subject, activities, observations[,means_stds])


# Get the summary means values.
grouped <- group_by(observations, subject, activity)
mean_measurements <- summarize_each(grouped, funs(mean))
View(mean_measurements)