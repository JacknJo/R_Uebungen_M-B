# SS2017_Hofmann_Aufgabenblatt1
## Übung 1
### open pdf document.
pdf("SS2017_Hofmann_Aufgabenblatt1.pdf")

## a)
print('Aufgabe 1a')
sGesamt = 369 / 1314 * 100
s1 = 32 / 628
s2 = 39 / 207
s3 = 91 / 236
s4 = 207 / 242

## b)
print('Aufgabe 1b')
rGesamt = (139/582)/(230/732)
r1 = (19/288)/(13/340)
r2 = (27/130)/(12/78)
r3 = (51/115)/(40/121)
r4 = (42/49)/(165/193)

## c)
### alternativ: rbind
### alternativ: legend

print('Aufgabe 1c')
library(ggplot2)
data = matrix(c(s1, s2, s3, s4, r1, r2, r3, r4), ncol = 4, byrow = TRUE)
rownames(data) = c("Sterblichkeitsrate", "Relatives Sterberisiko")
colnames(data) = c("unter 45", "45 bis 54", "55 bis 64", "über 65")
data = as.table(data)
data
### https://de.wikibooks.org/wiki/GNU_R:_barplot
barplot(data, legend = c("Sterblichkeitsrate", "Relatives Sterberisiko"),
        col = c("red", "darkblue"), beside = TRUE, xlab = "Altersgruppe")

## Übung 2

## a)
### H0 Hypothese: Das neue Mittel ist nicht wirksamer als Placebo.
### H1 Hypothese: Das neue Mittel ist in Bezug auf die
###               Blutdrucksenkung wirksamer als das Placebo.
print('Aufgabe 2a - Einseitiger Test')
print('Berechnung mit dbinom:')
p = dbinom(12,16,0.5) + dbinom(13,16,0.5) + dbinom(14,16,0.5) + dbinom(15,16,0.5) + dbinom(16,16,0.5)
print(p)

print('Berechnung mit pbinom:')
p = 1- pbinom(11, 16, 0.5)
print(p)

## b)
print('Aufgabe 2b - Zweiseitiger Test')
print('Berechnung mit dbinom:')
### >= 12
p = dbinom(12,16,0.5) + dbinom(13,16,0.5) + dbinom(14,16,0.5) + dbinom(15,16,0.5) + dbinom(16,16,0.5)
### <= 4
p = p + dbinom(0,16,0.5) + dbinom(1,16,0.5) + dbinom(2,16,0.5) + dbinom(3,16,0.5) + dbinom(4,16,0.5)
print(p)

### Option: lower.tail = FALSE spart 1 - xxx
print('Berechnung mit pbinom:')
p = 1 - pbinom(11, 16, 0.5) + pbinom(4, 16, 0.5)
print(p)

### close pdf document.
o = dev.off()