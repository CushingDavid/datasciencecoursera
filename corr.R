## Corr.R - 

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'threshold' is a numeric vector of length 1 indicating 
## number of completely observed observations (on all 
## variables ) required t ocompute the correlation between 
## nitrate and sulphate; the default is 0
##
## Return a numeric vector of correlations
## NOTE: Do not round the result!! 

rm(list=ls())

corr <- function(directory, threshold = 0) {
    if(directory == 1) { 
        setwd("/Users/David/Documents/Data Science Course/specdata")
        
    }
    
    # Reading in all files and making a large data.table
    files = list.files(path = getwd(), pattern="*.csv", full.names=TRUE, recursive=FALSE)
    
    #alldata <- lapply(files,function(i){
    #    read.csv(i, header=TRUE, sep=",")
    #})
    dataz <- matrix(ncol = 3, nrow = 332)
    
    for(i in 1:length(files)) {
        z <- read.csv(files[i], header=T, sep=",")
        z <- z[!is.na(z[ ,2]), ]
        z <- z[!is.na(z[ ,3]), ]
        corz <- cor(x = z[ , "sulfate"], y = z[ , "nitrate"])

        dataz <- rbind(dataz, corz)
       
    }
    print(dataz)
    ## comp_data <- dataz[!is.na(dataz[ ,2]), ]
    ## comp_data <- comp_data[!is.na(comp_data[ ,3]), ]
    
     ## view(comp_data)
 #  for (j in id) {
 #      if (comp_data[ ,"ID"] == j) {
 #           corz <- cor(x = comp_data[ , "sulfate"], y = comp_data[ , "nitrate"])
 #           corrz <- rbind(id, corz)
 #      }
 #  }
#        
##       corz <- as.vector(mode = 'integer', length = 332)
##      x <- as.vector(mode = 'integer')
##      y <- as.vector(mode = 'integer')
#        by(comp_data, comp_data$ID, function(x,y)
#           x = comp_data[ ,"sulfate"]
#           y = comp_data[ ,"nitrate"]
#           corz <- cor(x, y)
            
#        )
## dt <- comp_data[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID]   
    # Correlation and threshold
#    cordat <- comp_data[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
#    return(dt[, corr])
}

