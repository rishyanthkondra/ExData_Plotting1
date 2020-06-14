#Acquiring and processing Data
library(lubridate)
system("rm -rf Data")
dir.create("Data")
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              method = "curl",destfile = file.path("Data","data.zip"))
unzip(file.path("Data","data.zip"),exdir = "Data")
file.remove(file.path("Data","data.zip"))
x <- list.files("Data")
prepocessed_data <- read.csv(file.path("Data",x),sep=";")
prepocessed_data$Date = dmy(prepocessed_data$Date)
req_dates <- as.Date(c(" 2007-02-01 "," 2007-02-02 "))
processed_data <- subset(prepocessed_data,Date %in% req_dates)
class(processed_data$Voltage)<-"numeric"
class(processed_data$Global_reactive_power) <- "numeric"
class(processed_data$Global_intensity)<-"numeric"
class(processed_data$Sub_metering_2)<-"numeric"
class(processed_data$Sub_metering_1)<-"numeric"
class(processed_data$Sub_metering_3)<-"numeric"
class(prepocessed_data$Global_active_power) <- "numeric"
write.csv(processed_data,file.path("Data","cleaner.csv"),quote=F,row.names = F)
file.remove(file.path("Data",x))
rm(x,prepocessed_data,req_dates,processed_data)

