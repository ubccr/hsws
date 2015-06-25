# an example of the by() command
# 
# specify data that will be operated on
#       data that will provide grouping
#       function to apply to each group
#
# all this in one line!

attach(iris)
str(iris)

#'data.frame':   150 obs. of  5 variables:
# $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
# $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
# $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
# $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
# $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

head(iris)
#  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#1          5.1         3.5          1.4         0.2  setosa
#2          4.9         3.0          1.4         0.2  setosa
#3          4.7         3.2          1.3         0.2  setosa
#4          4.6         3.1          1.5         0.2  setosa
#5          5.0         3.6          1.4         0.2  setosa
#6          5.4         3.9          1.7         0.4  setosa

summary(iris)
#  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
# Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
# 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
# Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
# Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
# 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
# Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500            

# ---------- summary --------------

# Let's take a single numeric column from the dataset, and find its summary for each species
by(iris$Sepal.Length, iris$Species, summary)

# we can even operate over multiple columns: 
# specify columns 1 to 4 of the dataset:
by(iris[,c(1:4)], iris$Species, summary)

# ---------- mean --------------

# Let's take a single numeric column from the dataset, and find its mean for each species
by(iris$Sepal.Length, iris$Species, mean)

# we can even operate over multiple columns (need a different function though!):
# specify columns 1 to 4 of the dataset:
by(iris[,c(1:4)], iris$Species, colMeans)
# iris$Species: setosa
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#        5.006        3.428        1.462        0.246 
# ------------------------------------------------------------ 
# iris$Species: versicolor
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#        5.936        2.770        4.260        1.326 
# ------------------------------------------------------------ 
# iris$Species: virginica
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#        6.588        2.974        5.552        2.026 


# how not to do it: 
# need to give columns of proper type (numeric) to take mean of column:
by(iris, iris$Species, colMeans)
# Error in FUN(data[x, , drop = FALSE], ...) : 'x' must be numeric

