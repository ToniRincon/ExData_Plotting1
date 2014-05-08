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

# plot Global Active Power on y axis, x axis is DateTime, that will be represent and Thu, Fri, Sat
plot(data$DateTime, data$Global_active_power, ylab="Golbal Active Power (kilowatts)", type="l", xlab="")

# save as plot2.png
dev.copy(png,'plot2.png')
dev.off()
