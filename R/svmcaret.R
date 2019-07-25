### Support Vector Machine(SVM)-Its a classfication regression
### make sure that 2 alternate line are farther than eachother so that we make actual line in between them.It means your data is overfit.
##make hyperplane by nearest data points and always data is linearly separable

x=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
y=c(3,4,5,4,8,10,10,11,14,20,23,24,32,34,35,37,42,48,53,60)
length(x)
length(y)

train=data.frame(x,y)
train
plot(train)

lr_model=lm(y~x,data = train) ## using linear regression
lr_model
abline(lr_model)  ## it gives regression line for x and y



install.packages("e1071")  ## it is used for using SVM & caret is also used

library("e1071")

model_svm=svm(y~x,train)
prediction_svm=predict(model_svm,train)

points(train$x,prediction_svm,col="blue",pch=4)  ## blue dots are svm plot.

## Next Problem

heart_data=read.csv("c:/Users/arunesh/Downloads/heart_tidy.csv",header = FALSE)  ## by using header=false we are assigning somerandom names to columns
heart_data
names(heart_data)
View(heart_data)
?read.csv

head(heart_data)
ncol(heart_data)
nrow(heart_data)

summary(heart_data)

is.na(heart_data)

which(is.na(heart_data))

str(heart_data) ## it gives the string values

install.packages("caret")
library("caret")

table(heart_data$V14)

set.seed(3033)
?set.seed

## datapartition only runs for caret which gives random values.

intrain=createDataPartition(y=heart_data$V14,p=0.8,list = TRUE)

intrain=createDataPartition(y=heart_data$V14,p=0.8,list = FALSE) ## it picks the random value of v14 column
intrain
?createDataPartition
class(intrain)

training=heart_data[intrain,]
training

testing=heart_data[-intrain,]
testing

length(training)
nrow(training)
nrow(testing)

dim(testing)

anyNA(heart_data) ## for checking any NA in dataset

summary(heart_data)

training$V14
training$V14=factor(training$V14)

train_control=trainControl(method="repeatedcv",number=10,repeats = 3) ##it tells number of times 10 and repeat 3 times

train_control


## hyper parameter tuning

## SVM can handle non linear data also and disadvantage is it is very sensitive to noises

svm_linear=train(V14~.,data=training,method="svmLinear",trControl=train_control,preProcess=c("center","scale"),tuneLength=10)
svm_linear


result=predict(svm_linear,newdata = testing)
result
 
missed=mean(result!=testing$V14)
missed
1-missed


?tuneLength
?matrix




