## Calc the inverse of a matrix and save result in cache

## Create an special "matrix" that calculates the inverse and save
## it to cache so it won't be calculated again
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NUL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set=set, get=get, setInverse = setInverse, getInverse = getInverse)
}


## Calculate the inverse of the special "matrix" 
## If the inverse is already calculated and saved in cache, return the result from cache
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if (!is.null(m)) {
    message('getting cache matrix')
    return (m)
  }
  data <- x$get()
  m <- solve(data)
  x$setInverse(m)
  m
}

# Example

# myMat<-matrix(runif(3*3), ncol=3)
# chacheMatObj <- makeCacheMatrix(myMat)
# solved <- cacheSolve(chacheMatObj)
# solved <- cacheSolve(chacheMatObj)
# solved <- cacheSolve(chacheMatObj)
