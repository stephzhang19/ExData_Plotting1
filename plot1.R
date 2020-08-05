#reading data
energyData<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
subsetEnergyData<-subset(energyData, energyData$Date=="1/2/2007"|energyData$Date=="2/2/2007")

#create plot
png("plot1.png") #set up png graphics device
hist(as.numeric(subsetEnergyData$Global_active_power), col="red", 
     xlab="Global Active Power (Kilowats)", main="Global Active Power")
dev.off() #turn off graphics device