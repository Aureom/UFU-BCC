module Lista01 where

-- Forneça uma temperatura em graus Fahrenheit a partir de uma temperatura em graus Celsius.
celsiusToFahrenheit :: Double -> Double
celsiusToFahrenheit x = x * 1.8 + 32

fahrenheitToCelsius :: Double -> Double
fahrenheitToCelsius x = (x - 32) / 1.8

{- Uma empresa decidiu dar a seus funcionários um abono de salario, baseando-se nos pontos obtidos durante o mês, de acordo com a tabela:
    Pontos Obtidos      Prêmio em R$
    1 a 10              100,00
    11 a 20             200,00
    21 a 30             300,00
    31 a 40             400,00
    >=41                500,00 -}
abonoSalarial :: Integer -> Integer
abonoSalarial x | x > 1 && 10 >= x  = 100
                | x > 10 && 20 >= x = 200
                | x > 20 && 30 >= x = 300
                | x > 30 && 40 >= x = 400
                | x >= 41           = 500
                | otherwise         = 0

{-Considere que o preço de uma passagem de avião em um trecho pode variar
  dependendo da idade do passageiro. Pessoas com 60 anos ou mais pagam apenas
  60% do preço total. Crianças até 10 anos pagam 50% e bebês (abaixo de 2 anos)
  pagam apenas 10%. Faça uma função que tenha como entrada o valor total da
  passagem e a idade do passageiro e produz o valor a ser pago.-}
calcularPassagem :: Integer -> Double -> Double
calcularPassagem idade preco | idade >= 60 = (preco * 0.6)
                             | idade <= 2  = (preco * 0.1)
                             | idade <= 10 = (preco * 0.5)
                             | otherwise   =  preco

--Faça uma função que recebe um numero e retorna verdadeiro se o numero for par.
par :: Integer -> Bool
par x = mod x 2 == 0

--Faça uma função que recebe dois valores e retorna o menor.
menor :: Double -> Double -> Double
menor x y = if y > x then x else y

--Faça uma função que recebe três valores e retorna o menor
menor3 :: Double -> Double -> Double -> Double
menor3 x y z = if (y > x) && (z > x) then x else if (y > z) then z else y

--Escreva uma função recursiva para calcular o fatorial de um numero natural.
fatorial :: Integer -> Integer
fatorial x = if x == 0 then 1 else x * fatorial (x-1)

{- Especifique as seguintes funções para a manipulação de listas:
nro-elementos: recebe uma lista qualquer e retorna o número de elementos na lista. -}
tamanhoLista :: [a] -> Int
tamanhoLista [] = 0
tamanhoLista x = length x
--tamanhoLista (x:xs) = 1 + tamanhoLista xs

-- maior: recebe uma lista de números e retorna o maior .
maiorLista :: [Integer] -> Integer
maiorLista [x] = x
maiorLista (x:xs) | maiorLista xs > x = maiorLista xs
                  | otherwise = x

-- conta-ocorrencias: recebe um elemento e uma lista qualquer e retorna o número de ocorrências do elemento na list
numOcorrencias :: Int -> [Int] -> Int
numOcorrencias num x = length (filter(==num) x)

-- unica-ocorrencia: recebe um elemento e uma lista e verifica se existe uma única ocorrência do elemento na lista
unicaOcorrencia :: Int -> [Int] -> Bool
unicaOcorrencia num x = numOcorrencias num x == 1

-- maiores-que: recebe um número e uma lista de números e retorna uma lista com os números que são maiores do que o valor informado.
maioresQue :: Int -> [Int] -> [Int]
maioresQue num x = (filter(>num) x)

-- concatena: recebe duas listas quaisquer e retorna uma terceira lista com os elementos da primeira no início e os elementos da segunda no fim.
concatena :: [Int] -> [Int] -> [Int]
concatena x y = concat[x, y]

-- duplica: recebe uma lista e retorna uma nova lista contendo a duplicação dos elementos da lista original.
duplica :: [Int] -> [Int]
duplica x = concat[x, x]