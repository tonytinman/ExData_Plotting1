##read the data in from file and subset only the data required for the assignment
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
feb1<-data[data$Date=="1/2/2007",]
feb2<-data[data$Date=="2/2/2007",]
plotdata<-rbind(feb1,feb2)
remove(data,feb1,feb2)

##plot to png
gap<-as.numeric(plotdata$Global_active_power)
dt<-strptime(paste(plotdata$Date,plotdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 
png("plot2.png",width=480,height=480)
plot(dt,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()