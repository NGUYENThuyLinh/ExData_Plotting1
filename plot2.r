#Read data
unzip(zipfile="exdata-data-household_power_consumption.zip")
data<-read.table("household_power_consumption.txt",sep=";",head=TRUE)
dt<-rbind(subset(data,Date=="1/2/2007"),subset(data,Date=="2/2/2007"))
datetime<-strptime(paste(dt$Date," ",dt$Time),"%d/%m/%Y %H:%M:%S")
#Create file png
png(file="plot2.png",width = 480, height = 480, units = "px")
#plot
plot(datetime,as.numeric(as.character(dt$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()