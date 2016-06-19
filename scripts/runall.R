
# runs all R scripts 
# copies and removes files


# ----------------------------------------------------
# Knit Rmd -> md to auto-produce the correct header
# used by all .md files in gh-pages
library(knitr)
opts_chunk$set(include=TRUE, echo=FALSE, message=FALSE)

# the existence of the runall_flag helps with directory issues when 
# knitting the Rmd from this R script
runall_obj <- NULL
knit('index.Rmd', output = 'index.md')
rm(runall_obj) # removes it


# ----------------------------------------------------
# copy files to be used by particpants to the downloads folder

# file.copy(from = "data/load-cell-calibr-L3.csv"
# 					, to = "assets/downloads/")
# file.copy(from = "data/load-cell-calibr-L6.csv"
# 					, to = "assets/downloads/")
# file.copy(from = "assets/images/load-cell-setup.png"
# 					, to = "assets/downloads/")

# copy files used by me to test the report.Rmd
# file.copy(from = "assets/images/load-cell-setup.png"
# 					, to = "reports/")



# ----------------------------------------------------
# cleanup, main directory
unlink(".Rhistory")
unlink("*.html")

# cleanup, assets directory
unlink("assets/*.html")

# cleanup, pages directory
unlink("pages/*.html")

# cleanup, reports directory
unlink("reports/*.html")




