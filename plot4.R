# load data
source("loadData.R")

# launch png graphics device
png("plot4.png", bg = "transparent", type = "cairo")
# divide the plotting area in 2 rows and 2 columns, filling columns first
par(mfcol = c(2, 2))
with(power, {
  ## first plot: top-left
  # plot a line graph of global active power against time without drawing x-axis (xaxt = "n")
  plot(Time , Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power")
  # draw the x-axis with 3 ticks and labels representing a sequence of 3 consecutive weekdays
  axis.POSIXct(1, at = seq(min(Time), by = "day", length.out = 3), format = "%a")
  
  ## second plot: bottom-left
  # plot a line graph of sub_metering_1 active energy against time without drawing x-axis (xaxt = "n")
  plot(Time , Sub_metering_1, type = "l", xaxt = "n",  xlab = "", ylab = "Energy sub metering")
  # add the line graph of sub_metering_2 active energy against time to the plot in red
  lines(Time, Sub_metering_2, col = "red")
  # add the line graph of sub_metering_3 active energy against time to the plot in blue
  lines(Time, Sub_metering_3, col = "blue")
  # draw the x-axis with 3 ticks and labels representing a sequence of 3 consecutive weekdays
  axis.POSIXct(1, at = seq(min(Time), by = "day", length.out = 3), format = "%a")
  # add a legend the top right corner of the plot explaining line colors without a legend-box (bty = "n")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
  
  ## third plot: top-right
  # plot a line graph of voltage against time without drawing x-axis (xaxt = "n")
  plot(Time , Voltage, type = "l", xaxt = "n", xlab = "datetime")
  # draw the x-axis with 3 ticks and labels representing a sequence of 3 consecutive weekdays
  axis.POSIXct(1, at = seq(min(Time), by = "day", length.out = 3), format = "%a")
  
  ## fourth plot: bottom-right
  # plot a line graph of global reactive power against time without drawing x-axis (xaxt = "n")
  plot(Time , Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
  # draw the x-axis with 3 ticks and labels representing a sequence of 3 consecutive weekdays
  axis.POSIXct(1, at = seq(min(Time), by = "day", length.out = 3), format = "%a")
})
# close png graphics device
dev.off()
