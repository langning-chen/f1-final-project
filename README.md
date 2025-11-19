# F1 Final Project

## Data

The dataset used in this project is **“Winners Formula 1 1950–2025”** from Kaggle.\
It includes information about Formula 1 race winners, circuits, teams, and years.

-   File: `data/winners_f1_1950_2025_v2.csv`
-   The dataset is already included in this repository.

------------------------------------------------------------------------

## How to Build the Final Report

To generate the final HTML report, run the following commands in the Terminal:

\`\`\`bash make install \# one-time package installation make \# builds f1_report.html

This process will: Run code/01_make_table.R to create output/table_top_winners.csv Run code/02_make_figure.R to create output/figure_top_winners.png Render f1_report.Rmd to f1_report.html

## Code Structure

code/01_make_table.R to Generates the summary table of top 10 F1 winners code/02_make_figure.R to Creates the bar chart showing top 10 drivers Makefile to Automates building the project f1_report.Rmd to Combines everything into a final HTML report

## Output

Table: output/table_top_winners.csv Figure: output/figure_top_winners.png Final Report: f1_report.html

## Package environment (renv)

This project uses the **renv** package to manage the R package versions.

To synchronize the package environment before building the report, run:
make install

This command will run renv::restore() and install the packages recorded in renv.lock.