choco_data=read.csv("c:/Users/arunesh/Downloads/flavors_of_cacao.csv",header = T)
choco_data
View(choco_data)
names(choco_data)
nrow(choco_data)
head(choco_data)
summary(choco_data)
is.na(choco_data)
which(is.na(choco_data))
choco_data$Cocoa.Percent = as.numeric(gsub("%","", choco_data$Cocoa.Percent))
choco_data$Review.Date = as.factor(choco_data$Review.Date)

str(choco_data)
library(caret)
table(choco_data$Rating)
intrain=createDataPartition(y=choco_data$Rating,p=0.8,list = F)
intrain
class(intrain)
training=choco_data[intrain,]
training
testing=choco_data[-intrain,]
testing
dim(testing)
dim(training)
training$Rating=factor(training$Rating)
training$Rating
train_control=trainControl(method="repeatedcv",number=10,repeats = 3)
train_control


svm_linear=train(Rating~.,data=training,method="svmLinear",trControl=train_control,preProcess=c("center","scale"),tuneLength=10)
svm_linear

result=predict(svm_linear,newdata = testing)
result
missed=mean(result!=testing$Rating)
missed
1-missed







