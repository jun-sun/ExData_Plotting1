
### load data ###
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'zz.zip', method='curl')
zz <- unz('zz.zip', 'household_power_consumption.txt')
d <- read.table(zz, header=TRUE, sep=';', colClasses = 'character')
d.c <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

### plot ###
png('plot4.png', width = 480, height = 480)
dates <- strptime(paste(d.c$Date, d.c$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

Gap <- as.numeric(d.c$Global_active_power)
plot(dates, Gap, type='l', ylab='Global Active Power', xlab='')

Vol <- as.numeric(d.c$Voltage)
plot(dates, Vol, type='l', ylab='Voltage', xlab='datetime')

counts1 <- as.numeric(d.c$Sub_metering_1)
counts2 <- as.numeric(d.c$Sub_metering_2)
counts3 <- as.numeric(d.c$Sub_metering_3)
plot(dates, counts1, ylab='Energy sub metering', xlab='', type='n')
points(dates, counts1, type='l', col='black')
points(dates, counts2, type='l', col='red')
points(dates, counts3, type='l', col='blue')
legend("topright", lty=1, col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_2'))

Grp <- as.numeric(d.c$Global_reactive_power)
plot(dates, Grp, type='l', ylab='Global_reactive_power', xlab='datetime')

dev.off()

file.remove('zz.zip')
