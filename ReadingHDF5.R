# Install HDF5 Package

if (!requireNamespace("BiocManager", quietly = TRUE))
  {
    install.packages("BiocManager")
  }

BiocManager::install()
BiocManager::install("rhdf5")

library(rhdf5)

# Create HDF5 File
created<-h5createFile("example.h5")
created

# Create HDF5 Groups
created<-h5createGroup("example.h5","foo")
created<-h5createGroup("example.h5","baa")
created<-h5createGroup("example.h5","foo/foobaa")
h5ls()


# Write to groups
A=matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")

B=array(seq(0.1,2.0,by=0.1),dim = c(5,2,2))
attr(B,"scale")<-"liter"
h5write(B,"example.h5","foo/foobaa/B")

h5ls("example.h5")

df=data.frame(1L:5L,seq(0,1,length.out = 5),c("ab","cde","fghi","j","k"),stringsAsFactors = FALSE)
h5write(df,"example.h5","df")

h5ls()


# Reading data from HDF5
readA=h5read("example.h5","foo/A")
readB=h5read("example.h5","foo/foobaa/B")
readdf=h5read("example.h5","df")
readA


