library("bigrquery")
query1 <- 'SELECT title, contributor_username, comment  FROM [bigquery-public-data:samples.wikipedia]  WHERE title CONTAINS "Twitter" LIMIT 100;'
project <- 'central-droplet-126913'
data1 <- query_exec(query1, project)
project <- 'central-droplet-126913'
data1 <- query_exec(query1, project)
data1
query2 <- "SELECT place.country_code, user.id  FROM [central-droplet-126913:rtda.tweets]  WHERE (NOT (place.country_code IS NULL));"
data2 <- query_exec(query2, project, max_pages=Inf)
View(data2)
View(data2)
write.csv(data2, file = "MyTweets.csv")
cncnt <- as.data.frame(table(data2$place_country_code))
View(cncnt)
View(cncnt)
install.packages("ISOcodes")
library("ISOcodes")
data("ISO_3166_1")

alpha2to3 <- function(X) 
{   
  i <- 1   
  codes <- c() 
  while (i <= length(X))
  {
    code <- ISO_3166_1[ISO_3166_1$Alpha_2==X[i],]$Alpha_3
    if (length(code)==0) 
      codes <- c(codes, NA)
    else codes <- c(codes, code)
      i <- i + 1
  }
return(codes)
}

cncnt[,"CODE"] <- alpha2to3(cncnt$Var1)

library("plotly")
plot_ly(cncnt, z=Freq, locations=CODE, type='choropleth', color=Freq, colors='Reds')
cncnt[,"logFreq"] <- log(cncnt$Freq)
plot_ly(cncnt, z=logFreq, locations=CODE, type='choropleth', color=logFreq, colors = 'Blues')

