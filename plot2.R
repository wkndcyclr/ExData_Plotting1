AllData <- read.table ("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=F)
str(AllData)
unique(AllData$Date)
Data <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007"),]
str(Data)
?strptime
Sys.setlocale(locale = "USA")
DataTime <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot2.png", width=480, height=480, units="px")
plot(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

