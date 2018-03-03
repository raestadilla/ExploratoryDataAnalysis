#used SQL function to read data install.packages("sqldf")

#install.packages("sqldf")
library(sqldf)

setwd("D:/DOST/datasciencecoursera/power_consumption")

#read file using SQL
f_content <- read.csv.sql("household_power_consumption.txt","select * from file where Date IN('1/2/2007','2/2/2007')",sep=";")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
f_content$Date <- as.Date(f_content$Date, format="%d/%m/%Y")
f_content$Time <- strptime(f_content$Time, format="%H:%M:%S")
f_content[1:1440,"Time"] <- format(f_content[1:1440,"Time"],"2007-02-01 %H:%M:%S")
f_content[1441:2880,"Time"] <- format(f_content[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the plot function
plot(f_content$Time,f_content$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 


#open jpeg device to create graph
jpeg('plot2.png')

#create for file output
plot(f_content$Time,f_content$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#close device
dev.off()
