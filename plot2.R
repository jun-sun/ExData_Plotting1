
### load data ###
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'zz.zip', method='curl')
zz <- unz('zz.zip', 'household_power_consumption.txt')
d <- read.table(zz, header=TRUE, sep=';', colClasses = 'character')
d.c <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

### plot ###
png('plot2.png', width = 480, height = 480)
dates <- strptime(paste(d.c$Date, d.c$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
counts <- as.numeric(d.c$Global_active_power)
plot(dates, counts, type='l', ylab='Global Active Power (kilowatts)', xlab='')
dev.off()

file.remove('zz.zip')
