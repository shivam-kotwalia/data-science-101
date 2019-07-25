titanic_data=read.csv("c:/Users/arunesh/Downloads/titanic.csv",header = T,na.strings = c(""))
titanic_data
head(titanic_data)
View(titanic_data)
names(titanic_data)
nrow(titanic_data)
ncol(titanic_data)


##now find the no. of NA Available in datasets
sapply(titanic_data,function(x) sum(is.na(x)))  ## cabins have maximum na so we think about it

sapply(titanic_data,function(x) length(unique(x)))  ## unique tells the no of unique values in each column

#these are EDA(exploratory data analysis) techniques
unique(titanic_data$Sex)

install.packages("Amelia")  # Amelia tells about missing values
library("Amelia")

missmap(titanic_data)  #It Tells about missing Values graph and it sorted according to no of NA

training.data=subset(titanic_data,select = c(2,3,5,6,7,8,10,12))
names(training.data)

mean(training.data$Age,na.rm = T)
training.data$Age[is.na(training.data$Age)]

training.data$Age[is.na(training.data$Age)]=mean(training.data$Age,na.rm = T)
training.data$Age
is.na(training.data)

contrasts(training.data$Sex) ## R automatically assign binary values through this command(categorial value)

contrasts(training.data$Embarked)

training.data=training.data[!is.na(training.data$Embarked),] ## It means the rows which have dont have NA values copy it to another training data and need all columns
training.data
rownames(training.data)
head(training.data)
rownames(training.data)=NULL
training.data


nrow(training.data)

train.data=training.data[1:800,]
test.data=training.data[801:889,]


model=glm(Survived~., family = binomial(link = "logit"),data=train.data) ## now model the training data

summary(train.data)
summary(model)



result=predict(model,newdata = test.data,type = "response") ## It tell the prediction of survival means probablility of survival
result
## Response always tells the numerical value 

result=ifelse(result>0.5,1,0)
result

## now test the accuracy with testing model

missed=mean(result != test.data$Survived)
missed
1-missed

## it means 84% accuracy we have to predict with test model.









