## Exploratory Data Analysis: Course Project 1 Plot 2 
## Global Active Power against Time 

## load library 
library(data.table)
library(datasets)

## read the text file into data.table
hpc_filename <- "household_power_consumption.txt"
hpc_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc <- fread(hpc_filename, header = FALSE, sep=";", colClasses = hpc_classes, skip = 66637, nrow = 2880)

## set column names 
hpc_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
setnames(hpc, hpc_names) 

## convert date and time 
hpc$Time <- as.POSIXct(strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")) 
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## open dev as png 
png(filename = "plot2.png", width = 480, height = 480)

## Plot diagram here 
with(hpc, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" ))

## close output 
dev.off() 

