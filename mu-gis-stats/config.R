### MU GIS Summary Report
### 2016-03-22
### D.E. Beaudette and J. Wood
###
### configuration file, edit as needed


## data sources

# raster data
raster.list <- list(`Mean Annual Air Temperature (deg C)`=raster('E:/gis_data/prism/final_MAAT_800m.tif'), 
                    `Mean Annual Precipitation (mm)`=raster('E:/gis_data/prism/final_MAP_mm_800m.tif'),
                    `Effective Precipitation (mm)`=raster('E:/gis_data/prism/effective_precipitation_800m.tif'),
                    `Frost-Free Days`=raster('E:/gis_data/prism/ffd_mean_800m.tif'),
                    `Growing Degree Days (deg C)`=raster('E:/gis_data/prism/gdd_mean_800m.tif'),
                    `Elevation (m)`=raster('E:/gis_data/region-2-mu-analysis/elev_30.tif'),
                    `Slope Gradient (%)`=raster('E:/gis_data/region-2-mu-analysis/slope_30.tif'),
                    `Annual Beam Radiance (MJ/sq.m)`=raster('E:/gis_data/ca630/beam_rad_sum_mj_30m.tif'),
                    `(Estimated) MAST (deg C)`=raster('E:/gis_data/ca630/mast-model.tif'),
                    `Slope Aspect (degrees)`=raster('E:/gis_data/region-2-mu-analysis/aspect_30.tif'),
                    `Geomorphons`=raster('E:/gis_data/region-2-mu-analysis/forms30_region2.tif')
)

### TODO Data from SDA: add from tutorial ...
### 


### Data are in a large geodatabase with many map units, explicit subsetting

# geodatabase path
mu.dsn <- 'E:/gis_data/ca630/FG_CA630_OFFICIAL.gdb'
# name of featureclass
mu.layer <- 'ca630_a'

mu <-  readOGR(dsn=mu.dsn, layer=mu.layer, encoding='OpenFileGDB', stringsAsFactors = FALSE)
# map unit symbols / keys to extract
mu.set <- c('8115', '8175', '8176', '8177', '8178', '8179')

###


# ### Typical SDJR style data: SHP with multiple map units
# 
# # path to SHP
# mu.dsn <- 'E:/gis_data/region-2-mu-analysis'
# # SHP name, without file extension
# mu.layer <- 'CA630-SDJR-example'
# # load data
# mu <-  readOGR(dsn=mu.dsn, layer=mu.layer, stringsAsFactors = FALSE)
# 
# ###


### column with map unit ID / key / symbol
mu.col <- 'MUSYM'

### do geomorphon summary?
do.geomorphons <- TRUE

### polygon sampling density (samples / acre / polygon)
# using too-small a sampling density will result in variation between runs
pts.per.acre <- 1

