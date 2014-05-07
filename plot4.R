household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$DateTime = strptime(paste(household_power_consumption$Date,household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")
my_data = household_power_consumption[as.Date(household_power_consumption$DateTime)=="2007-02-01" | as.Date(household_power_consumption$DateTime)=="2007-02-02",]

Sys.setlocale(category = "LC_ALL", locale = "C")

par(mfrow=c(2,2))

hist(my_data$Global_active_power, col="red", main="Golbal Active Power", xlab="Golbal Active Power (kilowatts)")

plot(my_data$DateTime, my_data$Global_active_power, xlab="datetime", ylab="Golbal Active Power (kilowatts)",type="l")

plot(my_data$DateTime, my_data$Sub_metering_1, ylab="Enery sub metering",type="l",xlab="")
lines(my_data$DateTime, my_data$Sub_metering_2,col="red")
lines(my_data$DateTime, my_data$Sub_metering_3,col="blue")
legend("topright",bty = "n",cex=0.6,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

plot(my_data$DateTime, my_data$Global_reactive_power, ylab="Global_reactive_power",type="l",xlab="datetime")

dev.copy(png,'plot4.png')
dev.off()