
###Plot 2 - 

#Set a variable withe the path of the file to read. We assume the file is in the working directory
pathToFile <- "household_power_consumption.txt" 
e <- read.table(file=pathToFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )

#Because we know the format of the date file is ease to just subset the dataframe (e)
#using the two days that are required to do the exploration
e2days <- subset(e,Date=="1/2/2007" | Date=="2/2/2007")
#Adding a new column to the dataframe with the date and the time, and change the result to a Date time. 
#this will be usufull for the representation
e2days <- cbind(strptime(paste(e2days$Date,e2days$Time), "%d/%m/%Y %H:%M:%S"),e2days)
#Change the name of the calculated colum to datetime
colnames(e2days)[1] <- "datetime"
#Because we required the names of the days to be in english we change the locale

#UX-Like: Sys.setlocale("LC_TIME", "en_US.UTF-8")
Sys.setlocale("LC_TIME", "English")
#set the graphic device to print in a png file
png(filename = "plot2.png", width = 480, height = 480)
#get the picture with the rigth formats and labels
plot(Global_active_power ~ datetime , e2days, type="l", xlab="" , ylab="Global Active Power (kilowatts)", cex.axis=0.75,cex.lab=0.75)
#desactivate the device one the image has been printed. The file is printed in the workspace
dev.off()
