source("complete.R")

corr <- function(directory, threshold = 0, pollution=NULL) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  if(is.null(pollution)) pollution <- load(directory)
  
  complete.obs = complete("specdata",data=pollution)
  pollution.threshold = subset(pollution, pollution[,"ID"] %in% complete.obs[complete.obs[,"nobs"] > threshold,"id"])
  
  pollution.threshold.nitrate = split(pollution.threshold[,"nitrate"], pollution.threshold[,"ID"])
  pollution.threshold.sulfate = split(pollution.threshold[,"sulfate"], pollution.threshold[,"ID"])
  
  mapply( cor, MoreArgs = list(use="complete.obs") , pollution.threshold.nitrate , pollution.threshold.sulfate )
}
