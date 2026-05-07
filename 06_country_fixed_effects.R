# =========================================================
# ESS PROJECT
# 06_country_fixed_effects.R
# =========================================================

source("scripts/01_import_data.R")
source("scripts/02_create_indices.R")
source("scripts/04_regression_models.R")

library(modelsummary)
library(broom)

# ---------------------------------------------------------
# 1. Country fixed effects model
# ---------------------------------------------------------

model_fe <- lm(
  antiimm_index ~
    distrust_index +
    agea +
    gndr +
    eisced +
    lrscale +
    factor(cntry),
  
  data = ess_small,
  
  weights = anweight
)

summary(model_fe)

# ---------------------------------------------------------
# 2. Compare models
# ---------------------------------------------------------

modelsummary(
  list(
    "Baseline Model" = model5,
    "Country Fixed Effects" = model_fe
  ),
  
  stars = TRUE,
  
  coef_omit = "factor\\(cntry\\)",
  
  coef_map = c(
    "distrust_index" = "Political Distrust",
    "agea" = "Age",
    "gndr" = "Gender",
    "eisced" = "Education",
    "lrscale" = "Right-Wing Ideology"
  ),
  
  output = "tables/regression_table.html"
)

# ---------------------------------------------------------
# 3. Coefficient dataset
# ---------------------------------------------------------

coef_fe <- tidy(model_fe) %>%
  
  filter(
    !str_detect(term, "factor")
  ) %>%
  
  filter(
    term != "(Intercept)"
  )

# ---------------------------------------------------------
# 4. Coefficient plot
# ---------------------------------------------------------

figure2 <- ggplot(
  coef_fe,
  aes(
    x = estimate,
    y = reorder(term, estimate)
  )
) +
  
  geom_point(size = 3) +
  
  geom_errorbarh(
    aes(
      xmin = estimate - 1.96 * std.error,
      xmax = estimate + 1.96 * std.error
    ),
    height = 0.2
  ) +
  
  geom_vline(
    xintercept = 0,
    linetype = "dashed"
  ) +
  
  labs(
    title = "Country Fixed Effects Model",
    subtitle = "Weighted OLS Regression",
    x = "Coefficient Estimate",
    y = ""
  ) +
  
  theme_minimal()

figure2

# Export Figure 2

ggsave(
  "figures/figure2_coefficients.png",
  plot = figure2,
  width = 6.5,
  height = 4
)