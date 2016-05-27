
###Plot 1 - Histogram of Global_active_power for the days 1/2/2007" | Date=="2/2/2007

#Set a variable withe the path of the file to read. We assume the file is in the working directory
pathToFile <- "household_power_consumption.txt" 
e <- read.table(file=pathToFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )
#Because we know the format of the date file is ease to just subset the dataframe (e)
#using the two days that are required to do the exploration
e2days <- subset(e,Date=="1/2/2007" | Date=="2/2/2007")

#set the graphic device to print in a png file
png(filename = "plot1.png", width = 480, height = 480)
#get the histogram, setting the rigth color, title and axis fonts
hist(e2days$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",cex.axis=0.75, cex.lab=0.75)
#desactivate the device one the image has been printed. The file is printed in the workspace
dev.off()

