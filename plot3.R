library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(SCC)

ssNEI  <- NEI[NEI$fips=="24510", ]


aggTotals <- aggregate(Emissions ~ year, ssNEI,sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggplot(ssNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type) + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
  labs(title=expression("PM 2.5 Emissions, Baltimore by Type"))


dev.off()
