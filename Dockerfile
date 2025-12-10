FROM rocker/tidyverse:4.3.2
WORKDIR /project
COPY . /project

RUN R -e "options(repos = c(CRAN='https://cloud.r-project.org')); install.packages(c('rmarkdown','gt'), Ncpus = parallel::detectCores())"

CMD ["Rscript", "-e", "rmarkdown::render('f1_report.Rmd', output_file='f1_report.html', output_dir='report')"]