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

# read the data from the .txt file w/o decompressing first
dat <- read.table(unz("data/household_power_consumption.zip",
                      "household_power_consumption.txt"),
                  header = TRUE, sep = ";", na.strings = "?",
                  stringsAsFactors=FALSE)
# make some date/time manipulations
dat$Time <- strptime(paste(dat$Date,dat$Time),
                    format="%d/%m/%Y %H:%M:%S", tz="CEST")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y", tz="CEST")
# get the subset we will be using for the plots
subdat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")