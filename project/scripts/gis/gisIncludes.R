# gis includes
# 21 May 15
# include in a calling file with e.g.
# if(!exists("readSparcs", mode="function")) source("gisIncludes.R")

# -------------------------------------------------
# loadShapefile()
#
# load shapefile with call to readShapePoly()
#   will print status such as: 
#   Shapefile type: Polygon, (5), # of Shapes: 62
# @output SpatialPolygonsDataFrame object
# -------------------------------------------------

loadShapefile = function( path,
                          shapefilenm) {
  
  filename=paste0(path, "/", shapefilenm);
  
  # load GIS shape file
  shape=readShapePoly(filename, 
                      verbose=TRUE); 
  return(shape);
}


# -------------------------------------------------
# readSparcs()
#
# load 2011 sparcs dataset from csv file
# @output DataFrame object
# -------------------------------------------------

# load sparcs data from csv
readSparcs = function( path, filename = "sparcs_2011.csv" ) {
  
  sfile=paste0(path,"/", filename); # full 2584770 records!
  
  s=read.csv(sfile,
            header=TRUE, 
            sep=",",
            quote="\"", 
            dec=".");
            #na.strings=c(""));
  return(s);
}

# ---------------------

loadGisPackages = function () {
  
  # R package for geospatial data, needs Debian packages libgdal1-dev and libproj-dev
  library(rgdal);
  library(ggplot2);
  
  library(maptools);
  
  # General Polygon Clipper Library for R (version 1.5-5)
  library(gpclib);
  gpclibPermit();
}
