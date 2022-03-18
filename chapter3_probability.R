x <- rbinom(5, 1, 0.5)
x

mean(x)

x <- rbinom(100, 1, 0.5)
x

mean(x)
x <- rbinom(10000, 1, 0.5)
mean(x)

## 시뮬레이션

n_simulation <- 1000000
n_success <- 0
for(i in 1:n_simulation){
  x <- sample(1:5, 3, replace=FALSE)
  if(x[1] >= 4) n_success <-  n_success + 1
  if((x[1] == 3) & (x[2] >= 2)) n_success <- n_success + 1
}

n_success / n_simulation

# 몬테카를로 방법으로 원주율 계산하기

n_sim <- 10000000
x <- vector(length=n_sim)
y <- vector(length=n_sim)
res = 0
for(i in 1:n_sim) {
  x[i] <-  runif(1)
  y[i] <-  runif(10)
  if (x[i]^2 + y[i]^2 < 1) res <- res + 1
}

print(4 * res / n_sim)

circle <- function(x) sqrt(1-x^2)
plot(x, y, xlab='X', ylab='Y')
curve(circle, from=0, to=1, add=T, col='blue', lwd=2)

# 몬티홀 문을 바꾸지 않는 경우
n_sim <- 1000
doors <- 1:3
success <- 0

for (i in 1:n_sim) {
  car <- sample(doors, 1)
  
  if(car == 1) goat <- c(2, 3)
  else if (car == 2) goat <- c(1, 3)
  else goat <- c(1, 2)
  
  pick <- sample(doors, 1)
  
  goat_not_picked <- goat[goat!=pick]
  
  if (length(goat_not_picked) > 1) open <- sample(goat_not_picked, 1)
  else open <- goat_not_picked
  
  if (pick == car) success = success + 1
}

# 성공비율
success / n_sim


# 몬티홀 문을 바꾸는 경우
n_sim <- 1000
doors <- 1:3
success <- 0

for (i in 1:n_sim) {
  car <- sample(doors, 1)
  # 차가 없는 곳에 염소들을 배치한다
  if(car == 1) goat <- c(2, 3)
  else if (car == 2) goat <- c(1, 3)
  else goat <- c(1, 2)
  #참가자가 문을 고른다
  pick <- sample(doors, 1)
  #참가자가 고르지 않은 문 중 염소가 있는 문을 찾는다
  goat_not_picked <- goat[goat!=pick]
  # 참가자가 고르지 않은 문 중 염소가 있는 문 하나를 열어준다
  if (length(goat_not_picked) > 1) open <- sample(goat_not_picked, 1)
  else open <- goat_not_picked
  
  #참가자는 고른 문을 바꾼다
  pick = doors[(doors !=pick) & (doors != open)]
  
  if (pick == car) success = success + 1
}

# 성공비율
success / n_sim
