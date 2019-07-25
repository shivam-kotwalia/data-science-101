choco_data=read.csv("c:/Users/Lenovbo/Downloads/flavors_of_cacao.csv",header = T)
View(choco_data)
names(choco_data)
nrow(choco_data)
ncol(choco_data)
summary(choco_data)
choco_data$Rating
table(choco_data$Rating)
anyNA(choco_data)
str(choco_data)
install.packages("caret")
library(caret)
install.packages("e1071")
library(e1071)
set.seed(3033)
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
train_control=trainControl(method="repeatedcv",number=10,repeats = 3)
train_control
svm_linear=train(Rating~.,data=training,method="svmLinear",trControl=train_control,preProcess=c("center","scale"),tuneLength=10)
result=predict(svm_linear,newdata = testing)
result
missed=mean(result!=testing$Rating)
missed
1-missed




