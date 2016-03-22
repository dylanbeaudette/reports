## you need all of these packages to run the report

# packages + deps from CRAN
packages.to.get <- c('knitr', 'rmarkdown', 'rgdal', 'raster', 'plyr', 'reshape2', 'aqp', 'soilDB', 'sharpshootR', 'latticeExtra', 'clhs')
res <- sapply(packages.to.get, install.packages, dep=TRUE)

# latest versions from r-forge
install.packages("aqp", repos="http://R-Forge.R-project.org", type="source")
install.packages("soilDB", repos="http://R-Forge.R-project.org", type="source")
install.packages("sharpshootR", repos="http://R-Forge.R-project.org", type="source")

