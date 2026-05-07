# =========================================================
# ESS PROJECT
# 03_descriptive_analysis.R
# =========================================================

source("scripts/01_import_data.R")
source("scripts/02_create_indices.R")

library(ggplot2)

# ---------------------------------------------------------
# 1. Descriptive statistics
# ---------------------------------------------------------

ess_small %>%
  summarise(
    
    mean_distrust = mean(distrust_index, na.rm = TRUE),
    
    sd_distrust = sd(distrust_index, na.rm = TRUE),
    
    mean_antiimm = mean(antiimm_index, na.rm = TRUE),
    
    sd_antiimm = sd(antiimm_index, na.rm = TRUE)
    
  )

# ---------------------------------------------------------
# 2. Histogram:
# Political Distrust
# ---------------------------------------------------------

ggplot(
  ess_small,
  aes(x = distrust_index)
) +
  
  geom_histogram(
    bins = 30
  ) +
  
  labs(
    title = "Distribution of Political Distrust in Europe",
    x = "Political Distrust Index",
    y = "Respondents"
  ) +
  
  theme_minimal()

# ---------------------------------------------------------
# 3. Histogram:
# Anti-Immigration Attitudes
# ---------------------------------------------------------

ggplot(
  ess_small,
  aes(x = antiimm_index)
) +
  
  geom_histogram(
    bins = 30
  ) +
  
  labs(
    title = "Distribution of Anti-Immigration Attitudes",
    x = "Anti-Immigration Index",
    y = "Respondents"
  ) +
  
  theme_minimal()