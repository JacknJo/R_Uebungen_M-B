# Berechnung des kritischen Werts aus dem Beispiel in B2
### Output define for plots.
pdf("SS2017_Vorlesung_UebungenInR2.pdf")

### Binomialverteilung
### ?dbinom

n = 10
p = 1/2

## Einseitiger Test
## Bestimmung des kritischen Wertes durch sukzessives Ausrechnen

### W-keit P(X >= 7) = 1 - P(X <= 6)
1 - pbinom(6, n, p)

### W-keit P(X >= 8) = 1 - P(X <= 7)
1 - pbinom(7, n, p)

### W-keit P(X >= 9) = 1 - P(X <= 8)
1 - pbinom(8, n, p)

### W-keit P(X >= 10) = 1 - P(X <= 9)
1 - pbinom(9, n, p)

## Direkt über Quantilfunktion
### ?qbinom
qbinom(0.95, n, p)

# Darstellung von Binomialwahrscheinlichkeiten 
### Erzeugung eines Vektors von äquidistanten x-Werten
x = 0 : 10
print(x)

seq(0, 10)
seq(0, 10, by = 0.25)

### Berechnung der Binomialwahrscheinlichkeiten
library(ggplot2)
y = dbinom(x, n, p)
plot(x, y)

### Histogram ähnlicher Stil
plot(x, y, type = "h", main="Binomialwahrscheinlichkeiten")
barplot(y, names.arg =x, col = "red", xlab = "x", ylab = "y", main="Binomialwahrscheinlichkeiten", space = 2)

# Andere Verteilungen
## Poisson-Verteilung Po(lambda) - Zählprozess
### Je höher lambda, desto mehr Teilchen
### ?dpois
### dpois(x, lambda)

## Beispiel Poisson Verteilung
### labmda = Varianz und Mittelwert
x = 1:24
y = dpois(x, 8)
plot(x, y, main="Poisson Verteilung")

## Geometrische Verteilung Geo-(p)
### Anzahl der Misserfolge bis zum ersten Erfolg.
### ?dgeom
### dgeom(x, prob)

## Beispiel Geometrische Verteilung
x = 0 : 10
y = dgeom(x, 0.02)
plot(x, y, main = "Geometrische Verteilung")

## Negativ Binomialverteilung Nb-(r;p)
### Anzahl der Misserfolge bis zum r-ten Erfolg. r = size
### ?qnbinom
### dnbinom(x, size, prob)

## Beispiel Negativ Binomialverteilung
x = 0 : 10

### r = 1
y = dnbinom(x, 1, 0.2)
plot(x, y, main="Negativ Binomialverteilung r = 1")

### r = 2
y = dnbinom(x, 2, 0.2)
plot(x, y, main="Negativ Binomialverteilung r = 2")

### r = 3
y = dnbinom(x, 3, 0.2)
plot(x, y, main="Negativ Binomialverteilung r = 3")

## Hypergeometrische Verteilung Geo-(p)
### Anzahl weißer Kugeln bei Ziehung von k Kugeln aus Urne mit m weißen und n schwarzen Kugeln.
### N -> m+n, K->m, n->k
### ?dhyper
### dhyper(x, m, n, k)

## Beispiel Hypergeometrische Verteilung
x = 0:10
### 20 weiße, 30 schwarze
y = dhyper(x, 20, 30, 10)
plot(x,y, main="Hypergeometrische Verteilung")

# Rechnungen zum Beispiel 1 aus B 2
## Normalverteilung
### ?dnorm
### dnorm(x, mean = 0, sd = 1)
### Achtung Angabe der Standardabweichung! NICHT Varianz.

## Beispiel zur Normalverteilung
x = seq(-3, 3, 0.05)
y = dnorm(x, mean = 0, sd = 1)
plot(x,y, main = "Normalverteilung")

n = 1000
p = 0.5

## Exakte Wahrscheinlichkeit
1 - pbinom(529, n, p)

## Normalverteilungsapproximation
### Ohne Stetigkeitskorrektur
1- pnorm((530-n*p)/sqrt(n*p*(1-p)))
### Mit Stetigkeitskorrektur
1 - pnorm((529.5 - n*p)/sqrt(n*p*(1-p)))


## Erzeugung der Tabelle (Beispiel Mädchengeburten)
### Tatsächliche Wahrscheinlichkeit
p = 0.5
### Beobachtete Wahrscheinlichkeit
p_beob = 0.51

### Stichprobengrößen
n = c(100, 1000, 3000, 5000, 10000, 50000)
### Beobachtete Mädchenzahlen
w = n*p_beob
print(w)

### z-Wert durch Normalverteilungsapproximation
### round(mathematisches runden auf spezifizierten NK)
### ceiling(aufrunden auf int), floor(abrunden auf int)
z = round((w -n*p)/sqrt(n*p*(1-p)), 2)
print(z)

pW = round(1-pnorm(z), 4)
print(pW)

tabelle1 = cbind(n, w, z, pW)

### Data Frames:
### Variablen stehen in Spalten, Beobachtungen in Zeilen
tabelle2 = data.frame(n, w, z, pW)

### Einsicht in die von R erzeugten Objekte
### Matrix 'ungewöhnlich' für R
class(tabelle1)
### Data Frame 'besser'
class(tabelle2)

### Nicht nur optisch fast kein Unterschied, auch bei den meisten Rechnungen egal.
print(tabelle1)
print(tabelle2)

### Setzen der Namen
colnames(tabelle2)  = c("N", "Anzahl M", "z-Wert", "p-Wert")
print(tabelle2)

### Get working directory
getwd()

### Set working directory
setwd("/data/Dokumente/Studium/Master/Medizin- und Biostatistik")
getwd()

### csv2: Europäischer csv Standard (Punkt und Kommata)
write.csv2(tabelle2, "Tabelle.csv", row.names = FALSE)

### Rücklesen der gespeicherten Daten
tabelle3 = read.csv2("Tabelle.csv")
print(tabelle3)

### skip überspringt die ersten 3 Zeilen Daten
### header = FALSE: erste Zeile wird nicht als Namen, sondern bereits als Daten interpretiert.
tabelle4 = read.csv2("Tabelle.csv", skip = 3, header = FALSE)
tabelle4

### kritischer Wert - Standardnormalverteilungsquantil
qnorm(0.95)