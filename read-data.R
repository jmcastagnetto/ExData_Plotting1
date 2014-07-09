# check that data dir exists
if (!file.exists("data")) {
    dir.create("./data")
}

# and that we have a local copy of the zip file
if (!file.exists("data/household_power_consumption.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip",
                  destfile="data/household_power_consumption.zip",
                  method="curl")
}

# Read only the lines we need
# first row for 2007-02-01 is at line 66638
# last row for 2007-02-02 is at line 69517
# see also: benchmark_reading_strategies.R
columns <- "Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
cnames <- unlist(strsplit(columns, ";", fixed=TRUE))
dat <- read.table(unz("data/household_power_consumption.zip",
                      "household_power_consumption.txt"),
                  header = FALSE, sep = ";", na.strings = "?",
                  col.names = cnames,
                  stringsAsFactors = FALSE,
                  skip = 66637,
                  nrows = (69517 - 66637))
dat$Time <- strptime(paste(dat$Date,dat$Time),
                     format="%d/%m/%Y %H:%M:%S", tz="CEST")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y", tz="CEST")

