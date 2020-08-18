#Read data
unzip(zipfile="exdata-data-household_power_consumption.zip")
data<-read.table("household_power_consumption.txt",sep=";",head=TRUE)
dt<-rbind(subset(data,Date=="1/2/2007"),subset(data,Date=="2/2/2007"))
datetime<-strptime(paste(dt$Date," ",dt$Time),"%d/%m/%Y %H:%M:%S")
#Create file png
png(file="plot4.png",width = 480, height = 480, units = "px")
#plot
par(mfrow=c(2,2),pin=c(2.5,1.5))
plot(datetime,as.numeric(as.character(dt$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(datetime,as.numeric(as.character(dt$Voltage)),type="l",ylab="Voltage")
plot(datetime,as.numeric(as.character(dt$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="")
lines(datetime,as.numeric(as.character(dt$Sub_metering_2)),col="red")
lines(datetime,as.numeric(as.character(dt$Sub_metering_3)),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=1)      
plot(datetime,as.numeric(as.character(dt$Global_reactive_power)),type="l",ylab="Global_reactive_power")
dev.off()