source("loadData.R")

loadData()

png(filename = "plots/plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#top left
plot(hpc$timestamp, hpc$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#top right
plot(hpc$timestamp, hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#bottom left
plot(hpc$timestamp, hpc$Sub_metering_1,
	 ylim = range(c(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)), type = "l",
   	 ylab = "Energy sub metering", xlab = "",
   	 col = plotColors[1])
points(hpc$timestamp, hpc$Sub_metering_2, type = "l", col = plotColors[2])
points(hpc$timestamp, hpc$Sub_metering_3, type = "l", col = plotColors[3])
legend("topright",
	   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
   	   col = plotColors, border = plotColors,
	   lwd = 2, cex = .75)

#bottom right
with(hpc, plot(timestamp, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()