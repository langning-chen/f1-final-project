# Create output/table_top_winners.csv from data CSV
suppressPackageStartupMessages({
  library(tidyverse)
})

dir.create("output", showWarnings = FALSE)

f1 <- readr::read_csv("data/winners_f1_1950_2025_v2.csv", show_col_types = FALSE)

top_winners <- f1 %>%
  count(winner_name, name = "Wins", sort = TRUE) %>%
  slice_head(n = 10)

readr::write_csv(top_winners, "output/table_top_winners.csv")
