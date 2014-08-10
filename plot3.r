## Plot3.R ----
# Mark Cruse
# Project: Coursera\Exploratory Data Analysis\Course Project 1
# 08/10/2014
# This code reads the "household_power_consumption" data set and makes a 2x2 array of plots
# Note that lack of titles and inconsistent axis labeling are stipulated by the assignment

## Read the data ----
#requires raw data file in working directory
filename <- "household_power_consumption.txt"

#previewed with a text editor
#data for this assignment stops well before row 80,000
raw_d <- read.csv(filename, sep = ";", nrows = 80000, 
                  na.strings = "?")
months(as.Date(raw_d[1,1]))

d<-raw_d

d$Date2<-as.Date(d$Date, "%d/%m/%Y")
#subsetting to the correct days
d<-d[(d$Date2 >= "2007-02-01") & (d$Date2 <= "2007-02-02"),]
#combine date and time
d$DateTime<-paste(d$Date, d$Time)
d$DateTime<-strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

head(d)
head(raw_d)

yrange<-range(c(d$Sub_metering_1,d$Sub_metering_2,d$Sub_metering_3))
plot(x=d$DateTime, y=d$Sub_metering_1, type="l", ylim=yrange, col="black",
     ylab = "Energy sub metering",
     xlab = "")
lines(x=d$DateTime, y=d$Sub_metering_2, type="l", ylim=yrange, col="red")
lines(x=d$DateTime, y=d$Sub_metering_3, type="l", ylim=yrange, col="blue")
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1,1),col=c("black", "red", "blue")) # gives the legend lines the correct color and width

## Plot 3 png ----
# sending a plot straight to png
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
yrange<-range(c(d$Sub_metering_1,d$Sub_metering_2,d$Sub_metering_3))
plot(x=d$DateTime, y=d$Sub_metering_1, type="l", ylim=yrange, col="black",
     ylab = "Energy sub metering",
     xlab = "")
lines(x=d$DateTime, y=d$Sub_metering_2, type="l", ylim=yrange, col="red")
lines(x=d$DateTime, y=d$Sub_metering_3, type="l", ylim=yrange, col="blue")
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1,1),col=c("black", "red", "blue")) #legend lines color and width
dev.off()
