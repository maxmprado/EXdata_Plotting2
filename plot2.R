NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ssNEI  <- NEI[NEI$fips=="24510", ]


aggTotalYear <- aggregate(Emissions ~ year, ssNEI, sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")
barplot(height=aggTotalYear$Emissions, 
        names.arg=aggTotalYear$year, xlab="years",
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
