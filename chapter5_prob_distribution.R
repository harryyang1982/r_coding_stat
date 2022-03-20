# 로또

lotto <- function(x) choose(39, 6-x) * choose(6, x)

for (x in 0:6) print(lotto(x))

lotto2 <- function(x) choose(39, 6-x) * choose(6, x) / choose(45, 6)

for (x in 0:6) print(lotto2(x))

# 정규분포

pnorm(35000, 30000, 10000) - pnorm(25000, 30000, 10000)

pnorm(25000, 30000, 10000)

1-pnorm(35000, 30000, 10000)

pnorm(-0.5)

curve(dnorm(x), -3, 3, xlab = 'X', ylab = 'density')

# 중심극한정리

n_sim <- 10000
y <- rbinom(n_sim, 100, 0.5)
hist(y, xlab='X', ylab='mass', main='Binom(100, 0.5)', prob=TRUE, breaks=30)
curve(dnorm(x, 50, 5), 25, 75, add=T, lty=2, lwd=1, col='red')

