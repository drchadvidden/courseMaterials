rm(list=ls())
cat("\014")
dev.off()

A <- matrix(c(sqrt(3), -3, 3, sqrt(3)), ncol=2, byrow=TRUE)
x <- c(1,0)

xout <- x
n <- 5
for (i in c(1:n)){
  x <- A%*%x
  xout <- rbind(xout, t(x) )
}

plot(xout)
lines(xout)
text(xout, labels=1:(n+1), cex=3)
