# computations with NAs in a vector

# define a vector y with NAs:
y=c(1,NA,3,2,NA)

# show its summary:
summary(y)

# compute the sum
sum(y)             # nope, NA
sum(y, na.rm=true) # better


# how do we compute the mean? one way:
mean(y, na.rm=TRUE)

# but not like this; length does not take na.rm
# mean(y, na.rm=TRUE)/length(y, na.rm=TRUE)
#   Error in length(y, na.rm = TRUE) : 
#    2 arguments passed to 'length' which requires 1

# instead we can use na.omit()
# but we also must interpret the result as a vector
sum(y, na.rm=TRUE)/length(as.vector(na.omit(y)))

# we have generic functions for handling missing values:
#     na.fail(), na.omit(), na.pass()
#
# use the R help to find out more!