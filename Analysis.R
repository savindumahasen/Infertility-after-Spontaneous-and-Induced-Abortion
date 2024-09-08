## attach the dataset
attach(infert)

## view the dataset
View(infert)


#Normality testing
install.packages("nortest")
## call the library
library("nortest")

## Normality testing for Education
#ad.test(education)
#lillie.test(education)
#shapiro.test(education)

## Normality testing for age
ad.test(age)
lillie.test(age)
shapiro.test(age)

## Normality testing for parity
ad.test(parity)
lillie.test(parity)
shapiro.test(parity)

## Normality testing for induced
ad.test(induced)
lillie.test(induced)
shapiro.test(induced)

## Normality testing for case
ad.test(case)
lillie.test(case)
shapiro.test(case)

## Normality testing for spontaneous
ad.test(spontaneous)
lillie.test(spontaneous)
shapiro.test(spontaneous)

## Normality testing for stratum
ad.test(stratum)
lillie.test(stratum)
shapiro.test(stratum)

## Normality testing for pooled.stratum
ad.test(pooled.stratum)
lillie.test(pooled.stratum)
shapiro.test(pooled.stratum)

## install the package neuralnet
install.packages("neuralnet")

## call the library
library(neuralnet)

? infert
## check the observation
dim(infert)

?neuralnet


nn= neuralnet(case~age+parity+induced+spontaneous+stratum+pooled.stratum, data=infert, hidden=2,
              err.fct = "ce",linear.output=FALSE)

nn
plot(nn)
nn$weights
nn$result.matrix
