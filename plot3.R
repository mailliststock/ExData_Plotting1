# set working dir
setwd("/Users/rcc/Desktop/ExData_Plotting1/")

my_data <- read.table("household_power_consumption.txt", header = T, sep = ";")

pdata <- subset(my_data, my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007")

png(filename="plot3.png")

pdata$DateTime <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")

plot(pdata$DateTime,as.numeric(type.convert(as.character(pdata$Sub_metering_1), dec = ".")),
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "", 
     col = "black")

points(pdata$DateTime,as.numeric(type.convert(as.character(pdata$Sub_metering_2), dec = ".")), 
       type = "l", 
       ylab = "Energy sub metering", 
       xlab = "", 
       col = "red")

points(pdata$DateTime,as.numeric(type.convert(as.character(pdata$Sub_metering_3), dec = ".")), 
       type = "l", 
       ylab = "Energy sub metering",
       xlab = "", 
       col = "blue")

legend("topright", 
       lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))

dev.off()

