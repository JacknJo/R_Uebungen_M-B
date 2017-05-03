### Output define for plots.
library(ggplot2)
pdf("SS2017_Vorlesung_UebungenInR4.pdf")


# Beispiel Fehlgeburten bei Rhesus-negativen Müttern
## Rechnung 'zu Fuß'
p = 1/6
n = 180
### RHesusNegativ
rhn = 44

beob = c(rhn, n-rhn)
erw = c(p * n, (1 - p) * n)
beob
erw

## Wert der Teststatistiken
xq   = sum((beob - erw) ^ 2 / erw)
xq_c = sum((abs(beob - erw) - 0.5 )^ 2 / erw)

xq
xq_c

### kritischer Wert
qchisq(0.9, 1)

### p-Werte
round (0.5 * (1 - pchisq(xq, 1)), 4)
round (0.5 * (1 - pchisq(xq_c, 1)), 4)

# Routine für alle möglichen Chi-Quadrat-Tests:
## chisq.test(x, y = NULL, correct = TRUE, p, rescale.p = FALSE)
### x: Vektor mit beob Erfolgen und Misserfolgen
### correct = TRUE gibt Stetigkeitskorrektur an (wirkt nur bei 2x2-Tafeln!)
### p: Vektor mit Erfolgs- und Misserfolgswahrscheinlichkeiten unter H0
### rescale.p = TRUE bei Angabe der unter H0 erwarteten Häufigkeiten bei p

# Beispiel Fehlgeburten bei Rhesus-negativen Müttern
## Rechnung mit chisq.test()
p = 1/6
n = 180
### RHesusNegativ
rhn = 44

beob = c(rhn, n-rhn)
erw = c(p * n, (1 - p) * n)
beob
erw

### Falsche Benutzung!
chisq.test(beob, erw/n) 

###?chisq.test()

### Richtige Benutzung ohne Stetigkeitskorrektur
chisq.test(beob, p = erw/n)
chisq.test(beob, p = erw/n, rescale.p = TRUE)

### R - Rechnet zweiseitig und nicht wie 'zu Fuß' einseitig.
### -> manuelles teilen durch 2.

# Multinomialverteilungen in R

## Berechnung der Multinomialwahrscheinlichkeiten
x_star = c(0, 3, 0)
p_null = c(0.7, 0.2, 0.1)

dmultinom(x_star, 3, p_null)

## Berechnung Anzahl der Besetzungsmöglichkeiten
n = 3
k = 3
choose (n + k - 1, k -1)

## Erzeugung von 5 Zufallsvektoren aus Mult(n,p)
n = 10

### Nicht beabsichtigt: Summe > 1.
### Aber intern skaliert.
p = c(0.22, 0.33, 0.55)
p = c(0.22, 0.33, 0.45)
rmultinom(5, n, p)

# Beispiel Skelettanomalien bei Neugeborenen.
library("EMT")

out = multinomial.test(observed = x_star, prob = p_null)
plotMultinom(out)