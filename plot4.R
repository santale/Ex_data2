NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC1<-SCC[grepl("Coal", SCC$EI.Sector   ),]  # SCC1<-subset(SCC,grepl("Comb", EI.Sector))
NEI1<-NEI[(NEI$SCC %in% SCC1$SCC), ] # NEI1<-subset(NEI,SCC %in% SCC1$SCC)
em4<-aggregate(Emissions ~ year,NEI1,sum)
png(file="plot4.png", width=480, height=480)
ggplot(data=em4, aes(x=year, y=Emissions)) + 
geom_line() + geom_point()+
scale_x_continuous(breaks=c(1999,2002,2005,2008))+
ggtitle("Emissions from coal combustion-related sources")
dev.off()