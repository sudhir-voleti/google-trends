# update.packages(ask = FALSE)
try(require("shiny")||install.packages("shiny"))
try(require("reshape2")||install.packages("reshape2"))

try(require("devtools")||install.packages("devtools"))
library("devtools")
try(require(install_github("PMassicotte/gtrendsR")))

library("shiny")
library("gtrendsR")
library("reshape2")

