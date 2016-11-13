## Paul Clark
## 11/13/2016
## Line Plot: Global Active Power vs. Time

source("setup.R")
png("plot2.png")
with(powerdf, plot(datetime, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power (kilowatts)"))
dev.off()
