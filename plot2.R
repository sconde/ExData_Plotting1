# File: plot2.R
# Author: Sidafa Conde
# Email: sconde@umassd.edu
# School: UMass Dartmouth
# Date: 03/30/2017
# Purpose: re-creating the Global Active Power plot (2)

fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
validData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(validData$Date, validData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(validData$Global_active_power)
png("plot2.png", width = 480, height = 480) #instantiate the png device (height, width) in pixels
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
