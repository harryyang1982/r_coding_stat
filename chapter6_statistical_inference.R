# 난수생성기 시드 고정
set.seed(1234)
# 표본평균 개수
n_sim <- 10000

# 각 표본의 크기
sample_size <- 100
means <- c()

# 정규분포에서 표집 후 평균을 저장
for (i in 1:n_sim) {
  df  <- rnorm(sample_size, 170, 15)
  means <- c(means, mean(df))
}

# 표본평균의 분포
hist(means, xlab='X', ylab = 'N', main='', prob=TRUE, breaks=50)
curve(dnorm(x, 170, 15 / sqrt(sample_size)), 160, 180, add=TRUE, lty=2, lwd=2, col='red')

mean(means)

se <- 15 / sqrt(sample_size)
means_within_2se <- (means > 170 - 2*se) & (means < 170 + 2*se)
sum(means_within_2se)
mean(means_within_2se)

# 신뢰구간 성질 확인하기 (95%)

# 난수생성기 시드 고정
set.seed(1235)

# 표본평균 개수
n_sim <- 10000

# 각 표본의 크기
sample_size <- 100
m <- 170
s <- 15
se <- s / sqrt(sample_size)
X_bar_in_CI <- c()

# 정규분포에서 표집 후 평균을 저장
for (i in 1:n_sim) {
  df <- rnorm(sample_size, m, s)
  X_bar <- mean(df)
  if ((X_bar - 2*se < m) & (X_bar + 2*se > m)) {
    X_bar_in_CI <- c(X_bar_in_CI, TRUE)
  }
  else {
    X_bar_in_CI <- c(X_bar_in_CI, FALSE)
  }
}

# 신뢰구간 안에 모평균이 포함된 비율
mean(X_bar_in_CI)
