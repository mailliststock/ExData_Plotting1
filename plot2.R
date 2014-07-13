# set working dir
setwd("/Users/rcc/Desktop/ExData_Plotting1/")

my_data <- read.table("household_power_consumption.txt", 
                     header = T, 
                     sep = ";")

pdata <- subset(my_data, my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007")

png(filename="plot2.png")

pdata$DateTime <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")

plot(pdata$DateTime,as.numeric(type.convert(as.character(pdata$Global_active_power), dec = ".")), 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()
