## Matrix inversion is usually a costly computation and their may be some benefit
## to caching the inverse of a matrix rather than compute it repeatedly.
## There are a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

# Local variable to hold matrix
  s <- NULL

# Set current matrix variables to parameter and null out cached value
  set <- function(y) {
    x <<- y
    s <<- NULL
  }

# Get matrix value
  get <- function() x

# Set solved value of matrix
  setsolve <- function(solve) s <<- solve

# Get solved value of matrix
  getsolve <- function() s

# Return list
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

# Return a matrix that is the inverse of 'x'
  s <- x$getsolve()

# If matrix is already cached return inverse matrix that is cached.
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }

# Get matrix
  data <- x$get()

# Invert (solve) matrix
  s <- solve(data, ...)

# Cache solved matrix 
  x$setsolve(s)

# Return inverted (solved) matrix
  s
  
}
