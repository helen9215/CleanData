# CODEBOOK

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Modification and Updates:
1. The training and the test sets were combined to create one data set.
   - download zip file from website
   - unzip data
   - load data into R
   - merge train and test data as "data"
   
2. The measurements on the mean and standard deviation were extracted for each measurement.
   - load feature name into R
   - create and assign column names for "data"
   - extract mean and standard deviation of each measurements as "search"
   - format the data a little bit as "result"
   
3. Descriptive activity names were used to rename the activities in the data set.
   - load activity data into R, and assign column names as "test" and "activity"
   - merge activity data and the "result" data by "test". "test" is the class labels of activity name
   - format the "result" data to include only the activity names.
   
4. The data set with descriptive variable names was appropriately labeled.

5. A second and independent tidy data set with the average of each variable for each activity and each subject was created.
   - loaded the dplyr package
   - group_by and summarise_each were used to create the tidy data as "group"

## Variables in the R Script:
1. 'subject': An identifier of the subject who carried out the experiment.
2. 'activity': Activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
3. 'test': The class labels of activity name.
4. 'timeBodyAccMean-X','timeBodyAccMean-Y',timeBodyAccMean-Z, ...:all 561 features.


## Original dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


## Notes
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
