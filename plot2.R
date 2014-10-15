#Plot 2 - Global Active Power vs. Time 

# Datasource: "household_power_consumption.txt" from https://archive.ics.uci.edu/ml/machine-learning-databases/00235/
# Date of extraction: 14/10/2014

#set directory to the folder containing dataset
setwd("C:/Users/tariyaratne/Documents/Exploratory Data Analysis/Course Project 1")

#increase memory to accomodate large dataset
memory.limit(size=12000)

#convert dataset to a dataframe in R
data1<- read.table("household_power_consumption.txt", header=T, sep=";" )

#Observe characteristics of variable
str(data1)

#Subset the dataframe to dates of interest - 1/2/2007 to 2/2/2007
data2 <- subset(data1, Date=="1/2/2007"| Date=="2/2/2007")

#Convert "Date" from factor tor date var, and combine Time and Date vars to a new var called "datetime"
data2$Date<-strptime(data2$Date, "%d/%m/%Y")
data2$datetime<- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")


#Convert "Global active power" var to numeric var 
data2$Global_active_power<- as.numeric(as.character(data2$Global_active_power))

#Plot "datetime" against Global active power 
plot(data2$datetime, data2$Global_active_power, type="l", xlab=NULL, ylab="Global Active Power (kilowatts")

#Copy the plot to a PNG file
dev.copy(png, file="plot2.png")

#close the png device
dev.off()