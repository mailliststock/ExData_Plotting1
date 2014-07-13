# set working dir
setwd("/Users/rcc/Desktop/ExData_Plotting1/")

myData <- read.table("household_power_consumption.txt", header = T, sep = ";")

plotData <- subset(myData, myData$Date == "1/2/2007" | myData$Date == "2/2/2007")

png(filename="plot4.png")

plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_active_power), dec = ".")), 
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Voltage), dec = ".")), 
     type = "l", 
     ylab = "Voltage",
     xlab = "datetime")

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_1), dec = ".")),
     type = "l",
     ylab = "Energy sub metering",
     xlab = "",
     col = "black")

points(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_2), dec = ".")),
       type = "l",
       ylab = "Energy sub metering", 
       xlab = "",
       col = "red")

points(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Sub_metering_3), dec = ".")),
       type = "l",
       ylab = "Energy sub metering",
       xlab = "", 
       col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, 
       col = c("black", "red", "blue"))

plot(plotData$DateTime,as.numeric(type.convert(as.character(plotData$Global_reactive_power), dec = ".")),
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()
