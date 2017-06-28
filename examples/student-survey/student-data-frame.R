# workshop students data frame example

# construct vectors of data for inclusion in data frame.
height = c(68, 64, 63, 63, 70, 66, 73, 2, 160, 0.0010000119, 64,1753)     
units = c("in","in", "in", "in","in","in","in","yards","cm","nautical miles","in","mm")
firstname = c("Jake", "Andrew", "Sarah", "Aditi","Devin","Debosir","Jeremiah","Adam", "Luna", "Frid","Helen","Matt")   
lastinitial = c("B","L","W","C","M","G","M","R","L","D","H","D")   
school=c("OP","WN","SH","WestSenecaE","WestSenecaE","WN","FH","SweetHome","WillE","FH","WN","StJoes")
age    = c(17, 14, 16, 16, 17, 14, 17, 15, 16, 16, 16,16)      # years
handed = c("R", "R", "R", "R", "R", "R", "R", "R", "R","R","R","R")   # dominant hand: R=right, L=left

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

# select heights equal to 67 inches.
# How do you get the whole row instead?
# What happens (try this last) if you omit one of the =
# in the ==? Can you guess first?
data$Height[data$Height=74]

data$Height=74
# now what Heights are present in your dataset?

# --------------------------------

# write a function that accomplishes each of these ends:
#
# List heights and handedness of students at SJCI
# How many students are younger than 17?
# List names of students old enough to drive
# Convert all heights to centimeters, output a data frame
#   that contains name, height in cm, school. One inch is 2.54 cm.
