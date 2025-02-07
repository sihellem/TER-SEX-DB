[![sihellem - TER-SEX-DB](https://img.shields.io/static/v1?label=sihellem&message=TER-SEX-DB&color=red&logo=github)](https://github.com/sihellem/TER-SEX-DB "Go to GitHub repo")
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

# The Termite Sex Database

# ! UNDER CONSTRUCTION !
_Data will first appear at the publisher of the manuscript as "Supplementary Data" and will then be mirrored on this GitHub page._

## Population sex ratio
Calculate the mean population numerical sex ratio and its associated 95% confidence interval (CI) for frequency-structured data using the productivity-corrected colonial sex ratios. Formulae sensu Bourke & Franks (1995: 160-161).

Bourke A.F.G. & Franks N.R. _Social Evolution in Ants. Monographs in Behavior and Ecology._ (Princeton University Press, 1995).

```
### Get function and data
source(file="R_utilities/population_sr.R")
data <- read.table(file = "toy-data/cavitermes_tuberosus.txt", sep="\t", header = TRUE)
### Discard observations made on 50 or fewer individuals.
sub50 <- subset(data, n_tot > 50)
### Get the Population sex ratio
srpop_bourke(sub50$SRN, sub50$n_tot)
```

Output should be like:
```
> srpop_bourke(sub50$SRN, sub50$n_tot)
$pop_sex_ratio
[1] 0.4921269

$SD
[1] 0.04704284

$LI
[1] 0.4911274

$UI
[1] 0.4931264

$n_nests
[1] 19

$n_indiv
[1] 8510
```

## The Founder-generalized FG model
Model is implemented in the Excel file available with the paper (Supplementary Data 1). The same model is implemented under R under this repository.
```
### Source the model functions
source(file="R_utilities/related_tables.R")
source(file="R_utilities/model_source.R")

### Define the species parameters
my_parameters = c(
  q = 0.06, # proportion of parthenogenetically-produced female alates
  L = 0.1, # sex-linked genome fraction
  u = 0.18, # proportion of sexually-produced neotenic queens
  n.pq.pk = 27, # number of nests with Primary Queen + Primary King
  n.nq.pk = 12, # number of nests with Neotenic Queens + Primary King
  n.nq.nk = 4, # number of nests with Neotenic Queens + Neotenic King
  n.pq.nk = 0 # number of nests with Primary Queen + Neotenic King
)

### FG model predictions
do.call(founder_population_optimum, as.list(my_parameters))
# [1] 0.5217811
```

## How to cite this repository and review
Hellemans S, Bourguignon T, Roisin Y. 2025. Towards a universal understanding of sex ratio in termites.
