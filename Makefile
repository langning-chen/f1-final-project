R = Rscript --vanilla

.PHONY: all install clean

all: f1_report.html

install:
	$(R) -e "options(repos=c(CRAN='https://cloud.r-project.org')); pkgs <- c('tidyverse','gt','forcats','rmarkdown'); to_install <- setdiff(pkgs, rownames(installed.packages())); if(length(to_install)) install.packages(to_install)"

output/table_top_winners.csv: data/winners_f1_1950_2025_v2.csv code/01_make_table.R
	$(R) code/01_make_table.R

output/figure_top_winners.png: data/winners_f1_1950_2025_v2.csv code/02_make_figure.R
	$(R) code/02_make_figure.R

f1_report.html: f1_report.Rmd output/table_top_winners.csv output/figure_top_winners.png
	$(R) -e "rmarkdown::render('f1_report.Rmd', output_format='html_document', output_file='f1_report.html')"

clean:
	rm -f output/table_top_winners.csv output/figure_top_winners.png f1_report.html
