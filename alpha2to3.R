alpha2to3 <- function(X) 
{   
  i <- 1   
  codes <- c()   
  while (i <= length(X))   
  {     
    code <- ISO_3166_1[ISO_3166_1$Alpha_2==X[i],]$Alpha_3     
    if (length(code)==0) codes <- c(codes, NA)     
    else codes <- c(codes, code)     
    i <- i + 1   
  }   
  return(codes) 
}
