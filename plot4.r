## This script assembles 4 different plots into one png file. The plots included
## are all line plots vs time; Global Active Power, Voltage, Sub-meter readings,
## and global reactive power

plot4 <- function(){
    
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
    png(filename = '~/Coursera/ExpDataAnal/Project1/ExData_Plotting1/plot4.png',
        width = 480, height = 480)
    
    # IT'S PLOTTIN' TIME
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    with(PowerData, {
        plot(Global_active_power~DateTime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~DateTime, type="l", 
             ylab="Voltage", xlab="")
        plot(Sub_metering_1~DateTime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type="l", 
             ylab="Global_reactive_power",xlab="")
    })
    
    dev.off()
}