#Q1

  if(!file.exists("./data")){dir.create("./data")}
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileUrl,destfile = "./data/housing.csv",method='curl')
  restData<-read.csv("./data/housing.csv")
  
  # library(dplyr)

  # table(restData$ACR)
  # grACR<-filter(restData,ACR > 2)
  # 
  # table(restData$AGS)
  # grAGS<-filter(grACR,AGS > 5)

  agricultureLogical<- (restData$ACR > 2 & restData$AGS > 5)
  which(agricultureLogical)


#Q2
  
  install.packages("jpeg")
  library(jpeg)
  
  if(!file.exists("./data")){dir.create("./data")}
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  download.file(fileUrl,destfile = "./data/q2.jpg",method='curl')

  q2 <- readJPEG(normalizePath("./data/q2.jpg"), native=TRUE)
  quantile(q2,probs = c(0.3,0.8))

#Q3
  
  if(!file.exists("./data")){dir.create("./data")}
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileUrl,destfile = "./data/GDP.csv",method='curl')
  GDP<-read.csv("./data/GDP.csv",skip=4,nrows = 190)
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileUrl,destfile = "./data/ED.csv",method='curl')
  ED<-read.csv("./data/ED.csv")
  
  GDP<-dplyr::rename(GDP,id=X)
  ED<-dplyr::rename(ED,id=CountryCode)
  res<-merge(GDP,ED)
  
  res1<-arrange(res,desc(X.1))
  
  cat(nrow(res1),"matches, 13th country is ",res1[13,4])
  
#Q4
  resX<-tbl_df(res)
  
  OECD_mean<-filter(resX,Income.Group=="High income: OECD")
  nonOECD_mean<-filter(resX,Income.Group=="High income: nonOECD")
  
  a<-summarise(OECD_mean,mean(X.1))
  b<-summarise(nonOECD_mean,mean(X.1))
  paste(a,b,sep = ",")
  
#Q5
  
  library(Hmisc)
  resX<-mutate(resX,rank_cat=cut2(X.1,g=5))
  table(resX$rank_cat,resX$Income.Group)