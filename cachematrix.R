## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The function makeCacheMatrix creates a special matrix 
## which is really a list  containing functions to
## set and get the matrix, set and get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(solve) {
    m <<- solve
  }
  getInverse <- function() {
    m
  }
  list(set = set, get = get, 
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

## The function cacheSolve calculates inverse of the special matrix 
## created above. It first checks if the inverse was already calculated.
## If so, it gets the cached inverse and skips the calculation of the inverse.
## Else it calculates the inverse and caches the inverse using the setInverse() function

cacheSolve <- function(x=matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getInverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setInverse(m)
  m
}
