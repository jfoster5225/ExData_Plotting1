#setting directory
setwd('C:/Users/jfost/Documents/R/week4')
#import data
power <- "household_power_consumption.txt"
power <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")
#subsetting for 3 days
subdays <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]
#POSIX time set 
Sys.setlocale("LC_TIME", "English")
#conversion of dates and times
date_converted <- as.Date(subdays[, 1], format = "%d/%m/%Y")
time_converted <- strptime(subdays[, 2], format = "%H:%M:%S")
#integrating time and date x axis
time_axis <- as.POSIXct(paste(date_converted, subdays[, 2]))
#plotting package open
png("plot2.png", width=480, height=480)
#defining plot
plot(time_axis, subdays[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
#adding a title
title(main="Global Active Power Vs Time")
#turn it off!
dev.off()