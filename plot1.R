##read the data in from file and subset only the data required for the assignment
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
feb1<-data[data$Date=="1/2/2007",]
feb2<-data[data$Date=="2/2/2007",]
plotdata<-rbind(feb1,feb2)
remove(data,feb1,feb2)

##plot to png
gap<-as.numeric(plotdata$Global_active_power)
png("plot1.png",width=480,height=480)
hist(gap,right=FALSE,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()