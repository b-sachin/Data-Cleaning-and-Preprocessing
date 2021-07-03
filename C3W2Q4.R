
#Q.4 Reading from web using ReadLines()

library(XML)
con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
html3<-readLines(con)
close(con)

nchar(html3[c(10,20,30,100)])


#Q.5 Fixed Width file format

data1<-read.fwf('C:/Users/admin/Downloads/getdata_wksst8110.for', widths = c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), header = FALSE, skip = 4)
head(data1)
sum(data1[4])