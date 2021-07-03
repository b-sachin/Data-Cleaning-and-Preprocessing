#Getting the data from the web

  if(!file.exists("./data")){dir.create("./data")}
  fileUrl<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
  download.file(fileUrl,destfile = "./data/restaurants.csv",method='curl')
  restData<-read.csv("./data/restaurants.csv")

#Creating Sequences
  s1<-seq(1,10,by=2) # by difference of 2 in each value
  s1

  s2<-seq(1,10,length.out = 3) # only 3 elements from 1 to 10
  s2

  s3<-seq(along=s2) # create sequence of the size of given vector
  s3

  # Seq of size same as no. of rows in dataframe
    y<-seq(along=restData[,1])
    length(y)

  # Seq of size same as total no. of elements in all rows in dataframe
    z<-seq(along=row(restData))
    length(z)

# Subsetting Variables
  # Here we are creating new variable nearMe in restData dataframe which holds the boolean data for whether neighbourhood restaurants has of "Roland Park" or "Homeland"

  restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
  table(restData$nearMe)

# Creating binary Variables
  #good way to create categorical variable from quantitave variable
    restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
    table(restData$zipWrong)
            #OR
    restData$zipWrongTest = ifelse(restData$zipCode < 0, "Not OK", "OK")
    table(restData$zipWrongTest)

# Creating categorical variable [cut()]
  # good way to create new variable consist of quantitave variable as categorical variable  with our specified name for specific threshold
    restData$zipGroups=cut(restData$zipCode,breaks = quantile(restData$zipCode))
    table(restData$zipGroups)

# Easier Cutting [cut2()] 
  #can get data in any number of intervals
  library(Hmisc)
  restData$zipGroups2 = cut2(restData$zipCode,g=4)
  table(restData$zipGroups2)

# Creating a factor variable
  restData$zcf<-factor(restData$zipCode)
  restData$zcf[1:10]
  class(restData$zcf)

#Levels of factor Variables

  yesno<-sample(c("yes","no"),size = 10,replace = TRUE)
  yesno
    #[1] "no"  "no"  "no"  "no"  "no"  "no"  "no"  "yes" "yes" "no" 

  yesnofac<-factor(yesno,levels = c("yes","no"))
  yesnofac
    # [1] no  no  no  no  no  no  no  yes yes no 
    #Levels: yes no
  as.numeric(yesnofac)
    #[1] 2 2 2 2 2 2 2 1 1 2

  yesnofac<-relevel(yesnofac,ref = 'no')
  yesnofac
    #[1] no  no  no  no  no  no  no  yes yes no 
    #Levels: no yes
  as.numeric(yesnofac)
    #[1] 1 1 1 1 1 1 1 2 2 1

# Using the mutate function [part of "plyr" package]
    #mutate function create a new variable and add it in dataset.
  library(plyr)
  restData2<-mutate(restData,zipGroups=cut2(zipCode,g=4))
  table(restData2$zipGroups)

# Common Transforms
  
  x=-10
  x=abs(x)
  x
  # [1] 10
     
  x=sqrt(x)
  x
  # [1] 3.162278
  
  y=ceiling(x)
  y
  # [1] 4
  
  z=floor(x)
  z
  # [1] 3
  
  z=signif(x,digits = 2)
  z
  # [1] 3.2
  
  z=signif(x,digits = 3)
  z
  # [1] 3.16
  
  cos(x)
  # [1] -0.9997861
  
  sin(x)
  # [1] -0.02068353
  
  log(x)
  # [1] 1.151293
  
  log2(x)
  # [1] 1.660964
  
  log10(x)
  # [1] 0.5
  
  exp(x)
  # [1] 23.62434
