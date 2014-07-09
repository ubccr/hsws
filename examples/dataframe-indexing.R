
# ok
data[data$Height>65,c("Height","Weight")]
data[data$Height>65,c(1,2)]

# not ok
data[c(data$Weight,data$Hand),data$Height>65]
data[data$Height>65, c(data$Weight,data$Hand)]
