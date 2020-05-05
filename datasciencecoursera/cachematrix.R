## we are going to cache the inverse of a matrix instead of computing
## the calculation repeatedly to pull up for regular use from another environment.

## Set the value of the matrix, get the value of the matrix
## Then set the value of the inverse matrix, get the value of the inverse matrix (this
## is the function to be in another environment)

makeCacheMatrix <- function(x = matrix()) {      ##X equals matrix here 
      m <- NULL                  ##this will set the value of the matrix to be used in console
      set <- function(y)         ## the function of y will become the value of x here
      x <<- y                    ## m will remain NULL here because the value will come from somewhere else
      m <<- NULL
  }
  get <- function() x 
  setinverse <- function(inverse) m <<- inverse  ## added inverse inside the paranthesis to call this function into play
  getinverse <- function() m                     ## this will pull from the mysterious m value from other sources
  list(set = set, get = get,                     ## this creates a list which to compare the solve function below to in the end
       setinverse = setinverse,
       getinverse = getinverse)
  

## requires and argument to return the vector from cached files

cacheSolve <- function(x, ...) {       ## Return a matrix that is the inverse of 'x'
 m <- x$getinverse()                   ## we are now able to get the inverse from the m value
  if(!is.null(m)) {                    ## all 'list' items above are now in play in this function
    message("getting cached data")     ## all 'list' items above will be matched to pull info
    return(m)                          ## called to return a value in order to complete this
                                       ## of the function
  }
  data <- x$get()                ## pulls the information for x provided by user (also now the 'y' variable)
  m <- solve.default(data, ...)  ## use the default solve function here to find the solution of inverse function 
                                 ## if you get error thrown here, remember to test that you have a matrix to begin with
 x$setinverse(m)                 ## Hope for a good score on my assignment! :)
  m
}

