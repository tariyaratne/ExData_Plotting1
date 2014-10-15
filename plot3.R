#Plot 2 - Energy sub metering vs. Time 

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

#Convert "Energy sub metering" vars to numeric var 
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

#Plot "datetime" against Energy sub metering 
#Convert "Energy sub metering" vars to numeric var 
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

#Plot "datetime" against Energy sub metering 
par(mfrow= c(1,1), mar=c(4,4,2,1))
plot(data2$datetime, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub meeting", col="Black")
par(new=TRUE) 
   plot(data2$datetime, data2$Sub_metering_2/2, ann=FALSE, axes=FALSE,type="l", col="Red")
par(new=TRUE)  
  plot(data2$datetime, data2$Sub_metering_3, ann=FALSE, axes=FALSE,type="l", col="Blue") 
legend("topright", pch= "-", col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

#Copy the plot to a PNG file
dev.copy(png, file="plot3.png")
dev.off()