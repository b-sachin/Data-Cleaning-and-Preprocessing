# dplyr package developed by Hardley Wickham of Rstudio
# dplyr is optimized version of plyr package
# dplyr does not provide conceptually any "new" functionality but greatly simplifies existing functionality in R & also makes it lot faster.
# dplyr is fast as many key operations are coded in C++

# dplyr Verbs:
  # select: return subset of columns of a data frame
  # filter: extract a subset of rows from a data frame based on logical conditions
  # arrange: reorder rows of a data frame
  # rename: rename variables in a data frame
  # mutate: add new variable/ column or transform existing variable
  # summarise / summarize: generate summary statistics of the data frame.

# dplyr Properties:
  # The first argument is a data frame
  # The subsequent describes what to do with it
  # you can refer to column in the data frame directly without using the $ operator
  # The result is a new data frame
  # Data frame must be properly formatted and annotated for this to all be useful

# Download File to perform operation
  if(!file.exists("./data")){dir.create("./data")}
  fileUrl<-"https://github.com/DataScienceSpecialization/courses/raw/master/03_GettingData/dplyr/chicago.rds"
  download.file(fileUrl,destfile = "./data/chicago.rds",method='curl', extra='-L')
  chicago<-readRDS("./data/chicago.rds")
  
# understanding data
  dim(chicago)
  str(chicago)
  names(chicago)
  
# dplyr::select
  head(select(chicago,city:dptp))
  tail(select(chicago,-(city:dptp)))
  
  # Standard Way
    i<- match("city", names(chicago))
    j<- match("dptp", names(chicago))
  
    head(chicago[,(i:j)])
    tail(chicago[,-(i:j)])
  
# dplyr::filter
  chic.f<-filter(chicago,pm25tmean2 > 30)
  head(chic.f)
  
  chic.f<-filter(chicago,pm25tmean2 > 30 & tmpd > 80)
  head(chic.f)
  
# dplyr::arrange
  chicago<-arrange(chicago,date)
  head(chicago)
  tail(chicago)
  
  chicago<-arrange(chicago,desc(date))
  head(chicago)
  tail(chicago)
  
# dplyr::rename
  chicago<-rename(chicago,pm25 = pm25tmean2,dewpoint = dptp)
  head(chicago)
  
# dplyr::mutate
  chicago<-mutate(chicago,pm25detrend = pm25-mean(pm25,na.rm = TRUE))
  head(chicago)
  
# dplyr::group_by & summarize
  
  chicago<-mutate(chicago,tempcat = factor(1*(tmpd>80), labels = c("cold","hot")))
  head(chicago)
  
  hotcold<-group_by(chicago,tempcat)
  head(hotcold)
  
  summarise(hotcold,pm25=mean(pm25,na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
  
  # Example 2
  
  chicago<-mutate(chicago,year = as.POSIXlt(date)$year + 1900)
  years<- group_by(chicago,year)
  summarise(years,pm25=mean(pm25,na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
  
# Pipeline
  
  chicago %>% mutate(month=as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarise(pm25=mean(pm25, na.rm = TRUE), o3=max(o3tmean2), no2= median(no2tmean2))