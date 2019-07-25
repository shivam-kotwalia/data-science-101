titanic_data=read.csv("c:/Users/arunesh/Downloads/titanic.csv",header = T,stringsAsFactors = F)
titanic_data
View(titanic_data)
anyNA(titanic_data)
head(titanic_data)
nrow(titanic_data)
names(titanic_data)
sapply(titanic_data,function(x) sum(is.na(x)))
sapply(titanic_data,function(x) length(unique(x)))
library(Amelia)




training.data=subset(titanic_data,select = c(2,3,5,6,7,8,10,12))
mean(training.data$Age,na.rm = T)
training.data$Age[is.na(training.data$Age)]
training.data$Age[is.na(training.data$Age)]=mean(training.data$Age,na.rm = T)
is.na(training.data)
training.data=training.data[!is.na(training.data$Embarked),]
rownames(training.data)=NULL
library(DataExplorer)
plot_str(training.data)
PlotMissing(training.data)
plot_histogram(training.data)
training.data$Survived=as.factor(training.data$Survived) 
plot_correlation(training.data,type = "continuous","Survived")
plot_bar(training.data)
create_report(training.data)
