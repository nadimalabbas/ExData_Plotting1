# load data
source("loadData.R")

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
