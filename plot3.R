
## Reading in the power consumption data stored at default location
a<-read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactors = FALSE)

## Subsetting Feb1-Feb2 data
b<-a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]

## changing the data types as required
b$Time <- strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")
b$Sub_metering_1 <- as.numeric(b$Sub_metering_1)
b$Sub_metering_2 <- as.numeric(b$Sub_metering_2)

## Opening png device
png("./plot3.png",width=480,height=480)

## Plotting
plot(b$Time,b$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(b$Time,b$Sub_metering_2,col="red")
lines(b$Time,b$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black","red","blue"))

## Closing device
dev.off()