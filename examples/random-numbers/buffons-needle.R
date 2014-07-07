# Buffon's needle
#
# Consider a grid of equally spaced lines, separated by a distance d
#
# Take a needle of length l, and repeatedly toss it at random on the grid
#
# Record the number of hits, times that the needle touches a
# line, and misses, times that it doesn't.
#
# Then evaluate pi_estimate
#

hits1 = c(1,1,1,1,1,1,1,1,1,0 ) # 1 for hit, 0 for miss
hits2 = c(0,1,1,1,0,1,1,1,1,0 ) # 1 for hit, 0 for miss
hits3 = c(0,1,1,0,1,1,0,0,0,0 ) # 1 for hit, 0 for miss
hits4 = c(0,0,1,1,1,1,0,1,0,1 ) # 1 for hit, 0 for miss
hits = c(hits1,hits2,hits3,hits4)

l = 6.5; # length of toothpick, in [cm]
d = 6.5; # distance between lines, in [cm]

# overall computation of pi
p = sum(hits)/length(hits) # probability of a hit
pi_estimate = (2*l)/(p*d)

# 1
p1 = sum(hits1)/length(hits1) # probability of a hit
pi1_estimate = (2*l)/(p1*d)

p2 = sum(hits2)/length(hits2) # probability of a hit
pi2_estimate = (2*l)/(p2*d)

p3 = sum(hits3)/length(hits3) # probability of a hit
pi3_estimate = (2*l)/(p3*d)

p4 = sum(hits4)/length(hits4) # probability of a hit
pi4_estimate = (2*l)/(p4*d)

# create a vector of the 4 computations of pi
vp = c(pi4_estimate,pi3_estimate,pi2_estimate,pi1_estimate)

# find the standard deviation of our four computations
sd(vp)
