#COURSERA GETTING AND CLEANING DATA PROJECT

#Set working directory

setwd("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

#Load files into R (if u want to use that script be sure the data is in your working diretory and change the directory in load code sentences)

X_train <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"")

y_train <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"")

y_test <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"")

X_test <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"")

subject_test <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"")

features <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"")

activity_labels <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"")

subject_train <- read.table("~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"")


# Colunm bind dataframes y_test and subject_test and add colnames to variables

   ysubject.test <- cbind(y_test, subject_test)

   colnames(ysubject.test) <- c("Activity","Subject")

   dim(ysubject.test)  #check dimensions of the dataframes
 

#Column bind dataframes y_train and subject_train and and add colnames to variables 
  
   ysubject.train <- cbind(y_train, subject_train)

   colnames(ysubject.train) <- c("Activity", "Subject")

   dim(ysubject.train)

# Row bind the dataframes created before

    ysubject.final <- rbind(ysubject.test, ysubject.train)
    
    # I don't have to add colnames cause I did it before
                            
    dim(ysubject.final)
    
# Row bind dataframes X_train , X_test



   x.data <- rbind(X_train, X_test)

# Change colunm names by features.txt file

   names(x.data) <- features[,2]

# Extract the columns in X.data which have "mean()" or "std()" in the colunames


 toMatch <- c(".*mean\\(\\).*$", ".*std\\(\\).*$")   #Vector to test the colunm names

 matches <- unique (grep(paste(toMatch,collapse="|"), features$V2, value=FALSE)) #give me the index columns which have std and mean in the col name

 matches  #show me the indexs of the columns

# See what colums indexs have mean or sd in the col names and subset the data

  meansStdData <- x.data[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214,215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)]

# Column bind ysubject.final and meansStdData 

  datatoreshape <- cbind(ysubject.final, meansStdData)

# Take mean of observations per activity per subject. (dim-180*68). 
  library(reshape2)

  datasorted <- melt(datatoreshape,  id=c("Activity", "Subject"), )

  finaldata <- dcast(datasorted, Activity + Subject ~ variable, mean) #data just to replace activity names to get final table

# Replace activity numbers with Activity names from activity_labels.txt-
  
  finaldata[1:30,1] <- "Walking"
  
  finaldata[31:60,1] <- "Walking_Upstairs"

  finaldata[61:90,1] <- "Walking_Downstairs"  #subset the col Activity to 

  finaldata[91:120,1] <- "Sitting"

  finaldata[121:150,1] <- "Laying"

  finaldata[151:180,1] <- "Standing"

# Use write table to get a text file to open later with Excel and run some analysis(saved in my working directory)

 write.table(finaldata, "~/data/tidy data project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/tidydata.txt", sep="\t", row.names = FALSE)

