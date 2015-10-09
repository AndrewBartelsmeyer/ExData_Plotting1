# This script will read in a local file on household power consumption and 
# create a plot of "frequency" vs "Global Active Power"

plot1 <- function(){
    
# Loads in the dplyr library to make my life easier
library(dplyr)

# Reads in our data, places it in "data", and converts all "?" values to NA
data <- read.csv("~/Coursera/ExpDataAnal/Project1/household_power_consumption.txt", 
                      sep = ";", na.strings = "?")

# Selects subset of data from 2007-2-1 and 2007-2-2 and places in 'PowerData'
PowerData <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# Creates a histogram for Global Active Power and saves it to Plot1.png
png('~/Coursera/ExpDataAnal/Project1/ExData_Plotting1/plot1.png')
hist(PowerData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
}