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