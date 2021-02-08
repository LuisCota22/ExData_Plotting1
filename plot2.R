file <- read.table("./household.txt", sep = ";", header = TRUE)
sub <- subset(file, file$Date=="1/2/2007" | file$Date =="2/2/2007")
sub$Time <- strptime(sub$Time, format = "%H:%M:%S")
sub$Date <- as.Date(sub$Date, format="%d/%m/%Y")
sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub[1:1440,"Time"] <- format(sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub[1441:2880,"Time"] <- format(sub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(sub$Time, sub$Global_active_power, type = "s", ylab = "Global Active Power(kilowatts", xlab = "")