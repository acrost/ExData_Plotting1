
#read in Household Power Consumption text file as a table
PwrTbl<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")

#take only observations from February 1 and 2, 2007
PwrTbl <- PwrTbl[(PwrTbl$Date == "1/2/2007") | (PwrTbl$Date == "2/2/2007"),]

#create a new column that combines date and time into a single item
PwrTbl$DateTime <- strptime(paste(PwrTbl$Date, PwrTbl$Time), "%d/%m/%Y %H:%M:%S")


# open a png file named "plot2.png" as the graphical device. 
# Width and height are 480 pixels and the background is white
png(filename="plot2.png", width = 480, height = 480, units= "px", bg= "white")

# create a line plot with lables of day and time vs. Global Active power
plot(PwrTbl$DateTime, PwrTbl$Global_active_power, type = "l", xlab="",
     ylab= "Global Active Power (kilowatts)")


# close the connection
dev.off()