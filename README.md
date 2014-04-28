courseraproject : tidy Data

============================


Introducction

=============

This is the readme file attach to run_analysis.R script for coursera getting and cleaning data project.
Data was collected from Samsung devices and take measuramentes using the smarthpones accelerometers in some activities from 30 subjects in this study.

The activities monitored in this study are :

1- Walking
2- Walking Upstairs
3- Walking Downstairs
4- Sitting
5- Laying
6- Standing


Script

======

To use this script you have to change the working directory for your actually working directory (directory on you have stored the data set), and have to change the load part directory in my code for your own directory.


The finality of this script named run_analysis.R is collect diferent datasets, merge them and cleaning to get a tidy 
and an accurate data to work with it.

The scrips works in this way:

Fist set the working directory where is the data to use in the study

Second Load all the datasets we need for the project

Third the scripts colunm bind datasets: y_test_ and subject_test into ysubject.test and then add colnames(Activity and 
subject) to the columns of the new dataframe

Fourth the script does the same thing as he did in the third step to files y_train and subject_train

Fifth merges the dataframes created before

Sixth the script row bind the data frames x_train and x_test into x_data and then change the colunm names for the names
in the featured.txt files provided in the original data.

Seventh extracts the columns in the data fram which have in the name "mean()" or "std()" to do that scripts run a match 
function which identifies what columns have mean or std in names and return the index number of the colunms. Then subset 
the colunms of interest into a data frame called meansStdData

Eight scripts merge meansStdData and dataframe obtained in the fifht step into a data frame called datatoreshape

Ninth scripts takes the means of every measurement sorted by Activity and Subject using the functions dcast and melt

Tenth finaly replace the Activity numbers to a descriptive activity name and gets the finaldata set

Eleventh scripts uses write.table function to export the data file into our working directory in txt file format.




################## And that's all, I hope you enjoy the script and sorry for my terrible English




