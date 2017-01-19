# load libraries
library(stringr)


# reading dataset
users <- read.delim("./ml-1m/users.dat",stringsAsFactors = FALSE)
movies <- read.delim("./ml-1m/movies.dat",stringsAsFactors = FALSE)
ratings <- read.delim("./ml-1m/ratings.dat",stringsAsFactors = FALSE)



# Getting the Data Frames
usersdf <- as.data.frame(t(as.data.frame(sapply(users[[1]],function(y){str_split(y,pattern = "::")}),stringsAsFactors = FALSE)),stringsAsFactors=FALSE)
moviesdf <- as.data.frame(t(as.data.frame(sapply(movies[[1]],function(y){str_split(y,pattern = "::")}),stringsAsFactors = FALSE)),stringsAsFactors = FALSE)
ratingsdf <- as.data.frame(t(as.data.frame(sapply(ratings[[1]],function(y){str_split(y,pattern = "::")}),stringsAsFactors = FALSE)),stringsAsFactors = FALSE)


# Row names and column names to dataframes
rownames(usersdf) <- c(1:nrow(usersdf))
rownames(moviesdf) <- c(1:nrow(moviesdf))
rownames(ratingsdf) <- c(1:nrow(ratingsdf))
colnames(usersdf) <- c("UserID","Gender","Age","Occupation","Zip-code")
colnames(moviesdf) <- c("MovieID","Title","Genres")
colnames(ratingsdf) <- c("UserID","MovieID","Rating","Timestamp")



# converting columns to required data types
list <- c("UserID","Age","Occupation","Zip-code")
ChngeToInteger <- function(df,list)
{
  for(i in seq_along(list))
  {
    df[[ list[[i]] ]] <- as.integer(as.list(df[[ list[[i]] ]])) 
  }
  return(df)
}
usersdf<-ChngeToInteger(usersdf,list)
moviesdf$MovieID <- as.integer(as.list(moviesdf$MovieID))

