# SS2017_Hofmann_Aufgabenblatt3
## Übung 5
## 12. April 2017
### open pdf document.
pdf("SS2017_Hofmann_Aufgabenblatt3.pdf")

print("Übung 5 (ii)")
print("Pgelb = 30%, Pweiss = 25%, Prot = 40%")
print("Berechnung der Wahrscheinlichkeit, dass beim Aussähen von 1000 Samenkörnern zwischen 280 und 330 gelbe Blüten wachsen.")

n = 1000
p = 0.3

result = pbinom(330.5, n, p) - pbinom(279.5, n, p);
print(result)

pnorm(2.1047) - pnorm(-1.4146)

## Übung 6
p = 0.5
n = 1000
xa = 530
xe = 560
x = xa:xe
y = dbinom(x, n, p)

plot(x, y, type = "h", col = "red", lwd = 4, xlim = c(xa, xe), ylim = c(0, 0.0045),
     main = "Normalverteilungsapproximation der Binomialverteilung",
     ylab = "Wahrscheinlichkeiten P(X=x)")

### hold plot
par(new = TRUE)

z = (x - n*p)/sqrt(n * p * (1 - p))

za = (xa - n*p)/sqrt(n * p * (1 - p))
ze = (xe - n*p)/sqrt(n * p * (1 - p))

deltaz = 1/sqrt(n * p * (1 - p))

plot(z, dnorm(z) * deltaz, type = "l", col = "blue", lwd = 2, xlim = c(za, ze), ylim = c(0, 0.0045),
     ylab = "")


## Übung 7

### Auswertung der Formel aus Aufgabenteil (a)

p0 = 0.5
delta = c(0.05, 0.15, 0.25)
p1 = p0 + delta

epsilon = 0.8

alpha1 = 0.01
#n1 = ((sqrt(p0 * (1-p0)) * qnorm(1-alpha1) + n1 * p))
#n2 = ((sqrt(p0 * (1-p0)) * qnorm(1-alpha1) + n1 * p))

#round(rbind(n1,n2), 0)

### Formel für Stetigkeitskorrektur
# ...

# Aufgabenteil b
n = 1001
xc = 538
p1 = 0.55

### Überprüfung kritischer Wert
1 - pbinom(xc, n, p0)
1 - pbinom(xc - 1, n, p0) # dieser Wert passt.
1 - pbinom(xc - 2, n, p0)

### Berechnung der Teststärke
1 - pbinom(xc - 1, n, p1)

## alpha = 1%
n = 109
xc = 68
p1 = 0.65

### Überprüfung kritischer Wert
1 - pbinom(xc, n, p0)
1 - pbinom(xc - 1, n, p0) # dieser Wert passt.
1 - pbinom(xc - 2, n, p0)

### Berechnung der Teststärke
1 - pbinom(xc - 1, n, p1)
1 - pbinom(xc - 2, n, p1) # bei 67 als kritischer Wert würde angestrebte Teststärke besser getroffen


## alpha = 1%
n = 37
xc = 27
p1 = 0.75

### Überprüfung kritischer Wert
1 - pbinom(xc, n, p0)
1 - pbinom(xc - 1, n, p0) # dieser Wert passt.
1 - pbinom(xc - 2, n, p0)

### Berechnung der Teststärke
1 - pbinom(xc - 1, n, p1)
1 - pbinom(xc - 2, n, p1) # bei 67 als kritischer Wert würde angestrebte Teststärke besser getroffen

#####
## alpha = 5%
n = 616
xc = 329
p1 = 0.55

### Überprüfung kritischer Wert
1 - pbinom(xc, n, p0)
1 - pbinom(xc - 1, n, p0) # dieser Wert passt.
1 - pbinom(xc - 2, n, p0)

### Berechnung der Teststärke
1 - pbinom(xc - 1, n, p1)

#####
## alpha = 5%
n = 67
xc = 41
p1 = 0.65

### Überprüfung kritischer Wert
1 - pbinom(xc, n, p0)
1 - pbinom(xc - 1, n, p0) # dieser Wert passt.
1 - pbinom(xc - 2, n, p0)

### Berechnung der Teststärke
1 - pbinom(xc - 1, n, p1)

#####
## alpha = 5%, Effekt 25%
n = 23
xc = 16
p1 = 0.75

### Überprüfung kritischer Wert
1 - pbinom(xc, n, p0)
1 - pbinom(xc - 1, n, p0) # dieser Wert passt.
1 - pbinom(xc - 2, n, p0)

### Berechnung der Teststärke
1 - pbinom(xc - 1, n, p1)