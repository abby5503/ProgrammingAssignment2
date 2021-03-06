makeCacheMatrix<-function(x=matrix()){
  I<-NULL
  set<-function(y){
    x<<-y
    I<<-NULL
  }
  get<-function() x
  setinverse<-function(inverse) I<<-inverse
  getinverse<-function() I
  list(set=set, 
       get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}

cacheSolve<-function(x,...){
  I<-x$getinverse()
  if(!is.null(I)){
    message("get cache data")
    return(I)
  }
  
  data<-x$get()
  I<-solve(data,...)
  x$setinverse(I)
  return(I)
}