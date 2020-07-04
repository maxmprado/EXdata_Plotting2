library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ssNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggTotal <- aggregate(Emissions ~ year + fips, ssNEI, sum)
aggTotal$fips[aggTotal$fips=="24510"] <- "Baltimore, MD"
aggTotal$fips[aggTotal$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480,units="px",bg="transparent")
ggplot(aggTotal, aes(factor(year), Emissions)) + 
  facet_grid(. ~ fips) + 
  geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle ON-ROAD  Baltimore  vs Los Angeles')

dev.off()
