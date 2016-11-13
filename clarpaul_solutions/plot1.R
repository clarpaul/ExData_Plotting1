## Paul Clark
## 11/13/2016
## Histogram: Global Active Power

source("setup.R")
png("plot1.png")
hist(powerdf$Global_active_power, main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
