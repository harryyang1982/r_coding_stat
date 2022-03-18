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
