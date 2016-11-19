#lm(linear models)
install.packages("ISLR")
library("ISLR", lib.loc="~/R/win-library/3.3")
attach(Auto)
Auto
ind=sample((1:nrow(Auto)),round(0.70*nrow(Auto)))
#ind collects 70% datasets from Auto randomly and 'round' is to round the no like 2740.40=274
train=Auto[ind,]
test=Auto[-ind,]

head(Auto)
fit=lm(mpg ~ cylinders + displacement + horsepower + weight + acceleration + year + origin, data = train)
fit

fit1=lm(mpg ~ weight + year + origin , data = train )
fit1

summary(fit)#important

plot(fit)
library("car", lib.loc="~/R/win-library/3.3")
vif(fit)

step(fit)

out=predict(fit1,test)

test["mpg"]

error=out-test["mpg"]
error

rmse=sqrt(sum(error^2)/(nrow(test)))
#or rmse=sqrt(mean(error^2))
rmse