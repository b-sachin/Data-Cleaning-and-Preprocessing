# Check for the availability of "data" folder or create one
#download file and store it as dataframe

if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "./data/restaurants.csv",method = "curl")
restData<-read.csv("./data/restaurants.csv")

#Look at a bit of the data
head(restData,n=3)
tail(restData,n=3)

# Make Summary
summary(restData)

# Structure of data
str(restData)

# Quantiles of Quantitative variables
quantile(restData$councilDistrict,na.rm = TRUE)
quantile(restData$councilDistrict,probs = c(0.5,0.75,0.9))

# Make table to see value repeat count
table(restData$zipCode,useNA = "ifany")

# Make 2D table to know relationship between 2 attributes
table(restData$councilDistrict,restData$zipCode)

#Check for missing values
sum(is.na(restData$Zip.Codes))
any(is.na(restData$Zip.Codes))
all(is.na(restData$Zip.Codes))

all(restData$zipCode>0)

#Row and Column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)  # useful to check that no missing value left in system

#Values with specific characteristics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))

# cross tabs

data("UCBAdmissions")
df=as.data.frame(UCBAdmissions)
summary(df)

  # cross tabs with 2 attributes
xtabs(Freq ~ Admit+Gender,data = df) # what is freq. for male admitted and all others

 # cross tabs with all other variable also known as FLAT TABLES
xtabs(Freq ~.,data = df) # dot represents all other attributes other than freq.


# flat table 
xt <- xtabs(Freq ~.,data = df)
ftable(xt)

#Size of the data set
fakeData<-rnorm(1e5)
object.size(fakeData)

print(object.size(fakeData),units = "MB")
print(object.size(fakeData),units = "KB")