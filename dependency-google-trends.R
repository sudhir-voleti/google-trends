# update.packages(ask = FALSE)
try(require("shiny")||install.packages("shiny"))
try(require("reshape2")||install.packages("reshape2"))
try(require("xts")||install.packages("xts"))

try(require("devtools")||install.packages("devtools"))
library("devtools")
try(require("gtrendsR")||install_github("PMassicotte/gtrendsR"))
try(require("xtsExtra")||install_github("R-Finance/xtsExtra"))


library("shiny")
library("gtrendsR")
library("reshape2")
library("xts")
library("xtsExtra")
