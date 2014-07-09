source("read-data.R")
png("plot3.png", width=480, height=480)
plot(y=dat$Sub_metering_1, x=dat$Time, type="l",
     ylab="Energy sub metering", xlab="")
lines(y=dat$Sub_metering_2, x=dat$Time, type="l", col="red")
lines(y=dat$Sub_metering_3, x=dat$Time, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,
       col=c("black", "red", "blue"))
dev.off()
