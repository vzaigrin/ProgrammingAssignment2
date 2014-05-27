source("cachematrix.R")
m<-makeCacheMatrix(matrix(c(-2,3,9,8,-11,-34,-5,7,21),nrow=3,ncol=3,byrow=TRUE))
cacheSolve(m)
mi<-cacheSolve(m)
m$get()%*%mi
