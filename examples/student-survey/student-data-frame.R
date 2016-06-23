# workshop students data frame example

# construct vectors of data for inclusion in data frame.
height = c(68, 67, 65, 72, 71, 68,68 )      # inches
units = c("in","in", "in", "in", "in","in", "in")
firstname = c("R", "M", "T", "E", "N","T", "T")   
lastinitial = c("K","F","P","A", "P", "W","D")   
school=c("Nardin","MSM","OP","OP", "SJCI","Lake Shore","SJCI")
age    = c(17, 17, 17, 17, 15, 16, 14)      # years
handed = c("R", "R", "R", "R", "L","R","R")   # dominant hand: R=right, L=left

# provide names for the rows (samples)
rownames = c(paste(firstname,lastinitial))

# construct the data frame
data = data.frame(Height=height,       # Each column gets a name
                  Units=units,
                  Age=age, 
                  School=school,
                  Hand=handed,                  
                  row.names=rownames)  # provide names for the rows

# check current working directory, write the data frame to a csv:
getwd()
write.csv(data, file="students.csv")


# --------------------------------

# Exploring bad syntax, and good syntax, for 
# indexing into data frames:

# select subset of data frame having age < 17.
# try omitting the comma. What happens?
data[data$Age<17,]

# This should return a single value. What happens
# if you omit one of the row or column names? The comma?
data["T P","Hand"]

# what does this do? Why?
data$"T P"

# what does this do? Why?
data["Height"]

# why doesn't the same type of access work here:
data["T P"]

# any difference between these calls?
data[,]
data[]
data

# try these commands. What do they do?
summary(data$Height)
str(data$Height)

# select all heights equal to 65 inches.
data$Height[data$Height==65]

# Modify the above to return the whole row corresponding to this height...

# What does the following do?
data$Height==65

# What happens (try this last) if you omit one of the =
# in the ==? Can you guess first?
data$Height=65

# now what Heights are present in your dataset?

# ---

# Select all right-handers:
data[data$Hand=="R",]

# Select ages of all right-handers:
data[data$Hand=="R","Age"]

# --------------------------------

# write a function that accomplishes each of these ends:
#
# List heights and handedness of students at SJCI
# How many students are younger than 17?
# List names of students old enough to drive
# Convert all heights to centimeters, output a data frame
#   that contains name, height in cm, school. One inch is 2.54 cm.
