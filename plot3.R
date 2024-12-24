# load data
source("loadData.R")

# launch png graphics device
png("plot3.png", bg = "transparent", type = "cairo")
with(power, {
  # plot a line graph of sub_metering_1 active energy against time without drawing x-axis (xaxt = "n")
  plot(Time ,Sub_metering_1, type = "l", xaxt = "n",  xlab = "", ylab = "Energy sub metering")
  # add the line graph of sub_metering_2 active energy against time to the plot in red
  lines(Time, Sub_metering_2, col = "red")
  # add the line graph of sub_metering_3 active energy against time to the plot in blue
  lines(Time, Sub_metering_3, col = "blue")
  # draw the x-axis with 3 ticks and labels representing a sequence of 3 consecutive weekdays
  axis.POSIXct(1, at = seq(min(Time), by = "day", length.out = 3), format = "%a")
  # add a legend the top right corner of the plot explaining line colors
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
})
# close png graphics device
dev.off()
