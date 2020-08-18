#Read data
unzip(zipfile="exdata-data-household_power_consumption.zip")
data<-read.table("household_power_consumption.txt",sep=";",head=TRUE)
dt<-rbind(subset(data,Date=="1/2/2007"),subset(data,Date=="2/2/2007"))
#Create file png
png(file="plot1.png",width = 480, height = 480, units = "px")
#plot
hist(as.numeric(as.character(dt$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()