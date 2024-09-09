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

## correlational analysis
cor.test(case, age, method="spearman")
cor.test(case,parity, method = "spearman")
cor.test(case,induced, method="spearman")
cor.test(case,spontaneous, method="spearman")
cor.test(case, stratum, method="spearman")
cor.test(case, pooled.stratum, method="spearman")
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
nn$covariate
nn$net.result[[1]]
nn1 = ifelse(nn$net.result[[1]]>0.5,1,0)
nn1
missClassificationError = mean(case != nn1)
missClassificationError

outPutVsActual = cbind(case, nn1)
outPutVsActual


## Playing the the backpropergation algorithm
nn.bp =neuralnet(
  formula = case~age+parity+induced+spontaneous+stratum+pooled.stratum,
  data=infert, hidden=2, learningrate =0.01, algorithm = "backprop",
  err.fct = "ce",linear.output=FALSE
)
nn.bp
plot(nn.bp)
nn

## when we comparing the nn and nn.bp nn is used for making the prediction 
# Assuming the model expects these column names: "age", "gender", "income", "education"
covariates <- matrix(c(26,6, 1, 1,1,1,
                       26,6,1,0,0,0,
                       26,6,0,1,1,1,
                       26,6,1,0,0,1,
                       26,6,0,0,0,1), byrow=TRUE, ncol=6)

# Assign appropriate column names
colnames(covariates) <- c("age", "parity", "induced", "spaontaneous","stratum", "pooled.stratum")

# Now compute the output with the named covariates
new.output <- compute(nn, covariate=covariates)
new.output$net.result
new.output

## Install the plumber package for connecting with API
install.packages("plumber")
## call the library
library(plumber)
