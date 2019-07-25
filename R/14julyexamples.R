cars_data=read.csv("C:/Users/arunesh/Desktop/cardata.csv",header = F,na.strings = NULL)
colnames(cars_data) = c("BuyingPrice", "Maintenance", "NumDoors", "NumPersons", "BootSpace", "Safety", "Condition")
colnames(cars_data)<-c("buying","maint","doors","persons","lug_boot","saftey","class") ## Both Names and colnames are same 
str(cars_data)
View(cars_data)
summary(cars_data)
table(cars_data)
head(cars_data)
names(cars_data)
nrow(cars_data)
anyNA(cars_data)
library(tree)
plot(c(1:nrow(cars_data),cars_data$Safety))
?barplot ## barplot needs vector or category
barplot(table(cars_data$Condition))
table(cars_data$Maintenance)

library(DataExplorer) ##gowith random forest because it is categorical value

## so we do all logistic,decision tree,random forest

##Decision Treee
train=sample(1:nrow(cars_data),0.8*nrow(cars_data))
training=cars_data[train,]
testing=cars_data[-train,]
model=tree(Condition~.,data = training)
model
plot(model)
text(model,pretty = 0)

result = predict(model,newdata = testing,type = "class")
result




model1=randomForest(Condition~.,data = cars_data)
model1
plot(model1)
model2=randomForest(Condition~.,data=cars_data,ntree=600,mtry=5,importance=T) ## by maximising the no oftrees we are decresing the error.

model2
?randomForest




