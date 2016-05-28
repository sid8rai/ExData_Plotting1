
## Reading in the power consumption data stored at default location
a<-read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactors = FALSE)

## Subsetting Feb1-Feb2 data
b<-a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]

## changing the data type from character to datetime
b$Time <- strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")

## Opening png device
png("./plot2.png",width=480,height=480)

## Ploting chart
plot(b$Time,as.numeric(b$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab="")

## Closing device
dev.off()