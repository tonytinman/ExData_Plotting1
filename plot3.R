##read the data in from file and subset only the data required for the assignment
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
feb1<-data[data$Date=="1/2/2007",]
feb2<-data[data$Date=="2/2/2007",]
plotdata<-rbind(feb1,feb2)
remove(data,feb1,feb2)

##plot to png
gap<-as.numeric(plotdata$Global_active_power)
dt<-strptime(paste(plotdata$Date,plotdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 
sm1<-as.numeric(plotdata$Sub_metering_1)
sm2<-as.numeric(plotdata$Sub_metering_2)
sm3<-as.numeric(plotdata$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(dt,sm1,type="l",ylab="Energy sub metering", xlab="")
lines(dt,sm2,type="l",col="red")
lines(dt,sm3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))
dev.off()
