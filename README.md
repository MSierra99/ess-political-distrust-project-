# Political Distrust and Anti-Immigration Attitudes in Europe

## Overview

This project examines the relationship between political distrust and anti-immigration attitudes across Europe using data from Round 11 of the European Social Survey (ESS).

The project was developed as a reproducible quantitative political science research project focused on political behavior, democratic dissatisfaction, and backlash politics in contemporary Europe.

Using individual-level survey data and regression analysis in R, the project investigates whether individuals who distrust political institutions are more likely to express exclusionary attitudes toward immigration.

---

## Research Question

**Does political distrust predict stronger anti-immigration attitudes in Europe?**

---

## Main Findings

The analysis identifies a strong and consistent positive relationship between political distrust and anti-immigration attitudes across European countries.

Key findings include:

* Individuals with higher levels of political distrust are significantly more likely to express anti-immigration attitudes.
* Right-wing ideological orientation is strongly associated with exclusionary attitudes toward immigration.
* Higher educational attainment is associated with more favorable attitudes toward immigration.
* The relationship between political distrust and anti-immigration attitudes remains statistically significant after controlling for demographic variables, ideology, survey weights, and country fixed effects.

---

## Data

The project uses data from:

**European Social Survey (ESS), Round 11**

The ESS is a cross-national survey measuring political attitudes, social values, and political behavior across European countries.

### Main Variables

#### Political Distrust Index

Constructed from:

* trust in parliament
* trust in politicians
* trust in political parties

#### Anti-Immigration Attitudes Index

Constructed from:

* perceptions of immigration’s economic effects
* perceptions of immigration’s cultural effects
* perceptions of immigration’s effects on the country overall

---

## Methods

The project uses:

* descriptive statistics
* index construction
* weighted OLS regression models
* country fixed effects
* coefficient visualization
* reproducible workflows in R

---

## Repository Structure

```text
ess-political-distrust-project/
│
├── scripts/
│   ├── 01_import_data.R
│   ├── 02_create_indices.R
│   ├── 03_descriptive_analysis.R
│   ├── 04_regression_models.R
│   ├── 05_visualizations.R
│   └── 06_country_fixed_effects.R
│
├── figures/
│   ├── figure1_relationship.png
│   └── figure2_coefficients.png
│
├── tables/
│   └── regression_table.html
│
├── paper/
│   ├── paper_draft.qmd
│   └── paper_draft.docx
│
└── README.md
```

---

## Software and Packages

Analysis conducted using:

* R
* tidyverse
* ggplot2
* haven
* broom
* modelsummary
* Quarto

---

## Reproducibility

To reproduce the analysis:

1. Download ESS Round 11 data from the European Social Survey website.
2. Place the dataset inside the `data/` folder.
3. Run the scripts in numerical order.

---

## Research Areas

* Comparative Politics
* Political Behavior
* Democratic Dissatisfaction
* Backlash Politics
* Immigration Attitudes
* Quantitative Political Science

---

## Author

Mauricio Sierra
