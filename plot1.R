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

# histogram with red color, main title and x label
hist(data$Global_active_power, col="red", main="Golbal Active Power", xlab="Golbal Active Power (kilowatts)")

# save as plot1.png
dev.copy(png,'plot1.png')
dev.off()
