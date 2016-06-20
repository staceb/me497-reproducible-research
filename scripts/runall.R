# renders Rmd to md for gh-pages
# copies and removes files
# runs R scripts 

# ----------------------------------------------------
# Knit Rmd -> md to produce the correct header
# used by all .md files in gh-pages
library(knitr)
library(stringr)
opts_chunk$set(include=TRUE, echo=FALSE, message=FALSE)

knit_Rmd_to_md <- function(file_name) {
  input  <- file_name
  output <- str_replace(file_name, '.Rmd', '.md')
  knit(input = input, output = output)
}

# obtain list of all Rmd files in project and knit them all to .md
Rmd_files <- list.files(path = ".", pattern = "\\.Rmd$", recursive = TRUE)
sapply(Rmd_files, render_Rmd_to_md)





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


# ----------------------------------------------------
# try render
# library(rmarkdown)
# render('index.Rmd', clean = FALSE) # creates md
# library(readr)
# file_lines <- read_file('index.md')
# 
# 
# new_header <- "---\nlayout: page\ntitle:  reproducible research\ntagline: for the R novice\n---"
# 
# cat(new_header, file = 'index.md', append = FALSE)
# cat('\n\n',     file = 'index.md', append = TRUE)
# cat(file_lines, file = 'index.md', append = TRUE, sep = '')

# render_Rmd_gh_pages <- function (file_name) {
#   # adding input-output suffixes to filename
#   input <- paste0(file_name, '.Rmd')
#   output <- paste0(file_name, '.md')
#   knit(input = input, output = output)
#   
#   # find the header lines to omit
#   md_lines <- read_lines(output)
#   idx_begin <- grep('output:', md_lines)
#   idx_dashes <- grep('---', md_lines)
#   idx_end <- idx_dashes[idx_dashes > idx_begin][1]-1
#   md_lines <- md_lines[-(idx_begin:idx_end)]
#   writeLines(text = md_lines, con = output, sep = "\n")
# }

# render_Rmd_gh_pages('index')
# render_Rmd_gh_pages('pages/02-agenda')

# the existence of the runall_flag helps with directory issues when 
# knitting the Rmd from this R script
# proj_dir   <- 'me497-reproducible-research'
# runall_obj <- NULL
# knit('index.Rmd', output = 'index.md')
# knit('pages/02-agenda.Rmd', output = 'pages/02-agenda.md')
# rm(runall_obj) # removes it
