library(lubridate)
library(dplyr)

#please note that the data is processed in ProcessData.R to avoid repetition
#As per guideline we only need to load the data and that is done Here!!!
data <- read.csv(file.path("Data","cleaner.csv"))
data <- data %>% 
  mutate(Date = ymd(Date),Time = hms(Time))

#plot4
png("plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,2),oma=c(1,1,1,1))
#added margins and how to add -- row wise
with(data,plot(Date+Time,Global_active_power,type = "l",
               ylab = "Global Active Power (kilowatts)",xlab=""))
#--- 1st one done
with(data,plot(Date+Time,Voltage,type = "l",xlab = "datetime"))
#-- 2nd one done
with(data,plot(Date+Time,Sub_metering_1,type = "n",ylab="Energy sub metering",xlab=""))
with(data,points(Date+Time,Sub_metering_1,type = "l"))
with(data,points(Date+Time,Sub_metering_2,type = "l",col="red"))
with(data,points(Date+Time,Sub_metering_3,type = "l",col="blue"))
legend("topright",col=c("black","red","blue"),legend = paste("Sub_metering",1:3,sep = "_"),
       lty = rep(1,3),bty = "n",cex=0.9)
#-- 3rd one done
with(data,plot(Date+Time,Global_reactive_power,type = "l",xlab="datetime"))
#-- 4th one done
dev.off()
rm(data)