## you need all of these packages to run the report

# packages + deps from CRAN
packages.to.get <- c('knitr', 'rmarkdown', 'rgdal', 'raster', 'plyr', 'reshape2', 'aqp', 'soilDB', 'sharpshootR', 'latticeExtra', 'clhs', 'devtools', 'rgeos')
res <- sapply(packages.to.get, install.packages, dep=TRUE)

# latest versions from GitHub
devtools::install_github("ncss-tech/aqp", dependencies=FALSE, upgrade_dependencies=FALSE)
devtools::install_github("ncss-tech/soilDB", dependencies=FALSE, upgrade_dependencies=FALSE)
devtools::install_github("ncss-tech/sharpshootR", dependencies=FALSE, upgrade_dependencies=FALSE)

