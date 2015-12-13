## Jim W. 13-12-2015 ##
## First define the file (currently set to my own working directory), if test is required, please uncomment
## and edit the working directory below!
## setwd('')


## Step 1: Define file name:
Filename <- "household_power_consumption.txt"

## Step 2: Read data in to variable named 'Data'
data <- read.table(Filename, header=TRUE, stringsAsFactors=FALSE, dec=".", sep=";")

## Step 3: We only need data for feb and jan from 2007, thanks to Github for this tweak.
PartialData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Step 4: Define date time variable
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


# Generate 4th plot image, based on width and height
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Add plot with two lines, one red and one blue.
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Generate the plot and give a final name to it.
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")