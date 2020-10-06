#Plot4 (four in one)
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

dev.off()
png(file="Plot4.png")
par(mfcol=c(2,2))
#Global active power
with(EPC3,plot(d2,as.numeric(Global_active_power),type='n',axes=FALSE, frame.plot=TRUE, xlab="", ylab="Global Active Power (kilowatts)"))

axis(side=1, at=0,labels="Thur")
axis(side=1, at=1,labels="Fri")
axis(side=1, at=2,labels="Sat")

axis(side=2, at=0)
axis(side=2, at=2)
axis(side=2, at=4)
axis(side=2, at=6)

with(EPC3,points(d2,as.numeric(Global_active_power),type="l"))

#Energy sub metering
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

#voltage
with(EPC3,plot(d2,as.numeric(Voltage),type='n',axes=FALSE, frame.plot=TRUE, xlab="datetime", ylab="Voltage"))

axis(side=1, at=0,labels="Thur")
axis(side=1, at=1,labels="Fri")
axis(side=1, at=2,labels="Sat")

axis(side=2, at=234)
axis(side=2, at=238)
axis(side=2, at=242)
axis(side=2, at=246)

with(EPC3,points(d2,as.numeric(Voltage),type="l"))

#Global reactive power
with(EPC3,plot(d2,as.numeric(Global_reactive_power),type='n',axes=FALSE, frame.plot=TRUE, xlab="datetime", ylab="Global_reactive_power"))

axis(side=1, at=0,labels="Thur")
axis(side=1, at=1,labels="Fri")
axis(side=1, at=2,labels="Sat")

axis(side=2, at=0.0)
axis(side=2, at=0.1)
axis(side=2, at=0.2)
axis(side=2, at=0.3)
axis(side=2, at=0.4)
axis(side=2, at=0.5)

with(EPC3,points(d2,as.numeric(Global_reactive_power),type="l"))
