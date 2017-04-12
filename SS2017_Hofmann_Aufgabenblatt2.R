# SS2017_Hofmann_Aufgabenblatt2
## Übung 3
## 12. April 2017
### open pdf document.
#pdf("SS2017_Hofmann_Aufgabenblatt2.pdf")

print("Übung 3")
u = c("groß", "klein", "alle")
a = c("Studium", "kein Studium", "Studium", "kein Studium", "Studium", "kein Studium")
eP = c(270, 23, 102, 658, 372, 681)
eN = c(61, 2, 129, 621, 190, 623)
s = eP + eN

### Berechnung ProzentPositiv
pP = round(100 * eP/(eP + eN), 2)
### Berechnung ProzentNegativ
pN = round((100 - pP), 2)

### Berechnung des relatives Risikos
### Bezeichne RR jeweils das Verhältnis des Anteils positiver
### Einschätzungen bei "Studium" gegenüber "kein Studium"
rRgross = pP[1] / pP[2]
print("RR großer Unternehmen")
print(rRgross)
print("Fazit: Zufriedenheit deutlich kleiner, wenn Studium absolviert wurde.")
rRklein = pP[3] / pP[4]
print("RR kleiner Unternehmen")
print(rRklein)
print("Fazit: Zufriedenheit deutlich kleiner, wenn Studium absolviert wurde.")
rRges = pP[5] / pP[6]
print("RR aller Unternehmen")
print(rRges)
print("Fazit: Zufriedenheit deutlich größer, wenn Studium absolviert wurde.")
print("GesamtFazit: Aggregierte Betrachtung führt zu entgegengesetztem Resultat: Simpsons Paradoxon!")
### Debug Prints
### print(pP[1])
### print(rRgross)
### print(rRklein)
### print(rRges)

rR = c(rRgross, "", rRklein, "", rRges, "")

tabelle = data.frame(a, eP, eN, s, pP, pN, rR)
colnames(tabelle) = c("Ausbildung", "N pos", "N neg", "sum", "pos [%]", "neg [%]", "Rel Risiko")
print(tabelle)


## Übung 4
## 12. April 2017

print("Übung 4")
### a) Exakte Berechnung:
### https://de.wikipedia.org/wiki/Alphafehler-Kumulierung
### as = 1 - (1 - a)^(1/n)

### b) Näherungs Berechnung:
### as = 1 - (1 - 1/n * a)
### as = 1/n * a

### c) Beispielberechnung: n = 6, a = 0.05
n = 6
a = 0.05
### exakt
asE = 1 - (1 - a)^(1/n)
### Näherung
asN = a / n

print("Exakter und angenäherter Wert in % auf 4 Nachkommastellen")
print(round(100 * asE, 4))
print(round(100 * asN, 4))