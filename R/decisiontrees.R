                                 ## Decision Trees

##It is just like h cluster.It is supervised type of learning.It takes homogeneity points in single count and makedecision according that.It can act as classifier and regressor.
## Root node represents the entire population or sample or data points and further divided into homogeneous sets and then split nodes into two or more subnodes.Decision nodes are those nodes or subnodes which are further divided into further subnodes.Terminalnodes are those nodes that wont split further.
##Branch or subtree is a subsection of entire tree.
##nodes which are divided into further subnodes is called parent node of those subnodes whereas as subnodes are child of parent node.

##prunning of trees is helpful for not overfitting of data.it means it removes which do not match the data.
##most important is one which is in root node.

##parametric data- in which there is no effect on equation when we change on data.
## disadvanatge-overfitting is more,continous variable handling is not good
## cart(classification and regression tree)-this uses ginni score  method to split .Ginni score always does binary split.Higher the ginni value higher is homogeneity and higher the accuracy of model.Ginni score always do categical split i.e in 0 or 1.


## to calculate gini for subnode the formula is-sum of square of prob. of success and failure
##to calculate ginni score for splitting we use weighted gini score of each node of that split

## CHAID(chi square automatic interaction detector)
##chi sqaure-it is a algorithm to find out statistical significance between the differences b/w subnodes and parent node.
##we measure it by sum of square of standardised difference b/w observed and expected frequencies of target variable
##it can perform two or more splits.higher the value of chi square the higher the significance of difeerences b/w subnode and parent node.
##steps
##calaclute for individual node by calculating derivative for success and failure both
##calculate chi square for split by using sum of square of all chii square of success and failure of each node of split.

##Are tree based models better than linear models?*
  
 ## "If I can use logistic regression for classification problems and linear regression for regression problems, why is there a need to use trees"? Many of us have this question. And, this is a valid one too.

##Actually, you can use any algorithm. It is dependent on the type of problem you are solving. Let's look at some key factors which will help you to decide which algorithm to use:
  
##  If the relationship between dependent & independent variable is well approximated by a linear model, linear regression will outperform tree based model.
##If there is a high non-linearity & complex relationship between dependent & independent variables, a tree model will outperform a classical regression method.
##If you need to build a model which is easy to explain to people, a decision tree model will always do better than a linear model. Decision tree models are even simpler to interpret than linear regression!




salary=sample(200000:300000,1000)
salary

experience=sample(2:20,1000,replace = TRUE) ## replace never uses same value again so we use true means it repeat again.
experience

gender=sample(c("M","F"),1000,replace=T)
gender


data=data.frame(salary,experience,gender)
data
View(data)
summary(data)
table(data)


##Decision trees

install.packages("tree")
library("tree")

model=tree(salary~experience+gender,data=data)
summary(model)

## Decision tree classification

data("iris")
summary(iris)



model=tree(Species~.,data = iris)
summary(model)
plot(model)
text(model) ## it gives text in tree

iris$pred=predict(model,newdata = iris)
View(iris)

iris$pred=predict(model,newdata = iris,type = "class") ## it tell u about class of iris i.e it is in which category.

View(iris)

##by default it uses gini score











