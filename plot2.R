png(filename="plot2.png", height=480, width=480, bg="white")

hpc_data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character", rep("numeric",7)))
hpc_data <- within(hpc_data, datetime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
hpc_data <- subset(hpc_data,datetime>="2007-02-01" & datetime <="2007-02-03")
with(hpc_data, plot(datetime, Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)"))

dev.off()