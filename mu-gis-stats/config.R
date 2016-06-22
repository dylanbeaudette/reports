### MU GIS Summary Report
### 2016-04-07
### D.E. Beaudette and J. Wood
###
### configuration file, edit as needed


### raster data
# raster.list <- list(`Mean Annual Air Temperature (degrees C)`=raster('E:/gis_data/prism/final_MAAT_800m.tif'), 
#                     `Mean Annual Precipitation (mm)`=raster('E:/gis_data/prism/final_MAP_mm_800m.tif'),
#                     `Effective Precipitation (mm)`=raster('E:/gis_data/prism/effective_precipitation_800m.tif'),
#                     `Frost-Free Days`=raster('E:/gis_data/prism/ffd_mean_800m.tif'),
#                     `Growing Degree Days (degrees C)`=raster('E:/gis_data/prism/gdd_mean_800m.tif'),
#                     `Elevation (m)`=raster('E:/gis_data/region-2-mu-analysis/elev_30.tif'),
#                     `Slope Gradient (%)`=raster('E:/gis_data/region-2-mu-analysis/slope_30.tif'),
#                     `Annual Beam Radiance (MJ/sq.m)`=raster('E:/gis_data/ca630/beam_rad_sum_mj_30m.tif'),
#                     `(Estimated) MAST (degrees C)`=raster('E:/gis_data/ca630/mast-model.tif'),
#                     `Slope Aspect (degrees)`=raster('E:/gis_data/region-2-mu-analysis/aspect_30.tif'),
#                     `Geomorphon Landforms`=raster('E:/gis_data/region-2-mu-analysis/forms30_region2.tif'),
#                     `Curvature Classes`=raster('E:/gis_data/region-2-mu-analysis/curvature_classes_30_class_region2.tif')
# )

raster.list <- list(`Mean Annual Air Temperature (degrees C)`=raster('E:/gis_data/prism/final_MAAT_800m.tif'), 
                    `Mean Annual Precipitation (mm)`=raster('E:/gis_data/prism/final_MAP_mm_800m.tif'),
                    `Effective Precipitation (mm)`=raster('E:/gis_data/prism/effective_precipitation_800m.tif'),
                    `Frost-Free Days`=raster('E:/gis_data/prism/ffd_mean_800m.tif'),
                    `Growing Degree Days (degrees C)`=raster('E:/gis_data/prism/gdd_mean_800m.tif'),
                    `Elevation (m)`=raster('E:/gis_data/region-2-mu-analysis/elev_30.tif'),
                    `Slope Gradient (%)`=raster('E:/gis_data/region-2-mu-analysis/slope_30.tif'),
                    `Slope Aspect (degrees)`=raster('E:/gis_data/region-2-mu-analysis/aspect_30.tif'),
                    `Geomorphon Landforms`=raster('E:/gis_data/region-2-mu-analysis/forms30_region2.tif'),
                    `Curvature Classes`=raster('E:/gis_data/region-2-mu-analysis/curvature_classes_30_class_region2.tif')
)



# ### Data are in a large geodatabase with many map units, explicit subsetting
# 
# # geodatabase path
# mu.dsn <- 'E:/gis_data/ca630/FG_CA630_OFFICIAL.gdb'
# # name of featureclass
# mu.layer <- 'ca630_a'
# 
# mu <-  readOGR(dsn=mu.dsn, layer=mu.layer, encoding='OpenFileGDB', stringsAsFactors = FALSE)
# # map unit symbols / keys to extract
# mu.set <- c('5012', '5015', '5201', '7085', '7089', '7011')
# 

### Typical SDJR style data: SHP with multiple map units

# path to SHP
mu.dsn <- 'testing'
# SHP name, without file extension
mu.layer <- 'Mus_for_analysis'
# load data
mu <-  readOGR(dsn=mu.dsn, layer=mu.layer, stringsAsFactors = FALSE)

###


### column with map unit ID / key / symbol
mu.col <- 'MUSYM'


### polygon sampling density (samples / acre / polygon)
# values less < 1 (coarse sampling density) will result in variation between runs, and un-sampled polygons
# values > 10 will result in longer report run times
pts.per.acre <- 2

### quantiles of interest
p.quantiles <- c(0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95)


