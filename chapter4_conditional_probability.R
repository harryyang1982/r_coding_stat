# 시뮬레이션 횟수
n_sim <-  1000000

# 홀수가 나온 횟수
n_odd <- 0

# 5가 나온 횟수
n_5 <- 0

for(i in 1:n_sim) {
  # 주사위를 던진다
  y <- sample(1:6, 1)
  
  # 홀수가 나오면 n_odd에 1을 적립한다
  if (y%%2 == 1) n_odd <-  n_odd + 1
  
  # 5가 나오면 n_5에 1을 적립한다
  if (y == 5) n_5 <- n_5 + 1
}

# 홀수가 나온 횟수 출력
print(n_odd)

# 5가 나온 횟수 출력
print(n_5)

# 홀수가 나온 횟수 중 5가 나온 비율(통계적 확률) 출력
print(n_5/n_odd)



## 위양성률

# 시뮬레이션 횟수 및 유병률
n_sim <- 10000
prevalence <- 0.001

# 검사의 민감도, 특이도
sensitivity <- 0.99
specificity <- 0.99

# 전체 질환 케이스 수, 실제 환자 수, 오진 케이스 수
n_total_positive <- 0
n_true_positive <- 0
n_false_positive <- 0

# 시뮬레이션 파트
for(i in 1:n_sim) {
  #유병률에 따라 실제 병의 유무를 할당함
  disease <- rbinom(1, 1, prevalence)
  if (disease == 0) { #실제 병이 없는 경우
    diagnosis <- rbinom(1, 1, 1-specificity)
    if (diagnosis == 1) {
      n_total_positive <- n_total_positive + 1
      n_false_positive <- n_false_positive + 1
    }
  }
  if (disease == 1) { #실제 병이 있는 경우
    diagnosis <- rbinom(1, 1, sensitivity)
    if (diagnosis == 1) {
      n_total_positive <- n_total_positive + 1
      n_true_positive <- n_true_positive + 1
    }
  }
}

# 양성, 위양성, 진양성 수
print(n_total_positive)
print(n_true_positive)
print(n_false_positive)

# 위양성률
print(n_false_positive / n_total_positive)
