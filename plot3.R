library(sqldf)

# read file and convert data and time columns
file <- "household_power_consumption.txt"
power <- read.csv.sql(file, sql = "select * from file where Date  in ('1/2/2007', '2/2/2007')", sep =";" )
closeAllConnections()

#create plot3
png(file = "plot3.png", width = 480, height = 480)

plot(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Sub_metering_1,
     col = "black",
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")

lines(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Sub_metering_2,
     col = "red")

lines(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Sub_metering_3,
      col = "blue")

legend("topright", col = c("black", "red", "blue"), lty= 1, legend = names(power[7:9]))

dev.off()




