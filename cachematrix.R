##Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly 
## Following function initializes the matrix and then help users to cache the matrix

##The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
##set the Matrix
##get the Matrix
##set the value of the Inverse of Matrix
##get the value of the Inverse of Matrix

makeCacheMatrix <- function(mat = matrix()) {
 InvMatx <- NULL
  set <- function(y) {
    mat <<- y
    InvMatx <<- NULL
  }
  
  get <- function() mat
  
  setInvMatx<-function(solvem = matrix()) InvMatx <<- solvem
  
  getInvMatx<-function() InvMatx
  
  list(set = set, get = get,
       setInvMatx = setInvMatx,
       getInvMatx = getInvMatx)
}


##The following function calculates the Inverse of the special "matrix" created with the above function. 
##However, it first checks to see if the Inverse has already been calculated. If so, it gets the matrix inverse from the cache and skips the computation. 
##Otherwise, it calculates the inverse of the data and sets the value of the Inverse matrix in the cache via the setInvMatx function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  mat  <- x$getInvMatx()
  if(!is.null(mat)) {
    message("getting cached data")
    return(mat)
  }
  data <- x$get()
  mat  <- solve(data,...)
  x$setInvMatx(mat)
  mat 
}

##Usage
## Initialize a matrix

##B<- matrix( c(2, 4, 3, 5), nrow=2,   ncol=2)

## x<-makeCacheMatrix(B)

##x$get()
## Verify the Output - 
##     [,1] [,2]
##[1,]    2    3
##[2,]    4    5

##cacheSolve(x)
##     [,1] [,2]
##[1,] -2.5  1.5
##[2,]  2.0 -1.0


