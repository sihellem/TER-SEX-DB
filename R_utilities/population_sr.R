#!/usr/bin/env Rscript

## How to execute
# srpop_bourke(data$SR, data$n_tot)
# SR should be: colonial sex ratio as a proportion of females: F/(M+F)
# n_tot should be: total number of individuals in the colony (M+F)

## Implemented from
# Bourke A.F.G. & Franks N.R.
# Social Evolution in Ants. Monographs in Behavior and Ecology.
# Princeton University Press, 1995.

## Population sex ratio function
srpop_bourke <- function(SR, ntot) {
  ######## Metrics
  n.nests <- length(SR)
  mean.pop <- mean(ntot)
  sum.pop <- sum(ntot)
  ######## Population sex ratio
  # Bourke & Franks, 1995: p.160
  freq <- (ntot/mean.pop)
  freq.SR <- (freq*SR)
  pop.SR <- sum(freq.SR)/sum(freq)
  ######## Standard deviation on the sex ratio
  # Bourke & Franks, 1995: p.161
  freq.SR.SR <- (freq*SR*SR)
  Term1 <- (sum(freq.SR.SR)/(sum(freq)-1))
  Term2 <- ((sum(freq.SR))^2)/(sum(freq)*(sum(freq)-1))
  SD <- sqrt(Term1 - Term2)
  ######## Confidence interval
  # Lower LI
  LI <- pop.SR - 1.96*(SD/sqrt(sum.pop))
  # Upper UI
  UI <- pop.SR + 1.96*(SD/sqrt(sum.pop))
  ######## OUTPUT
  out <- list(
    pop_sex_ratio = pop.SR, 
    SD = SD, 
    LI = LI, 
    UI = UI, 
    n_nests = n.nests, 
    n_indiv = sum.pop)
  return(out)
}
