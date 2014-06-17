# Lattice Examples
library(lattice)

# create factors with value labels
gear.f<-factor(mtcars$gear,levels=c(3,4,5),
               labels=c("3 gears","4 gears","5 gears"))
cyl.f <-factor(mtcars$cyl,levels=c(4,6,8),
               labels=c("4 cyl","6 cyl","8 cyl"))

# kernel density plot
l= densityplot(~mtcars$mpg,
            main="Density Plot",
            xlab="Miles per Gallon", 
               col="darkblue")

# kernel density plots by factor level
m=densityplot(~mtcars$mpg|cyl.f,
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon",
            col="darkblue")

# kernel density plots by factor level (alternate layout)
n=densityplot(~mtcars$mpg|cyl.f,
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon",
            layout=c(1,3),
            col="darkblue")

# boxplots for each combination of two factors
p=bwplot(cyl.f~mtcars$mpg|gear.f,
       ylab="Cylinders", xlab="Miles per Gallon",
       main="Mileage by Cylinders and Gears",
       layout=(c(1,3)),
       col="darkblue")
       
# scatterplots for each combination of two factors
# xyplot(mtcars$mpg~mtcars$wt|cyl.f*gear.f,
#       main="Scatterplots by Cylinders and Gears",
#       ylab="Miles per Gallon", xlab="Car Weight")

# 3d scatterplot by factor level
q=cloud(mpg~wt*qsec|cyl.f,
     data=mtcars,
     main="3D Scatterplot by Cylinders",
     col="darkblue")

# dotplot for each combination of two factors
# dotplot(cyl.f~mtcars$mpg|gear.f,
#        main="Dotplot Plot by Number of Gears and Cylinders",
#        xlab="Miles Per Gallon")

# scatterplot matrix
r=splom(mtcars[c(1,3,4,5,6)],
     main="MTCARS Data",
     col="darkblue")

# display plots
print(l)
print(m)
print(n)
print(p)
print(q)
print(r)

detach("package:hexbin, unload=TRUE")
detach("package:lattice", unload=TRUE)