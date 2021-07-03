# how to connect to MySql and get data

install.packages("RMySQL")
library(RMySQL)

ucscDB<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDB,"show databases;") 
dbDisconnect(ucscDB)


# Connecting to hg19 database and listing tables
hg19<-dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
allTables<-dbListTables(hg19)
length(allTables)
allTables[1:5]

# Get dimensions of a specific table
dbListFields(hg19,"affyU133Plus2")

# Get number of rows in Table
dbGetQuery(hg19,"select count(*) from affyU133Plus2")

# Read from the table
affData<-dbReadTable(hg19,"affyU133Plus2")
head(affData)

# Read Specific subset of table
query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query)
quantile(affyMis$misMatches)

# Read only 10 record from db
affyMisSmall<-fetch(query,n=10)

dbClearResult(query)   # clear the query from remote server

dim(affyMisSmall)



