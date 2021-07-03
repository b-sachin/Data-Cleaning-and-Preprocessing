if(!exists("./data")){dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,"./data/cameras.csv", method = "curl")
cameraData<-read.csv("./data/cameras.csv")

names(cameraData)

#tolower()  #toupper()

tolower(names(cameraData))
toupper(names(cameraData))

#strsplit() # Seperating column names at occurance of period  (dot)

splitNames <- strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

class(splitNames)

splitNames[[6]][1]

# Selecting first element as column name after split

firstElement <- function(x){x[1]}

sapply(splitNames, firstElement)


#sub() # Seperating column names at occurance of _  (underscore)

fileUrl1<- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
fileUrl2<- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"

download.file(fileUrl1,destfile = "./data/reviews.csv", method = "curl")
download.file(fileUrl2,destfile = "./data/solutions.csv", method = "curl")

reviews<-read.csv("./data/reviews.csv")
solutions<-read.csv("./data/solutions.csv")

head(reviews,2)
head(solutions,2)

names(reviews)


#sub()

sub("_","",names(reviews))

#gsub()

testName<-"this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

# grep() and grepl()

grep("Alameda",cameraData$intersection)

res = grepl("Alameda",cameraData$intersection)
res
table(res)

cameraData2<- cameraData[grepl("Alameda",cameraData$intersection),]
cameraData2

# what if we want content instead of location
grep("Alameda",cameraData$intersection,value = TRUE)

# what if patern doesn't match
grep("Sachin",cameraData$intersection)

# what if we need count of matching pattern
length(grep("Alameda",cameraData$intersection))

library(stringr)
nchar("Sachin Bhopi")
#[1] 12

substr("Sachin Bhopi", 1,6)
#[1] "Sachin"

paste("Sachin","Bhopi")
#[1] "Sachin Bhopi"

paste0("Sachin","Bhopi")
#[1] "SachinBhopi"

"    Sachin    "
str_trim("    Sachin    ")
#[1] "Sachin"

