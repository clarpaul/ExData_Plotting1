## Paul Clark
## 2016-11-13
## Download zipfile into working directory, read data, reformat Date & Time info as POSIXct datetime
## NOTE: again - R files must be all be run from the same working directory 

if (!file.exists("household_power_consumption.zip")) {
    cat("Downloading file 'household_power_consumption.zip'.\n")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "household_power_consumption.zip")
} else {
    cat("File 'household_power_consumption.zip' has already been downloaded.\n")
}

cat("Checking if data is loaded...")

dtrnge <- c("1/2/2007","2/2/2007")
if (!("powerdf" %in% ls()) || sum(powerdf$Date %in% dtrnge) != 2880) { # sum evaluated iff "powerdf" in ls()
    
    cat("Reading compressed data...")
    classes <- c("character", "character", rep("numeric", times = 7))
    conxn <- unz("household_power_consumption.zip","household_power_consumption.txt")
    powerdf <- read.csv(conxn, sep = ";", na.strings = "?", colClasses = classes) # closes conxn after use
    
    cat("Preparing data...")
    powerdf <- powerdf[powerdf$Date %in% dtrnge,] # x %in% y rtrns vector length(x), T/F for each element of x
    datetime <- paste(powerdf$Date, powerdf$Time)
    datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
    powerdf <- cbind(datetime,powerdf)
    
    rm(list = c("classes","conxn","datetime"))
} 
rm("dtrnge")
cat("Data is loaded and ready for use.\n")
