# Create output/figure_top_winners.png from the CSV
suppressPackageStartupMessages({
  library(tidyverse)
  library(forcats)
})

dir.create("output", showWarnings = FALSE)

f1 <- readr::read_csv("data/winners_f1_1950_2025_v2.csv", show_col_types = FALSE)

top_winners <- f1 %>%
  count(winner_name, name = "Wins", sort = TRUE) %>%
  slice_head(n = 10)

p <- ggplot(top_winners, aes(x = fct_reorder(winner_name, Wins), y = Wins)) +
  geom_col() +
  coord_flip() +
  labs(title = "Top 10 Drivers by Grand Prix Wins (1950–2025)",
       x = "Driver", y = "Total Wins") +
  theme_minimal()

ggsave("output/figure_top_winners.png", p, width = 8, height = 5, dpi = 300)
