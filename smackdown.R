training <- read.csv("C:/Users/chenjf/Downloads/training.csv", na.strings="?")
training <- training[complete.cases(training),]

fit1 <- lm(sales ~ . , data = training)

summary(fit1)

#experimenting with plots to get a big picture
par(mfrow=c(2,2))
plot(training$sales ~ training$previous_sales)
plot(training$sales ~ training$previous_books)
plot(training$sales ~ training$advance_amount)
plot(training$sales ~ training$number_of_authors)
plot(training$ad_budget ~ training$previous_sales)
plot(training$ad_budget ~ training$previous_books)

plot(training$ad_budget ~ training$advance_amount)
plot(training$ad_budget ~ training$sales)

library(class)
library(MASS)
library(glmnet)

set.seed(10)
train = sample(15000, 7000)
test <- -train
training.train <- training[train, ]
training.test <- training[test, ]

train.mat <-  model.matrix(sales ~ . , data = training.train)
test.mat <-  model.matrix(sales ~ . , data = training.test)
grid <-  10 ^ seq(10, -2, length = 100)


#see which variables we can probably throw out
library(leaps)
regfit.full=regsubsets(sales~ . , data=training, nvmax=15)
reg.summary=summary(regfit.full)
reg.summary

#potting adjusted R^2, Cp, and BIC
par(mfrow=c(2,2))
plot(reg.summary$adjr2, xlab="Number of Variables", ylab="Adjusted RSq")
plot(reg.summary$cp, xlab="Number of Variables", ylab="Cp")
plot(reg.summary$bic, xlab="Number of Variables", ylab="BIC")

#max # of predictors for each method
which.max(reg.summary$adjr2)
which.min(reg.summary$cp)
which.min(reg.summary$bic)

#regularization
mod.lasso <-  cv.glmnet(train.mat, training.train[, "sales"], alpha = 1, lambda = grid, thresh = 1e-12)
lambda.best <-  mod.lasso$lambda.min
lambda.best
lasso.pred <-  predict(mod.lasso, newx = test.mat, s = lambda.best)
mean((lasso.pred - training.test[, "sales"])^2)

mod.lasso <-  glmnet(model.matrix(sales ~ . , data = training), training[, "sales"], alpha = 1)
predict(mod.lasso, s = lambda.best, type = "coefficients")

lasso.test <-  1 - mean((training.test[, "sales"] - lasso.pred)^2) /
  mean((training.test[, "sales"] - test.avg)^2)
lasso.test


