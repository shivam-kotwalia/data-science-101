adult_data=read.csv("c:/Users/arunesh/Downloads/adult.csv",header = T,na.strings = c(""))
adult_data
names(adult_data)
nrow(adult_data)
ncol(adult_data)
View(adult_data)
unique(adult_data$WORKCLASS)
unique(adult_data$SEX)
summary(adult_data$SEX)
table(adult_data$SEX)
table(adult_data$WORKCLASS)
summary(adult_data$WORKCLASS)
table(adult_data$NATIVECOUNTRY)

table(adult_data$ABOVE50K) ##Always remember classed shuold not be biased or make it to unbiased.Either by down sampling or up sampling.

input_zero=adult_data[which(adult_data$ABOVE50K==0),]  
input_zero
input_ones=adult_data[which(adult_data$ABOVE50K==1),]
input_ones
##now we index all the rows which have these condition and and check on all the columns



?logit
nrow(input_zero)
nrow(input_ones)

?set.seed 

set.seed(47)  # it sets the randomness

?sample

input_ones_training_rows=sample(1:nrow(input_ones),.8*nrow(input_ones))
input_zero_training_rows=sample(1:nrow(input_zero),.8*nrow(input_ones)) #here also we match with ones so that both match by no of rows so we take input_ones

input_ones_training_rows
input_zero_training_rows

length(input_ones_training_rows)
length(input_zero_training_rows)

training_ones=input_ones[input_ones_training_rows,]
training_zeros=input_zero[input_zero_training_rows,]
nrow(training_ones)

nrow(training_zeros)

?rbind
training_data=rbind(training_ones,training_zeros)  ## by this now we combine all the data 
training_data

nrow(training_data)

test_ones=input_ones[-input_ones_training_rows,]  ## by using -sign we exclude those data which are in training data

test_zeros=input_zero[-input_zero_training_rows,]

test_data=rbind(test_ones,test_zeros)

nrow(test_data)
nrow(training_data)

factor_vars <- c ("WORKCLASS", "EDUCATION", "MARITALSTATUS", "OCCUPATION", "RELATIONSHIP", "RACE", "SEX", "NATIVECOUNTRY")
continuous_vars <- c("AGE", "FNLWGT","EDUCATIONNUM", "HOURSPERWEEK", "CAPITALGAIN", "CAPITALLOSS")

min(adult_data$AGE)

max(adult_data$AGE)

?min
mean(adult_data$AGE)
summary(adult_data$AGE,mean)
summary(adult_data$AGE)

## now u have to normalize your data by dividing all with maximum value(called min max scalar nrmalization technique)

##most appropriate way is to make a bin by making category.

##package smbinning is used for this

install.packages("smbinning") ## covert it into recursive partion

library("smbinning")

## categorical value


iv_df <- data.frame(VARS=c(factor_vars, continuous_vars), IV=numeric(14))  # init for IV results

# Catagorial Values
for(factor_var in factor_vars){
  smb <- smbinning.factor(training_data, y="ABOVE50K", x=factor_var)  # WOE table
  if(class(smb) != "character"){ # check if some error occured
    iv_df[iv_df$VARS == factor_var, "IV"] <- smb$iv
  }
}



# compute IV for continuous vars
for(continuous_var in continuous_vars){
  smb <- smbinning(training_data, y="ABOVE50K", x=continuous_var)  # WOE table
  if(class(smb) != "character"){  # any error while calculating scores.
    iv_df[iv_df$VARS == continuous_var, "IV"] <- smb$iv
  }
}


















?sort










iv_df
iv_df=iv_df[order(-iv_df$IV),]  ## for sorting
iv_df


logitMod = glm(ABOVE50K ~ RELATIONSHIP + AGE + CAPITALGAIN + OCCUPATION + EDUCATIONNUM,  data=training_data, family=binomial(link="logit"))
predicted <- plogis(predict(logitMod, test_data))  # predicted scores

predicted

result=ifelse(predicted>0.5,1,0)
result

missed=mean(result!=test_data$ABOVE50K)
missed
1-missed
(1-missed)*100


## always calculate accuracy on test data it will give u good result.














x=c(adult_data$NATIVECOUNTRY)
x
?replace

adult_data$NATIVECOUNTRY=ifelse(adult_data$NATIVECOUNTRY=="?",NA,adult_data$NATIVECOUNTRY)
adult_data$NATIVECOUNTRY
sapply(adult_data,function(x) sum(is.na(x)))

adult_data$NATIVECOUNTRY = gsub("?",NA,adult_data$NATIVECOUNTRY, fixed = TRUE)
adult_data$NATIVECOUNTRY
?gsub
sapply(adult_data,function(x) sum(is.na(x)))
length(is.na(adult_data$NATIVECOUNTRY))


sapply(adult_data,function(x) length(unique(x)))
install.packages("Amelia")
library("Amelia")

missmap(adult_data)

training.data=subset(adult_data,select = c(2,4,5,7,9,11,12,13,14,15))
training.data
names(training.data)

training.data=training.data[!is.na(training.data$NATIVECOUNTRY),]
training.data
rownames(training.data)=NULL
training.data
nrow(training.data)
ncol(training.data)


train.data=training.data[1:25582,]
train.data
test.data=training.data[25582:31978,]
test.data

model=glm(ABOVE50K~., family = binomial(link = "logit"),data=train.data)
model

summary(model)


result=predict(model,newdata = test.data,type = "response")
result
result=ifelse(result>0.5,1,0)
result
missed=mean(result != test.data$ABOVE50K)
missed
1-missed
(1-missed)*100

?gsub


