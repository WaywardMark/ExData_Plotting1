## Plot1.R ----
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
## Code for plot 1 ----

#color helper
#colors()

## Initialize plot ---- 
# turn on png recorder
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

#create plot, change color
hist(d$Global_active_power, col="red3", 
     #change x-axis label
     xlab="Global Active Power (kilowatts)", 
     #change title
     main = "Global Active Power" )

dev.off()
