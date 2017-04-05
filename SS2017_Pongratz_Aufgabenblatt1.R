###################
##### Übung 1 #####
###################

pdf("SS2017_Pongratz_Aufgabenblatt1.pdf")

# a)
S_all = 369/1314
S_U45 = 32/628
S_45_54 = 39/208
S_55_64 = 91/236
S_Ü65 = 207/242

# b)
R_all = (139/582)/(230/732)
R_U45 = (19/288)/(13/340)
R_45_54 = (27/130)/(12/78)
R_55_64 = (51/115)/(40/121)
R_Ü65 = (42/49)/(165/193)

# c)
Sterblichkeitsrate = c(S_U45, S_45_54, S_55_64, S_Ü65)
Relatives_Risiko = c(R_U45, R_45_54, R_55_64, R_Ü65)

library(ggplot2)

Matrix_Sterblichkeit = rbind(Sterblichkeitsrate, Relatives_Risiko)
colnames(Matrix_Sterblichkeit) = c("Unter 45", "45-54", "55-64", "Über 65")
Balkendiagramm_Sterblichkeit = barplot(Matrix_Sterblichkeit, col=c("red", "darkblue"), legend = rownames(Matrix_Sterblichkeit), beside=TRUE)


###################
##### Übung 2 #####
###################

"Übung 2"

# a)
pWert_neu_besser_einseitig = 1-pbinom(11, size=16, prob=0.5)
pWert_neu_besser_einseitig
ifelse(pWert_neu_besser_einseitig<=0.05, "Hypothese annehmen", "Hypothese ablehnen")

# b)
pWert_neu_besser_zweiseitig = 1-pbinom(11, size=16, prob=0.5) + pbinom(4, size=16, prob=0.5)
2 * pWert_neu_besser_einseitig
pWert_neu_besser_zweiseitig
ifelse(pWert_neu_besser_zweiseitig<=0.05, "Hypothese annehmen", "Hypothese ablehnen")

o = dev.off()