## Complete.R 
##
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'id' is an integer vector indicating the monitor ID numbers
## to be used
##
## Return a data frame in the form:
## id   nobs
##  1   117
##  2   1041
## ...
## where id is the monitor id and nobs is the number of complete cases
## number of complete cases 
    rm(list=ls())

complete <- function(directory, id = 1:332) {
    if(directory == 1) { 
        setwd("/Users/David/Documents/Data Science Course/specdata")
    }  
    idmax <- max(id)
    ## Put the path names into lists - concat into a "paths" vector
    directory <- as.character(getwd())
    file_names <- as.character(list.files(getwd()))
    paths <- paste(directory,"/", file_names, sep="")
    
    ## define datay matrix and row_count vector
    datay <- matrix(data = 0, nrow = idmax, ncol = 2)
    row_count <- as.vector(idmax, mode = 'any')
    
    ## Read in the csv files you need for range id:
    for(i in id) {
        y <- read.csv(paths[i], header=T, sep=",")
        na_rem2 <- y[!is.na(y[ ,2]), ]
        na_rem3 <- na_rem2[!is.na(na_rem2[ ,3]), ]
        ## count the number of rows with full data
        row_count[i] <- nrow(na_rem3)
        datay[i , ] <- rbind(id[i], row_count[i])
        
    }
## Rename the column names:
    colnames(datay, do.NULL = FALSE)
    colnames(datay) <- c("id","nobs")
## Print out the final output   
    print(datay)
    
    
}