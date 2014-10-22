corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        corr = numeric()
        mons = list.files(directory)
        
        for (mon in mons)
        {
                mon_data = read.csv(paste(directory, "\\", mon, sep=""))
                mon_complete = mon_data[complete.cases(mon_data),]
                
                if (nrow(mon_complete) > threshold )
                {
                        mon_corr = cor(mon_complete$sulfate, mon_complete$nitrate)
                        corr[length(corr)+1] = mon_corr
                }
        }
        corr
}