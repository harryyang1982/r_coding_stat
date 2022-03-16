x <- 5
x * x

x <- c(5, 6)

x[1]
x[2]

# factorial function

x <- 1
for (i in 2:10) {
  x <- x * i
}

x

x <- 1
for (i in 2:20) {
  x <- x * i
}

# making factorial function
fact <- function(n) {
  x <- 1
  for (i in 2:n) {
    x <- x * i
  }
  return(x)
}

fact(10)
fact(20)
fact(5)

# 순열

x <- c(1, 2, 3, 4, 5)
count <- 0
for (i in 1:5) {
  x2 <- x[x!=i]
  for (j in seq_along(1:4)) {
    print(c(i, x2[j]))
    count <- count + 1
  }
}
print(count)


x <- c(1, 2, 3, 4, 5)
count <- 0
for (i in 1:length(x)) {
  x2 <- x[x!=i]
  for (j in 1:(length(x)-1)) {
    print(c(i, x2[j]))
    count <- count + 1
  }
}
print(count)

permute <- function(x) {
  count <- 0
  x_vec <- 1:x
  for (i in 1:x) {
    x2 <- x_vec[x_vec!=i]
    for (j in 1:(x-1)) {
      print(c(i, x2[j]))
      count <- count + 1
    }
  }
  print(count)
}

permute(10)

perm <- function(n, r) {
  return(fact(n) / fact(n-r))
}

perm(5, 4 )
perm(5, 2)

# combination

x <- c(1, 2, 3, 4, 5)
count <- 0
for (i in 1:4) {
  for(j in (i+1):5) {
    print(c(i, j))
    count <- count + 1
  }
}
print(count)
comb <- function(n, r) {
  return(fact(n) / fact(n-r) / fact(r))
}

comb(45, 6)
