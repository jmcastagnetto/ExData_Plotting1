source("read-data.R")
png("plot2.png", width=480, height=480)
plot(y=dat$Global_active_power, x=dat$Time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
