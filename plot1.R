getwd()
setwd("~/Desktop/Coursera R Files")
# Read all the data before subsetting
fulldataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Data only needed from February 1st and 2nd
feb1and2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]


#Create the Graph
png("plot1.png")
hist(feb1and2$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")



