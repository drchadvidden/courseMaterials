rm(list = ls())
cat("\014") 
setwd("~/UWL/Fall 2022/MTH 150/Code")
set.seed(3141)

df <- read.csv("AmesHousing.csv")
df <- df[sample(nrow(df),100),]

plot(df$Gr.Liv.Area, df$SalePrice, 
     main="Ames Iowa Houses Sold 2006-10",
     xlab='Living Area', ylab='Sale Price')

model <- lm(SalePrice ~ Gr.Liv.Area, df)
smry <- summary(model)
print(smry$coefficients[,1])
abline(model, col='red')
legend('topleft',c('House','Best fit line'), 
       col=c('black','red'),pch=c(1,NA), lty=c(NA,1))