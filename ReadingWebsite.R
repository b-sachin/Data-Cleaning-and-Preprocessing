# Getting data off Webpages - readLines()

con <- url("https://scholar.google.com/citations?user=poajWXEAAAAJ&hl=en&oi=ao")
htmlCode<-readLines(con)
close(con)


# Parsing with XML

library(RCurl) # link is https not http so we need to use "ssl.verifyPeer=FALSE" in "getURL" method
library(XML)

url=getURL("https://scholar.google.com/citations?user=poajWXEAAAAJ&hl=en&oi=ao",ssl.verifyPeer=FALSE)
html=htmlTreeParse(url,useInternalNodes = TRUE)
xpathSApply(html,"//title",xmlValue)
xpathSApply(html,"//td[@class='gsc_rsb_std']",xmlValue)


# GET from the httr package [without password]

library(httr)

url2<-"https://scholar.google.com/citations?user=poajWXEAAAAJ&hl=en&oi=ao"
html2<-GET(url2)
content2<-content(html2,as="text")
parsedHtml<-htmlParse(content2,asText = TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)


# GET from the httr package [with password]
library(httr)
pg1<-GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2<-GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg2

names(pg2)


# Using handles [Need to make only once so later request can be made using same setting & cookie ]

google=handle("http://google.com")
pg3=GET(handle=google,path="/")
pg3

pg4=GET(handle=google,path="search")
pg4
