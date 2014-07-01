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
