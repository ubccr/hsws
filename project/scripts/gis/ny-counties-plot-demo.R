# NYS County GIS dataset plotted with 2011 SPARCS data.
# ggplot with fortify() and merge()
# JMS
# 21 May 15

# set active directory: vidia
#setwd("/data/demo/nys/gis");
# king
setwd("~/resources/R/geospatial-data/demo");

# load includes
if(!exists("readSparcs", mode="function")) source("gisIncludes-demo.R");

loadGisPackages();

if (!exists("s")) s=readSparcs( getwd() );

# load the GIS data.
# use readShapePoly() since it's what we've used the most:
path=paste0( getwd(),"/gis" );
counties=loadShapefile(path, "counties");

# ----------------------------------------------------------------------

# pull out GIS lat, long data in a way ggplot can understand:
counties.f=fortify(counties, region="NAME") # 116861 obs
counties.f$id = as.factor(counties.f$id) # convert id to factor.

# merge the other data fields back into the GIS data frame:
counties.m=merge(x=counties.f,  # 116861 obs
             y=counties@data,
             by.x="id",
             by.y="NAME",
             all=TRUE # very important!! if you neglect this you will have an incomplete plot.
             )

# ------------------------------------------------

# some info about your merged dataset. Same # counties, no NAs:

length(unique(counties@data$NAME))
# [1] 62
length(unique(counties.f$id))
# [1] 62
length(unique(counties.m$id))
# [1] 62
# 
summary(counties.m$sq_miles)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.     
#   33.75  496.80  809.60  880.20 1248.00 2819.00  
# 
summary(counties@data$sq_miles)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   33.75  496.80  809.60  880.20 1248.00 2819.00 

# ------------------------------------------------

# plot something on a map!

# try coloring by a column from the dataframe we joined back to.
# plot the results of fortify and merge. OK:
Map <- ggplot(counties.m, aes(x=long, y=lat, group=group, fill=sq_miles)) + geom_polygon() + 
  coord_equal() + labs(x = "long", y = "lat", fill = "sq miles") + 
  ggtitle("NY State Counties")
Map

# And again: coloring by population. ok:
Map <- ggplot(counties.m, aes(x=long, y=lat, group=group, fill=POP2000)) + geom_polygon() + 
  coord_equal() + labs(x = "long", y = "lat", fill="population") + 
  ggtitle("NYS Counties")
Map

# ------------------------------------------------

# can we merge back to the hospital admissions dataset?
# 2011 SPARCS data: hospital admissions, statewide, deidentified.


# I have "s" loaded (the sparcs 2011 dataset). 
# Let's plot: count of hospital admissions by county
admission_count=table(s$hospital_county)
hc=data.frame(as.vector(admission_count), 
              names(admission_count))
colnames(hc)=c("hospital_admission_counts", "id")


# ensure no NA and no "NA" in the counties:
is.na(hc$id)
hc[hc$id=="NA",]
#hc=hc[!hc$id=="NA",] # someplace I picked up the STRING NA

# check the classes
sapply(hc,class)

# ------------------------------------------------

# NAIVELY: just do the merge and plot it.

# merge the hospital admissions by county with the counties data frame:
admissions.naive = merge(x=counties.m, 
                   y=hc,
                   by.x="id",
                   by.y="id", 
                   all=TRUE)


# Bad plot!
Map <- ggplot(admissions.naive, aes(x=long, y=lat, group=group, fill=hospital_admission_counts)) + geom_polygon() + 
  coord_equal() + labs(x = "long", y = "lat", fill="hospital admission counts") + 
  ggtitle("Hospital Admissions by NYS County")
Map
rm(admissions.naive)

# ------------------------------------------------

# MAKE A CORRECTION:
# let's represent all counties in the sparcs subset, since
# the hc dataframe lacks some.

# find counties not represented in sparcs and create a data frame:
nacounties=c(setdiff(counties.m$id,hc$id))
nacounties=as.factor(nacounties)
nas=rep(NA,5)
nas=data.frame(nas,nacounties)
colnames(nas)=c("hospital_admission_counts", "id")

# merge the unrepresented counties with hc data frame
hc.m=merge(x=hc,       
           y=nas,
           by="id",
           all=TRUE # gives an extra col of NAs
)

# ensure the correct columns and names
hc.m=data.frame(hc.m$hospital_admission_counts.x, hc.m$id)
colnames(hc.m)=c("hospital_admission_counts", "id")


# merge the hospital admissions by county with the counties data frame:
admissions = merge(x=counties.m, 
                   y=hc.m,
                   by.x="id",
                   by.y="id", 
                   all=TRUE)

# ------------------------------------------------

# no coloring, all there
Map <- ggplot(admissions, aes(x=long, y=lat, group=group)) + geom_polygon() + 
  coord_equal() + labs(x = "long", y = "lat") + 
  ggtitle("NYS Counties")
Map

# with coloring, all there!!
Map <- ggplot(admissions, aes(x=long, y=lat, group=group, fill=hospital_admission_counts)) + geom_polygon() + 
  coord_equal() + labs(x = "long", y = "lat", fill="Hospital Admission Counts") + 
  ggtitle("2011 Hospital Admissions by NYS County")
Map

# normalize by 2000 population data, with coloring, all there!!
Map <- ggplot(admissions, aes(x=long, y=lat, group=group, fill=100*hospital_admission_counts/POP2000)) + geom_polygon() + 
  coord_equal() + labs(x = "long", y = "lat", fill="admissions as % \nof 2000 population") + 
  ggtitle("2011 Hospital Admissions by NYS County")
Map

ggsave("NYS-Counties-SPARCS-2011.png")
