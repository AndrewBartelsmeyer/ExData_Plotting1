# This script will read in a local file on household power consumption and 
# create a line plot of the various sub-meters vs. time

plot3 <- function(){
    
    # Loads in the dplyr library to make my life easier
    library(dplyr)
    
    # Reads in our data, places it in "data", and converts all "?" values to NA
    data <- read.csv("~/Coursera/ExpDataAnal/Project1/household_power_consumption.txt", 
                     sep = ";", na.strings = "?")
    
    # Selects subset of data from 2007-2-1 and 2007-2-2 and places in 'PowerData'
    PowerData <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    # removes unneccessary and huge 'data'
    rm(data)
    
    # converts date data to Date-type obeject
    PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")
    
    # Creates new DateTime object and appends to data
    datetime <- paste(as.Date(PowerData$Date), PowerData$Time)
    PowerData$DateTime <- as.POSIXct(datetime)
    
    # Creates line plots for various sub-meters vs "date/time" 
    # and saves it to plot3.png
    png(filename = '~/Coursera/ExpDataAnal/Project1/ExData_Plotting1/plot3.png',
        width = 480, height = 480)
    
    # IT'S PLOTTIN' TIME
    with(PowerData, {
        plot(Sub_metering_1~DateTime, type="l",
             ylab="Energy sub metering)", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
    })
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
}