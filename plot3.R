## Exploratory Data Analysis: Course Project 1 Plot 3
## Sub Metering (1-3) against Time 

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
png(filename = "plot3.png", width = 480, height = 480)

## Plot diagram here 
with(hpc, plot(Time, Sub_metering_1, type="l", col="black", , xlab="", ylab="Energy sub metering"))
lines(hpc$Time,hpc$Sub_metering_2, type="l", col="red") 
lines(hpc$Time,hpc$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1, pch="")

## close output 
dev.off() 

