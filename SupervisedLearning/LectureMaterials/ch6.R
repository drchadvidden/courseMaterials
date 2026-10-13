cat("\014")
rm(list = ls())

library(ISLR2)

#############################
# polynomial regression variance
#############################

Auto_sub <- Auto[sample(1:nrow(Auto),25),]

par(mfrow = c(1, 1))
plot(Auto_sub$weight, Auto_sub$mpg)

fit_poly <- lm(mpg ~ poly(weight,10), data = Auto_sub)
x <- seq(min(Auto_sub$weight),max(Auto_sub$weight), by=10)
lines(x, predict(fit_poly, newdata = data.frame(weight = x)), col = "blue", lwd = 2)

#############################
# polynomial regression coef variance
#############################

n_sim <- 100
deg <- 10
beta_mat <- matrix(NA, nrow = n_sim, ncol = deg + 1)

for (i in 1:n_sim) {
  Auto_sub <- Auto[sample(1:nrow(Auto), 25), ]
  fit_poly <- lm(mpg ~ poly(weight, deg), data = Auto_sub)
  beta_mat[i, ] <- coef(fit_poly)
}

par(mfrow = c(1,1))
boxplot(beta_mat, names = 0:deg,
        xlab = "Beta Index (0 = Intercept)",
        ylab = "Coefficient Value",
        main = "Distribution of Beta Coefficients Across Simulations",
        col = "lightblue")
abline(0,0, col='red')

#############################
# multinomial linear regression coef variance
#############################

data(Auto)
Auto <- subset(Auto, select = -c(name, origin))

# Scale all predictors, but not the response
predictors <- names(Auto)[!names(Auto) %in% "mpg"]
Auto[predictors] <- scale(Auto[predictors])

p <- length(predictors) + 1

beta_mat <- matrix(NA, nrow = n_sim, ncol = p)
colnames(beta_mat) <- c("(Intercept)", predictors)

for (i in 1:n_sim) {
  Auto_sub <- Auto[sample(1:nrow(Auto), 25), ]
  fit <- lm(mpg ~ ., data = Auto_sub)
  beta_mat[i, ] <- coef(fit)
}

boxplot(beta_mat[, -1],
        main = "Coefficient Variability (Full Linear Model)",
        xlab = "Predictors",
        ylab = "Standardized Coefficient Value",
        col = "lightgreen",
        las = 2)

abline(h = 0, col = "red")

print(summary(fit))
