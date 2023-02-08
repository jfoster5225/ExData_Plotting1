#setting directory
setwd('C:/Users/jfost/Documents/R/week4')
#import data
power <- "household_power_consumption.txt"
power <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")
#subsetting for 3 days
subdays <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]
#plotting package open
png("plot3.png", width=480, height=480)
#plot sub meter 1
plot(time_axis, data[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
#plot sub meter 2
lines(time_axis, data[, 8], col = "red")
#plot sub meter 3
lines(time_axis, data[, 9], col = "blue")
#add a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)
#turn it off!
dev.off()