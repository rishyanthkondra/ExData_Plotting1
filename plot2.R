library(lubridate)
library(dplyr)
#please note that the data is processed in ProcessData.R to avoid repetition
#As per guideline we only need to load the data and that is done Here!!!
data <- read.csv(file.path("Data","cleaner.csv"))
data <- data %>% 
  mutate(Date = ymd(Date),Time = hms(Time))

#plot2
png("plot2.png")
with(data,plot(Date+Time,Global_active_power,type = "l",
               ylab = "Global Active Power (kilowatts)",xlab=""))
dev.off()
rm(data)