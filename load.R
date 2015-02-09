library("doParallel");

load <- function(directory, id = 1:332, cores=detectCores()) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used)
  
  ## Return a data frame of the files
  cores <- makeCluster(cores);
  registerDoParallel(cores);
  
  nid = length(id); 
  data = foreach(i=1:nid,.combine="rbind") %dopar% read.csv(paste0("Data/",directory,"/",sprintf("%03d",id[i]),".csv"));
  
  stopCluster(cores);

  data
}
