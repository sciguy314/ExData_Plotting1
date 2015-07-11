##
##  plot4.R
##
##  This code constructs a set of plots of data taken from the "household_power_consumption" 
##  dataset available from UC Irvine Machine Learning Repository and puts the histogram into a 
##  png file entitled "plot4.png"
##
##
##  Use the following assignment statement to specify a location for the dataset
##  other than the current working directory
##
datasetFilePathway <- ""

##
## Read all the dataset from the dataset
##

household_power_consumption <- data.frame(read.csv(paste(datasetFilePathway, "household_power_consumption.txt", sep = ""), sep=";", na.strings="?", stringsAsFactors = FALSE))

##
##  The following statement subsets the data according to our selection criteria
##

powerData <- household_power_consumption[which(household_power_consumption$Date %in% c("1/2/2007", "2/2/2007")), ]

##
##  Introduce a new date variable by using strptime() to combine the character
##  strings for Date and Time in the original data
##

powerData$DateTime <- strptime(paste(powerData$Date, " ", powerData$Time), format = "%d/%m/%Y %H:%M:%S")

##
## Open the png file
##

png(filename = "plot4.png")

##
##  Estabish organization, 2 x 2 plots
##

par(mfrow = c(2, 2))

##
##  First plot is of "Global_Active_Power" versus "DateTime"
##

with(powerData, plot(DateTime, Global_active_power, type = "l", pch = "", col = "black", bg = "black", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))

##
##  Second plot is of "Voltage" versus "DateTime"
##

plot(powerData$DateTime, powerData$Voltage, type = "l", pch = "", col = "black", main ="", xlab = "datetime", ylab = "Voltage")

##  Third plot is "Sub_metering_" values versus "DateTime"  (plot3.R)

plot(powerData$DateTime, powerData$Sub_metering_1, type = "l", pch = "", col = "black", bg = "black", main = "", xlab = "", ylab = "Energy Sub Metering" )
lines(powerData$DateTime, powerData$Sub_metering_2, type = "l", pch = "", col = "red")
lines(powerData$DateTime, powerData$Sub_metering_3, type = "l", pch = "", col = "blue")
legend("topright", pch = "", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##
## Fourth plot is of "Global_reactive_power" versus "DateTime"
##

plot(powerData$DateTime, powerData$Global_reactive_power, type = "l", pch = "", col = "black", main ="", xlab = "datetime", ylab = "Global_reactive_power")

## Close the png file
##

dev.off()
