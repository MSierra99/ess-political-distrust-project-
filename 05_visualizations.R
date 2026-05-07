# =========================================================
# ESS PROJECT
# 05_visualizations.R
# =========================================================

source("scripts/01_import_data.R")
source("scripts/02_create_indices.R")
source("scripts/04_regression_models.R")

library(ggplot2)

# ---------------------------------------------------------
# 1. Scatterplot
# ---------------------------------------------------------

figure1 <- ggplot(
  ess_small,
  aes(
    x = distrust_index,
    y = antiimm_index
  )
) +
  
  geom_point(
    alpha = 0.02
  ) +
  
  geom_smooth(
    method = "lm"
  ) +
  
  labs(
    title = "Political Distrust and Anti-Immigration Attitudes in Europe",
    subtitle = "European Social Survey Round 11",
    x = "Political Distrust Index",
    y = "Anti-Immigration Index"
  ) +
  
  theme_minimal()

figure1

# Export Figure 1

ggsave(
  "figures/figure1_relationship.png",
  plot = figure1,
  width = 7,
  height = 5
)

# ---------------------------------------------------------
# 2. Predicted values plot
# ---------------------------------------------------------

prediction_data <- tibble(
  
  distrust_index = seq(
    from = 0,
    to = 10,
    by = 0.1
  ),
  
  agea = mean(ess_small$agea, na.rm = TRUE),
  
  gndr = 1,
  
  eisced = mean(ess_small$eisced, na.rm = TRUE),
  
  lrscale = mean(ess_small$lrscale, na.rm = TRUE)
)

prediction_data$predicted_antiimm <- predict(
  model5,
  newdata = prediction_data
)

ggplot(
  prediction_data,
  aes(
    x = distrust_index,
    y = predicted_antiimm
  )
) +
  
  geom_line(
    linewidth = 1.2
  ) +
  
  labs(
    title = "Predicted Anti-Immigration Attitudes",
    subtitle = "Holding Controls Constant",
    x = "Political Distrust Index",
    y = "Predicted Anti-Immigration Attitudes"
  ) +
  
  theme_minimal()