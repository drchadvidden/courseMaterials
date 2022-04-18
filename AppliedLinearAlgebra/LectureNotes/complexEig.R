rm(list=ls())
cat("\014")


x <- pi/12
A <- matrix(c(cos(x), -sin(x), 
              sin(x), cos(x)), ncol=2, byrow=TRUE)
x <- c(1,0)

xout <- x
n <- 24
for (i in c(1:n)){
  x <- A%*%x
  xout <- rbind(xout, t(x) )
}

plot(xout)
lines(xout)
text(xout, labels=0:n, cex=2)