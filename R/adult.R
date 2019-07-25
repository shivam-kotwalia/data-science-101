adult.data=read.csv("c:/Users/arunesh/Downloads/adult.csv",header = T,na.strings = c(""))
adult.data
head(adult.data)
View(adult.data)
names(adult.data)
rownames(adult.data)
nrow(adult.data)
nrow(adult.data)
ncol(adult.data)



sapply(adult.data, function(x) sum(is.na(x)))
sapply(adult.data, function(x) length(unique(x)))

install.packages("Amelia")
library("Amelia")
missmap(adult.data)
length(adult.data[adult.data$NATIVECOUNTRY == "?",])

training.data=subset(adult.data,select = c(1,2,4,7,9,10,11,12,13,14,15))
training.data
ncol(training.data)
names(training.data)

nrow(training.data)
train.data=training.data[1:26050,]
train.data
test.data=training.data[26050:32561,]
test.data


model=glm(ABOVE50K~., family = binomial(link = "logit"),data=train.data)
model


summary(train.data)
summary(model)

result=predict(model,newdata = test.data,type = "response")
result

result=ifelse(result>0.5,1,0)
result

missed=mean(result!=test.data$ABOVE50K)
missed
1-missed
