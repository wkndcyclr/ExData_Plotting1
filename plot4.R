library(sqldf)

# read file and convert data and time columns
file <- "household_power_consumption.txt"
power <- read.csv.sql(file, sql = "select * from file where Date  in ('1/2/2007', '2/2/2007')", sep =";" )
closeAllConnections()

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#create upper left
plot(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

#create upper right
plot(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Voltage, 
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

#create plot lower left
plot(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Sub_metering_1,
     col = "black",
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")

lines(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Sub_metering_2,
      col = "red")

lines(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Sub_metering_3,
      col = "blue")

legend("topright", bty = "n", col = c("black", "red", "blue"), lty= 1, legend = names(power[7:9]))

#create lower right
plot(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Global_reactive_power, 
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

dev.off()