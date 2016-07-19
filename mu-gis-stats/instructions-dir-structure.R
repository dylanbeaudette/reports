library(data.tree)


davis <- list(name='Davis Server', list(name='geodata/project data/', list(name='MuSum_10m_MSSO/', notes='10m DEM and derivatives'), list(name='MUSum_30m_SSR2/', notes='30m DEM and derivatives'), list(name='MUSum_Curvature/', notes='30m curvature classes'), list(name='MUSum_Geomorphons/', notes='30m landform elements'), list(name='MUSum_PRISM/', notes='800m climate data'), list(name='MUSum_reports/', notes='master copies of reports')))

msso <- list(name='MSSO shared data drive', notes='report runs faster from copies on local disk', list(name='geodata/project data/', list(name='MuSum_10m_MSSO/', notes='10m DEM and derivatives'), list(name='MUSum_30m_SSR2/', notes='30m DEM and derivatives'), list(name='MUSum_Curvature/', notes='30 m curvature classes'), list(name='MUSum_Geomorphons/', notes='30m landform elements'), list(name='MUSum_PRISM/', notes='800m climate data'), list(name='MUSum_reports/', notes='local master copies, do not edit',  list(name='GIS-summary-by-MU.Rmd'), list(name='config.R'), list(name='load-packages.R', notes='run the first time only'))), list(name='geodata/climate/PRISM/', list(name='PRISM_800m/', notes='copy files from MUSum_PRISM for use with other projects')))

local.project <- list(name='Projects', list(name='[SDJR|MLRA Project Name]', list(name='Correlation/'), list(name='Images/'), list(name='Lab/'), list(name='Maps/', list(name='shape files/')), list(name='MUDs/'), list(name='Pedons/'), list(name='Vegetation/'), list(name='MUSum/', notes='local copy of report, set as working directory', list(name='output/', notes='SHP file output here'), list(name='GIS-summary-by-MU.Rmd', notes='"run" this report file'), list(name='config.R', notes='edit as needed for each project'), list(name='load-packages.R'), list(name='mu_polygons/', notes='put input map unit polygon data here (.shp, .gdb)'))))


l <- list(davis, msso, local.project)

dt <- FromListSimple(l, nodeName='Suggested Directory Structure')

sink(file = 'suggested-structure.txt')
print(dt, 'notes')
sink()

