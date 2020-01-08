module Exercicio01 where

-- Escreva uma função para calcular o dobro de um número
dobro :: Integer -> Integer
dobro x = x * 2

-- Escreva uma função para quadruplicar um número, usando a função definida no item anterior.
quadruplo :: Integer -> Integer
quadruplo x = dobro x * 2

-- Defina uma função para calcular a distância entre dois pontos (num plano).
distanciaPlano :: Double -> Double -> Double -> Double -> Double
distanciaPlano x1 x2 y1 y2 = sqrt((x2 - x1)^2 + (y2 - y1)^2)

-- Dadas as medidas dos catetos de um triangulo retângulo, retornar o valor de sua hipotenusa.
hipotenusa :: Double -> Double -> Double
hipotenusa x1 x2 = sqrt(x1^2 + x2^2)