Code Book for tidy data exported by *run_analysis.R*
==================================================================
*This script works with original data provided by:*

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

*Study Design*
=====
This script prepares tidy data that can be used for later analysis. It uses data collected from the accelerometers from the Samsung Galaxy S smartphone, in a study carried out to develop the most advanced algorithms to attract new users in weareble computing.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50 Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

*Variables*
=====
**GENERAL VARIABLES**

These are the variables that were not measured directly from the cell phones.

  * **subject**: ID for each volunteer. There were 30 volunteers in this study
    * Numeric, values: 1 to 30
  
  * **activity**: activity being performed during measure. Six activities were defined
    * Text, values: 1. WALKING, 2. WALKING_UPSTAIRS, 3. WALKING_DOWNSTAIRS, 4. SITTING, 5. STANDING, 6. LAYING

**VARIABLES CAPTURED FROM SENSOR SIGNALS (ACCELEROMETER AND GYROSCOPE)**

**TIME DOMAIN VARIABLES**

These are the variables measured directly from the cell phones.  All time domain variables contain a prefix ("Time_"). They were captured in 50 Hz intervals.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
The acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

The resulting variables are:
Triaxial **estimated gravity acceleration** (**GravityAcc**):
  * **Time_GravityAcc_X**: component direction X
  * **Time_GravityAcc_Y**: component direction Y
  * **Time_GravityAcc_Z**: component direction Z
  
Triaxial **estimated body acceleration** (**BodyAcc**):
  * **Time_BodyAcc_X**: component direction X
  * **Time_BodyAcc_Y**: component direction Y
  * **Time_BodyAcc_Z**: component direction Z

Triaxial **angular velocity from the body** measured in the **gyroscope** (**BodyGyro**):
  * **Time_BodyGyro_X**: component direction X
  * **Time_BodyGyro_Y**: component direction Y
  * **Time_BodyGyro_Z**: component direction Z

Subsequently, the **body acceleration** were derived in time to obtain triaxial **Jerk signals** (suffix **_Jerk**):
  * **Time_BodyAcc_Jerk_X**: component direction X
  * **Time_BodyAcc_Jerk_Y**: component direction Y
  * **Time_BodyAcc_Jerk_Z**: component direction Z

Equally, the **angular velocity** from the **body in the gyroscope** were derived in time to obtain triaxial **Jerk signals** (suffix **_Jerk**): 
  * **Time_BodyGyro_Jerk_X**: component direction X
  * **Time_BodyGyro_Jerk_Y**: component direction Y
  * **Time_BodyGyro_Jerk_Z**: component direction Z
  
The **magnitude** (suffix **_Mag**) of each of these five three-dimensional signals were calculated using the Euclidean norm:
  * **Time_GravityAcc_Mag**
  * **Time_BodyAcc_Mag**
  * **Time_BodyGyro_Mag**
  * **Time_BodyAcc_Jerk_Mag**
  * **Time_BodyGyro_Jerk_Mag** 

Each one of this 20 variables were sampled in 10.299 time windows (an average of 343.3 windows per subject).

All 20 variables in the time domain are numeric type, and are normalized and bounded within [-1,1].

**FREQUENCY DOMAIN VARIABLES**

These are the variables derived from measurements from the cell phones.  All frequency domain variables contain a prefix (**Freq_**).
A Fast Fourier Transform (FFT) was applied to some of the time domain signals presented above, producing (same abbreviations as before):
  * **Freq_BodyAcc_X**: component direction X
  * **Freq_BodyAcc_Y**: component direction Y
  * **Freq_BodyAcc_Z**: component direction Z
  * **Freq_BodyGyro_X**: component direction X
  * **Freq_BodyGyro_Y**: component direction Y
  * **Freq_BodyGyro_Z**: component direction Z
  * **Freq_BodyAcc_Jerk_X**: component direction X
  * **Freq_BodyAcc_Jerk_Y**: component direction Y
  * **Freq_BodyAcc_Jerk_Z**: component direction Z
  * **Freq_BodyAcc_Mag**
  * **Freq_BodyGyro_Mag**
  * **Freq_BodyAcc_Jerk_Mag**
  * **Freq_BodyGyro_Jerk_Mag**

All 13 variables in the frequency domain are numeric type, and are normalized and bounded within [-1,1].

**FUNCTIONS APPLIED**

For each of the 10.299 sampling windows of the 33 variables presented above (time domain + frequency domain), two statistical parameters were obtained: 

**mean**: Mean value

**std**: Standard deviation

They are indicated in each variable by the suffix **_mean** and **_std**, respectly.

The combination of 33 variables and the 2 functions, generates the total 66 observed numerical variables in the tidy data set.

*Code Book for the tidy data set of run_analysis.R*
=================
All variables presented above are presented in the tidy_data variable after run_analysis.R is executed.
The results of each of the 66 numeric variables from the accelerometer and gyroscope **are grouped by subject and activity**.
This grouping is done by an **average**, meaning that the **means** and **standard deviations** calculated for each of the 33 original variables are averaged themselves.

