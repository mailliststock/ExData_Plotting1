# set working dir
setwd("/Users/rcc/Desktop/ExData_Plotting1/")

my_data <- read.table("household_power_consumption.txt", 
                      header = T, 
                      sep = ";")

pdata <- subset(my_data, my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007")

png(filename="plot1.png")

hist(as.numeric(type.convert(as.character(pdata$Global_active_power), dec = ".")), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     breaks = 14, 
     xaxp = c(0, 6, 3))

dev.off()