file <- read.table("./household.txt", sep = ";", header = TRUE)
sub <- subset(file, file$Date=="1/2/2007" | file$Date =="2/2/2007")
sub$Time <- strptime(sub$Time, format = "%H:%M:%S")
sub$Date <- as.Date(sub$Date, format="%d/%m/%Y")
sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub[1:1440,"Time"] <- format(sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub[1441:2880,"Time"] <- format(sub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(sub$Time, sub$Sub_metering_1, ylab = "Energy sub Metering", type = "n", xlab = "")
with(sub,lines(Time,Sub_metering_1, col = "black"))
with(sub,lines(Time,Sub_metering_3, col = "blue"))
with(sub,lines(Time,Sub_metering_2, col = "red"))
legend("topright", col = c("blue", "red", "black"), legend = c("sub metering 3", "sub metering 2", "sub metering 1"), lty = 1)