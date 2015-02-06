require(data.table)
#set working directory
setwd("~/Workspaces//ExData_Plotting1")
#import dataset and filter required dates
dt <- fread("./household_power_consumption.txt", showProgress = FALSE)
setkey(dt, Date)
data <- dt[c("1/2/2007", "2/2/2007"),]
#open device 
png("plot3.png", width=480, height=480, units="px")
#plot
plot(as.numeric(data$Sub_metering_1), type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(as.numeric(data$Sub_metering_2), col="red")
lines(as.numeric(data$Sub_metering_3), col="blue")
axis(1, at=c(1, length(data$Time)/2, length(data$Time)), labels=c("Thu","Fri","Sat"))

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lty = 1)
#close device
dev.off()