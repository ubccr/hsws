# student data function example

# load the student data:
s=read.csv("students-example.csv",header=TRUE,row.names=1)

# those heights that are reported in feet
summary(s$Height[s$Units=="in"])

# a boxplot:
boxplot(s$Height[s$Units=="in"],main="Heights of Students", ylab="in", col="blue")

# ----------  writing a simple function to convert heights ----------

# define constants for the conversions
in.cm.Factor = 2.54 # feet to cm

# perform height conversion 
# input is assumed to be a single value
# input value assumed to be in feet
# (or conversion will be incorrect)
htConvertSimple = function(inch) {
  in.cm.Factor = 2.54

  # find equivalent measurement in cm
  cm = inch * in.cm.Factor
  
  # create vector of the 2 values and return it
  return ( c(inch, cm) )
}

students = s

# call on a single height in inches
htConvertSimple(students$Height[1])

# what happens when we call on all heights?
htConvertSimple(students$Height)

# call all using sapply
sapply(students$Height[students$Units=="in"],htConvertSimple)
# transpose to make the layout look more familiar?
res=t(sapply(students$Height[students$Units=="in"],htConvertSimple))

# put the result in a data frame:
heights = data.frame(inches=res[,1], cm=res[,2])
