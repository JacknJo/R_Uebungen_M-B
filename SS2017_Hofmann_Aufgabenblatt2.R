# SS2017_Hofmann_Aufgabenblatt2
## Übung 3
## 12. April 2017
### open pdf document.
#pdf("SS2017_Hofmann_Aufgabenblatt2.pdf")

u = c("groß", "klein", "alle")
a = c("Studium", "kein Studium", "Studium", "kein Studium", "Studium", "kein Studium")
eP = c(270, 23, 102, 658, 372, 681)
eN = c(61, 2, 129, 621, 190, 623)

### Berechnung ProzentPositiv
pP = round(100 * eP/(eP + eN), 2)
### Berechnung ProzentNegativ
pN = round((100-pP),2)
### Berechnung des relatives Risikos
rRgross = pP[1] / pP[2]
rRklein = pP[3] / pP[4]
rRges = pP[5] / pP[6]

print(pP[1])
print(rRgross)
print(rRklein)
print(rRges)

rR = c(rRgross, "", rRklein, "", rRges, "")

### Forschungshypothese H1: Entwicklung der letzten 5 Jahre war positiv
### Nullhypothese H0 : Entwicklung der letzen 5 Jahre war negativ

tabelle = data.frame(a, eP, eN, pP, pN, rR)
colnames(tabelle) = c("Ausbildung", "N pos", "N neg", "pos [%]", "neg [%]", "Rel Risiko")
print(tabelle)


## Übung 4
## 12. April 2017

