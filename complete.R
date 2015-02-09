source("load.R")

complete <- function(directory, id = 1:332, data = NULL) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  if(is.null(data)) data <- load(directory,id)
  
  aggregate(list(nobs=complete.cases(data)),list(id=factor(data[,4],levels=id)),sum)
}

