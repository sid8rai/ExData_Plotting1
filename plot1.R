
## Reading in the power consumption data stored at default location
a<-read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactors = FALSE)

## Subsetting Feb1-Feb2 data
b<-a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]

## changing the data type from character to datetime
b$Time <- strptime(paste(b$Date,b$Time),"%d/%m/%Y %H:%M:%S")

## Opening png device
png("./plot1.png",width=480,height=480)

## Plotting histogram
hist(as.numeric(b$Global_active_power),col="red",main="Global Active Power",xlab= "Global Active Power (kilowatts)")

## Close device
dev.off()