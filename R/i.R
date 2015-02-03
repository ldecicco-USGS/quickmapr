#' Identify
#' 
#' Spatially select an sp object  and reutrn the data associated with it.
#' @export
#' @import sp rgeos
#' 
i<-function(spdata){
  
  i.poly<-function(spdata){
    data<-spdata@data[over(spdata,SpatialPoints(locator(1),CRS(proj4string(spdata)))),]
    return(data)
  }
  
  i.line<-function(spdata){
    if(regexpr("DataFrame",class(spdata))>0{
      loc<-SpatialPoints(locator(1),CRS(proj4string(spdata)))
      data<-spdata@data[gWithinDistance(loc,spdata,gDistance(loc,spdata),byid=T),]
      return(data)
    } else {
      
    }
  }
  
  i.point<-function(spdata){
    i.line(spdata)
  }
    
  i.grid<-function(spdata){
    spdata<-as(spdata,"SpatialGridDataFrame")
    data<-over(SpatialPoints(locator(1),CRS(proj4string(spdata))),spdata)
    return(data)
  }
  
  spclass<-class(spdata)[1]
  switch(EXPR=spclass,
         SpatialPolygonsDataFrame = i.poly(spdata),
         SpatialGridDataFrame = i.grid(spdata),
         RasterLayer = i.grid(spdata),
         SpatialPixelsDataFrame = i.grid(spdata),
         SpatialLinesDataFrame = i.line(spdata),
         SpatialPointsDataFrame = i.point(spdata))
  
}