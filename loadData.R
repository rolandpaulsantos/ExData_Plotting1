library(R.utils)
library(data.table)
library(dplyr)
library(sqldf)

loadData <- function() {
	data_source <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	data_filename <- "data/exdata_plot.zip"
	data_destination <- "data/household_power_consumption.txt"
	
	if (!file.exists("data")) {
		dir.create("data")
	}

	if (!file.exists("plots")) {
	   	dir.create("plots")
	}

	if (!file.exists(data_filename)) {
	   	cat(">>> downloading data from ", data_source, "...\n", sep = "")
	   	download.file(data_source, data_filename, method = "curl")
	}

	if (!file.exists(data_destination)) {
	   	cat(">>> extracting ", data_filename, "...\n", sep = "")
	   	unzip(data_filename, exdir = "data")
	}

	if (!exists("hpc") || is.null(hpc)) {
	   	cat(">>> loading data into environment")
	   	hpc <<- fread(data_destination, sep = ";",
				na.strings = c("", "?"),
							colClasses = c("Date", "POSIXlt", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
	   	hpc <<- mutate(hpc, Date = as.Date(Date, format = "%d/%m/%Y")) %>%
					filter(Date >= "2007-02-01", Date <= "2007-02-02") %>%
					mutate(timestamp = as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))
	}
}