#filename
f = "./Data/household_power_consumption.txt"

#read the data in
df = read.table(f, header=TRUE, sep=";", col.names=c("date", "time", "globalActivePower", "globalReactivePower", 
      "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3"), colClasses=c("character",
      "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

#Change the class of the date row to dates, and filters out dates that we don't need
df$date = as.Date(df$date, format="%d/%m/%Y")
df = df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]

#graph
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")

plot(df$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")

axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))

dev.off()