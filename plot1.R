# The following code is for replicating Plot 1 of the Exploratory 
# Data Analysis Course 1 Project.
#Created by Tuyet Hayes

#Importing data into R
hpcdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                      dec = ".", colClasses = c("character", "character", "numeric", 
                        "numeric","numeric", "numeric", "numeric", "numeric", 
                        "numeric"), na.strings = c("?"))

#Creating subset for dates 1/2/07 - 2/2/07
hpcdata_2day <- subset(hpcdata, (hpcdata$Date == "1/2/2007" | hpcdata$Date == "2/2/2007"))

#Creates png file device
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg="light grey")

#Creates histogram of Global Active Power over the two days
hist(hpcdata_2day$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red", mar = c(5,5,2,2), axes = FALSE)

axis(side = 2, at = c(0, 200, 400, 600, 800, 1000, 1200))
axis(side = 1, at = c(0,2,4,6))

dev.off()
