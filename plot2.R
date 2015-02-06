require(data.table)
#set working directory
setwd("~/Workspaces//ExData_Plotting1")
#import dataset and filter required dates
dt <- fread("./household_power_consumption.txt", showProgress = FALSE)
setkey(dt, Date)
data <- dt[c("1/2/2007", "2/2/2007"),]
#open device 
png("plot2.png", width=480, height=480, units="px")
#plot
plot(as.numeric(data$Global_active_power), type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at=c(1, length(data$Time)/2, length(data$Time)), labels=c("Thu","Fri","Sat"))
#close device
dev.off()
