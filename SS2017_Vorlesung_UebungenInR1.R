# Dies ist ein Beispiel
5+7
log(17)

# Binomialverteilung B(n, p)
# @params n Anzahl der Bernoullli Versuche
# @params p Erfolgswahrscheinlichkeit

# Allgemeine Binomialverteilung:
#   (n k)^t p^k (1-p)^(n-k)
# Hier:
#   (20 10)^t 0.3^10 (1-0.3)^(20-10)
print('Binomialverteilung B(20, 0.3) für k = 0, 1, 2 in Prozent.')
# d in dbinom steht für Dichte der Wahrscheinlichkeitsfunktion.
dbinom(0, size = 10, prob = 0.3) * 100 
dbinom(1, size = 10, prob = 0.3) * 100 
dbinom(2, size = 10, prob = 0.3) * 100 

# p in pbinom steht für die Verteilungsfunktion(CDF) an der stelle c.
print('Summe der obigen Binomialverteilungen B(20, 0.3) für k = 2 in Prozent.')
pbinom(2, 10, 0.3) * 100

# q in qbinom steht für das Quantil 0.8.
# das 20% quantil wird in 80% der fälle unterschritten, in 20% der Fälle überschritten. 
print('80% Quantil = %d', qbinom(0.8, 10, 0.3))
pbinom(qbinom(0.8, 10, 0.3)-1, 10, 0.3);
pbinom(qbinom(0.8, 10, 0.3), 10, 0.3);
pbinom(qbinom(0.8, 10, 0.3)+1, 10, 0.3);

#rbinom gibt eine binomialverteilte Stichprobe
#rbinom(500, 10, 0.3)
library(ggplot2)
pdf("SS2017_Vorlesung_UebungenInR1.pdf")
hist(table(rbinom(1000, 10, 0.3)))

######
# P(X >= 9)
dbinom(9,10,0.5) + dbinom(10,10,0.5)
1- pbinom(8,10,0.5)

# P(X <= 1)
pbinom(1,10,0.5)
1- pbinom(8,10,0.5) + pbinom(1,10,0.5)

o = dev.off()