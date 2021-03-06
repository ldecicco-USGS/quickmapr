#' Zooms out on current plot
#' 
#' This function uses the package \code{zoom} to provide zooming and panning functionality.  
#' These are simply wrappers with shortened function names. This function zooms out by a set 
#' amount.
#' 
#' @param ... arguments to be passed to zoom::out.zoom()
#' 
#' @export
#' 
#' @examples
#' data(lake)
#' qmap(list(lake,buffer,elev)) %>% zi()
zo<-function(...){
  zoom::out.zoom(...)
}