choco_data=read.csv("c:/Users/arunesh/Downloads/flavors_of_cacao.csv",header = T,stringsAsFactors = F)
View(choco_data)
summary(choco_data)
library(tree)
sapply(choco_data, function(x) length(unique(x)))
choco_data$Cocoa.Percent = as.numeric(gsub("%","", choco_data$Cocoa.Percent))
choco_data$Review.Date = as.factor(choco_data$Review.Date)
anyNA(choco_data)
table(choco_data$Rating)
table(choco_data$Review.Date)
class(choco_data$Review.Date)
model=tree(Rating~.,data = choco_data)



choco_new = subset(choco_data,select = c(1,2,5,7,8))
View(choco_new)
train = sample(1:nrow(choco_new), 0.8*nrow(choco_new))
training = choco_new[train,]
testing = choco_new[-train,]
library(tree)
model = tree(Rating~., data = training)

model
plot(model)
text(model, pretty = 0)
result = predict(model,newdata = testing)
result