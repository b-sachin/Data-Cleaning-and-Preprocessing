
# creating dataframe using sample numbers
set.seed(13435)
X<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X<-X[sample(1:5),]
X$var2[c(1,5)]=NA
X<-rbind(X,c(3,8,8))
X

#subset specific column
X[,1]

X[,"var1"]

# subset by both rows and columns
X[1:2,"var2"]
X[1:2,2:3]
X[1:2,c(1,3)]

# Subset using logical statements
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]

#Dealing with missing values (which command removes NA and give result)
X[which(X$var2>6),]

#Sorting single column
sort(X$var1)
sort(X$var1,decreasing = TRUE)
sort(X$var2,na.last = TRUE)

#Sorting All the data structure according to particular column
X[order(X$var1),]

#First order data structure using first variable and if 2 values in same column having same values the order it using second variable 
X[order(X$var1,X$var3),]

#Ordering with plyr
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))

# Adding rows and columns
X$var4<-rnorm(6)

# Adding Column using cbind()
cbind(X,rnorm(6))

# Adding Row using rbind()
rbind(X,c(1:4))