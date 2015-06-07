url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, destfile = 'data', method = 'curl')
unzip('data')
dt <- read.csv('household_power_consumption.txt', na.strings = '?', sep = ';')

# - change columns to correct classes and subset to the relevent dates
require(package = 'lubridate')
dt$Date <- dmy(dt$Date)
dt$Time <- hms(dt$Time)
dt$datetime <- dt$Date + dt$Time
start<-ymd('2007-02-01')
end<-ymd('2007-02-02')
dt <- subset(dt,Date == start | Date == end)

# - plot 2
png(filename='plots/plot2.png', width = 480, height = 480)
plot(dt$datetime, dt$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()