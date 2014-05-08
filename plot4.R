# read data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# concat Date and Time to Time object
data$DateTime = strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# select data from days 2007-02-01 and 2007-02-02
data = data[as.Date(data$DateTime)=="2007-02-01" | as.Date(data$DateTime)=="2007-02-02",]

# set locale to C to force English labels on x axis
Sys.setlocale(category = "LC_ALL", locale = "C")

# set background transparency
par(bg="transparent")

# set a 2x2 plot
par(mfrow=c(2,2))

# plot on topleft
plot(data$DateTime, data$Global_active_power, cex=0.6, xlab="", ylab="Golbal Active Power",type="l")

# plot on topright
plot(data$DateTime, data$Voltage, cex=0.6, xlab="datetime", ylab="Voltage",type="l")

# plot on bottonleft
plot(data$DateTime, data$Sub_metering_1, cex=0.6, xlab="", ylab="Enery sub metering", type="l")
lines(data$DateTime, data$Sub_metering_2,col="red")
lines(data$DateTime, data$Sub_metering_3,col="blue")
legend("topright",bty = "n", cex=0.6, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

# plot on bottomright
plot(data$DateTime, data$Global_reactive_power, cex=0.6, ylab="Global_reactive_power",type="l",xlab="datetime")

# save as plot4.png
dev.copy(png,'plot4.png')
dev.off()
