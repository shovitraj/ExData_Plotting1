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
glo_active_power <- as.numeric(dataSubset$Global_active_power)
glo_reactive_power <- as.numeric(dataSubset$Global_reactive_power)

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(dataSubset, {
        plot(glo_active_power~Date_time, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Date_time, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Date_time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(glo_reactive_power~Date_time, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()