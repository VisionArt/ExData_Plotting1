## Getting full dataset
exda1_full <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

## Setting desirable data format
exda1_full$Date <- as.Date(exda1_full$Date, "%d/%m/%Y")

## Subsetting the data
exda1 <- exda1_full[exda1_full$Date >= "2007-02-01" & exda1_full$Date <= "2007-02-02",]

## Converting datetime
datetime <- paste(as.Date(exda1$Date), exda1$Time)
exda1$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(exda1$Global_active_power~exda1$Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(exda1$Voltage~exda1$Datetime, type="l", ylab="Voltage", xlab="datetime")
  plot(exda1$Sub_metering_1~exda1$Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(exda1$Sub_metering_2~exda1$Datetime,col='Red')
  lines(exda1$Sub_metering_3~exda1$Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(exda1$Global_reactive_power~exda1$Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
})

## Saving to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()