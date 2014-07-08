source("read-data.R")
png("plot2.png", width=480, height=480)
plot(y=dat2$Global_active_power, x=dat2$Time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
