#Plot 1 - Histogram "Global Active Power"

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


#Convert "Global active power" var to numeric var 
data2$Global_active_power<- sapply(data2$Global_active_power, as.numeric)

#Plot histogram to observe distribution of "Global active power" var
hist(data2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab= "Frequency", col = "red")

#Copy the plot to a PNG file
dev.copy(png, file="plot2.png")

#close the png device
dev.off()
