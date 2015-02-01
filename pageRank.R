# Quiz 1 - Background
# -------------------

# This matrix represents the connected graph from pagerank_the_matrix_formulation (week 1)
m <- matrix( c(0.5,0.5,0,0.5,0,1,0,0.5,0), nrow=3, ncol=3, byrow = TRUE )
r <- c(1/3,1/3,1/3)
# > m
# [,1] [,2] [,3]
# [1,]  0.5  0.5    0
# [2,]  0.5  0.0    1
# [3,]  0.0  0.5    0

iter1 <- m %*% r
# > iter1
# [,1]
# [1,] 0.3333333
# [2,] 0.5000000
# [3,] 0.1666667
r <- iter1

iter2 <- m %*% r
# > iter2
# [,1]
# [1,] 0.4166667
# [2,] 0.3333333
# [3,] 0.2500000

r <- iter2
iter3 <- m %*% r
# [1,] 0.3750000
# [2,] 0.4583333
# [3,] 0.1666667

r <- iter3
iter4 <- m %*% r
# > iter4
# [,1]
# [1,] 0.4166667
# [2,] 0.3541667
# [3,] 0.2291667

r <- iter4
iter5 <- m %*% r
> iter5
# [,1]
# [1,] 0.3854167
# [2,] 0.4375000
# [3,] 0.1770833

# eventually finishing at 6/15, 6/15,3/15

delta <- 1
r <- c(1/3,1/3,1/3)
while( delta > 0.001 )
{
    r2 <- m %*% r
    delta <- sum(abs(r2-r))
    r <- r2
    cat("\ndelta=",delta," ,r=",r)
}
cat("\nDone! final r=",r)

# Done! final r= 0.4000714 0.3998131 0.2001155

# Example - Spider Trap
# ---------------------

# simulate spider trap, from pagerank_the_matrix_formulation page 36
# ry = ry / 2 + ra /2
# ra = ry / 2
# rm = ra / 2 + rm   # this is the trap, node m got a node from m, but a random m will bve trapped in a loop and can't get out of m
m <- matrix( c(0.5,0.5,0, 0.5,0,0, 0,0.5,1), nrow=3, ncol=3, byrow = TRUE )

delta <- 1
r <- c(1/3,1/3,1/3)
while( delta > 0.001 )
{
    r2 <- m %*% r
    delta <- sum(abs(r2-r))
    r <- r2
    cat("\ndelta=",delta," ,r=",r)
}
cat("\nDone! final r=",r)

# Done! final r= 0.001277102 0.0007892922 0.9979336

# As expected, the importance of node m is 1, and the importance of the rest is zero
# As soon as the random walker will be crossing to m, he will be stuck in an infinte-loop 


# Example - Why teleport solve the problem (why_teleports_solve_the_problem page 47)
# ----------------------------------------------------------------------------------
# starting from the same matrix as the last example
beta <- 0.8
m <- matrix( c(0.5,0.5,0, 0.5,0,0, 0,0.5,1), nrow=3, ncol=3, byrow = TRUE )
tele <- matrix( rep(1/3,9),nrow=3,ncol=3  )

m.tele <- beta*m + (1-beta)*tele
# > m.tele
# [,1]       [,2]       [,3]
# [1,] 0.46666667 0.46666667 0.06666667
# [2,] 0.46666667 0.06666667 0.06666667
# [3,] 0.06666667 0.46666667 0.86666667

delta <- 1
r <- c(1/3,1/3,1/3)
while( delta > 0.001 )
{
    r2 <- m.tele %*% r
    delta <- sum(abs(r2-r))
    r <- r2
    cat("\ndelta=",delta," ,r=",r)
}
cat("\nDone! final r=",r)

# Done! final r= 0.2125037 0.1517515 0.6357448

# As we can see, the problem now is solved, so node m is not 1 and the rest is 0 - it's a more balanced solution


# Quiz 1 - Question 1
# -------------------

# Consider three Web pages with the following links:
#     ra is dead end
#     rb = 0.5a
#     rc = 0.5a + b + c
# 
# Suppose we compute PageRank with a β of 0.7, and we introduce the additional constraint that the sum of the PageRanks of the three pages must be 3, 
#     to handle the problem that otherwise any multiple of a solution will also be a solution. 
# Compute the PageRanks a, b, and c of the three pages A, B, and C, respectively. Then, identify from the list below, the true statement.

beta <- 0.7
m <- matrix( c(0,0,0, 0.5,0,0, 0.5,1,1), nrow=3, ncol=3, byrow = TRUE )
tele <- matrix( rep(1/3,9),nrow=3,ncol=3  )

m.tele <- beta*m + (1-beta)*tele

