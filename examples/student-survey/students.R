#setwd("~/Documents")
data = read.csv("students.csv",header = TRUE, row.names = 1)



#-------------------------------------Distribution of Schools---------------------------------------


par(las = 3,
    mar = c(10,5,4,1)
)

plot(table(data$school),
     main = "Distribution of Schools\nStudents attend",
     ylab = "",
     col = rainbow(length(data$school)),
     cex = .6,
)

par(las = 0,
    mar = c(5, 4, 4, 2) + 0.1
)

mtext(side = 1, text = "School", line = 3)

mtext(side = 2, text = "Number of Students", line = 2)


#----------------------------------Distribution of Statistics Experience------------------------------------


plot(data$statExp,
     main = "Students with Statistics Experience",
     xlab = "Experience?",
     ylab = "Number of Students",
     col = c("red", "green"),
)




#----------------------------------Distribution of Programming Experience-----------------------------------

par(las = 3,
    mar = c(10,5,4,1)
)

plot(data$first, 
     data$proExp,
     main = "Students with Programming Experience",
     ylab = "Number of Languages Familiar With",
     ylim = c(0,6)
)

par(las = 0,
    mar = c(5, 4, 4, 2) + 0.1
)

mtext(side = 1, text = "Student Name", line = 2)
grid(nx = c(0,16), ny = NULL)



#----------------------------------------Sports verses Instruments------------------------------------------


plot(data$instrument, 
     data$sport,
     main = "Number of Instruments Students play\ncompared to\nNumber of Sports Students Play",
     xlab = "Number of Instruments Played",
     ylab = "Number of Sports Played",
     pch = 16,
     col = rainbow(length(data$instrument))
)