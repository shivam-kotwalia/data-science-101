# Lists- Key value
x=list(a=1,b="abc")
x
x[[b]]
x[["b"]]
j=list(name="shaivam",age=25,R=T)
j$name
class(j$name)
class
j$last_name="Gupta"
$last_name
$age

a=list(1:10,20:22)
a
lapply(a, median)
lapply(a, sum)
sapply(a,sum)#for systematic apply

##
Dataframes
people=c("mahesh","ramesh","suresh")
age=c(23,24,25)
d=data.frame(people,age,stringsAsFactors = FALSE)
d
class(d)
d[[1]]
d[[2]]
d$people
d$age

names(d)

d[2:3,] #it shows 2 to 3 rows 

d[,,]

d[2,1:2]

d[2,1]

class(d[2,2])


d[d$age>24,]
d[d$age>24,1]


rbind(d,list("rakesh",26))
d=rbind(d,list("rakesh",26))
d
d$address=c("A","B","C","D")
d

#column names are keys so we apply $ function to column only

cbind(d,list(ln=c("Gupta","Sharma","Pandey","Sharma")))

x

#Looping and control statements

##control statements -if,if-else,for,while,repeat,break,next,stop,warning

# If Statement

x=20
if(x<10){
  print("inside if")
  x=x+100
}

x=5
if(x>4){
  print("Inside if")
  x=x*2
}

x

# If-else statement


salary=15
if(salary>15){
  pk_fee=500
}else{
  pk_fee=200
}
pk_fee

#for loop

for (i in (1:10)){
  print(i)
  
}



d=c("R","Python",2.14,3)
d
for(i in d){
  print i
}


cars=c("maruti","suzuki","tata","hyundai","audi")
cars
for (i in cars) {
  print(paste(i,"car"))
  
  
}


num=c(5,10,2,6,9)
num
for(i in num){
  print(i*i)
}

for(i in num){
  if(i==2){
    break
  }
  print(i)
}


#While Loop - it works infinite

i=3
while (i<=7) {
  i=i+1
  print(i)
  
}




#Repeat condition

a=5
a
repeat{
  print(a)
  a=a+1
  if(a>3){
    break
  }
}


a=7
a
repeat{
  print(a)
  a=a+1
  if(a>13){
    break
  }
}

x=c(1:20)
x
for(i in x){
  if(i%%5==0){
  print(i*i)
  }else{
    print(i)
  }
  
  if(i==18){
    break
  }
}



##function- forallocation of any code whenever we call it,it execute


my_print_func=function(){
  print("Hello Class")
}

my_print_func()


my_addition_func=function(a,b){
  c=a+b
  return(c)
}


my_addition_func(30,40)



my_mult_func=function(a,b){
  c=a*b
  return(c)
}


my_mult_func(6,8)


parking_fee_func=function(salary){
if(salary>=10){
  parking_fee=1000
  }else{
    parking_fee=200
    }
  return(parking_fee)
}


parking_fee_func(12)
parking_fee_func(9)

#stop- works as break but it stops with a massage

for(i in 1:10){
  if(i==5){
    stop("I breaked it beacause it was 5")
  }
  print(i)
}




parking_fee_func=function(salary){
  if (salary>20){
    parking_fee=1000
  }
else if(15<salary<20){
  parking_fee=800
}
else if(10<salary<15){
  parking_fee=500
}
else if(5<salary<10){
  parking_fee=300
}else{
  parking_fee=200
}
return(parking_fee)
}

  
 shopping_func(2000)   
    
    
    
    
    
    
    
    