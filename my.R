MyFunction <- function(myVector)
{   
  s <- c()   
  for (v in myVector)     
    if (!is.element(v, s))      
      s <- c(s, v)   
    return(s) 
}