#
# Clean the global environment:
  rm(list=ls())

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)


## Start pollutemean with 2 characters and a vector (default 1:332): 
pollutemean <- function(directory = 1, pollutant = 1, id = 1:332) {
  if(directory == 1) { 
    setwd("/Users/David/Documents/Data Science Course/specdata")
    }
  if(pollutant == 1) {
    a <- "sulfate"
    }
  if(pollutant == 2) { 
    a <- "nitrate"
  }

## Put the path names into lists - concat into a "paths" vector
  directory <- as.character(getwd())
  file_names <- as.character(list.files(getwd()))
  paths <- paste(directory,"/", file_names, sep="")
  
  datax <- NA
  
## Read in the csv files you need for range id:
  for(i in id) {
    x <- read.csv(paths[i], header=T, sep=",")
    datax <- rbind(datax, x)

    }

## Remove the NA values from the correct column: 
    na_rem <- datax[!is.na(datax[ ,a]), ]
## Calculate the mean of the chosen column:
    pol_mean <- mean(na_rem[,a])
## Output the mean to the screan:
##  print(na_rem)
  print(pol_mean)



}