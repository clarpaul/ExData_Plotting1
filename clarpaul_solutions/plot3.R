## Paul Clark
## 11/13/2016
## Line Plot: Energy sub metering (3 areas) vs. Time

source("setup.R")
png("plot3.png")
with(powerdf, {
    plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    points(datetime, Sub_metering_2, type = "l", col = "red")
    points(datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = names(powerdf[8:10]), lty = c(1,1,1), col = c("black","red","blue")) 
})
dev.off()
cat("plot3.png has been written to the working directory.\n")
