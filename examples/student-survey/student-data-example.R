# student data function example

# load the student data:
s=read.csv("students.csv",header=TRUE,row.names=1)

# those heights that are reported in feet
summary(s$height[s$htLab=="ft"])

# a boxplot:
boxplot(s$height[s$htLab=="ft"],main="Heights of Students", ylab="feet", col="blue")

# ----------  writing a simple function to convert heights ----------

# define constants for the conversions
ft.cm.Factor = 30.48 # feet to cm
ft.b.Factor = 0.2 # feet to Bhaskars

# perform height conversion 
# input is assumed to be a single value
# input value assumed to be in feet
# (or conversion will be incorrect)
htConvertSimple = function(f) {
  ft.cm.Factor = 30.48
  ft.b.Factor = 0.1
  
  # find equivalent measurement in Bhaskars
  bh = f * ft.b.Factor
  # find equivalent measurement in cm
  ch = f * ft.cm.Factor
  
  # create vector of the 3 values and return it
  return ( c(f, ch, bh) )
}

students = s

# call on a single height in feet
htConvertSimple(students$height[1])

# what happens when we call on all heights?
htConvertSimple(students$height)

# call all using sapply
sapply(students$height[students$htLab=="ft"],htConvertSimple)
# transpose to make the layout look more familiar?
res=t(sapply(students$height[students$htLab=="ft"],htConvertSimple))

# put the result in a data frame:
heights = data.frame(feet=res[,1], cm=res[,2], bh=res[,3])
