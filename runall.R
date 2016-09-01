# render Rmd to create md 
# create gh-pages from Rmd
# move and copy files 
# delete byproduct files

# load plyr before dplyr 
library(plyr)
suppressMessages(library(dplyr))
library(rmarkdown)
library(stringr)
library(readr)
library(knitr)

# function for editing the md header 
#     Extract header from an Rmd file
#     collect with the existing md file too.
#     md file must already exist in scripts, created by Rmd header

Rmd_to_gh_pages <- function(Rmd_file) {
	
	# replace Rmd only when it is at the end of the file name
	md_file <- str_replace(Rmd_file, 'Rmd$', 'md')
	
	# read both files
	Rmd_source_file <- read_lines(Rmd_file)
	md_source_file  <- read_lines(md_file) # originally created by the Rmd file
	
	# change md_file path from scripts to pages
	# md_file <- str_replace(md_file, 'scripts', 'pages')
	
	# from the Rmd file, extract just the lines I want for the gh-page.md header
	# start by finding the line numbers of the first two sets of dashes
	header_limits <- grep("---", Rmd_source_file)[1:2]
	
	# extract the header lines, including dashes
	starting_lines <- Rmd_source_file[header_limits[1]:header_limits[2]]
	
	# keep title and tagline and bib
	i_title   <- grep("title",   starting_lines)
	i_tagline <- grep("tagline", starting_lines)
	i_bib     <- grep("bibliography", starting_lines)
	title_and_tagline <- starting_lines[c(i_title, i_bib, i_tagline)]
	
	# remove the first # heading-1 line from the md file
	i_hashtag <- grep("#",  md_source_file)[1]
	md_source_file <- md_source_file[-i_hashtag]
	
	# print to file
	cat(c("---", "layout: page")
			, file = md_file, sep = '\n')
	cat(title_and_tagline
			, file = md_file, sep = '\n', append = TRUE)
	cat(c("---")
			, file = md_file, sep = '\n', append = TRUE)
	cat(md_source_file
			, file = md_file, sep = '\n', append = TRUE)
}

# render Rmd scripts for pages
Rmd_page_scripts <- list.files(path = "pages"
													, pattern = "\\.Rmd$"
													, full.names = TRUE
													)
sapply(Rmd_page_scripts, function(x) render(x))

# edit the md header for gh-pages
sapply(Rmd_page_scripts, failwith(NULL, Rmd_to_gh_pages))

# render index and move to main directory
render("scripts/index.Rmd")
sapply("scripts/index.Rmd", failwith(NULL, Rmd_to_gh_pages))
file.rename(from = 'scripts/index.md', to = './index.md')



# render Rnw for slides, uses knitr::knit2pdf
Rnw_slide_scripts <- list.files(path = "slides"
															 , pattern = "\\.Rnw$"
															 , full.names = TRUE
)
# create output file names
tex_slide_files <- str_replace(Rnw_slide_scripts, 'Rnw$', 'tex')
# knit2pdf, knits to tex
sapply(Rnw_slide_scripts, function(x) knit2pdf(input = Rnw_slide_scripts, output = tex_slide_files))







# delete R byproducts
unlink(".Rhistory")

# delete html byproducts
unlink("*.html")
unlink("data/*.html")
unlink("pages/*.html")
unlink("scripts/*.html")

# delete tex byproducts
unlink("slides/*.toc")
unlink("slides/*concordance*")
unlink("slides/*.snm")
unlink("slides/*.nav")
unlink("slides/*.gz")
unlink("slides/*.log")
unlink("slides/*.aux")
unlink("slides/*.out")
unlink(tex_slide_files)













# # copy participant files to the downloads folder
# file.copy(from = "data/007_wide-data.csv"
# 					, to = "resources/downloads/"
# )
# file.copy(from = "data/008_wide-data_6-cycles.csv"
# 					, to = "resources/downloads/"
# )
# file.copy(from = "resources/images/load-cell-setup-786x989px.png"
# 					, to = "resources/downloads/"
# )
# # copy image up one level for my Rmds that mimic the student files
# file.copy(from = "resources/images/load-cell-setup-786x989px.png"
# 					, to = "resources/"
# )
# # copy word template one level up
# file.copy(from = "resources/docs/mystyles-01.docx"
# 					, to = "resources/"
# )



# compile slides, html is the output
# library(rmarkdown)
# render("slides/slides_session_01.Rmd")
# render("slides/slides_session_02.Rmd")




# unlink("scripts/*.md")
# # files to omit
# omit_files <- list.files(path = "scripts"
# 											, pattern = "_calibr_"
# 											, full.names = TRUE
# )
# omit_files <- c(omit_files, list.files(path = "scripts"
# 												 , pattern = "999"
# 												 , full.names = TRUE
# 												 )
# 								)
# Rmd_scripts <- Rmd_scripts[! Rmd_scripts %in% omit_files]

# last line
