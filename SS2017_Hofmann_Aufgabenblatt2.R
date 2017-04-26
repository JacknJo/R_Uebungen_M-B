# SS2017_Hofmann_Aufgabenblatt3
## Übung 5
## 12. April 2017
### open pdf document.
#pdf("SS2017_Hofmann_Aufgabenblatt2.pdf")

print("Übung 5 (ii)")
print("Pgelb = 30%, Pweiss = 25%, Prot = 40%")
print("Berechnung der Wahrscheinlichkeit, dass beim Aussähen von 1000 Samenkörnern zwischen 280 und 330 gelbe Blüten wachsen.")


n = 1000
p = 0.3


result = pbinom(330.5, n, p) - pbinom(279.5, n, p);
print(result)

pnorm(2.1047) - pnorm(-1.4146)

## Übung 6


## Übung 7
