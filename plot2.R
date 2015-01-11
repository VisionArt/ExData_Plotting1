## Getting full dataset
exda1_full <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

## Setting desirable data format
exda1_full$Date <- as.Date(exda1_full$Date, "%d/%m/%Y")

## Subsetting the data
exda1 <- exda1_full[exda1_full$Date >= "2007-02-01" & exda1_full$Date <= "2007-02-02",]

## Converting datetime
datetime <- paste(as.Date(exda1$Date), exda1$Time)
exda1$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(exda1$Global_active_power~exda1$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()