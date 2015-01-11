## Getting full dataset
exda1_full <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

## Setting desirable data format
exda1_full$Date <- as.Date(exda1_full$Date, "%d/%m/%Y")

## Subsetting the data
exda1 <- exda1_full[exda1_full$Date >= "2007-02-01" & exda1_full$Date <= "2007-02-02",]

## Plot 1
hist(exda1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()