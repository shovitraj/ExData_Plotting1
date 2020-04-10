#Coursera Data Science Specialization: Exploratory Data Analysis
#Shovit Raj Bhari
#Week: 1
#Project 1
#Plot 1
################################


#load data
datapath<-file.path("./data/household_power_consumption.txt")
data <- read.table(datapath, header=TRUE, sep=";", stringsAsFactors=FALSE)

#these are optional, I like to use them to see if the data is loaded properly\
#and to check the names of the variables
head(data)
names(data)
class(data$Date) #Variable Date is in a character format
class(dataSubset$Global_active_power) #Variable "Global_active_power" is in a character format

#creating the subset of data from the dates 2007-02-01 and 2007-02-02

dataSubset<- subset(data, Date=="1/2/2007" | Date =="2/2/2007")
#Date variable is in a character from, we need to convert it into date format with as.Date function
datetime <- as.Date(dataSubset$Date, format="%d/%m/%Y")

names(dataSubset) #optional, I like to check variable names when subset is created
Date_time <- as.POSIXct(datetime)
#converting variable "Global_active_power" to numeric
glo_active_power <- as.numeric(dataSubset$Global_active_power)
glo_active_power
Date_time
dim(glo_active_power)
dim(Date_time)
## Plot 2
with(dataSubset, {
        plot(glo_active_power~Date_time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})