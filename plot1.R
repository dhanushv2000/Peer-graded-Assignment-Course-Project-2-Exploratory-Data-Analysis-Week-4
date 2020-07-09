url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

destfile1 <- "destfile.zip"

if(!file.exists(destfile1)) {
  download.file(url1,
                destfile = destfile1,
                method = "curl")
  unzip(destfile1, exdir = ".")
}
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

head(SCC)

findata <- with(NEI, aggregate(Emissions, by = list(year), sum))

png("Plot1.png",width=480,height=480)

plot(findata, type = "o", main = "Total PM2.5 Emissions", xlab = "Year", 
     ylab = "PM2.5 Emissions", pch = 19, col = "darkblue", lty = 6)

dev.off()