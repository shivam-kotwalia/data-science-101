## How to extract data in R

home_data=read.csv("C:/Users/arunesh/Downloads/home_data.csv")
home_data

names(home_data)

#Questions


## tell me names of the columns

##calculate the house price sqft under living   (sqft=1960)


##create a linear regression model house price against the living in the dataset


?predict
head(home_data)


linear_reg=lm(price~sqft_living,data=home_data)
linear_reg
predict(linear_reg,newdata = data.frame(sqft_living=c(1960)))

predict(linear_reg,newdata = data.frame(sqft_living=c(1960,2040,3520)))

linear_reg2=lm(price~sqft_living+floors,data=home_data)
linear_reg2

predict(linear_reg2,newdata = data.frame(sqft_living=c(2940),floors=c(3.0)))


lm(y~.,data=)  # then it takes all column except y

##now we have 

predict(linear_reg2,newdata = data.frame(sqft_living=c(2940,3450),floors=c(3.0,5.0)))

df=data.frame(sqft_living=c(2940,3450),floors=c(3.0,5.0))
df
house_price=predict(linear_reg2,newdata = df)
house_price
house_price[[2]]
class(house_price)





## Multi-variate analysis -- in which we try to predict 2 Ys instead of 1


##Dindrogram(Hierarichal)

require(datasets)
data("USArrests")
datasets
USArrests
USA=na.omit(USArrests)
USA

?USArrests

d=dist(USA,method = "euclidean")
d

fit1=hclust(d,method = "ward.D")# its a method of plotting
fit1
plot(fit1)
?hclust

fit2=hclust(d,method = "ward.D2")
plot(fit2)

fit3=hclust(d,method = "centroid")
plot(fit3)


# K Means Clustering

iris
?iris

install.packages("ggplot2",dep=TRUE)


library(ggplot2)
ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))+geom_point()


iris_cluster=kmeans(iris[,3:4],3,nstart=20)
iris_cluster
iris_cluster$size

library(cluster)
clusplot(iris,iris_cluster$cluster,color = TRUE,shade = TRUE,labels=TRUE,lines=0)

set.seed(20)








