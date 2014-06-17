# -------------------------------------------------------
# factorify()
# 
# input: data frame, df, that has been subset by factor
# output: data frame, ndf, with all factors re-evaluated
#
# 
# -------------------------------------------------------
factorify <- function(df) {
  ndf = data.frame();
  dfc = colnames(df);
  execstr = "ndf = data.frame(";
  
  # for each item in dfc:
  for (i in 1:length(dfc)) {
    
    # if it's a factor, call the factor() function on the column name:
    if ( is.factor( df[,dfc[i]] ) ) {
      colname = paste0("factor(df$", dfc[i], ")")
    } else {
      colname = paste0("df$", dfc[i])
    }
    execstr = paste(execstr, colname)
    if (i<length(dfc)) {
      execstr = paste0(execstr,",")
    }
  }
  execstr = paste0(execstr,")")
  print(execstr)
  # eval it:
  eval(parse(text = execstr)) 
  # reassign column names and return:
  colnames(ndf) = dfc
  return(ndf)
}

# example call, using a data frame called "sample":
# output will be a dataframe called "testme"
#testme = factorify(sample)
