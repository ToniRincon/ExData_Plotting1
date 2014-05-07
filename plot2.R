household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$DateTime = strptime(paste(household_power_consumption$Date,household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")
my_data = household_power_consumption[as.Date(household_power_consumption$DateTime)=="2007-02-01" | as.Date(household_power_consumption$DateTime)=="2007-02-02",]
Sys.setlocale(category = "LC_ALL", locale = "C")
plot(my_data$DateTime, my_data$Global_active_power, ylab="Golbal Active Power (kilowatts)",type="l",xlab="")
dev.copy(png,'plot2.png')
dev.off()
