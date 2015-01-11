getwd()
setwd("~/Desktop/Coursera R Files")
# Read all the data before subsetting
fulldataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                          stringsAsFactors=FALSE, na.strings=c("?"))

# Below we only need data from two days
feb1and2part2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create a variable called datetime
feb1and2part2$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                         sdata$Date,sdata$Time)

png("plot2.png")
plot(feb1and2part2$datetime, feb1and2part2$Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis.POSIXct(1, as.POSIXct(feb1and2part2$datetime, origin="1970-01-01"))
dev.off()

