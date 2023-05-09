install.packages('pracma')
library(pracma)
km <- c(0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0)
r <- c(56.8, 48.2, 32.2, 19.8, 12.2, 7.8, 5.2, 3.6, 2.6, 1.9, 1.5) 

#Integrando a função 
intg <- function(x) {
  
  2 * pi * x * interp1(km, r, x, 'linear') #interpolação linear dos valores da densidade populacional
}  #2 * pi * x é formula da area de um anel de raio 'x'


#intervalos 
a <- 0
b <- 5 

#calculo da integral 
integral <- integrate(intg, a, b)


#Numero de cervos na regiao 
num_cerv <- integral$value
num_cerv 


#plotando grafico
dist <- seq(0 , 5, length.out = 1000) #vetores de disntacia
dens <- interp1(km, r, dist, 'linear') #vetores de densidade
plot(dist, dens, type = 'l', xlab = "distancia (km)", ylab = "Densidade (cervos/km²)")
