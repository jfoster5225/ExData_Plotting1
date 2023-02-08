#setting directory
plot1<- setwd('C:/Users/jfost/Documents/R/week4')
#importing data
housepower<- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
#change column names
housepower[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
#Change date formats
housepower[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
#subset the dates
housepower <- housepower[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
#open plotting
png("plot1.png", width=480, height=480)
#plot it out
hist(housepower[, Global_active_power], main="Global Active Power", 
#add main title
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#turn it off!
          dev.off()