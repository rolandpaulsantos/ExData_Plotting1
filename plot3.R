source("loadData.R")

loadData()

plotColors <- c("black", "red", "blue")

png(filename = "plots/plot3.png", width = 480, height = 480)
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
dev.off()