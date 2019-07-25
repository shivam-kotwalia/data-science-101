
choco_data=read.csv("c:/Users/Lenovbo/Downloads/flavors_of_cacao.csv",header = T,stringsAsFactors = F) 
choco_data
View(choco_data)
names(choco_data)
nrow(choco_data)
sapply(choco_data, function(x) length(unique(x)))
choco_data$Cocoa.Percent = as.numeric(gsub("%","", choco_data$Cocoa.Percent))
choco_data$Review.Date = as.factor(choco_data$Review.Date)
anyNA(choco_data)
table(choco_data$Rating)
train = sample(1:nrow(choco_data), 0.8*nrow(choco_data))
train
install.packages("randomForest")
library(randomForest)

choco_data$CompanyÂ...Maker.if.known.=as.factor(choco_data$CompanyÂ...Maker.if.known.)
choco_data$Specific.Bean.Origin.or.Bar.Name=as.factor(choco_data$Specific.Bean.Origin.or.Bar.Name)
choco_data$Company.Location=as.factor(choco_data$Company.Location)
choco_data$Bean.Type=as.factor(choco_data$Company.Location)
choco_data$Broad.Bean.Origin=as.factor(choco_data$Broad.Bean.Origin)






model =randomForest(Rating~.,data=choco_data,subset=train)
str(choco_data)


