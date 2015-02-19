# Question 1
# ----------
# The edit distance is the minimum number of character insertions and character deletions required to turn one string into another. 
# Compute the edit distance between each pair of the strings he, she, his, and hers. 
# Then, identify which of the following is a true statement about the number of pairs at a certain edit distance.

a <- c("he", "she", "his", "hers")

# he -> she - dist 1
# he -> his - dist 3 ( he -> h -> hi -> his )
# he -> hers - dist 2
# she -> his - dist 4  she -> he -> h -> hi -> his
# she -> hers - dist 3 she -> he -> her -> hers  
# his -> hers - dist 3  his -> hs -> hes -> hers

# 1,2,3,3,3,4

# There is 1 pair at distance 4.

# Question 2
# ----------

# Consider the following matrix:
#     C1    C2	C3	C4
# R1	0	1	1	0
# R2	1	0	1	1
# R3	0	1	0	1
# R4	0	0	1	0
# R5	1	0	1	0
# R6	0	1	0	0
# 
# Perform a minhashing of the data, with the order of rows: R4, R6, R1, R3, R5, R2. 
# Which of the following is the correct minhash value of the stated column? 
# Note: we give the minhash value in terms of the original name of the row, rather than the order of the row in the permutation. 
# These two schemes are equivalent, since we only care whether hash values for two columns are equal, not what their actual values are.

#      C1  C2   C3	C4
# 3	    0	1	1	0
# 6	    1	0	1	1
# 4	    0	1	0	1
# 1	    0	0	1	0
# 5	    1	0	1	0
# 2	    0	1	0	0

# C1 C2 C3 C4
# R5 R6 R4 R3

# The minhash value for C3 is R4

# Question 4
------------
    
#     Question 4
# Find the set of 2-shingles for the "document":
#     
#     ABRACADABRA
# and also for the "document":
#     
#     
#     BRICABRAC
# Answer the following questions:
#     
#     How many 2-shingles does ABRACADABRA have?
# How many 2-shingles does BRICABRAC have?
# How many 2-shingles do they have in common?
# What is the Jaccard similarity between the two documents"?
# Then, find the true statement in the list below.

# ABRACADABRA 
# AB, BR, RA, AC, CA, AD, DA
# AB, AC, AD, BR, CA, DA, RA

# BRICABRAC
# BR, RI, IC, CA, AB, RA, AC
# AB, AC, BR, CA, IC, RA, RI

# Common
# AB, AC, BR, CA, RA

# Common
# 


# Question 6
# -----------
# Suppose we want to assign points to whichever of the points (0,0) or (100,40) is nearer. 
# Depending on whether we use the L1 or L2 norm, a point (x,y) could be clustered with a different one of these two points. 
# For this problem, you should work out the conditions under which a point will be assigned to (0,0) when the L1 norm is used, but assigned to (100,40) when the L2 norm 
# is used. Identify one of those points from the list below.

# after some basic math, the two conditions are:
#     x + y < 70
#     2.5x + y > 145

# x <- 55; y <- 5; x+y; 2.5*x + y
# [1] 60
# [1] 142.5
# No, since the last condition is smaller than 145
# 
# x <- 51; y <- 15; x+y; 2.5*x + y
# [1] 66
# [1] 142.5
# No, since the last condition is smaller than 145
# 
# x <- 56; y <- 13; x+y; 2.5*x + y
# [1] 69
# [1] 153
# Yes, both conditions are met
# 
# x <- 66; y <- 5; x+y; 2.5*x + y
# [1] 71
# [1] 170
# No, first condition is not met