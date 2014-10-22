complete <- function(directory, id = 1:332) {
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
        
        read_monitor_data <- function (m_id)
        {
                mon_data <- read.csv(paste(directory, "\\", formatC(m_id, width=3, flag="0"), ".csv", sep=""))
                mon_data
        }    
        
        complete_info <- data.frame(id=numeric(0), nobs=numeric(0))
        
        for (i in id)
        {     
                #data <- read.csv(paste(directory, "\\", formatC(i, width=3, flag="0"), ".csv", sep=""))
                data <- read_monitor_data(i)
                complete_info[nrow(complete_info)+1, ] <- c(i, nrow(data[complete.cases(data),]))
        }
        
        complete_info
}