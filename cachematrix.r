## Caching the Inverse of a Matrix:
## Below are functions that are used to create a special object which
## stores a matrix and caches its inverse.

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(solveMatrix) inv <<- solveMatrix
  getInverse <- function() inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}	

##The function cacheSolve takes the output of the previous matrix makeCacheMatrix(matrix) as aninput and checks inverse matrix 
from makeCacheMatrix(matrix) has any value in it or not.In case inverse matrix from makeCacheMatrix((matrix) is empty,
it gets the original matrix data from and set the invertible  matrix by using the solve function. 

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv      
}		 	



