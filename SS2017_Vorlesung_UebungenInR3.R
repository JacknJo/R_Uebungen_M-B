### Output define for plots.
library(ggplot2)
pdf("SS2017_Vorlesung_UebungenInR3.pdf")

# Stetige Verteilung

## Normalverteilung
x = seq(-3, 3, by = 0.05)
y = dnorm(x, 0, 1)

plot(x,y, main="Dichte der Uniformen Verteilung auf [-3,3]", lwd = 2, col = "red")


## Uniforme Verteilung()
x = seq (-3, 3, by = 0.05)
y = dunif(x, -3, 3)

plot(x,y, main="Dichte der Uniformen Verteilung auf [-3,3]", lwd = 2, col = "red")

## Exponential Verteilung(lambda); lambda = rate
x = seq(0, 3, by = 0.05)
y1 = dexp(x, 1)
y2 = dexp(x, 2)

plot(x, y1, lwd = 2, col = "blue", main = "Dichte der Exponentialverteilung")
par(new = TRUE)
plot(x, y2, lwd = 2, col = "red", main = "Dichte der Exponentialverteilung")

legend("topright", c("lambda = 1", "lambda = 2"), col = c("red", "blue"), lty = 1, lwd = 2)

## Gammaverteilung (alpha, lambda); alpha = scale, lambda = rate
### Gamma mit scale = 1 gleicht der Exponentialverteilung
x = seq(0, 3, by = 0.05)
y1 = dgamma(x, 1, 1)
y2 = dgamma(x, 1, 2)

plot(x, y1, lwd = 2, col = "blue", main = "Dichte der Gammaverteilung mit scale = 1")

## Chi-Quadrat Verteilung aus Gammaverteilung herleitbar (Spezialfall: alpha = n/2 und rate = 1/2)
### Parameter der Verteilung: n = Anzahl der Freiheitsgrade.
### dchisq(x, df, ncp = 0) lambda = ncp, df = degrees of freedom

## t-Verteilung
### Verallgemeinerung der Standardnormalverteilung
### t-Verteilung konvergiert für lim_n->inf(dt(n)) gegen Normalverteilung
### R-Befehl df(n)

## f-Verteilung
### R-Befehl df(n,m)

# Bespiel Bortz - Aspestbelastung

n = 7
p = 0.25

### Bestimmung des p-Wertes
pW = 1 - pbinom(4,n,p) ### 5 Fälle werden beobachtet

## Kritischer Wert
1 -pbinom(3,n,p) ### Überprüfung, ob 4 kritischer Wert ist

## Teststärke für p1 = 0.5
1 -pbinom(4,n,0.5)

## 50 von 70 Todesfälle durch Krebs verursacht
n = 70
p = 0.25

## Bestimmung p-Wert
pw = 1 - pbinom(49, n, p) # 50 Fälle werden beobachtet

## Kritischer Wert

1 - pbinom(23, n, p) ### Überprüfung ob 24 kritischer Wert ist
1 - pbinom(24, n, p) ### Überprüfung ob 25 kritischer Wert ist

## Teststärke für p1 = 0.5
1 - pbinom (24, n, 0.5)

# Berechnung mit Normalverteilungsapproximation

## Ermittlung der Teststärke
n = 70
p = 0.25
x = 50

zc = qnorm(0.95)

xc = zc * sqrt(n*p*(1-p) + n*p)

(xc - n * 0.5)/sqrt(n * 0.5 * 0.5)

1 - pnorm((xc - n*0.5))/sqrt(n * 0.5 * 0.5)

## Grafische Darstellung d Gütefunktionen

p = seq(0, 1, 0.005)

G7 = 1 - pbinom(4, 7, p)
G70 = 1 - pbinom(24, 70, p)

plot ( p, G7, lwd = 2, type = "l", col = "red", ylab = "G(p)", xlab = "p", main = "Gütefunktion für einseitigen Binomialtest")

par(new = TRUE)
plot ( p, G70, lwd = 2,type = "l", col = "blue")

abline(v = 0.25, col = "green4")
abline(v = 0.5, col = "chocolate")
abline(h = 0.0)
abline(h = 0.05, col = "green4")

legend("topleft", c("n = 7", "n = 70"), col = c("red", "blue"), lty = 1, lwd = 1)

## Versuchsweise kritischer Wert um eins geringer:
G7 = 1 - pbinom(3, 7, p)
G70 = 1 - pbinom(23, 70, p)

par(new = TRUE)
plot ( p, G7, lwd = 2, type = "l", col = "orange2", ylab = "G(p)", xlab = "p", main = "Gütefunktion für einseitigen Binomialtest")
par(new = TRUE)
plot ( p, G70, lwd = 2,type = "l", col = "lightblue", ylab = "")

# Binomialtest in R

## Besipiel Todesfälle durch Krebs im Wohnhaus

n = 7
p = 0.25
x = 5

binom.test(x, n, p, alternative = "greater")

### sample estimate - Beobachtete Erfolgswahrscheinlichkeit: 5/7
### 95% confidence interval - Konfidenzintervall für Erfolgswahrscheinlichkeit
### p 0.25 nicht plausibel in Konfidenzintervall

### Hier angegeben: Konfidenzniveau = 1 - Signifikanzniveau (alpha).
### binom.test(x, n, p = 0.5, alternative = c("two.sided", "less", "greater"), conf.level = 0.95)