set.seed(346)

library(ggplot2)
library(readxl)
library(mice)
library(lattice)

bdtest<- read_excel("Tarea 2019S2 - BBDD 2018.xlsx", col_names = TRUE)
bdhist<- read_excel("Tarea 2019S2 - BBDD Historica.xlsx",col_names = TRUE)
bdprediccion <- read_excel("Tarea 2019S2 - PrediccionRequerida.xlsx", col_names = TRUE)

