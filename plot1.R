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

# Generate plot based on known data and add dimensions, title and colour.
globalActivePower <- as.numeric(PartialData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


