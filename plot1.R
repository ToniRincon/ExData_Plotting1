household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Time = strptime(household_power_consumption$Time, format="%H:%M:%S")
household_power_consumption$Date=as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
my_data = household_power_consumption[household_power_consumption$Date=="2007-02-01" | household_power_consumption$Date=="2007-02-02",]
hist(my_data$Global_active_power, col="red", main="Golbal Active Power", xlab="Golbal Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()
