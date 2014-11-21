NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI1<-subset(NEI,fips == "24510")
em3<-aggregate(Emissions ~ year + type,NEI1,sum)
png(file="plot3.png", width=700, height=480)
ggplot(data=em3, aes(x=year, y=Emissions, group=type, colour=type)) + geom_line() + geom_point()+facet_grid(. ~ type)+ylab(expression("Emissions in Baltimora"))
dev.off()



ggplot(em3, aes(x=factor(year), y=Emissions, fill=type))+geom_bar(stat="identity", position=position_dodge()) 