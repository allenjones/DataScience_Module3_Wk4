---
title: "README"
author: "Allen Jones"
date: "September 21, 2016"
output: html_document
---

## Course Assignment

The assignment for the Getting and Cleaning Data Course Project is to create a script file named run_analysis.R that does the following:

1. "Merges the training and the test sets to create one data set.
2. "Extracts only the measurements on the mean and standard deviation for each measurement.
3. "Uses descriptive activity names to name the activities in the data set
4. "Appropriately labels the data set with descriptive variable names.
5. "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

In addition, the submission must satisfy the following criteria:

1. "The submitted data set is tidy.
2. "The Github repo contains the required scripts.
3. "GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. "The README that explains the analysis files is clear and understandable.
5. "The work submitted for this project is the work of the student who submitted it."

## The Submission

The files in this GitHub repository satisfy these requirements as follows:

The file named "run_analysis.R" performs the following steps:

1. Lines 1-3 of run_analysis.R assumes that the reviewers of this program already have the plyr, dplyr, and reshape2 libraries installed on their computers from having worked on the class exercises, so the program loads these libraries without first verifying that they are already installed.
2. Lines 6-12 assume that the review may not have the LaF and utils packages installed already, so it installs and loads them if necessary.  The first time the program installs these packages, it may generate a warning such as "there is no package called 'LaF'".  This is normal.  The "require" function detects this warning and the "if" statement which contains that function installs and loads the appropriate package in this case.

3. The main part of the program begins at line 24 of the file.  This line and the following line download and unzip the data files that are to be used in this assignment.
4. Line 28 forms an operating system independent path to the newly unzipped features.txt file.  These features represent the various measurements that are available in the initial data set.  These feature names are modified slightly when they are read into a data table.  The changes consist of removing parentheses, and changing commas and hyphens to underscores.  These changes were made so that users of the resulting tidy data set would not need to deal with characters that may be invalid if used "as-is" in various programs.  Although one of the courses *recommended* removing all underscores and changing all letters to lower case, this was not done because it made the column names much harder to read.  For example, although fBodyBodyGyroJerkMag_meanFreq is not simple to read, it is much easier than fbodybodygyrojerkmagmeanfreq.
5. Lines 38-40 of the file combine the X_test.txt and X_train.txt files into a single data set named observations using the technique recommended in Hadley Wickham's Tidy Data Paper.<sup>1</sup>  A function was created in lines 16-21 of the file to make it easier to call the laf_open_fwf function.  This function was used instead of read.fwf because read.fwf took minutes to read in the large data sets while laf_open_fwf was able to accomplish the same thing in seconds.
6. Lines 44-46 apply the same techique to combine the subject_test.txt and subject_train.txt files into a single data set named subject.  This data set contains the subject that corresponds to each row in the observations data set.
7. Lines 50-51 read the activity_labels.txt file and place it in a data frame named activity_labels.
8. Lines 53-56 once again apply the same technique from Hadley Wickham to combine the y_test.txt and y_train.txt files into a single data set. The numbers in this data set are then replaced with their corresponding activity_labels and placed in a data frame named activities.  This data set contains the activity that corresponds to each row in the observations data set.
9. Line 60 creates an integer vector containing the indices of the feature names that contain "mean" or "std".  This vector is used to determine which columns will be needed in order to extract "only the measurements on the mean and standard deviation for each measurement."  This line does *not* extract the indices for columns such as "angletBodyAccMean_gravity".  This is intentional since these variables do not measurements on the mean or standard deviation.  They are actually angular measurements and should not be included.
10. Line 61 binds the subject and the activity to the portions of the observations data frame indicated by the previous step and stores the result back in the observations data frame.
11. Lines 65-66 group the observations by subject and activity.  The observations that correspond to a subject/activity pair are then averaged together to form a mean_measurements data frame which is displayed by line 67.

<sup>1</sup> (https://www.jstatsoft.org/article/view/v059i10/v59i10.pdf>

## How this submission satisfies the assignment requirements

1. "Merges the training and the test sets to create one data set."
    * X_test.txt and X_train.txt are combined in step 5 of the Submission section above.
    * subject_test.txt and subject_train.txt are combined in step 4 of the Submission section above.
    * y_test.txt and y_train.txt are combined in step 8 of the Submission section above.
    * These three portions are combined into a single data set in step 8 of the Submission section above.
    
2. "Extracts only the measurements on the mean and standard deviation for each measurement.
    * Step 9 of the Submission section above determines which measurements need to be extracted.
    * Step 10 of the Submission extracts these measurements.
    
3. "Uses descriptive activity names to name the activities in the data set.
    * Step 8 of the Submission creates the descriptive activity name corresponding to each observation.
    
4. "Appropriately labels the data set with descriptive variable names.
    * Descriptive variable names are assigned in steps 4-8 of the Submission section above.
    
5. "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."
    * Step 11 of the Submission meets this requirement.

## Additional requirements met by this assignment.

1. "The submitted data set is tidy.
   * The two tables meet the tidy data requirements set out in Hadley Wickham's Tidy Data paper<sup>1</sup>.  Specifically,
    1. Each variable forms a column.
    2. Each observation forms a row.
    3. Each type of observational unit forms a table.
2. "The Github repo contains the required scripts.
   * The run_analysis.R script contains all of the steps required.
3. "GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
   * The CodeBook.md file contains the code book, complete with a description of each variable along with the units for that variable.
4. "The README that explains the analysis files is clear and understandable.
   * Hopefully the reader of this file will find the explanations in this README to be clear and understandable.
5. "The work submitted for this project is the work of the student who submitted it."
   * This is my own work.  In places where I have drawn from others work, such as the original data set or Hadley Wickham's technique for combining files, I have given the appropriate attribution.

