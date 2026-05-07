# =========================================================
# ESS PROJECT
# 04_regression_models.R
# =========================================================

source("scripts/01_import_data.R")
source("scripts/02_create_indices.R")

library(modelsummary)
library(broom)

# ---------------------------------------------------------
# 1. Model 1
# ---------------------------------------------------------

model1 <- lm(
  antiimm_index ~ distrust_index,
  data = ess_small
)

summary(model1)

# ---------------------------------------------------------
# 2. Model 2
# ---------------------------------------------------------

model2 <- lm(
  antiimm_index ~
    distrust_index +
    agea +
    gndr +
    eisced,
  
  data = ess_small
)

summary(model2)

# ---------------------------------------------------------
# 3. Model 3
# ---------------------------------------------------------

model3 <- lm(
  antiimm_index ~
    distrust_index +
    agea +
    gndr +
    eisced +
    lrscale,
  
  data = ess_small
)

summary(model3)

# ---------------------------------------------------------
# 4. Weighted model
# ---------------------------------------------------------

model5 <- lm(
  antiimm_index ~
    distrust_index +
    agea +
    gndr +
    eisced +
    lrscale,
  
  data = ess_small,
  
  weights = anweight
)

summary(model5)

# ---------------------------------------------------------
# 5. Regression table
# ---------------------------------------------------------

modelsummary(
  list(
    "Model 1" = model1,
    "Model 2" = model2,
    "Model 3" = model3,
    "Weighted Model" = model5
  ),
  
  stars = TRUE
)

# ---------------------------------------------------------
# 6. Clean coefficients
# ---------------------------------------------------------

tidy(model5)