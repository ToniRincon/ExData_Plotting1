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

# plot sub_metering_1
plot(data$DateTime, data$Sub_metering_1, ylab="Enery sub metering", type="l", xlab="")

# add sub_metering_2
lines(data$DateTime, data$Sub_metering_2, col="red")

# add sub_metering_3
lines(data$DateTime, data$Sub_metering_3, col="blue")

# add legend with titles and indicating colors
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

# save as plot3.png
dev.copy(png,'plot3.png')
dev.off()
