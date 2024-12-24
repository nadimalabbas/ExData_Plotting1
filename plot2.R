# initialize constants
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataDir <- "data"
zipFilePath <- file.path(dataDir, "power_consumption.zip")

# setup directory and download zip file if needed
if(!file.exists(zipFilePath)) {
  if(!dir.exists("data")) dir.create(dataDir)
  download.file(dataURL, zipFilePath, method = "curl")
}
# unzip file and load data.frame
dataFile <- unzip(zipFilePath, exdir = dataDir)
power <- read.table(dataFile, header = TRUE, sep = ";", comment.char = "", na.strings = "?")
# subset data.frame to only needed rows
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
# convert time column to a POSIXlt datetime object
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

# launch png graphics device
png("plot2.png", bg = "transparent", type = "cairo")
with(power, {
  # plot a line graph of global active power against time without drawing x-axis (xaxt = "n")
  plot(Time , Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  # draw the x-axis with 3 ticks and labels representing a sequence of 3 consecutive weekdays
  axis.POSIXct(1, at = seq(min(Time), by = "day", length.out = 3), format = "%a")
})
# close png graphics device
dev.off()
