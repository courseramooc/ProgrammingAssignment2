## This script caches the expensive calculation of inverting a matrix. If the
## particular inverted matrix is not cached, the calculation is performed.
## Otherwise the cached inverted matrix is returned

## This function takes a matrix as argument and returns a list with four 
## functions to manipulate the given matrix

makeCacheMatrix <- function(x = matrix()) {
    im <- NULL

    set <- function(y) {
        x <<- y
        im <<- NULL
    }

    get <- function() x

    setinversematrix <- function(solve) im <<- solve

    getinversematrix <- function() im

    list(set=set, get=get, 
        setinversematrix=setinversematrix,
        getinversematrix=getinversematrix)

}


## This function takes a matrix as argument and returns its inverse. If the 
## inverse is previously cached, it returns the cached inverse. Otherwise
## it calculates the inverse, caches it and returns the inverted matrix

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
	im <- x&getinversematrix()

	if(!is.null(im)) {
		message("getting cached data")
		return(im)
	}

	data <- x$get()
	im <- inversematrix(data, ...)
	x$setinversematrix(im)
	im
}
