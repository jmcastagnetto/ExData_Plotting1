load_and_subset <- function (zipfile, txtfile, return_subset=TRUE) {
    dat <- read.table(unz(zipfile, txtfile), header = TRUE, sep = ";",
                      na.strings = "?", stringsAsFactors=FALSE)
    # make some date/time manipulations
    dat$Time <- strptime(paste(dat$Date,dat$Time),
                        format="%d/%m/%Y %H:%M:%S", tz="CEST")
    dat$Date <- as.Date(dat$Date, format="%d/%m/%Y", tz="CEST")
    if (return_subset == TRUE) {
        # get the subset we will be using for the plots
        subdat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")
        # reset the rownames numbering
        rownames(subdat) <- seq(length=nrow(subdat))
        return(subdat)
    } else {
        return(dat)
    }
}

load_selected_lines <- function (zipfile, txtfile, colnames, start, end) {
    dat <- read.table(unz(zipfile, txtfile), header = FALSE, sep = ";",
                      na.strings = "?", col.names = colnames,
                      stringsAsFactors = FALSE, 
                      skip = start - 1, nrows = (end - start + 1))
    dat$Time <- strptime(paste(dat$Date,dat$Time),
                          format="%d/%m/%Y %H:%M:%S", tz="CEST")
    dat$Date <- as.Date(dat$Date, format="%d/%m/%Y", tz="CEST")
    return(dat)
}

zipfile <- "data/household_power_consumption.zip"
txtfile <- "household_power_consumption.txt"
start <- 66638
end <- 69517
header <- "Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
colnames <- unlist(strsplit(header, ";", fixed=TRUE))

# Baseline, only reading the data w/o subsetting
system.time({dat0 <- load_and_subset(zipfile, txtfile, FALSE)})
# Memory size for all data
object.size(dat0)

# Reading all the data file and then subsetting
system.time({dat1 <- load_and_subset(zipfile, txtfile)})
# Memory size for the subset
object.size(dat1)

# Reading only the lines that are needed
system.time({dat2 <- load_selected_lines(zipfile, txtfile, colnames, start, end)})
# Memory size for data from selected lines
object.size(dat2)

# Comparing subsetted data frame with the one from selected lines
all.equal(dat1, dat2)
