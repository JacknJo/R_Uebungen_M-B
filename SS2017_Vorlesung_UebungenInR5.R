### Output define for plots.
library(ggplot2)
pdf("SS2017_Vorlesung_UebungenInR5.pdf")

## Beispiel Fisher-Yates-Test
### Komplett manuelle Berechnung über hypergeometrische W-keiten
choose(7,4)
choose(8,1)
choose(15,5)

pStar = choose(7,4) * choose(8,1) / choose(15,5)
pStar
dhyper (4,7,8,5)

choose(7,5)
choose(8,0)
choose(15,5)

n_11 = 0:5
p = dhyper(n_11, 7,8,5)
plot(n_11, p, type="h", col = "red", lwd=5, main = "Hypergeometrische Wahrscheinlichkeiten")
abline (h=dhyper(4,7,8,5), col = "blue", lwd = 3, lty = 2)

tafel = matrix(c(4,1,3,7), 2, 2, byrow=TRUE)
dimnames(tafel) = list(c("Typhus", "Paratyphus"), c("pos", "neg"))

tafel
### einseitiger Teset
fisher.test(tafel, alternative="greater")

### zweiseitiger Test
fisher.test(tafel)

### Hinweis:
### Odds ratio wird anders geschätzt, als manuell herleitbar.
### Hier gibt es einen Unterschied zwischen R-Schätzung und händischer.


## Chi Quadrat Test in R

#### chisq.test(x, y = NULL, correct = TRUE, p, rescale.p = FALSE)
#### x matrix der 2x2 Felder Tafel
#### p Vektor mit den W-keiten für einzelne Kategorien unter H0
#### correct = TRUE führt bei den Vierfeldertafeln eine Stetigkeitskorrektur durch
#### angehängtes $expected gibt die unter H0 erwarteten Häufigkeiten aus.


tafel = matrix(c(5, 5, 6, 24), 2,2, byrow = TRUE)
dimnames(tafel) = list(c("hoch", "niedrig"), c("7-12", "13-18"))

tafel

chisq.test(tafel, correct=FALSE)
chisq.test(tafel)
chisq.test(tafel)$expected

fisher.test(tafel)
#### Hinweis: Odds ratio wieder etwas niedriger als manuelle Schätzung.

## Freeman-Halton-Test in R

#### fisher.test(x, alternative="two.sided")
#### x: betrachtete kx2 Tafel in Form einer Matrix.

### Berechnung zu Fuß
#### Berechnung der Wahrscheinlichkeit p in abhängigkeit von beiden Freiheitsgraden n1, n2
#### return = ptafel;

#### Frage: Welche der 18 möglichen Tafeln hat eine Wahrscheinlichkeit <= 2.1
#### -> 9stk
#### Summe = 8.82%

### Mit R implementierten Test
tafel = matrix(c(0,6,3,5,2,1), 3, 2, byrow = TRUE)
dimnames(tafel) = list(c("gut", "mäßig", "unbefriedigend"), c("Zwang", "Angst"))
tafel

fisher.test(tafel)
# auch transponierte tafel kann genommen werden
fisher.test(t(tafel))

## Berechnung der Trendalternativhypothese
#komb sind alle tafeln, die man betrachten muss = kombination aller beiden Freiheitsgraden
# trend = 10 - komb[,1]+komb[,2]
# trend
# which(trend >= 12)

# komb[which(trend) >= 12),]

### ausgabe aller extremerer tafeln (Ausgangstafel noch enthalten)
### Berechnung des p-Wertes durch funktion(n1, n2)
### pWert = summe der einzelnen pWerte.


## kx2 Felder-Chi-Quadrat-Test in R
### chisq.test(x, y=NULL, correct=TRUE, rescale.p=FALSE)
#### $expected: unter H0 erwartete Häufigkeiten
#### $resuduals: einzelne Summanden der Teststatistik
tafel = matrix(c(30,25,60,55,61,93), 3, 2, byrow = TRUE)
dimnames(tafel) = list(c("Hebephrene", "Katakone", "Paranoide"), c("m", "w"))
tafel

chisq.test(tafel)
round(chisq.test(tafel)$expected, 1)
round((chisq.test(tafel)$residuals)^2, 2)