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


# calling the basic plot functions
plot(f_content$Time,f_content$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(f_content,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(f_content,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(f_content,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#open jpeg device to create graph
jpeg('plot3.png')

#create for file output
plot(f_content$Time,f_content$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(f_content,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(f_content,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(f_content,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close device
dev.off()
