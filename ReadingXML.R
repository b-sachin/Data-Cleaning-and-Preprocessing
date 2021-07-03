library(XML)

fileURL3<-"http://producthelp.sdl.com/SDL%20Trados%20Studio/client_en/sample.xml"

doc<-xmlTreeParse(fileURL3,useInternalNodes = TRUE)

rootN<-xmlRoot(doc)

xmlName(rootN)  

names(rootN)

rootN[[2]]

xmlSApply(rootN,xmlValue)

xpathSApply(rootN,"//signature",xmlValue)

xpathSApply(rootN,"/letter",xmlValue)