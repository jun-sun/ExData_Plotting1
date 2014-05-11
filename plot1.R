
### load data ###
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'zz.zip', method='curl')
zz <- unz('zz.zip', 'household_power_consumption.txt')
d <- read.table(zz, header=TRUE, sep=';', colClasses = 'character')
data <- subset(d, Date == '1/2/2007' | Date == '2/2/2007')

### plot ###
png('plot1.png', width = 480, height = 480)
with(data, hist(as.numeric(Global_active_power), main='Global Active Power', axes = FALSE,
             xlab='Global Active Power (kilowatts)', col = 'red'))
axis(1, at = seq(0,6,by=2), labels = seq(0,6,by=2))
axis(2, at = seq(0,1200,by=200), labels = seq(0,1200,by=200))
dev.off()

### clear ###
file.remove('zz.zip')

