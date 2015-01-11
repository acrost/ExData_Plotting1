
#read in Household Power Consumption text file as a table
Power_table<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")

# only use observations from February 1 and 2, 2007
Power_table <- Power_table[(Power_table$Date == "1/2/2007") | (Power_table$Date == "2/2/2007"),]

# create a new column that combines date and time called Date_Time
# the new format is Day/Month/Year Hour:Minute:Second
Power_table$Date_Time <- strptime(paste(Power_table$Date, Power_table$Time), "%d/%m/%Y %H:%M:%S")

# open a new png file named "plot2.png" as the graphical device. 
# Width and height are 480 pixels and the background is white
png(filename="plot2.png", width = 480, height = 480, units= "px", bg= "white")

# create a line plot of Day and Time vs. Global Active power observations
plot(Power_table$Date_Time, Power_table$Global_active_power, type = "l", xlab="",
     ylab= "Global Active Power (kilowatts)")

# shut down the graphical device because plot2 is complete
dev.off()