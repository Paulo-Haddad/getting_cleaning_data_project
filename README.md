
README file
=============
This repo was created as part of the project in "Getting and Cleaning Data" course in Coursera.org.

There are three files in the repo:

1. A README file ('README.md'), explaining all details for the repo
2. A script ('run_analysis.R')
3. A code book file ('CodeBook.md')

##run_analysis.R
#### *General Info*
This script prepares tidy data that can be used for later analysis. It uses data collected from the accelerometers from the Samsung Galaxy S smartphone, in a study carried out to develop the most advanced algorithms to attract new users in weareble computing. A full description of the original data is available at the study website: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The source for the data used in this specific project was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

#### *Prerequisites*
In order for **_run_analysis.R_** to work properly, the following must be true:
* You must download the zipped file from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and unzip it in your current R (or RStudio) working directory;
* You must have package 'dplyr' installed;
* You must have package 'data.table' installed;

The packages mentioned before will be loaded automatically by **_run_analysis.R_**, so as long as they are installed there is no need to source them before executing this script.

#### *Script results*
The script does the following:

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The script contains comments that describe in a simple manner what is the result for each part of the code. The order in which the steps presented above and the order in which they are executed in the script are somewhat different, but the result is the same.

Some details for each step are presented below.

#### *Merges the training and the test sets to create one data set.*
This is done in four steps:
* Merges files containing subject information for the test and training sets (files 'subject_test.txt', 'subject_train.txt'). Apply 'subject' as a variable name for this information.
* Merges files containing activity information for the test and training sets (files 'y_test.txt', 'y_train.txt'). Apply 'activity' as variable name for this information.
* Merges files containing variables information for the test and training sets (561 variables - files 'X_test.txt', 'X_train.txt').
* Merges all data from the merges above ('subject' data, 'activity' data, variables data (561 features of the study)

#### *Extracts only the measurements on the mean and standard deviation for each measurement.*
From the whole data set generated by the merge step before, it selects only variables representing means ['mean()'] and standard deviations ['std()'].
It is important to note that the original data set contains features called 'MeanFreq()', but these were not considered to create this tidy data set (note that in the 'features.txt' in the original data set, the measure for 'mean' and for 'meanFreq' are presented and considered separated. Therefore, it was my interpretation that the Coursera project asked only for mean and standard deviation as defined by 'mean()' and 'std()' in the original features names). Instructions for the project does not specify in detail, so it is also my opinion that both sollutions should be considered correct.

#### *Uses descriptive activity names to name the activities in the data set*
For variable 'activity', replaces the coded number (1:6) by their descriptive correspondent ('WALKING',...). It uses the file 'activity_labels.txt' as the source for the codification, as follows:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


#### *Appropriately labels the data set with descriptive variable names*
For this step, each variable (originally called 'feature') is assigned to the name provided with the original data set (available in 'features.txt'). This was chosen because the names in the original data set were considered sufficiently descriptive. A detailed description for the meaning of variable names is given in the code book file ('CodeBook.md').
It is important to note that there are typos in the original variables names (some variables present a "BodyBody"  part). In this step this is corrected, and replaced by "Body".

#### *From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject*
The resulting tidy data is presented as a data frame with 180 rows and 68 columns. As asked, data was grouped by subject (30 subjects) and activity (6 types of activities), so there is a total 180 combinations of these variables.
Each column represent the average of a variable.mean() ou variable.std() (for a given subject and activity).
The data can be considered tidy because it complies with the following principles:
* Each variable you measure should be in one column
* Each different observation of that variable is in a different row

##CodeBook.md
The code book cotains information that explains all variables in the tidy data exported by 'run_analysis.R'.