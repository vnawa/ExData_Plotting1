#Reading data
EPC <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
EPC1<-subset(EPC,Date=="1/2/2007")
EPC2<-subset(EPC,Date=="2/2/2007")
EPC3<-rbind(EPC1,EPC2)

z<-paste(EPC3$Date,EPC3$Time,sep=",")
d <- strptime(z, format="%d/%m/%Y, %H:%M:%OS")
time2="2007-02-01 00:00:00 SAST"
d1=difftime(d,time2)
d2=d1/(60*60*24)

#plot3

#Sub_metering_1
dev.off()
png(file="Plot3.png")
with(EPC3,plot(d2,as.numeric(Sub_metering_1),type='n',axes=FALSE, frame.plot=TRUE, xlab="", ylab="Energy sub metering"))

axis(side=1, at=0,labels="Thur")
axis(side=1, at=1,labels="Fri")
axis(side=1, at=2,labels="Sat")

axis(side=2, at=0)
axis(side=2, at=10)
axis(side=2, at=20)
axis(side=2, at=30)

with(EPC3,points(d2,as.numeric(Sub_metering_1),type="l"))
with(EPC3,points(d2,as.numeric(Sub_metering_2),type="l",col="red"))
with(EPC3,points(d2,as.numeric(Sub_metering_3),type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
