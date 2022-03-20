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

# 남녀 키를 통해 본 중심극한 정리
n_sim <- 100000
n <- 30
means <- vector(length = n_sim)

for (i in 1:n_sim){
  y <- vector(length=n) # 길이가 n인 저장소를 만든다
  for (j in 1:30) { # 30명을 추출한다
    gender <- rbinom(1, 1, 0.5) # 개인별로 성별을 추출한다 
    if (gender == 0) { # 추출된 성별이 여성이라면
      y[j] <- rnorm(1, 160, 5) # 여성 집단에서 키를 추출
    }
    else { # 추출된 성별이 남성이라면 
      y[j] <- rnorm(1, 175, 5) # 남성 집단에서 키를 추출
    }
  }
  means[i] <- mean(y)
}

hist(means, xlab='Mean_Height', ylab = 'prob', main = 'Distribution of means', prob = TRUE)
0