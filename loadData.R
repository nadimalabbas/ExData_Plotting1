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
fullPowerData <- read.table(dataFile, header = TRUE, sep = ";", comment.char = "", na.strings = "?")
# subset data.frame to only needed rows
power <- subset(fullPowerData, Date %in% c("1/2/2007", "2/2/2007"))
# remove fullPowerData to save memory
rm(fullPowerData)
# convert time column to a POSIXlt datetime object
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
