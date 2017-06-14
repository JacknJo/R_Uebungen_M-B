# SS2017_Hofmann_Aufgabenblatt4
## Übung8
## 24. Mai 2017
### open pdf document.
#pdf("SS2017_Hofmann_Aufgabenblatt4.pdf")

# b) Exakte Berechnung der Binomialverteilung zum Vergleich der Normalapproximation aus a)
alpha = 0.05
n = 180
p0 = 1/6

### kritischer Wert
# xc = wqrt(n*p0 * (1-p0))

### pWert
xstar = 44
z = (xstar - n* p0 - 0.5)/sqrt(n*p0*(1-p0))
pW = 1 - pnorm(z)
pW

# binom.test()
# Binomialtest in R
# xc = # kritischer Wert!
# 1-pbinom(xc,    n, p0)
# 1-pbinom(xc -1, n, p0) # letzter Wert zum Niveau alpha.
# 1-pbinom(xc -2, n, p0)

### pWert
x_star = 44;
pW = 1 - pbinom(x_star -1, n, p0)
pW

### mit binom.test
binom.test(x_star -1, n, p0, alternative="greater")

### Bestimmung mittels Konfidenzintervall
### Überprüfen, ob behaupteter Wert unter H0 postuliert im Konfidenzintervall liegt.