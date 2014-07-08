source("read-data.R")
png("plot2.png", width=480, height=480)
plot(y=subdat$Global_active_power, x=subdat$Time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
