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

## kxm - Felder Chi-Quadrat-Test in R
### chisq.test(x, y = NULL, correct = TRUE, p, rescale.p = FALSE)
### x: matrix der kxm Felder-Tafel
### correct = TRUE: Stetigkeitskorrektur nur bei 2x2 Feldertafeln.
### chisq.test()$estimated: unter H0 erwartete Häufigkeiten
### (chisq.test()$residuals)^2: einzelne Summanden der Teststatistik

tafel = matrix(c(28, 9, 3, 17, 1, 2, 5, 0, 25), 3, 3, byrow = TRUE)
dimnames(tafel) = list(c("Staphylokokken", "Streptokokken", "Pseudomonas aeruginos"), c("sehr positiv", "positiv", "negativ"))

tafel
### Warnung, da Erwartungswerte < 5.
chisq.test(tafel, correct = TRUE)
chisq.test(tafel)
chisq.test(tafel)$expected
(chisq.test(tafel)$residuals)^2


## McNemar Test in R
### mcnemar.test(x, y = NULL, correct = TRUE)
### x: Matrix der Vierfeldertafel
### correct = TRUE: Stetigkeitskorrektur
### implementiert ist der zweiseitige Test

tafel = matrix(c(9, 15, 4, 10), 2, 2, byrow = TRUE)
dimnames(tafel) = list(c("A: starke Wirkung", "B: starke Wirkung"), c("A: geringe Wirkung", "B: geringe Wirkung"))
tafel
mcnemar.test(tafel, correct = TRUE)
mcnemar.test(tafel, correct = FALSE)

## Mediantest in R
isol = c(1, 4, 1, 2, 2, 1, 5, 1, 2)
integ = c(1, 4, 4, 1, 3, 2, 4, 4, 5, 4, 4)

med = median(c(isol, integ))
med

n11 = sum(isol  > med)
n12 = sum(integ > med)
n21 = sum(isol  < med)
n22 = sum(integ < med)

tafel = matrix(c(n11, n12, n21, n22), 2, 2, byrow = TRUE)
dimnames(tafel) = list(c("größer MED", "kleiner MED"), c("isoliert", "nicht isoliert"))

dchisq(0.9, 1)

chisq.test(tafel, correct = TRUE)
chisq.test(tafel)$expected

### einseitig
fisher.test(tafel, alternative = "less")
