install.packages("MASS")
library(MASS)
birthwt
View(birthwt)
summary(birthwt)
table(birthwt)
?birthwt
unique(birthwt$low)
unique(birthwt$bwt)
table(birthwt$bwt)
nrow(birthwt)
ncol(birthwt)
hist(birthwt$bwt)
 dim(birthwt)
 cols=c("low","race","smoke","ht","ui")
  birthwt[cols]
  
  birthwt[cols]=lapply(birthwt[cols],as.factor)
  birthwt[cols]=sapply(birthwt[cols],as.factor)
  birthwt[cols]
train=sample(1:nrow(birthwt),.75*nrow(birthwt))
install.packages("rpart")  
library(rpart)  
birthwtTree=rpart(low~.-bwt,data = birthwt[train,],method = "class")  
  
birthwtTree  
summary(birthwtTree)
  
 plot(birthwtTree) 
text(birthwtTree)  
text(birthwtTree,pretty = 0)  
birthwtpred=predict(birthwtTree,birthwt[-train,],type="class")  
table(birthwtpred,birthwt[-train,"low"])  ## it gives result in comaprison to actualvs predict.

?pretty
?type


##Random Forest-they make multiple decision and then do voting.By using this it gives result in the form of probability.

install.packages("randomForest")
library(randomForest)
library(MASS)
?Boston
Boston
View(Boston)
nrow(Boston)
names(Boston)

train=sample(1:nrow(Boston),0.8*nrow(Boston))
model=randomForest(medv~.,data=Boston,subset=train) ## it goes in boston and take that rows which are in train only

model
plot(model) ## when we take less no of trees error increases.
?randomForest
  
  
  install.packages("DataExplorer") ##it makes beutiful graphs for u.
library(DataExplorer)
  

  
  
  
  
  
 choco=read.csv("c:/Users/arunesh/Downloads/flavors_of_cacao.csv",header = T,stringsAsFactors = F) 
choco  
names(choco)  
View(choco)  
choco$cocoa.percent=  as.numeric(gsub("%","",choco$Cocoa.Percent))
View(choco)  
choco$Review.Date=as.factor(choco$Review.Date)  
library(DataExplorer)  
plot_str(choco)  ##it gives more sytematic plotting

PlotMissing(choco) ## it gives missing values in data set

plot_histogram(choco) ##it makes histogram for all the columns due to data explorer library

##density graph is continous in nature where histogram is in categoricalin nature.

plot_correlation(choco,type = "continuous","Review.Date") ## it gives correlation graph b/w 0 and 1 and rmove reviewdate.

plot_bar(choco)## it gives bar chart

create_report(choco)


  
  
  
  
  
  
  
  
  
  
  