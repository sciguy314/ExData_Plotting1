##
##  plot3.R
##
##  This code constructs a line graph with "datetime" as the x-variable and "Sub_metering_x" (where x = 1, 2, 3)
##  as the y-variable for the dates 2/1/2007 and 2/2/2007 from the "household_power_consumption" 
##  dataset available from UC Irvine Machine Learning Repository and puts the histogram into a 
##  png file entitled "plot2.png"
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

png(filename = "plot3.png")

##
## Draw the x-y plot with the specified parameters
##

 
plot(powerData$DateTime, powerData$Sub_metering_1, type = "l", pch = "", col = "black", bg = "black", main = "", xlab = "", ylab = "Energy Sub Metering" )
lines(powerData$DateTime, powerData$Sub_metering_2, type = "l", pch = "", col = "red")
lines(powerData$DateTime, powerData$Sub_metering_3, type = "l", pch = "", col = "blue")
legend("topright", pch = "", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##
## Close the png file
##

dev.off()
