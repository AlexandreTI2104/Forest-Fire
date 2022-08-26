dataset <- Forest_Fire_iter_100_steps_100_2022_08_25_17_11_33_053977
dataset 
hist(dataset$`Velocidade do Alastramento do Fogo`)
hist(dataset$`Velocidade do Alastramento do Fogo`, breaks = 100)
hist(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110], breaks = 100)
hist(dataset$`Velocidade do Alastramento do Fogo`[dataset$`Burned Out`==394], breaks = 100)
plot(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110], breaks = 100)

hist(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110], breaks = 100)
hist(dataset$`Velocidade do Alastramento do Fogo`[dataset$`Burned Out`==394], breaks = 100)

summary(dataset$`Velocidade do Alastramento do Fogo`[dataset$`Burned Out`==394])
summary(dataset$`Velocidade do Alastramento do Fogo`[dataset$`Burned Out`==348])
summary(dataset$`Velocidade do Alastramento do Fogo`[dataset$`Burned Out`==399])
summary(dataset$`Velocidade do Alastramento do Fogo`[dataset$`Burned Out`==302])
summary(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110])

lm(dataset$`density`~dataset$`Velocidade do Alastramento do Fogo`)
lm(dataset$`Velocidade do Alastramento do Fogo`~dataset$`density`)

boxplot(dataset$`Velocidade do Alastramento do Fogo`[dataset$density==110])
boxplot(dataset$`Velocidade do Alastramento do Fogo`[dataset$`Burned Out`==302])