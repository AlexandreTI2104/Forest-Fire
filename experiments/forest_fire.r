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



# Segunda Parte dos Códigos utilizados em R nas duas execuções do Teste t de Student e Regressão Linear.

amostra <- Forest_Fire_iter_100_steps_100_2022_08_25_17_11_33_053977
hist(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==70])
hist(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==30])
hist(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==30], breaks = 100)
par(mfrow=c(1,4))
hist(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==20&amostra$`Profundidade da Floresta`==100], breaks = 100)
hist(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==30&amostra$`Profundidade da Floresta`==100], breaks = 100)
hist(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==80&amostra$`Profundidade da Floresta`==100], breaks = 100)
hist(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==140&amostra$`Profundidade da Floresta`==100], breaks = 100)
t.test(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==80&amostra$`Largura da Floresta`==100&amostra$`Profundidade da Floresta`==100],amostra$`Velocidade do Alastramento do Fogo`[amostra$density==140&amostra$`Largura da Floresta`==100&amostra$`Profundidade da Floresta`==100])
t.test(amostra$`Velocidade do Alastramento do Fogo`[amostra$density==40&amostra$`Largura da Floresta`==100&amostra$`Profundidade da Floresta`==100],amostra$`Velocidade do Alastramento do Fogo`[amostra$density==100&amostra$`Largura da Floresta`==100&amostra$`Profundidade da Floresta`==100])



velocidade.lm <- lm(formula = `Velocidade do Alastramento do Fogo` ~ `density`, data = dataset)
summary(velocidade.lm)