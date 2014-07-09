source("read-data.R")
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# top left
plot(y=dat$Global_active_power, x=dat$Time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
# top right
plot(y=dat$Voltage, x=dat$Time, type="l",
     ylab="Voltage", xlab="datetime")
# bottom left
plot(y=dat$Sub_metering_1, x=dat$Time, type="l",
     ylab="Energy sub metering", xlab="")
lines(y=dat$Sub_metering_2, x=dat$Time, type="l", col="red")
lines(y=dat$Sub_metering_3, x=dat$Time, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,
       col=c("black", "red", "blue"), bty="n")
# bottom right
plot(y=dat$Global_reactive_power, x=dat$Time, type="l",
     ylab="Global_reactive_power", xlab="datetime")
dev.off()
