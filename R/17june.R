youtube- Learn R

parking_func=function(salary){
  if (salary>=0 & salary<10){
    parking_fee=500
  }
  else if (salary>=10 & salary<15){
    parking_fee=800
  }
  else if(salary>=15 & salary<20){
    parking_fee=1000
  }
  else{
    parking_fee=2000
  }
  return(parking_fee)
}

parking_func=function (30)
  
  
  
  
shopping_func=function(money){
  if (money>=1000 & money<2500){
    discount= (money-(money*5/100))
  }
  else if(money>=2500 & money <5000){
    discount=(money-(money*10/100))
  }
  else if(money>=5000){
    discount=(money-(money*20/100))
  }
  else{
    discount=0
  }
  return(discount)
}
shopping_func(6000)
shopping_func(500)
shopping_func=function(2000)

  
  
  
  
  
  
shopping_func(6000)
shopping_func(6000)

shopping_func(6000)
shopping_func(500)
shopping_func(500)

discount_func=function(money){
  if (money>=1000 & money<2500){
    discount= 5
    msg=paste(c("Eligible for",discount,"%"),collapse = " ")
  }
  else if(money>=2500 & money <5000){
    discount=10
    msg=paste(c("Eligible for",discount,"%"),collapse = " ")
  }
  else if(money>=5000){
    discount=20
    msg=paste(c("Eligible for",discount,"%"),collapse = " ")
  }
  else{
    discount=0
    msg=paste(c("Eligible for",discount,"%"),collapse = " ")
  }
  return(msg)
}

shopping_func(6000)
discount_func(6000)


discount_func=function(money){
  if (money>=1000 & money<2500){
    discount= 5
    final_price =money-(money*discount/100)
    msg=paste(c("Eligible for",discount,"%" and final price is",final_price ),collapse = " ")
  }
    
  else if(money>=2500 & money <5000){
discount=10
    final_price =money-(money*discount/100)
   msg=paste(c("Eligible for",discount,"%" and final price is",final_price ),collapse = " ")
  }
    
  else if(money>=5000){
    discount=20
    final_price =money-(money*discount/100)
    msg=paste(c("Eligible for",discount,"%" and final price is",final_price ),collapse = " ")
  }
  else
    discount=0
    msg=paste(c("Eligible for",discount,"%" and final price is",final_price ),collapse = " ")
  
  return(msg)
}

discount_func(2000)



### Linear Regression in R


## Regression will always give you some value

?cars
?mtcars

head(cars)
class(cars)

cars$speed
cars$dist

names(cars)


rm(list=ls())  # for removing all environment


cars

# scatter plot

scatter.smooth(x=cars$speed,y=cars$dist)


#box plot - it means it lies b/w 25 to 75 percent

par(mfrow=c(1,2)) #??
boxplot(cars$speed)
boxplot(cars$dist)

cor(cars$speed,cars$dist)

#lm (y~x,data=data source)

linearmodel = lm(dist~speed,data=cars) 

coefficients:
  
  
summary(linearmodel)  

testdata=sample(1:nrow(cars),0.2*nrow(cars))
testdata

testdata=cars[testdata,]
testdata
testdata$speed
predict(linearmodel,testdata$speed)

?predict

predict(linearmodel,testdata)

mean(testdata$speed)

















