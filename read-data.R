dat <- read.table(unz("data/household_power_consumption.zip",
                      "household_power_consumption.txt"),
                  header = TRUE, sep = ";", na.strings = "?",
                  stringsAsFactors=FALSE)
dat$Time <- strptime(paste(dat$Date,dat$Time),
                    format="%d/%m/%Y %H:%M:%S", tz="CEST")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y", tz="CEST")
subdat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")