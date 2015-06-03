png(filename="plot3.png", height=480, width=480, bg="white")

hpc_data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character", rep("numeric",7)))
hpc_data <- within(hpc_data, datetime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
hpc_data <- subset(hpc_data,datetime>="2007-02-01" & datetime <="2007-02-03")

with(hpc_data, plot(datetime, Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering"))
with(hpc_data, lines(datetime, Sub_metering_2, type="l", col="red"))
with(hpc_data, lines(datetime, Sub_metering_3, type="l", col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()