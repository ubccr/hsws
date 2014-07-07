markovProcess <- function(pn){
  probability_vector <- c(.6,.1,.3)
  pm <- sample(probability_vector,1)
  r <- runif(1,0,1)
  
  while(pn == pm){
    pm <- sample(probability_vector, 1)
  }
  if(pm > pn){
      new_pn <- paste("New state:", pm, sep=" ")
      return(new_pn)
  } else if(pm/pn > r){
      new_pn <- paste("New state:", pm, sep=" ")
      return(new_pn)
  } else {
      new_pn <- paste("State does not change:", pn, sep=" ")
      return(new_pn)
  }
}