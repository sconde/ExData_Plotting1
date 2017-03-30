# File: plot4.R
# Author: Sidafa Conde
# Email: sconde@umassd.edu
# School: UMass Dartmouth
# Date: 03/30/2017
# Purpose: re-creating the fourth plot

fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
validData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(validData$Date, validData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(validData$Global_active_power)
globalReactivePower <- as.numeric(validData$Global_reactive_power)
voltage <- as.numeric(validData$Voltage)
subMetering1 <- as.numeric(validData$Sub_metering_1)
subMetering2 <- as.numeric(validData$Sub_metering_2)
subMetering3 <- as.numeric(validData$Sub_metering_3)


png("plot4.png", width = 480, height = 480, units = "px") #instantiate the png device (height, width) in pixels
par(mfrow  =  c(2, 2)) # subplots

# subplot(2,2,1): Flobal Active Power
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
# subplot(2,2,2): Voltage
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# subplot(2,2,3): Energy sub metering
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
# subplot(2,2,4): Global_reactive_power
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off() #close the png device object
