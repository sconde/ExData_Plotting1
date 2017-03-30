# File: plot1.R
# Author: Sidafa Conde
# Email: sconde@umassd.edu
# School: UMass Dartmouth
# Date: 03/30/2017
# Purpose: re-creating the Global Active Power plot (1)

fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
validData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(validData$Global_active_power)

png("plot1.png", width = 480, height = 480) #instantiate the png device (height, width) in pixels
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() #close the png device object
