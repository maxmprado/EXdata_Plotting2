library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ssNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggTotalYear <- aggregate(Emissions ~ year, ssNEI, sum)



png("plot5.png", width=840, height=480)
ggplot(aggTotalYear, aes(factor(year), Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions motor vehicle ON-ROAD in Baltimore')

dev.off()
