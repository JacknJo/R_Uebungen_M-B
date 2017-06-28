### Output define for plots.
library(ggplot2)
#pdf("SS2017_Vorlesung_UebungenInR6.pdf")

## CMH Test in R:
### mantelhaen.test(x, y = NULL, z = NULL, alternative = c("two.sided", "less", "greater"), correct = TRUE, exact = FALSE, conf.level = 0.95)
#### x: 3-dim Kontigenztafel in Form eines Arrays
#### correct = TRUE: führt bei 2x2xk tafeln eine Stetigkeitskorrektur durch.
#### exact = TRUE: führt exakt bedingten Test durch
#### für den besprochenen approximativen Test ist exact = FALSE zu setzen.
#### Output:
#### common odds ratio: MH Schätzwert für OR (falls exact = FALSE)
#### mantelhaen.test()$estimate
#### Konfidenzintervall für common odds ratio.

## Beispiel CHM Test APSAC-Studie
### dim(2x2xStratifizierungsdimensionen!)
### tafel = array(c(3, 11, 86, 69, 6, 8, 67, 63), dim=c(2, 2, 2))
### dimnames(tafel) = list(c("APSAC", "Heparin"), c("verstorben", "überlebt", c("Hinterwand", "Vorderwand"))
### mantelhaen.test(x, correct = FALSE, exact = FALSE)

### spaltenweises einlesen der Daten als array.
tafel = array(c(3, 11, 86, 69, 6, 8, 67, 63), dim=c(2, 2, 2))

### einfache Beschriftung
dimnames(tafel) = list(Therapie = c("APSAC", "Heparin"), Ergebnis = c("verstorben", "überlebt"), Lokation = c("Hinterwand", "Vorderwand"))

### ausgabe der tafel
tafel

ergebnis = mantelhaen.test(x = tafel, alternative = c("two.sided"), correct = FALSE, exact = FALSE)
ergebnis$statistic
ergebnis$estimate