The resulting data set is considered tidy because it has the following characteristics:
* Each variable measured is in one column
* Each different observation of a variable is in a different row

The resulting variable list is (**all numeric variables are presented as an average for the subject in a given activity**):

1. **subject**: *ID number for the subject (numeric, 30 values)*
2. **activity**: *activity performed during the measures (text, 6 values)*
3. **Freq_BodyAcc_mean_X**: *frequency domain body acceleration in component direction X - average of means (numeric, unit: gravity units (g), values between [-1,1])*
4. **Freq_BodyAcc_mean_Y**: *frequency domain body acceleration in component direction Y - average of means (numeric, unit: gravity units (g), values between [-1,1])*
5. **Freq_BodyAcc_mean_Z**: *frequency domain body acceleration in component direction Z - average of means (numeric, unit: gravity units (g), values between [-1,1])*
6. **Freq_BodyAcc_std_X**: *for the frequency domain body acceleration in component direction X - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
7. **Freq_BodyAcc_std_Y**: *frequency domain body acceleration in component direction Y - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
8. **Freq_BodyAcc_std_Z**: *frequency domain body acceleration in component direction Z - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
9. **Freq_BodyAcc_Jerk_mean_X**: *frequency domain body acceleration (Jerk signal) in component direction X - average of means (numeric, unit: gravity units (g), values between [-1,1])*
10. **Freq_BodyAcc_Jerk_mean_Y**: *frequency domain body acceleration (Jerk signal) in component direction Y - average of means (numeric, unit: gravity units (g), values between [-1,1])*
11. **Freq_BodyAcc_Jerk_mean_Z**: *frequency domain body acceleration (Jerk signal) in component direction Z - average of means (numeric, unit: gravity units (g), values between [-1,1])*
12. **Freq_BodyAcc_Jerk_std_X**: *frequency domain body acceleration (Jerk signal) in component direction X - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
13. **Freq_BodyAcc_Jerk_std_Y**: *frequency domain body acceleration (Jerk signal) in component direction Y - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
14. **Freq_BodyAcc_Jerk_std_Z**: *frequency domain body acceleration (Jerk signal) in component direction Z - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
15. **Freq_BodyAcc_Jerk_Mag_mean**: *frequency domain body acceleration (Jerk signal) magnitude - average of means (numeric, unit: gravity units (g), values between [-1,1])*
16. **Freq_BodyAcc_Jerk_Mag_std**: *frequency domain body acceleration (Jerk signal) magnitude - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
17. **Freq_BodyAcc_Mag_mean**: *frequency domain body acceleration magnitude - average of means (numeric, unit: gravity units (g), values between [-1,1])*
18. **Freq_BodyAcc_Mag_std**: *frequency domain body acceleration magnitude - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
19. **Freq_BodyGyro_mean_X**: *frequency domain body gyroscope angular velocity in component direction X - average of means (numeric, unit: radians/sec, values between [-1,1])*
20. **Freq_BodyGyro_mean_Y**: *frequency domain body gyroscope angular velocity in component direction Y - average of means (numeric, unit: radians/sec, values between [-1,1])*
21. **Freq_BodyGyro_mean_Z**: *frequency domain body gyroscope angular velocity in component direction Z - average of means (numeric, unit: radians/sec, values between [-1,1])*
22. **Freq_BodyGyro_std_X**: *frequency domain body gyroscope angular velocity in component direction X - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
23. **Freq_BodyGyro_std_Y**: *frequency domain body gyroscope angular velocity in component direction Y - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
24. **Freq_BodyGyro_std_Z**: *frequency domain body gyroscope angular velocity in component direction Z - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
25. **Freq_BodyGyro_Jerk_Mag_mean**: *frequency domain body gyroscope angular velocity (Jerk Signal) magnitute - average of means (numeric, unit: radians/sec, values between [-1,1])*
26. **Freq_BodyGyro_Jerk_Mag_std**: *frequency domain body gyroscope angular velocity (Jerk Signal) magnitute - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
27. **Freq_BodyGyro_Mag_mean**: *frequency domain body gyroscope angular velocity magnitude - average of means (numeric, unit: radians/sec, values between [-1,1])*
28. **Freq_BodyGyro_Mag_std**: *frequency domain body gyroscope angular velocity magnitude - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
29. **Time_BodyAcc_mean_X**: *time domain body acceleration in component direction X - average of means (numeric, unit: gravity units (g), values between [-1,1])*
30. **Time_BodyAcc_mean_Y**: *time domain body acceleration in component direction Y - average of means (numeric, unit: gravity units (g), values between [-1,1])*
31. **Time_BodyAcc_mean_Z**: *time domain body acceleration in component direction Z - average of means (numeric, unit: gravity units (g), values between [-1,1])*
32. **Time_BodyAcc_std_X**: *time domain body acceleration in component direction X - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
33. **Time_BodyAcc_std_Y**: *time domain body acceleration in component direction Y - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
34. **Time_BodyAcc_std_Z**: *time domain body acceleration in component direction Z - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
35. **Time_BodyAcc_Jerk_mean_X**: *time domain body acceleration (Jerk Signal) in component direction X - average of means (numeric, unit: gravity units (g), values between [-1,1])*
36. **Time_BodyAcc_Jerk_mean_Y**: *time domain body acceleration (Jerk Signal) in component direction Y - average of means (numeric, unit: gravity units (g), values between [-1,1])*
37. **Time_BodyAcc_Jerk_mean_Z**: *time domain body acceleration (Jerk Signal) in component direction Z - average of means (numeric, unit: gravity units (g), values between [-1,1])*
38. **Time_BodyAcc_Jerk_std_X**: *time domain body acceleration (Jerk Signal) in component direction X - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
39. **Time_BodyAcc_Jerk_std_Y**: *time domain body acceleration (Jerk Signal) in component direction Y - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
40. **Time_BodyAcc_Jerk_std_Z**: *time domain body acceleration (Jerk Signal) in component direction Z - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
41. **Time_BodyAcc_Jerk_Mag_mean**: *time domain body acceleration (Jerk Signal) magnitute - average of means (numeric, unit: gravity units (g), values between [-1,1])*
42. **Time_BodyAcc_Jerk_Mag_std**: *time domain body acceleration (Jerk Signal) magnitute - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
43. **Time_BodyAcc_Mag_mean**: *time domain body acceleration magnitude - average of means (numeric, unit: gravity units (g), values between [-1,1])*
44. **Time_BodyAcc_Mag_std**: *time domain body acceleration magnitude - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
45. **Time_BodyGyro_mean_X**: *time domain body gyroscope angular velocity in component direction X - average of means (numeric, unit: radians/sec, values between [-1,1])*
46. **Time_BodyGyro_mean_Y**: *time domain body gyroscope angular velocity in component direction Y - average of means (numeric, unit: radians/sec, values between [-1,1])*
47. **Time_BodyGyro_mean_Z**: *time domain body gyroscope angular velocity in component direction Z - average of means (numeric, unit: radians/sec, values between [-1,1])*
48. **Time_BodyGyro_std_X**: *time domain body gyroscope angular velocity in component direction X - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
49. **Time_BodyGyro_std_Y**: *time domain body gyroscope angular velocity in component direction Y - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
50. **Time_BodyGyro_std_Z**: *time domain body gyroscope angular velocity in component direction Z - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
51. **Time_BodyGyro_Jerk_mean_X**: *time domain body gyroscope angular velocity (Jerk Signal) in component direction X - average of means (numeric, unit: radians/sec, values between [-1,1])*
52. **Time_BodyGyro_Jerk_mean_Y**: *time domain body gyroscope angular velocity (Jerk Signal) in component direction Y - average of means (numeric, unit: radians/sec, values between [-1,1])*
53. **Time_BodyGyro_Jerk_mean_Z**: *time domain body gyroscope angular velocity (Jerk Signal) in component direction Z - average of means (numeric, unit: radians/sec, values between [-1,1])*
54. **Time_BodyGyro_Jerk_std_X**: *time domain body gyroscope angular velocity (Jerk Signal) in component direction X - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
55. **Time_BodyGyro_Jerk_std_Y**: *time domain body gyroscope angular velocity (Jerk Signal) in component direction Y - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
56. **Time_BodyGyro_Jerk_std_Z**: *time domain body gyroscope angular velocity (Jerk Signal) in component direction Z - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
57. **Time_BodyGyro_Jerk_Mag_mean**: *time domain body gyroscope angular velocity (Jerk Signal) magnitute - average of means (numeric, unit: radians/sec, values between [-1,1])*
58. **Time_BodyGyro_Jerk_Mag_std**: *time domain body gyroscope angular velocity (Jerk Signal) magnitute - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
59. **Time_BodyGyro_Mag_mean**: *time domain body gyroscope angular velocity magnitute - average of means (numeric, unit: radians/sec, values between [-1,1])*
60. **Time_BodyGyro_Mag_std**: *time domain body gyroscope angular velocity magnitute - average of the standart deviations (numeric, unit: radians/sec, values between [-1,1])*
61. **Time_GravityAcc_mean_X**: *time domain gravity acceleration in component direction X - average of means (numeric, unit: gravity units (g), values between [-1,1])*
62. **Time_GravityAcc_mean_Y**: *time domain gravity acceleration in component direction Y - average of means (numeric, unit: gravity units (g), values between [-1,1])*
63. **Time_GravityAcc_mean_Z**: *time domain gravity acceleration in component direction Z - average of means (numeric, unit: gravity units (g), values between [-1,1])*
64. **Time_GravityAcc_std_X**: *time domain gravity acceleration in component direction X - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
65. **Time_GravityAcc_std_Y**: *time domain gravity acceleration in component direction Y - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
66. **Time_GravityAcc_std_Z**: *time domain gravity acceleration in component direction Z - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*
67. **Time_GravityAcc_Mag_mean**: *time domain gravity acceleration magnitute - average of means (numeric, unit: gravity units (g), values between [-1,1])*
68. **Time_GravityAcc_Mag_std**: *time domain gravity acceleration magnitute - average of the standart deviations (numeric, unit: gravity units (g), values between [-1,1])*





*License for original data*
================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
