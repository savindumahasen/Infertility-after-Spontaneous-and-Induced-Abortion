## attach the dataset
attach(infert)



## Normality testing
#install.packages("nortest")
## call the library
#library("nortest")

## anderson darling testing for Education
#d.test(case)
#illie.test(case)
#sapiro.test(case)

## anderson darling testing for age
#ad.test(age)
#lillie.test(age)
#shapiro.test(age)
## install the package neuralnet
#install.packages("neuralnet")

## call the library
library(neuralnet)

? infert
## check the observation
dim(infert)

?neuralnet


#nn= neuralnet(case~age+parity+induced+spontaneous, data=infert, hidden=2,
 #             err.fct = "ce",linear.output=FALSE)