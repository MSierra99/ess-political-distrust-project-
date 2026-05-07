# =========================================================
# ESS PROJECT
# 02_create_indices.R
# =========================================================

source("scripts/01_import_data.R")

# ---------------------------------------------------------
# 1. Create political distrust variables
# ---------------------------------------------------------

ess_small <- ess_small %>%
  mutate(
    
    distrust_parliament = 10 - trstprl,
    distrust_politicians = 10 - trstplt,
    distrust_parties = 10 - trstprt
    
  )

# ---------------------------------------------------------
# 2. Create political distrust index
# ---------------------------------------------------------

ess_small <- ess_small %>%
  mutate(
    
    distrust_index = rowMeans(
      select(
        .,
        distrust_parliament,
        distrust_politicians,
        distrust_parties
      ),
      na.rm = TRUE
    )
    
  )

# ---------------------------------------------------------
# 3. Create anti-immigration variables
# ---------------------------------------------------------

ess_small <- ess_small %>%
  mutate(
    
    antiimm_economy = 10 - imbgeco,
    antiimm_culture = 10 - imueclt,
    antiimm_country = 10 - imwbcnt
    
  )

# ---------------------------------------------------------
# 4. Create anti-immigration index
# ---------------------------------------------------------

ess_small <- ess_small %>%
  mutate(
    
    antiimm_index = rowMeans(
      select(
        .,
        antiimm_economy,
        antiimm_culture,
        antiimm_country
      ),
      na.rm = TRUE
    )
    
  )

# ---------------------------------------------------------
# 5. Create analysis weights
# ---------------------------------------------------------

ess_small <- ess_small %>%
  mutate(
    anweight = dweight * pweight
  )

# ---------------------------------------------------------
# 6. Inspect indices
# ---------------------------------------------------------

summary(
  select(
    ess_small,
    distrust_index,
    antiimm_index
  )
)

# ---------------------------------------------------------
# 7. Correlation
# ---------------------------------------------------------

cor(
  ess_small$distrust_index,
  ess_small$antiimm_index,
  use = "complete.obs"
)