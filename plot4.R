require(data.table)
#set working directory
setwd("~/Workspaces/ExData_Plotting1")
#import dataset and filter required dates
dt <- fread("./household_power_consumption.txt", showProgress = FALSE)
setkey(dt, Date)
data <- dt[c("1/2/2007", "2/2/2007"),]
#open device 
png("plot4.png", width=480, height=480, units="px")
#plot
par(mfrow=c(2,2))
#plot 1
plot(as.numeric(data$Global_active_power), type = "l", xaxt = "n", xlab = "", ylab = "Voltage")
axis(1, at=c(1, length(data$Time)/2, length(data$Time)), labels=c("Thu","Fri","Sat"))

#plot 2
plot(as.numeric(data$Voltage), type = "l", xaxt = "n", xlab = "datetime", ylab = "Global Active Power (kilowatts)")
axis(1, at=c(1, length(data$Time)/2, length(data$Time)), labels=c("Thu","Fri","Sat"))

#plot 3
plot(as.numeric(data$Sub_metering_1), type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(as.numeric(data$Sub_metering_2), col="red")
lines(as.numeric(data$Sub_metering_3), col="blue")
axis(1, at=c(1, length(data$Time)/2, length(data$Time)), labels=c("Thu","Fri","Sat"))

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lty = 1)

#plot 4
plot(as.numeric(data$Global_reactive_power), type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at=c(1, length(data$Time)/2, length(data$Time)), labels=c("Thu","Fri","Sat"))


#close device
dev.off()