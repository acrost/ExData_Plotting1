
#read in Household Power Consumption text file as a table
PwrTbl<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")

#take only observations from February 1 and 2, 2007
PwrTbl <- PwrTbl[(PwrTbl$Date == "1/2/2007") | (PwrTbl$Date == "2/2/2007"),]

#create a new column that combines date and time into a single item
PwrTbl$DateTime <- strptime(paste(PwrTbl$Date, PwrTbl$Time), "%d/%m/%Y %H:%M:%S")


# open a png file named "plot4.png" as the graphical device. 
# Width and height are 480 pixels and the background is white
png(filename="plot4.png", width = 480, height = 480, units= "px", bg= "white")

#change plotting parameters to accept 4 graphs in a 2 x 2 grid,
# moving from upper left to bottom right
par(mfrow=c(2,2))

# create a line plot with lables of day and time vs. Global Active power
plot(PwrTbl$DateTime, PwrTbl$Global_active_power, type = "l", xlab="",
     ylab= "Global Active Power")

# create a line plot with lables of day and time vs. Voltage
plot(PwrTbl$DateTime, PwrTbl$Voltage, type = "l", xlab="datetime",
     ylab= "Voltage")

# Note: this recreates plot 3
# Create a line plot of Sub Metering 1, 2, and 3
# "Sub metering 1" is a black line
# "Sub metering 2" is a red line
# "Sub metering 3" is a blue line
plot(x=PwrTbl$DateTime, y=PwrTbl$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=PwrTbl$DateTime, y=PwrTbl$Sub_metering_2, col="red")
lines(x=PwrTbl$DateTime, y=PwrTbl$Sub_metering_3, col="blue")

# Create and place legend in the top right corner of the graph
# List the three variables and display the corresponding line color
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))

# create a line plot with lables of day and time vs. Global reactive power
plot(PwrTbl$DateTime, PwrTbl$Global_reactive_power, type = "l", xlab="datetime",
     ylab= "Global_reactive_power")


# close the connection
dev.off()