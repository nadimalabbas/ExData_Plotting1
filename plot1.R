# load data
source("loadData.R")

# launch png graphics device
png("plot1.png", bg = "transparent", type = "cairo")
mainTitle <- "Global Active Power"
# plot a histogram of global active power
hist(power$Global_active_power, col = "red", main = mainTitle, xlab = paste(mainTitle, "(kilowatts)"))
# close png graphics device
dev.off()
