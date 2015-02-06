require(data.table)
#set working directory
setwd("~/Workspaces//ExData_Plotting1")

#import dataset and filter required dates
dt <- fread("./household_power_consumption.txt", showProgress = FALSE)
setkey(dt, Date)
data <- dt[c("1/2/2007", "2/2/2007"),]

#open device 
png("plot1.png", width=480, height=480, units="px")
#plot
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close device
dev.off()
