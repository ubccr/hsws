# workshop students data frame example

# construct vectors of data for inclusion in data frame.
height = c(75, 74, 66, 59, 66, 67, 61,74, 76, 69, 72)      # inches
units = c("in","in", "in", "in", "in","in", "in","in","in","in","in")
firstname = c("Steven", "Mike", "Jack", "Sarah", "Thomas", "Jade",
              "Lorena","Matthew","Markus","Brian", "Jin")   
lastinitial = c("B", "C", "D", "B", "K", "G", "J", "O","D", "C", "L")   
school=c("SJCI","WNHS","SJCI", "Nardin", "Nichols", 
         "NC","Nichols","SJCI","FHS", "WSHS","WSHS")
age    = c(16, 16, 15, 17, 15, 17, 14, 15, 16, 18,14)      # years
handed = c("L", "R", "R", "R", "R","R","R","R","R","R","R")   # dominant hand: R=right, L=left

# provide names for the rows (samples)
rownames = c(paste(firstname,lastinitial))

# construct the data frame
data = data.frame(Height=height,       # Each column gets a name
                  Units=units,
                  Age=age, 
                  School=school,
                  Hand=handed,                  
                  row.names=rownames)  # provide names for the rows

# --------------------------------

# Exploring bad syntax, and good syntax, for 
# indexing into data frames:

# select subset of data frame having age < 17.
# try omitting the comma. What happens?
data[data$Age<17,]

# This should return a single value. What happens
# if you omit one of the row or column names? The comma?
data["Jack D","Hand"]

# what does this do? Why?
data$"Jack D"

# what does this do? Why?
data["Height"]

# why doesn't the same type of access work here:
data["Jack D"]

# any difference between these calls?
data[,]
data[]
data

# try these commands. What do they do?
summary(data$Height)
str(data$Height)

# select heights equal to 74 inches.
# How do you get the whole row instead?
# What happens (try this last) if you omit one of the =
# in the ==? Can you guess first?
data$Height[data$Height==74]

# now what Heights are present in your dataset?

# --------------------------------

# write a function that accomplishes each of these ends:
#
# List heights and handedness of students at SJCI
# How many students are younger than 17?
# List names of students old enough to drive
# Convert all heights to centimeters, output a data frame
#   that contains name, height in cm, school. One inch is 2.54 cm.