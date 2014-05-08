## Exploratory Data Analysis: Course Project 1 Plot 1

## load library 
library(data.table)
library(datasets)

## read the text file into data.table
hpc_filename <- "household_power_consumption.txt"
hpc_classes <- c("Date", "POSIXct", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc <- fread(hpc_filename, header = FALSE, sep=";", colClasses = hpc_classes, skip = 66637, nrow = 2880)

## set column names 
hpc_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
setnames(hpc, hpc_names) 

## open dev as png 
png(filename = "plot1.png", width = 480, height = 480)

## Plot diagram here 
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red") 

## close output 
dev.off() 
