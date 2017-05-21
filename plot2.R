library(sqldf)

# read file and convert data and time columns
file <- "household_power_consumption.txt"
power <- read.csv.sql(file, sql = "select * from file where Date  in ('1/2/2007', '2/2/2007')", sep =";" )
closeAllConnections()

#create plot2
png(file = "plot2.png", width = 480, height = 480)
plot(as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y%H:%M:%S"), power$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()



