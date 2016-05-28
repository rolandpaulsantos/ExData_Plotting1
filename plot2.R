source("loadData.R")

loadData()

png(filename = "plots/plot2.png", width = 480, height = 480)
plot(hpc$timestamp, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()