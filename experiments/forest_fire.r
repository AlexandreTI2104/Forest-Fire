dataset <- Forest_Fire_iter_100_steps_100_2022_08_25_17_11_33_053977
dataset 
hist(dataset$`Velocidade do Alastramento do Fogo`)
hist(dataset$`Velocidade do Alastramento do Fogo`, breaks = 100)
hist(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110], breaks = 100)
plot(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110], breaks = 100)

hist(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==80], breaks = 100)

summary(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110])

lm(dataset$`Velocidade do Alastramento do Fogo`~dataset$`density`)

boxplot(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110])



# Segunda Parte dos Códigos utilizados em R nas execuções do Teste t de Student.

amostra <- Forest_Fire_iter_100_steps_100_2022_08_25_17_11_33_053977
amostrad20 <- amostra$`Velocidade do Alastramento do Fogo`[amostra$density==20] 
amostrad30 <- amostra$`Velocidade do Alastramento do Fogo`[amostra$density==30]
amostrad80 <- amostra$`Velocidade do Alastramento do Fogo`[amostra$density==80] 
amostrad140 <- amostra$`Velocidade do Alastramento do Fogo`[amostra$density==140] 

par(mfrow=c(1,4))
hist(amostrad20, breaks = 100)
hist(amostrad30, breaks = 100)
hist(amostrad80, breaks = 100)
hist(amostrad140, breaks = 100)

t.test(amostrad20, amostrad30)
t.test(amostrad20, amostrad140)

t.test(amostrad80, amostrad140)

# Teste da Regressão Linear.
velocidade.lm <- lm(formula = `Velocidade do Alastramento do Fogo` ~ `density`, data = dataset)
summary(velocidade.lm)


# Teste Chi Quadrado.

library(DescTools)
library(readr)
todas_as_amostras <- read_csv("Forest-Fire_iter_100_steps_100_2022-08-25-17-11-33.053977.csv")
unique(todas_as_amostras$density)
unique(todas_as_amostras$`Largura da Floresta`)
amostras_controladas_pela_largura_da_floresta_100 <- todas_as_amostras[todas_as_amostras$`Largura da Floresta`==100,]
max(amostras_controladas_pela_largura_da_floresta_100$`Velocidade do Alastramento do Fogo`)
min(amostras_controladas_pela_largura_da_floresta_100$`Velocidade do Alastramento do Fogo`)
faixa_de_corte <- c(43,109,175,241)
Density20 <- Freq(amostras_controladas_pela_largura_da_floresta_100$`Velocidade do Alastramento do Fogo`[amostras_controladas_pela_largura_da_floresta_100$`density`==20],breaks = faixa_de_corte)
Density70 <- Freq(amostras_controladas_pela_largura_da_floresta_100$`Velocidade do Alastramento do Fogo`[amostras_controladas_pela_largura_da_floresta_100$`density`==70],breaks = faixa_de_corte)
Density130 <- Freq(amostras_controladas_pela_largura_da_floresta_100$`Velocidade do Alastramento do Fogo`[amostras_controladas_pela_largura_da_floresta_100$`density`==130],breaks = faixa_de_corte)
crosstable <- as.table(rbind(Density20$freq,Density70$freq,Density130$freq))
crosstable
dimnames(crosstable) <- list("Densidade das Árvores"=c("Baixa","Media", "Forte"), "Velocidade do Alastramento do Fogo"=c("Pequena","Média", "Alta"))
crosstable
chisq.test(crosstable)
