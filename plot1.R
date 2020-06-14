library(lubridate)
library(dplyr)

#please note that the data is processed in ProcessData.R to avoid repetition
#As per guideline we only need to load the data and that is done Here!!!
#loading the data
data <- read.csv(file.path("Data","cleaner.csv"))
data <- data %>% 
        mutate(Date = ymd(Date),Time = hms(Time))

#plot1
png("plot1.png")
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",
     ylab="Frequency",main="Global Active Power",col="red")
dev.off()