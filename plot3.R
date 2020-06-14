library(lubridate)
library(dplyr)
#please note that the data is processed in ProcessData.R to avoid repetition
#As per guideline we only need to load the data and that is done Here!!!
data <- read.csv(file.path("Data","cleaner.csv"))
data <- data %>% 
  mutate(Date = ymd(Date),Time = hms(Time))

#plot3
png("plot3.png")# note that the default width and height are already 480
with(data,plot(Date+Time,Sub_metering_1,type = "n",ylab="Energy sub metering",xlab=""))
#created empty plot frame!
with(data,points(Date+Time,Sub_metering_1,type = "l"))
with(data,points(Date+Time,Sub_metering_2,type = "l",col="red"))
with(data,points(Date+Time,Sub_metering_3,type = "l",col="blue"))
legend("topright",col=c("black","red","blue"),legend = paste("Sub_metering",1:3,sep = "_"),
       lty = rep(1,3))
dev.off()
rm(data)
