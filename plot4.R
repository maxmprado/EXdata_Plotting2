library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


combr <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalr <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalcomb <- (combr & coalr)
combustionSCC <- SCC[coalcomb,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480,units="px",bg="transparent")

ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total Emission")) + 
  labs(title=expression("PM 2.5 Coal Combustion"))


dev.off()
