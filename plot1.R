library(sqldf)
library(dplyr)
library(lubridate)

# read file and convert data and time columns
file <- "household_power_consumption.txt"
power <- read.csv.sql(file, sql = "select * from file where Date  in ('1/2/2007', '2/2/2007')", sep =";" )
closeAllConnections()
power <- mutate(power, Date = dmy(Date), Time = hms(Time))

#create plot1
png(file = "plot1.png", width = 480, height = 480)
with(power, hist(Global_active_power, 
                 col = "red", 
                 xlab = "Global Active Power (kilowatts)", 
                 ylab = "Frequency",
                 main = "Global Active Power"))
dev.off()