
#Loads the necessary libraries in order for the script to work

writeLines("\nLoading lybraries...\n")
library(dplyr)
library(data.table)

#Merges files containing subject information for the test and training sets. Apply 'subject' as variable name.

writeLines("\nOpening files and merging. Please wait.\n")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_total <- rbind(subject_test, subject_train)
subject_total <- rename(subject_total, subject = V1)

#Merges files containing activity information for the test and training sets. Apply 'activity' as variable name.

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_total <- rbind(y_test, y_train)
y_total <- rename(y_total, activity = V1)

#Merges files containing variables information for the test and training sets (561 variables).
#For each variable (originally called 'feature') it applies the name provided with the original dataset.
#There are typos in the original variables names ("BodyBody"). This is corrected.

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
X_total <- rbind(X_test, X_train)
variables <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")
variables$V2 <- gsub("BodyBody", "Body", variables$V2, fixed = TRUE)
setnames(X_total,colnames(X_total),variables$V2)

#Merges all information together ('subject', 'activity', series of 561 features)

data_p <- cbind(subject_total,y_total,X_total)

#From the whole data set, selects only variables representing means ['mean()'] and standard deviations ['std()']

x <- grep("mean()", colnames(data_p), fixed = TRUE, value = TRUE)
y <- grep("std()", colnames(data_p), fixed = TRUE, value = TRUE)
z <- c("subject", "activity", sort(c(x,y)))
data <- data_p[,z]

#Format some of the variables names to make them more friendly

colnames(data) <- gsub("()", "", colnames(data), fixed = TRUE)
colnames(data) <- gsub("-", "_", colnames(data), fixed = TRUE)
colnames(data) <- gsub("f", "Freq_", colnames(data), fixed = TRUE)
colnames(data) <- gsub("tG", "Time_G", colnames(data), fixed = TRUE)
colnames(data) <- gsub("tB", "Time_B", colnames(data), fixed = TRUE)
colnames(data) <- gsub("Mag", "_Mag", colnames(data), fixed = TRUE)
colnames(data) <- gsub("Jerk", "_Jerk", colnames(data), fixed = TRUE)


#For variable 'activity', replaces the coded number (1:6) by their descriptive correspondent ('WALKING',...)

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
data$activity <- factor(data$activity, c(1,2,3,4,5,6), activity_labels$V2)

#Using the manipulated data set returned above('data'), returns a tidy data set.
#The tidy dataset cotains the mean for each variable, grouped by 'subject' and 'activity'

tidy_data <- group_by(data,subject,activity) %>% summarise_each(funs(mean))

#Removes all intermediary variables, leaving only the tidy data set in the Environment.

rm(activity_labels,data,data_p,subject_test,subject_total,subject_train,
   variables,x,X_test,X_total,X_train,y,y_test,y_total,y_train,z)

write.table(tidy_data,"tidy_data.txt",row.name = F)

writeLines("\nData sucessefully formatted.\nData stored in variable 'tidy_data'.")
writeLines("'tidy_data.txt' was saved in your working directory.")
writeLines("For details refer to the 'CodeBook.md' and 'README.md' files.\n")
