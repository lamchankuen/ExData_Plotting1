## Exploratory Data Analysis: Course Project 1 Plot 4
## Four columns (2x2)  

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
png(filename = "plot4.png", width = 480, height = 480)

## create a 2x2 plot 
par(mfrow=c(2, 2)) 

## Plot 1 - Global Active Power vs Time 
with(hpc, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power" ))

## Plot 2 - Voltage vs Time
with(hpc, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage" ))

## Plot 3 
with(hpc, plot(Time, Sub_metering_1, type="l", col="black", , xlab="", ylab="Energy sub metering"))
lines(hpc$Time,hpc$Sub_metering_2, type="l", col="red") 
lines(hpc$Time,hpc$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1, pch="")

## Plot 4 - Global Reactive Power vs Time 
with(hpc, plot(Time, Global_reactive_power, type="l", xlab="datetime" ))


## close output 
dev.off() 
