## Paul Clark
## 11/13/2016
## Line plots 2 x 2

source("setup.R")
png("plot4.png")
par(mfrow = c(2,2))
with(powerdf, {
    
    # Global_active_power vs. datetime
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    # Voltage vs. datetime
    plot(datetime, Voltage, type = "l", ylab = "Voltage")
    
    # Sub metering vs. datetime
    plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    points(datetime, Sub_metering_2, type = "l", col = "red")
    points(datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = names(powerdf[8:10]), lty = c(1,1,1), col = c("black","red","blue"), bty = "n") 
    
    # Global reactive power vs. datetime
    plot(datetime, Global_reactive_power, type = "l")

})
dev.off()
cat("plot4.png has been written to the working directory.\n")