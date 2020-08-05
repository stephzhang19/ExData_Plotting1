#reading data
library(lubridate) #used lubridate to process date/time entries
energyData<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
subsetEnergyData<-subset(energyData, energyData$Date=="1/2/2007"|energyData$Date=="2/2/2007")
#create date/time entries
subsetEnergyData$Date<-as.Date(subsetEnergyData$Date, format="%d/%m/%Y")
subsetEnergyData$Time<-strptime(subsetEnergyData$Time, format="%H:%M:%S")
subsetEnergyData$DateTime<-with(subsetEnergyData, dmy(Date)+hms(Time))

#set up 2x2 plot layout and graphics device
png("plot4.png")
par(mfrow=c(2, 2))

#plot 4 graphs in order
plot(subsetEnergyData$DateTime, as.numeric(subsetEnergyData$Global_active_power), 
     type="l", xlab="", ylab="Global Active Power")
plot(subsetEnergyData$DateTime, as.numeric(subsetEnergyData$Voltage), type="l", 
     xlab="", ylab="Voltage")
plot(subsetEnergyData$DateTime, as.numeric(subsetEnergyData$Sub_metering_1), 
     type="l", xlab="", ylab="Global Active Power (Kilowatts)")
with(subsetEnergyData, lines(DateTime, as.numeric(Sub_metering_2), col="red"))
with(subsetEnergyData, lines(DateTime, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
plot(subsetEnergyData$DateTime, as.numeric(subsetEnergyData$Global_reactive_power), 
     type="l", xlab="", ylab="Global_reactive_power")
dev.off()