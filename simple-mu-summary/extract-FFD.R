# # library(raster)
# # library(sp)
# library(rgdal)
# # library(sharpshootR)
# # library(plyr)
# 
# mu <- readOGR(dsn='spatial', layer='soilmu_a_ca713', stringsAsFactors = FALSE)
# mu <- spTransform(mu, CRS('+proj=utm +zone=10 +datum=NAD83'))
# 
# writeOGR(mu, dsn='.', layer='mu_projected', driver='ESRI Shapefile')
# 

# R session options
options(width=100, stringsAsFactors=FALSE)

# stat summary function
f.summary <- function(i, p) {
  
  # remove NA
  v <- na.omit(i$value)
  
  # compute quantiles
  q <- quantile(v, probs=p)
  res <- data.frame(t(q))
  
  ## TODO: implement better MADM processing and explanation  
  if(nrow(res) > 0) {
   
    # assign reasonable names (quantiles)
    names(res) <- c(paste0('Q', p * 100))
    
    return(res)
  }
  else
    return(NULL)
}


# load required packages
library(rgdal, quietly=TRUE)
library(raster, quietly=TRUE)
library(plyr, quietly=TRUE)
library(reshape2, quietly=TRUE)
library(sharpshootR, quietly=TRUE)

## load local configuration
source('config.R')


# load map unit polygons from OGR data source
mu <- try(readOGR(dsn=mu.dsn, layer=mu.layer, stringsAsFactors = FALSE))
if(class(mu) == 'try-error')
  stop(paste0('Cannot find map unit polygon file/feature: "', mu.dsn, ' / ', mu.layer, '"'), call. = FALSE)

# just in case, coerce mu.col to character
mu[[mu.col]] <- as.character(mu[[mu.col]])

# if no filter, then keep all map units
if(exists('mu.set')) {
  # coerce mu.set to character just in case
  mu.set <- as.character(mu.set)
  # filter
  mu <- mu[which(mu[[mu.col]] %in% mu.set), ]
} else {
  mu.set <- unique(mu[[mu.col]])
}

# add a unique polygon ID
mu$pID <- seq(from=1, to=length(mu))


## 25 minutes for all rasters / all map units
# sample / extract
system.time(sampling.res <- sampleRasterStackByMU(mu, mu.set, mu.col, raster.list, pts.per.acre, p=p.quantiles))

# summarize raster data for tabular output
mu.stats <- ddply(sampling.res$raster.samples, c('variable', '.id'), f.summary, p=p.quantiles)

write.csv(sampling.res$area.stats, file='area-stats.csv', row.names = FALSE)
write.csv(mu.stats, file='mu-stats.csv', row.names = FALSE)






