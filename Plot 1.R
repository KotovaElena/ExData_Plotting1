library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file, skip = 66637, n_max = 2880)
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
gl_power<-as.numeric(power$Global_active_power)

hist(gl_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()


