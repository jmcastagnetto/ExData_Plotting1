source("read-data.R")
png("plot3.png", width=480, height=480)
plot(y=subdat$Sub_metering_1, x=subdat$Time, type="l",
     ylab="Energy sub metering", xlab="")
lines(y=subdat$Sub_metering_2, x=subdat$Time, type="l", col="red")
lines(y=subdat$Sub_metering_3, x=subdat$Time, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,
       col=c("black", "red", "blue"))
dev.off()
