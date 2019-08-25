set.seed(346)

library(ggplot2)
library(readxl)
library(mice)
library(lattice)
library(dplyr)
library(dummies)
library(corrr)
library(caret)
library(h2o)


bdtest<- read_excel("Tarea 2019S2 - BBDD 2018.xlsx", col_names = TRUE)
bdhist<- read_excel("Tarea 2019S2 - BBDD Historica.xlsx",col_names = TRUE)
bdprediccion <- read_excel("Tarea 2019S2 - PrediccionRequerida.xlsx", col_names = TRUE)

#Se crea una nueva variable asociada a la edad.
bdtest$RANGOEDAD[bdtest$EDAD_ASEGURADO<= 20]<- "Joven"
bdtest$RANGOEDAD[bdtest$EDAD_ASEGURADO >20 & bdtest$EDAD_ASEGURADO <= 60]<- "Adulto"
bdtest$RANGOEDAD[bdtest$EDAD_ASEGURADO > 60]<- "Adulto Mayor"

#Subset solo con "POSIBLE FRAUDE".
fraude <- bdtest[bdtest$CLASE== 'POSIBLE FRAUDE',]

aggregate(DIA_SEMANA~BANCO,fraude,mean)
aggregate(DIA_SEMANA~RANGOEDAD,fraude,sd)
boxplot(fraude$DIA_SEMANA~fraude$RANGOEDAD)
#Test ANOVA
anova1 <- aov(fraude$DIA_SEMANA~fraude$RANGOEDAD)
summary(anova1)
TukeyHSD(anova1)









#Extraer variables id, tipo de seguro, descripción y si era o no fraude en un subset.
bdtest1 <- subset(bdtest, select= c("SIN_ID","TIPO_EMPRESA_SEGURO","CAU_DESCRIPCION","CLASE"))

#Normalizar la base.
bdtest1$CLASE <- as.factor(bdtest1$CLASE)
