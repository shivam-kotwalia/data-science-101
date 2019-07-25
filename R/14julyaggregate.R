names_data=read.csv("C:/Users/arunesh/Downloads/NationalNames.csv",header = T,na.strings = NULL)
View(names_data)
summary(names_data$Name)

table(names_data$Name)        

summary(names_data$Name)     
install.packages("ggvis")        
library(ggvis)  
francis=subset(names_data,Name=="Francis"&Gender=="F")##now we work on francis who r female only
francis

nrow(francis)
francis%>% ## it means it start by the name francis
select(Name,Year,Count)%>%  

Name
attach(francis)  ##now all the columns names are variable for us.it works on current database
Name
plot(francis$Year,francis$Count)## it gives in which year most common
plot(Year,Count)
detach(francis) ##it means when we dont want to use.
hazel=subset(names_data,Name=="Hazel"&Gender=="F")
attach(hazel)
plot(Year,Count)

year_1900=subset(names_data,Gender=="M"&Year==1900)
head(year_1900)
max(year_1900$Count)
min(year_1900$Count)
tail(year_1900)
summary(year_1900)
year_1900[year_1900$Name,]
year_1950=subset(names_data,Gender=="M"&Year>=1900 & Year<1950)
year_1950
summary(year_1950)
head(year_1950)

year1950_group_by_name=aggregate(year_1950$Count,by=list(year_1950$Name),FUN=sum) ## aggregate uses for grouping
head(year1950_group_by_name)
max(year1950_group_by_name$x)
year1950_group_by_name[year1950_group_by_name$x==2224253,] ## It gives the maximum no of john comes .

year_1980=subset(names_data,Gender=="F"&Year>=1980)
year_1980_groupby=aggregate(year_1980$Count,by=list(year_1980$Name),FUN=sum)
head(year_1980_groupby)
year_1980_groupby[year_1980_groupby$x==max(year_1980_groupby$x),]## It gives the girl name which have max count.



##how many people took birth in each year?