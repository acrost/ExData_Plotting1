# read in Household Power Consumption text file as a table
Power_table<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")

# only use observations from February 1 and 2, 2007
Power_table <- Power_table[(Power_table$Date == "1/2/2007") | (Power_table$Date == "2/2/2007"),]

# create a new column that combines date and time called Date_Time
# the new format is Day/Month/Year Hour:Minute:Second
Power_table$Date_Time <- strptime(paste(Power_table$Date, Power_table$Time), "%d/%m/%Y %H:%M:%S")

# open a new png file named "plot3.png" as the graphical device. 
# Width and height are 480 pixels and the background is white
png(filename="plot3.png", width = 480, height = 480, units= "px", bg= "white")

# Create a line plot of the observations for Sub Metering 1, 2, and 3
# First, plot Sub_metering_1 in a black line 
#     Since this is the first plot, print the Y axis label
# Second, plot Sub_metering_2 in a red line
# Third, plot Sub_metering_3 in a blue line
plot(x=Power_table$Date_Time, y=Power_table$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=Power_table$Date_Time, y=Power_table$Sub_metering_2, col="red")
lines(x=Power_table$Date_Time, y=Power_table$Sub_metering_3, col="blue")

# Create and place legend in the top right corner of the graph
# List the three variables and display the corresponding line color
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))

# shut down the graphical device because plot3 is complete
dev.off()