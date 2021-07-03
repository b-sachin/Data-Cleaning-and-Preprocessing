# Srarting with reshaping
  library(reshape2)
  head(mtcars)
  
# Melting data frames
  mtcars$name <- rownames(mtcars)
  
  carMelt<-melt(mtcars,id.vars = c("name","gear","cyl"),measure.vars = c("mpg","hp"))
  carMelt
  nrow(mtcars)
  
# Casting data Frames
  
  cylDataLength<-dcast(carMelt,cyl ~ variable,length)
  cylDataLength
  
  cylDataMean<-dcast(carMelt,cyl ~ variable,mean)
  cylDataMean
  
  cylDataMedian<-dcast(carMelt,cyl ~ variable,median)
  cylDataMedian
  
  carDataLength<-dcast(carMelt,name ~ variable,median)
  carDataLength
  
  gearDataLength<-dcast(carMelt,gear ~ variable,length)
  gearDataLength
  
# Averaging Values
  
  tapply(InsectSprays$count,InsectSprays$spray,sum)
  
  #Alternate 1
    spIns<-split(InsectSprays$count,InsectSprays$spray)
    spIns
    
    sprCount<- lapply(spIns,sum)
    sprCount
    unlist(sprCount)
        #OR
    sapply(spIns,sum)
    
  # Alternate 2 [plyr Package]
    ddply(InsectSprays,.(spray),summarise,sum=sum(count))
    
# Creating a new variable (Keep dimensions)
    spraySums<-ddply(InsectSprays,.(spray),summarise,sum=ave(count,FUN = sum))
    spraySums
    
    