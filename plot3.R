# The following code is for replicating Plot 3 of the Exploratory 
# Data Analysis Course 1 Project.
#Created by Tuyet Hayes

#Importing data into R
hpcdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                      dec = ".", colClasses = c("character", "character", "numeric", 
                                                "numeric","numeric", "numeric", "numeric", "numeric", 
                                                "numeric"), na.strings = c("?"))

#Creating subset for dates 1/2/07 - 2/2/07
hpcdata_2day <- subset(hpcdata, (hpcdata$Date == "1/2/2007" | hpcdata$Date == "2/2/2007"))

#Formatting date 
formatted_date <- as.Date(hpcdata_2day$Date, format = "%d/%m/%Y")

#creating date-time vector
date_time <- paste(formatted_date," ", hpcdata_2day$Time)

#converting to date-time character vector to date-time class
formatted_date_time <- strptime(date_time, format = "%Y-%m-%d %H:%M:%S", tz="")

#Creates png file device
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="light grey")

#sets general paramters
par(mar = c(5,5,2,2))

#Creates line graph of Energy Sub-metering over the two days
plot(formatted_date_time, hpcdata_2day$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", xlab = "")
lines(formatted_date_time, hpcdata_2day$Sub_metering_1, type = "l")
lines(formatted_date_time, hpcdata_2day$Sub_metering_2, type = "l", col = "red")
lines(formatted_date_time, hpcdata_2day$Sub_metering_3, type = "l", col = "blue")

legend("topright", pch = c("-","-","-"), lty = 1, lwd = 2, col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#closes png file device
dev.off()
