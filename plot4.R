# Read in all the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Data only needed from February 1st and 2nd
sdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create a new variable called Datetime
sdata$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                         sdata$Date,sdata$Time)

#Plot the Graphs
png("plot4.png")
par(mfrow = c(2,2))

plot(sdata$datetime, sdata$Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power", xlab = "")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin="1970-01-01"))

plot(sdata$datetime, sdata$Voltage, type="l", xaxt = "n",
     ylab = "Voltage", xlab = "datetime")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin="1970-01-01"))

plot(sdata$datetime, sdata$Sub_metering_1, type="l", xaxt = "n",
     ylab = "Energy sub metering", xlab = "")
lines(sdata$datetime, sdata$Sub_metering_2, col = "red")
lines(sdata$datetime, sdata$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin="1970-01-01"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(sdata$datetime, sdata$Global_reactive_power, type="l", xaxt = "n",
     ylab = "Global_reactive_power", xlab = "datetime")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin="1970-01-01"))
dev.off()