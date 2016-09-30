---
title: "CodeBook"
author: "Allen Jones"
output: html_document
---

The following section of this code book is taken from the following publications [1] and [2]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

## Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Observations Data Set

The following measurement values were extracted from the database mentioned above and are contained in the data set named "observations".  Each row of the data set contains one complete set of measurements that were taken while the indicated test subject was performing the indicated activity. 

| Column Name  | Description                              | Units<sup>1</sup> |
| ------------ |----------------------------------------- | ------ |
| subject      | Test subject identifier.                 | NA |
| activity                      | Activity performed during observation    | NA |
| **Gravity Values** |
| tGravityAcc_mean_X            | Mean of the gravity acceleration along the accelerometer X axis. | g |
| tGravityAcc_mean_Y            | Mean of the gravity acceleration along the accelerometer Y axis. | g |
| tGravityAcc_mean_Z            | Mean of the gravity acceleration along the accelerometer Z axis. | g |
| tGravityAcc_std_X             | Standard deviation of the gravity acceleration along the accelerometer X axis. | g |
| tGravityAcc_std_Y             | Standard deviation of the gravity acceleration along the accelerometer Y axis. | g |
| tGravityAcc_std_Z             | Standard deviation of the gravity acceleration along the accelerometer Z axis. | g |
| tGravityAccMag_mean           | Mean of the magnitude of the gravity acceleration. | g |
| tGravityAccMag_std            | Standard deviation of the magnitude of the gravity acceleration. | g |
| **Body Acceleration Values** |
| fBodyAcc_mean_X               | Mean of the frequency domain body acceleration along the accelerometer X axis. | g |
| fBodyAcc_mean_Y               | Mean of the frequency domain body acceleration along the accelerometer Y axis. | g |
| fBodyAcc_mean_Z               | Mean of the frequency domain body acceleration along the accelerometer Z axis. | g |
| tBodyAcc_mean_X               | Mean of the body acceleration along the accelerometer X axis. | g |
| tBodyAcc_mean_Y               | Mean of the body acceleration along the accelerometer Y axis. | g |
| tBodyAcc_mean_Z               | Mean of the body acceleration along the accelerometer Z axis. | g |
| fBodyAcc_std_X                | Standard deviation of the frequency domain body acceleration along the accelerometer X axis. | g |
| fBodyAcc_std_Y                | Standard deviation of the frequency domain body acceleration along the accelerometer Y axis. | g |
| fBodyAcc_std_Z                | Standard deviation of the frequency domain body acceleration along the accelerometer Z axis. | g |
| tBodyAcc_std_X                | Standard deviation of the body acceleration along the accelerometer X axis. | g |
| tBodyAcc_std_Y                | Standard deviation of the body acceleration along the accelerometer Y axis. | g |
| tBodyAcc_std_Z                | Standard deviation of the body acceleration along the accelerometer Z axis. | g |
| fBodyAccMag_mean              | Mean of the magnitude of the frequency domain body acceleration. | g |
| tBodyAccMag_mean              | Mean of the magnitude of the body acceleration. | g |
| fBodyAccMag_std               | Standard deviation of the magnitude of the frequency domain body acceleration. | g |
| tBodyAccMag_std               | Standard deviation of the magnitude of the body acceleration. | g |
| fBodyAcc_meanFreq_X           | Weighted mean frequency of the body acceleration along the accelerometer X axis. | Hz |
| fBodyAcc_meanFreq_Y           | Weighted mean frequency of the body acceleration along the accelerometer Y axis. | Hz |
| fBodyAcc_meanFreq_Z           | Weighted mean frequency of the body acceleration along the accelerometer Z axis. | Hz |
| fBodyAccMag_meanFreq          | Weighted mean frequency of the body acceleration. | Hz |
| **Body Acceleration Jerk Values** |
| fBodyAccJerk_mean_X           | Mean of the frequency domain body linear acceleration along the accelerometer X axis. | g/s |
| fBodyAccJerk_mean_Y           | Mean of the frequency domain body linear acceleration along the accelerometer Y axis. | g/s |
| fBodyAccJerk_mean_Z           | Mean of the frequency domain body linear acceleration along the accelerometer Z axis. | g/s |
| tBodyAccJerk_mean_X           | Mean of the body linear acceleration along the accelerometer X axis. | g/s |
| tBodyAccJerk_mean_Y           | Mean of the body linear acceleration along the accelerometer Y axis. | g/s |
| tBodyAccJerk_mean_Z           | Mean of the body linear acceleration along the accelerometer Z axis. | g/s |
| fBodyAccJerk_std_X            | Standard deviation of the frequency domain body linear acceleration along the accelerometer X axis. | g/s |
| fBodyAccJerk_std_Y            | Standard deviation of the frequency domain body linear acceleration along the accelerometer Y axis. | g/s |
| fBodyAccJerk_std_Z            | Standard deviation of the frequency domain body linear acceleration along the accelerometer Z axis. | g/s |
| tBodyAccJerk_std_X            | Standard deviation of the body linear acceleration along the accelerometer X axis. | g/s |
| tBodyAccJerk_std_Y            | Standard deviation of the body linear acceleration along the accelerometer Y axis. | g/s |
| tBodyAccJerk_std_Z            | Standard deviation of the body linear acceleration along the accelerometer Z axis. | g/s |
| tBodyAccJerkMag_mean          | Mean of the magnitude of the body linear acceleration. | g/s |
| tBodyAccJerkMag_std           | Standard deviation of the magnitude of the body linear acceleration. | g/s |
| fBodyAccJerk_meanFreq_X       | Weighted mean frequency of the body linear acceleration along the accelerometer X axis. | Hz |
| fBodyAccJerk_meanFreq_Y       | Weighted mean frequency of the body linear acceleration along the accelerometer Y axis. | Hz |
| fBodyAccJerk_meanFreq_Z       | Weighted mean frequency of the body linear acceleration along the accelerometer Z axis. | Hz |
| fBodyBodyAccJerkMag_mean      | Mean of the magnitude of the body linear acceleration. | g/s |
| fBodyBodyAccJerkMag_std       | Standard deviation of the magnitude of the body linear acceleration. | g/s |
| fBodyBodyAccJerkMag_meanFreq  | Weighted mean frequency of the body linear acceleration. | g/s |
| **Body Gyro Values** |
| fBodyGyro_mean_X              | Mean of the frequency domain body rotation about the gyroscope X axis. | rad/s |
| fBodyGyro_mean_Y              | Mean of the frequency domain body rotation about the gyroscope Y axis. | rad/s |
| fBodyGyro_mean_Z              | Mean of the frequency domain body rotation about the gyroscope Z axis. | rad/s |
| tBodyGyro_mean_X              | Mean of the body rotation about the gyroscope X axis. | rad/s |
| tBodyGyro_mean_Y              | Mean of the body rotation about the gyroscope Y axis. | rad/s |
| tBodyGyro_mean_Z              | Mean of the body rotation about the gyroscope Z axis. | rad/s |
| fBodyGyro_std_X               | Standard deviation of the frequency domain body rotation about the gyroscope X axis. | rad/s |
| fBodyGyro_std_Y               | Standard deviation of the frequency domain body rotation about the gyroscope Y axis. | rad/s |
| fBodyGyro_std_Z               | Standard deviation of the frequency domain body rotation about the gyroscope Z axis. | rad/s |
| tBodyGyro_std_X               | Standard deviation of the body rotation about the gyroscope X axis. | rad/s |
| tBodyGyro_std_Y               | Standard deviation of the body rotation about the gyroscope Y axis. | rad/s |
| tBodyGyro_std_Z               | Standard deviation of the body rotation about the gyroscope Z axis. | rad/s |
| tBodyGyroMag_mean             | Mean of the magnitude of the body rotation. | rad/s |
| tBodyGyroMag_std              | Standard deviation of the magnitude of the body rotation. | rad/s |
| fBodyGyro_meanFreq_X          | Weighted mean frequency of the body rotation about the gyroscope X axis. | rad/s |
| fBodyGyro_meanFreq_Y          | Weighted mean frequency of the body rotation about the gyroscope Y axis. | rad/s |
| fBodyGyro_meanFreq_Z          | Weighted mean frequency of the body rotation about the gyroscope Z axis. | rad/s |
| fBodyBodyGyroMag_mean         | Mean of the magnitude of the body rotation. | rad/s |
| fBodyBodyGyroMag_std          | Standard deviation of the magnitude of the body rotation. | rad/s |
| fBodyBodyGyroMag_meanFreq     | Weighted mean frequency of the body rotation. | Hz |
| **Body Gyro Jerk Values** |
| tBodyGyroJerk_mean_X          | Mean of the body angular velocity about the gyroscope X axis. | rad/s<sup>2</sup> |
| tBodyGyroJerk_mean_Y          | Mean of the body angular velocity about the gyroscope Y axis. | rad/s<sup>2</sup> |
| tBodyGyroJerk_mean_Z          | Mean of the body angular velocity about the gyroscope Z axis. | rad/s<sup>2</sup> |
| tBodyGyroJerk_std_X           | Standard deviation of the body angular velocity about the gyroscope X axis. | rad/s<sup>2</sup> |
| tBodyGyroJerk_std_Y           | Standard deviation of the body angular velocity about the gyroscope Y axis. | rad/s<sup>2</sup> |
| tBodyGyroJerk_std_Z           | Standard deviation of the body angular velocity about the gyroscope Z axis. | rad/s<sup>2</sup> |
| tBodyGyroJerkMag_mean         | Mean of the magnitude of the body angular velocity. | rad/s<sup>2</sup> |
| tBodyGyroJerkMag_std          | Standard deviation of the magnitude of the body angular velocity. | rad/s<sup>2</sup> |
| fBodyBodyGyroJerkMag_mean     | Mean of the magnitude of the body angular velocity. | rad/s<sup>2</sup> |
| fBodyBodyGyroJerkMag_std      | Standard deviation of the magnitude of the body angular velocity. | rad/s<sup>2</sup> |
| fBodyBodyGyroJerkMag_meanFreq | Weighted mean frequency of the body angular velocity. | Hz |

<sup>1</sup>In this table, g stands for standard gravity, not grams.  Standard gravity is defined as 9.80665 m/s<sup>2</sup>.

## Mean_measurements Dataset

The mean_measurements data set contains the same measurements as the observations data set except that all instances of the same activity for the same test subject are averaged together.