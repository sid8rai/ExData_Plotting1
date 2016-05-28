
## Reading in the power consumption data stored at default location
a<-read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactors = FALSE)

## Subsetting Feb1-Feb2 data
b<-a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]

## changing the data types as required
b$Time <- strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")
b$Sub_metering_1 <- as.numeric(as.character(b$Sub_metering_1))
b$Sub_metering_2 <- as.numeric(as.character(b$Sub_metering_2))

## Opening png device
png("./plot4.png",width=480,height=480)

par(mfrow=c(2,2))

## Ploting chart 4 (Part 1)
plot(b$Time,as.numeric(b$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab="")

## Ploting chart 4 (Part 2)
plot(b$Time,as.numeric(b$Voltage),type="l",ylab="Voltage",xlab="datetime")

## Ploting chart 4 (Part 3)
plot(b$Time,b$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(b$Time,b$Sub_metering_2,col="red")
lines(b$Time,b$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black","red","blue"),bty="n")

## Ploting chart 4 (Part 4)
plot(b$Time,as.numeric(b$Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime")

## Closing device
dev.off()