delta <- 1
r <- c(1/3,1/3,1/3)
while( delta > 0.0001 )
{
    r2 <- m.tele %*% r
    delta <- sum(abs(r2-r))
    r <- r2
    cat("\ndelta=",delta," ,r=",r)
}
cat("\nDone! final r=",r)

# Done! final r= 0.1 0.135 0.765

sum(r) # 1

r3 = 3.0 * r # ... we introduce the additional constraint that the sum of the PageRanks of the three pages must be 3,
# 
# [1,] 0.300
# [2,] 0.405
# [3,] 2.295

a <- r3[1]
b <- r3[2]
c <- r3[3]

# check the two options in the multiple choice options
a + c # 2.595
a + b # 0.705

# Quiz 1 - Question 2
# -------------------

# Consider three Web pages with the following links:
# a = c
# b = 0.5a
# c = 0.5a + b

# Suppose we compute PageRank with β=0.85. 
# Write the equations for the PageRanks a, b, and c of the three pages A, B, and C, respectively. T
# Then, identify in the list below, one of the equations.

beta <- 0.85
m <- matrix( c(0,0,1, 0.5,0,0, 0.5,1,0), nrow=3, ncol=3, byrow = TRUE )
tele <- matrix( rep(1/3,9),nrow=3,ncol=3  )

m.tele <- beta*m + (1-beta)*tele

# > m.tele
#       [,1] [,2] [,3]
# [1,] 0.050 0.05 0.90
# [2,] 0.475 0.05 0.05
# [3,] 0.475 0.90 0.05

# which is actually

#       a     b     c
# a   0.050 0.05 0.90
# b   0.475 0.05 0.05
# c   0.475 0.90 0.05

# it's clear that 
#   b = 0.475a + 0.05b + 0.05c <--> 0.95b = 0.475a + 0.05c 


# Quiz 1 - Question 3
# -------------------
# Consider three Web pages with the following links:
    # a = c
    # b = 0.5a
    # c = 0.5a + b    

# Assuming no "taxation," compute the PageRanks a, b, and c of the three pages A, B, and C, using iteration, 
# starting with the "0th" iteration where all three pages have rank a = b = c = 1. 
# Compute as far as the 5th iteration, and also determine what the PageRanks are in the limit. 
# Then, identify the true statement from the list below.

m <- matrix( c(0,0,1, 0.5,0,0, 0.5,1,0), nrow=3, ncol=3, byrow = TRUE )

# pagerank in the limit
# ---------------------
delta <- 1
r <- c(1,1,1)
while( delta > 0.001 )
{
    r2 <- m %*% r
    delta <- sum(abs(r2-r))
    r <- r2
    cat("\ndelta=",delta," ,r=",r)
}
cat("\nDone! final r=",r)

# Done! final r= 1.200195 0.6000977 1.199707

# Now, over 5 iterations
------------------------
    
r <- c(1,1,1)
for( i in 1:5)
{
    r2 <- m %*% r
    delta <- sum(abs(r2-r))
    r <- r2
    cat("\ni=",i," ,delta=",delta," ,r=",r)
}

# i= 1  ,delta= 1  ,r= 1 0.5 1.5
# i= 2  ,delta= 1  ,r= 1.5 0.5 1
# i= 3  ,delta= 1  ,r= 1 0.75 1.25
# i= 4  ,delta= 0.5  ,r= 1.25 0.5 1.25
# i= 5  ,delta= 0.25  ,r= 1.25 0.625 1.125

# It's clear that the right answer is that: After iteration 4, b = 1/2

# Question 4
# ----------
# Suppose our input data to a map-reduce operation consists of integer values (the keys are not important). 
# The map function takes an integer i and produces the list of pairs (p,i) such that p is a prime divisor of i. For example, map(12) = [(2,12), (3,12)].
# The reduce function is addition. That is, reduce(p, [i1, i2, ...,ik]) is (p,i1+i2+...+ik).
# 
# Compute the output, if the input is the set of integers 15, 21, 24, 30, 49. Then, identify, in the list below, one of the pairs in the output.

library(gmp) 

nums <- c(15, 21, 24, 30, 49)
s <- rep(0,10)

for(n in nums)
{
    # cat("\nn=",n)
    a <- unique(as.numeric(factorize(n)))
    for(i in a)
    {
        cat("\n(",i,",",n,")")
        s[i] <- s[i] + n
    }
}

# ( 3 , 15 )
# ( 5 , 15 )
# ( 3 , 21 )
# ( 7 , 21 )
# ( 2 , 24 )
# ( 3 , 24 )
# ( 2 , 30 )
# ( 3 , 30 )
# ( 5 , 30 )
# ( 7 , 49 )

s
# [1]  0 54 90  0 45  0 70  0  0  0

# From this vector it's clear that the sum of the factor 7 is 70 

