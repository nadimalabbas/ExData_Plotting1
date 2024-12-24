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
png("plot1.png", bg = "transparent", type = "cairo")
mainTitle <- "Global Active Power"
# plot a histogram of global active power
hist(power$Global_active_power, col = "red", main = mainTitle, xlab = paste(mainTitle, "(kilowatts)"))
# close png graphics device
dev.off()
