## Getting full dataset
exda1_full <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

## Setting desirable data format
exda1_full$Date <- as.Date(exda1_full$Date, "%d/%m/%Y")

## Subsetting the data
exda1 <- exda1_full[exda1_full$Date >= "2007-02-01" & exda1_full$Date <= "2007-02-02",]

## Converting datetime
datetime <- paste(as.Date(exda1$Date), exda1$Time)
exda1$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data, {
  plot(exda1$Sub_metering_1~exda1$Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(exda1$Sub_metering_2~exda1$Datetime,col='Red')
  lines(exda1$Sub_metering_3~exda1$Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1,
         box.lwd = par("lwd"), box.lty = par("lty"), box.col = par("fg"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

## Saving to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()