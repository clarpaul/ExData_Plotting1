## Paul Clark
## 2016-11-13
## Download zipfile into working directory, read data, reformat Date & Time info as POSIXct datetime

if (!file.exists("household_power_consumption.zip")) {
    
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "household_power_consumption.zip")

}

if (!("powerdf" %in% ls())) {
    classes <- c("character", "character", rep("numeric", times = 7))
    conxn <- unz("household_power_consumption.zip","household_power_consumption.txt")
    powerdf <- read.csv(conxn, sep = ";", na.strings = "?", colClasses = classes) # closes conxn after use
    powerdf <- powerdf[powerdf$Date == "1/2/2007" | powerdf$Date == "2/2/2007",]
    datetime <- paste(powerdf$Date, powerdf$Time)
    datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
    powerdf <- cbind(datetime,powerdf)
    rm(list = c("classes","conxn","datetime"))
}
