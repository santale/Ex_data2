NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI1<-subset(NEI,fips == "24510" & type=="ON-ROAD")
NEI2<-subset(NEI,fips == "06037" & type=="ON-ROAD")
em6a<-aggregate(Emissions ~ year, NEI1, sum)
em6b<-aggregate(Emissions ~ year, NEI2, sum)
em6a$city<-"Baltimore"
em6b$city<-"Los Angeles"
em6<-rbind(em6a,em6b)
png(file="plot6.png", width=480, height=480)
ggplot(em6, aes(x=year, y=Emissions, fill=city)) +
geom_bar(stat="identity") +facet_grid(city ~. )+
scale_x_continuous(breaks=c(1999,2002,2005,2008))
dev.off()