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

hits = c( ) # 1 for hit, 0 for miss

l = ; # length of toothpick, in [units]
d = ; # distance between lines, in [units]

p = sum(hits)/length(hits) # probability of a hit

pi_estimate = (2*l)/(p*d)

