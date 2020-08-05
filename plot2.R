#reading data
library(lubridate) #used lubridate to process date/time entries
energyData<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
subsetEnergyData<-subset(energyData, energyData$Date=="1/2/2007"|energyData$Date=="2/2/2007")
#create date/time entries
subsetEnergyData$Date<-as.Date(subsetEnergyData$Date, format="%d/%m/%Y")
subsetEnergyData$Time<-strptime(subsetEnergyData$Time, format="%H:%M:%S")
subsetEnergyData$DateTime<-with(subsetEnergyData, dmy(Date)+hms(Time))

#create plot
png("plot2.png") #set up png graphics device
plot(subsetEnergyData$DateTime, as.numeric(subsetEnergyData$Global_active_power), 
     type="l", xlab="", ylab="Global Active Power (Kilowatts")
dev.off() #turn off graphics device