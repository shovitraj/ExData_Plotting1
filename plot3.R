
#Coursera Data Science Specialization: Exploratory Data Analysis
#Shovit Raj Bhari
#Week: 1
#Project 1
#Plot 3
################################
rm(list=ls())

library(data.table)

#load data
datapath<-file.path("./data/household_power_consumption.txt")
data <- read.table(datapath, header=TRUE, sep=";", stringsAsFactors=FALSE)

#these are optional, I like to use them to see if the data is loaded properly\
#and to check the names of the variables
head(data)
names(data)
class(data$Date) #Variable Date is in a character format
class(data$Global_active_power) #Variable "Global_active_power" is in a character format

#creating the subset of data from the dates 2007-02-01 and 2007-02-02

dataSubset<- subset(data, Date=="1/2/2007" | Date =="2/2/2007")
#Date variable is in a character from, we need to convert it into date format with as.Date function
dataSubset$Date <- as.Date(dataSubset$Date, format="%d/%m/%Y")

names(dataSubset) #optional, I like to check variable names when subset is created

#concatenate date and time
datetime <- paste(as.Date(dataSubset$Date), dataSubset$Time)
head(datetime)
class(datetime)

#converting "datetime" which is in a character format to POSIXct
Date_time <- as.POSIXct(datetime)

## Plotting lines for 3 different variables
with(dataSubset, {
        plot(Sub_metering_1~Date_time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
})
## creating ledend for 3 different variables
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()