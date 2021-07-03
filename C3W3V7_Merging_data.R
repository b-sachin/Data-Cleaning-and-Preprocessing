
# Creating 2 Data frames

  abc<-data.frame(id=c(sample(1:10)),name=LETTERS[1:10])
  abc

  xyz<-data.frame(id=c(sample(1:10)),sid=c(sample(1:10)),name=LETTERS[6:15])
  xyz

# Merged data based on user specified column
  mergedData<-merge(abc,xyz,by.x = "id",by.y = "sid", all=TRUE)
  mergedData

# Merged data without specified will merge according to all common columns
  mergedData2<-merge(abc,xyz,all=TRUE)
  mergedData2

# Using join in plyr package
  library(plyr)
  arrange(join(abc,xyz),name)
  
  # if you have multiple data frames to join
    dfList<-list(abc,pqr,xyz)
    join_all(dfList)