datapath<-file.path("./data/household_power_consumption.txt")
data <- read.table(datapath, header=TRUE, sep=";", stringsAsFactors=FALSE)
head(data)
names(data)
#dataSubset<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
dataSubset<- subset(data, Date=="1/2/2007" | Date =="2/2/2007")

#subSubset<- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

dataSubset$Date <- as.Date(dataSubset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataSubset$Date), dataSubset$Time)
Date_time <- as.POSIXct(datetime)


with(dataSubset, {
        plot(Sub_metering_1~Date_time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()