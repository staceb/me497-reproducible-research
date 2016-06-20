# renders Rmd to md for gh-pages
# copies and removes files
# runs R scripts 

# load my functions
source('scripts/hskp02_housekeeping-functions.R')

# ----------------------------------------------------
# knit Rmd -> md with the correct header for gh-pages
# this requires that the Rmd files DO NOT set knitr root.dir to project-WD
# instead use relative paths from their directories

# list only those directories where knit to md needed
paths_to_search <- c(".", "./pages")

# obtain file names with full paths
Rmd_to_knit <- list.files(path = paths_to_search
													, pattern = "\\.Rmd$"
													, full.names = TRUE)

# for comparison, find all Rmd files in the project
all_Rmd <- list.files(path = "."
													 , pattern = "\\.Rmd$"
													 , full.names = TRUE
													 , recursive = TRUE)

# knit
sapply(Rmd_to_knit, knit_Rmd_to_md)

# print to console
knitted <- all_Rmd %in% Rmd_to_knit
not_knitted <- all_Rmd[!knitted]
cat("\n\nRmd files rendered by runall.R\n", Rmd_to_knit, sep = "\n")
cat("\nRmd files not rendered\n", not_knitted, sep = "\n")






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
