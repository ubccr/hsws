# simple data frame example
# -------------------------

# label             height      weight  age     hand
# ----------        ------      ------  ---     -----
# subject A         68             120  16		L
# subject B         75             160  17		R	
# subject C         60             118  16		R	

# construct vectors of data for inclusion in data frame.
# Order counts! vec[1] describes subject A, etc.
height = c(68, 75, 60)      # inches
weight = c(120, 160, 118)   # pounds
age    = c(16, 17, 16)      # years
handed = c("L", "R", "R")   # dominant hand: R=right, L=left

# provide names for the rows (samples)
rownames = c("A", "B", "C")

# construct the data frame
data = data.frame(Height=height,       # Each column gets a name
                  Weight=weight, 
                  Age=age, 
                  Hand=handed,
                  row.names=rownames)  # provide names for the rows

# describe the data frame:
print(str(data))
View(data)
names(data)
rownames(data)
colnames(data)
head(data)
tail(data)
dim(data)


# index into the data frame:
print(data["A",]) # all information about subject A

print(data$Height) # all heights in the dataset

# look for information about the contents:
print(summary(data$Height))

print(summary(data$Age))

# --- What kind of errors might we see if we ask for the wrong thing, the wrong way? ---

# Let's try to specify a row using column-access notation:
data$A
#[1] 16 17 16
#Warning message:
#  In `$.data.frame`(data, A) : Name partially matched in data frame

# notice the partial match is to the column "Age".

# ----

# now we'll get it wrong another way: switch rows and columns:
data[,"A"]
#
# Error in `[.data.frame`(data, , "A") : undefined columns selected

# ---

# get it wrong another way: specify a row that does not exist:
data["Hand",]
#
#        Height Weight Age Hand
# NA     NA     NA      NA <NA>

# an entry that does not exist:
data[5,5]
# NULL