## Matrix inversion is usually a costly operation and there are advantages 
## in caching the inverse of the matrix rather than computing it every time

## makeCacheMatrix creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
   	inv <- NULL
   	
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	
	get <- function()
	    x
	
	setinverse <- function(inverse) 
	    inv <<- inverse
	
	getinverse <- function() 
	    inv
	
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)	
}


## Calculates inverse of the matrix created with makeCacheMatrix function. 
## However, it first checks if inverse has already been computed. If so, it 
## gets the inverse from the cache and skips the computation. Otherwise, it 
## calculates the inverse and stores it in cache via setinverse function.
cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
		message("Retrieving matrix inverse from cache")
		return(inv)
    }
    
    ## Compute the inverse and store in a cache
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setinverse(inv)
    inv
}
