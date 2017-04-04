# The following code is for replicating Plot 2 of the Exploratory 
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
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="light grey")

#Creates line graph of Global Active Power over the two days
plot(formatted_date_time, hpcdata_2day$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)", mar = c(5,5,2,2))

#closes png file device
dev.off()
