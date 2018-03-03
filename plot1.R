#used SQL function to read data install.packages("sqldf")

#install.packages("sqldf")
library(sqldf)

setwd("D:/DOST/datasciencecoursera/power_consumption")

#read file using SQL
f_content <- read.csv.sql("household_power_consumption.txt","select * from file where Date IN('1/2/2007','2/2/2007')",sep=";")

#create histogram
hist(f_content$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#open jpeg device to create graph
jpeg('plot1.png')

#create histogram for file output
hist(f_content$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#close device
dev.off()
