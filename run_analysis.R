# Here we check if the folder with data already exists in working directory. 
# If it does we rename it just in case.
# We do that to be sure that we do not use changed data.
if("UCI HAR Dataset" %in% dir()){
    time <- Sys.time()
    file.rename("UCI HAR Dataset", gsub(":","-", paste("UCI HAR Dataset", time)))
}

# Here we determine operting system to use different upload method and file path
Windows <- FALSE
if(Sys.info()["sysname"]=="Windows") Windows <- TRUE


# Here we download freash data file, 
# unzip it and remove it to keep directory clean.
# We check the operating system to use method curl 
# for Macintosh and Unix machines.

url.data.file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp.zip.file.name <- "temp.zip"
if(Windows) download.file(url.data.file, temp.zip.file.name) else
    download.file(url.data.file, temp.zip.file.name, method="curl")
unzip(temp.zip.file.name)
file.remove(temp.zip.file.name)

# Here we read two sets (test and train) and combine them into one data set
# We use direct names of files instead of dir()
# to achieve correct order of colums - "id", "Activity" and then all measures
if(Windows) {
    test.files <- c("UCI HAR Dataset\\test\\subject_test.txt", "UCI HAR Dataset\\test\\y_test.txt","UCI HAR Dataset\\test\\X_test.txt") 
    train.files <- c("UCI HAR Dataset\\train\\subject_train.txt", "UCI HAR Dataset\\train\\y_train.txt","UCI HAR Dataset\\train\\X_train.txt")} else
        {test.files <- c("UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/test/y_test.txt","UCI HAR Dataset/test/X_test.txt")
        train.files <- c("UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/train/y_train.txt","UCI HAR Dataset/train/X_train.txt")}
data.set <- rbind(do.call(cbind,lapply(test.files, read.table,quote="\"")), do.call(cbind,lapply(train.files, read.table,quote="\"")))


# Here we add human names to data set...
names(data.set) <- make.names(c("id", "Activity", as.character(read.table("UCI HAR Dataset/features.txt", header=F)[,2])), unique=T)
names(data.set) <- c("id", "Activity", as.character(read.table("UCI HAR Dataset/features.txt", header=F)[,2]))


# ... and select columns with mean and standard deviation only
names.we.need <- c("id", "Activity", "-mean()", "-std()")
columns.we.need <- unlist(lapply(names.we.need, grep, names(data.set), fixed=T))
data.set <- data.set[, sort(columns.we.need)]


# Here we change code of activity into human words
translator = c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING")
data.set$Activity<-translator[data.set$Activity]

# Here we remove unwanted characters to make column names more readable 
#and to apply the conventions of R 
names(data.set) <- gsub("[-]", ".", names(data.set))
names(data.set) <- gsub("[()]", "", names(data.set))

# Here we check if the package "dplyr" exists and if it does not we upload it.
# Then we attach it.
if(!("utils" %in% installed.packages())) install.packages("dplyr")
library(dplyr)

# Here we create a new tidy data set with only the average of each variable
# for each activity and each subject. 
new.data.set <- data.set %>% group_by(id, Activity) %>% summarise_each(funs(mean))

# And here we write this data set as file "averaged_data_set.txt"
# Values are separated by space. If file is already exists in working
# directory it will be overwritten.
write.table(new.data.set, "averaged_data_set.txt", row.name=F)
