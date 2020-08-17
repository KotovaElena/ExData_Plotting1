library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file, skip = 66637, n_max = 2880)
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
gl_power<-as.numeric(power$Global_active_power)

datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)

plot(datetime,subMetering1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),cex = 0.75)  
title(main="Energy sub-metering")

dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()

