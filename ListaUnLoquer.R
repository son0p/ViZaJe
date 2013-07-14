rm(list=ls())

require(Gmisc)
require(memisc)
require(ggplot2)
require(reshape)

Mensajes <- read.csv2("./Data/ListaUnLoquer.csv", sep=";")

p <- ggplot(Mensajes, aes(Date)) + geom_bar(stat="bin")
p

MensajesXDia <- as.data.frame(table(Mensajes$Date))

colnames(MensajesXDia) <- c("date","n_correos")
MensajesXDia <- MensajesXDia[-1166,]
write.csv(MensajesXDia,"./Data/MensajesXDia.csv")

MensajesXDia[which(MensajesXDia$n_correos == as.numeric(max(MensajesXDia$n_correos))),]
MensajesXDia[which(MensajesXDia$n_correos == as.numeric(min(MensajesXDia$n_correos))),]
