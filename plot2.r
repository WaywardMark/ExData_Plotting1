## Plot2.R ----
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

#d$Date<-as.Date(d$Date)
d$Date2<-as.Date(d$Date, "%d/%m/%Y")
#subsetting to the correct days
d<-d[(d$Date2 >= "2007-02-01") & (d$Date2 <= "2007-02-02"),]
#combine date and time
d$DateTime<-paste(d$Date, d$Time)
d$DateTime<-strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

head(d)
head(raw_d)

## Initialize plot ---- 
# turn on png recorder
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
par(col="black")
plot(x = d$DateTime, y = d$Global_active_power)#, col="black")
lines(x = d$DateTime, y = d$Global_active_power)

#read the help for plot, gets better
par(col="black")
plot(x = d$DateTime, type = "l", y = d$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     #setting label to NULL does not work, see ggplot2
     xlab = "")#, col="black")
#add title interactively (I dare you to subtract points for adding an informative title!)
title(main = "Global Power Over Time")

dev.off()

