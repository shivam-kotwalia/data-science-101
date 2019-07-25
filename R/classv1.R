abs(-54)
# for absolute value
200%/%11
# this is for quotient
200%%11
#this is for reminder
class(x)
#type of object in R
a="R is good boy"
class(a)



### Vectors
x=c(23,6,28,29,87)
x
#c is used for concatenation

x=48:87
x

length(x)
#for length of character



x*2
#for broadcasting means multiplied by all


x=c(12,78,67,876,987,34,76,989,564,89)
max(x)

min(x)

median(x)

range(x)

sort(x)

?sort

sort(x,decreasing = TRUE)

?Position


rank(x)
#it helpsin finding arbitrary value


length(x)






y=c(NA,8,12,45,NA,12,4,5,8,7,NA,NA)
sum(y,na.rm = T)
mean(y,na.rm = T)
#rm is for remove
median(y,na.rm = T)
         
is.na(y)
#is there is na

which(is.na(y))
#at which position

length(which(is.na(y)))
#no. of NA

#if-else function

ifelse(is.na(y),0,y)

y
length(y)
y[5:12]
#slicing

y[4]
#indexing



c= c(5,8,1,10,3)
sort(c)


sum(sort(c)[4:5])
#for sum of last 2 digit


seq(50,75,3)
#for sequence with gap of 3

rep(7,10)
#for repeatation

rep(c(3,9,1),4)


w=c(3,9,1)

rep(w,4)








n=c(4,7,15,53,5,50,78,38,98)

n[n>50]


subset(n,n>50)

n[n<50]


p[1:10]

ifelse(p%%3==0,"y","n")


## CHARACTERS

a="Hello Shailesh"

age="55"
class(age)
as.numeric(age)


b=c("amit","shivam","nandu","bhim","ali")
b
length(b)

nchar(b)

nchar(b)[3]

nchar(b[b=="bhim"])
#forany specific character if we dont know index for bigger list


b=="amit"


LETTERS
letters

sports=c("football","criket","hockey","basketball","voletball")
sports

my_sports=c("football","cricket","rugby")
my_sports

my_sports %in% sports
#this is for finding whether is in list or not

first_name="shailesh"
last_name="sharma"
paste(first_name,last_name)

paste(first_name,last_name,sep = "5")


x=c("apple","potato","grapes","10","blue.flower")
grep("a",x)
#in which array contain a


fruit="apple"
substr(fruit,start=2,stop=5)
#for know start and end characters

#Stringmanipulation

chartr(old = "a",new="A",fruit)
chartr(old = "a",new="B",fruit)



full_name="shailesh sharma"
strsplit(full_name,split = " ")

#String Formatting

mean_csv=1234
sprintf("The mean of this csv is %d",mean_csv)

fy=2018
sprintf("The mean for the csv is %d for the financial year %d",mean_csv,fy)











##Matrix-Its is a collection of lists
#Lists- in which one row but multiple colums

y=matrix(c(1,2,3,4),nrow = 2,ncol=2)
y


z=matrix(c(1:10),nrow=5,ncol=2)
z


?attributes

attributes(z)

t(z)
#For transpose

z[,2]

z[1,3]

mean(z[2,])


z=matrix(c(1:24),nrow = 6,ncol = 4)
z
rbind(z,apply(z,2,mean))

?apply

apply(z,2,mean)


cbind(z,apply(z,1,sum))


#Arrays
array=1:20
is.matrix(array)

array
dim(array)=c(5,4)
array

is.matrix(array)

dim(array)=c(5,2,2)
array

array[,,2]

array[3,,]
array[3,2,]















