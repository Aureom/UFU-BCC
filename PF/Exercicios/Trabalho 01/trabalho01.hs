import Data.List

{- 1) Escreva a função analisa_raizes que, dados os 3 coeficientes a, b e c de uma
equação quadrática ax2 +bx + c = 0, realiza a análise das raízes da equação. A equação
é dita degenerada, se o coeficiente do termo quadrático a for igual a zero. Por outro lado,
uma equação não degenerada possui o número de raízes reais de acordo com as regras:
(1) a equação possui duas raízes reais, se b2 > 4*a*c; (2) a equação possui uma raiz real,
se b2 = 4*a*c; (3) a equação não possui raízes reais, se b2 < 4*a*c. A análise de saída
deve ser uma das 4 opções a seguir: “1-possui duas raízes reais”, “2-possui uma raiz
real”, “3-nenhuma raiz real” ou “4-equação degenerada”. -}
analisa_raizes :: Int -> Int -> Int -> String
analisa_raizes a b c
    | a == 0 = "equação degenerada"
    | b*b == 4*a*c = "a equação possui uma raiz real"
    | b*b > 4*a*c = "a equação possui duas raízes reais"
    | otherwise = "a equação não possui raízes reais"


{- 2) Escreva a função equacao que recebe três valores reais a, b, c. Se a for diferente de
0, a função retorna uma tupla com as duas raízes da equação de segundo grau ax2 + bx
+ c = 0. Se Se a for igual a 0, a função retorna uma tupla, sendo o primeiro elemento a
solução da equação de primeiro grau bx + c = 0 e o segundo elemento o próprio a. -}
equacao :: (Float, Float, Float) -> (Float, Float)
equacao (0, b, c) = (-c / b, 0)
equacao (a, b, c) = ((-b + sqrt(b*b-4*a*c)) / (2*a), (-b - sqrt(b*b-4*a*c)) / (2*a))


{- 3) Considere que o preço de uma passagem de ônibus intermunicipal pode variar
dependendo da idade do passageiro. Crianças até 10 anos pagam 40% e bebês (abaixo
de 2 anos) pagam apenas 15%. Pessoas com 70 anos ou mais pagam apenas 50% do
preço total. Os demais passageiros, pagam a tarifa normal (100%). Faça uma função que
tenha como entrada: o valor total da passagem, a data atual e a data de nascimento do
passageiro. Como saída, a função retorna o valor a ser pago. (Obs.: na solução, deve ser
definido o tipo data para representar a tupla (d,m,a)). -}
type Data = (Int, Int, Int)

idade :: Data -> Data -> Int
idade (diaH, mesH, anoH) (diaN, mesN, anoN)
    | mesH > mesN = anoH - anoN
    | mesH == mesN && diaH >= diaN = anoH - anoN
    | otherwise = anoH - anoN - 1

precoPassagem :: Float -> Data -> Data -> Float
precoPassagem preco dataAtual dataNascimento
    | idade dataAtual dataNascimento < 2 = preco*0.15
    | idade dataAtual dataNascimento <= 10 = preco*0.40
    | idade dataAtual dataNascimento >= 70 = preco*0.50
    | otherwise = preco


{- 4) Construa funções que gerem as seguintes listas, utilizando-se lista por compressão.
Todas as funções devem utilizar a lista de inteiros de 1 a 20 em pelo menos um dos
geradores. Apresentar o código da função e o resultado da lista gerada. -}
listaAux :: [Int]
listaAux = [1..20]

{- 4-a-}
gera1 :: [Int] -> [Int]
gera1 list = [x^3 | x <- listaAux, even x, x > 3, x < 11]
{- 4-b -}
gera2 :: [Int] -> [(Int, Int)]
gera2 list = [(x,y) | x <- listaAux, x <= 5, y <- [x..x*3]]
{- 4-c -}
l1 :: [Int]
l1 = [15,16]

gera3 :: [Int] -> [Int]
gera3 (x : xs : _) = [x | x <- [1..x]] ++ [x | x <- [1.. xs]]
{- 4-d -}
gera4 :: [Int] -> [(Int, Int)]
gera4 list = [(x, x+1) | x <- listaAux, even x]
{- 4-e -}
gera5 :: [Int] -> [Int]
gera5 list = [x + y | (x, y) <- gera4 listaAux]


{- 5) a) Escreva uma função (usando compreensão de listas) que calcula a quantidade de
números que são positivos e múltiplos de 3 (ao mesmo tempo) de uma lista de inteiros: -}
contaNegM2 :: [Int] -> Int
contaNegM2 list = length [x | x <- list, x > 0, mod x 3 == 0]

{- b) Escreva uma função (usando compreensão de listas) que extrai números que são
positivos e múltiplos de 3 (ao mesmo tempo) de uma lista de inteiros e os retorna em uma
nova lista: -}
listaNegM2 :: [Int] -> [Int]
listaNegM2 list = [x | x <- list, x > 0, mod x 3 == 0]


{- 6) Escreva a função primos a seguir que recebe dois valores inteiros x,y e retorna todos
os números primos que se encontram entre x e y. Obs: construir uma segunda função
fatores que retorna todos os divisores de um número inteiro e utilizá-la na elaboração
da função primos. -}
fatores :: Int -> [Int]
fatores n = [x | x <- [1..n], mod n x == 0]

primos :: Int -> Int -> [Int]
primos x y = [x | x <- [x..y], fatores x == [1, x]]


{- 7) Construa a função mmc a seguir que calcula o valor do mínimo múltiplo comum de três
números inteiros. -}
mdc:: Int -> Int -> Int
mdc a b
       | a < b = mdc b a
       | b == 0 = a
       | otherwise = mdc b (mod a b)

mmc:: Int -> Int -> Int
mmc a b = (a * b) `div` mdc a b

mmc3:: Int -> Int -> Int -> Int
mmc3 a b c = mmc a (mmc b c)

{- 8) Escreva uma função que calcula a série a seguir, dados um número real x e o número
de termos a serem calculados n. Obs: se preciso, use a função fromIntegral para
converter n de Inteiro para Float. -}
serie :: Float -> Int -> Float
serie x n
    | n == 1 = 1/x
    | even n = x/fromIntegral n + serie x (n-1)
    | otherwise = fromIntegral n/x + serie x (n-1)

{- 9) Escreva a função fizzbuzz a seguir que recebe um inteiro n e retorna uma lista de
strings. Para cada inteiro i entre 1 e n, a lista será composta da seguinte forma.
• Se i é divisível por 2, escreva “Fizz”.
• Se i é divisível por 3, escreva “Buzz”.
• Se i é divisível por ambos 2 e 3, escreva “FizzBuzz”.
• Caso contrário, diga “No”. -}
getFizzBuzz :: Int -> String
getFizzBuzz x
    | mod x 2 == 0 && mod x 3 == 0 = "FizzBuzz"
    | mod x 2 == 0 = "Fizz"
    | mod x 3 == 0 = "Buzz"
    | otherwise = "No"

fizzBuzz :: Int -> [String]
fizzBuzz x = [getFizzBuzz x | x <- [1..x]]


{- 10) Usando lista por compreensão, escreva a função seleciona_multiplos que recebe um
lista de inteiros e um inteiro n e retorna uma nova lista com todos os números presentes na lista
de entrada que são múltiplos de n -}
seleciona_multiplos :: Int -> [Int] -> [Int]
seleciona_multiplos n list = [x | x <- list, mod x n == 0]


{- 11) Escreva a função unica_ocorrencia a seguir que recebe um elemento e uma lista
e verifica se existe uma única ocorrência do elemento na lista . -}
unica_ocorrencia :: Int -> [Int] -> Bool
unica_ocorrencia n list = length [x | x <- list, x == n] == 1


{- 12) Crie uma função que intercala os elementos de duas listas de qualquer tamanho
numa nova lista. Obs: as listas de entrada devem ser do mesmo tipo mas podem ter
tamanhos diferentes. Caso sejam diferentes, os elementos excedentes da lista maior
devem complementar a lista de saída -}
intercala :: [t] -> [t] -> [t]
intercala x [] = x
intercala [] y = y
intercala (x: xs) y = x : intercala y xs


{- 13) Construa a função zipar que recebe duas listas de mesmo tipo e elabora uma terceira lista
de sublistas de tamanho 2 formadas por um elemento da primeira lista e outro da segunda lista.
Assim, a primeira sublista da lista de saída é formada com o primeiro elemento de cada lista, a
segunda sublista é formada com o segundo elemento de cada uma, e assim por diante. Se listas
de entrada tiverem tamanhos diferentes, a lista de saída é truncada para o tamanho da menor lista
de entrada. Obs: não é permitido usar funções de manipulação de listas da biblioteca PRELUDE
padrão do Haskell. -}
zipar:: [Int] -> [Int] -> [[Int]]
zipar [] _ = []
zipar _ [] = []
zipar (x : xs) (y : ys) = [x,y] : zipar xs ys

{- 14) Defina novos tipos para representar os dados contidos numa agenda pessoal. Para
cada contato, armazene as informações: nome, endereço, telefone, e-mail. Em seguida,
crie uma função para recuperar o nome de um contato, a partir do email. Caso o número
não seja encontrado, retornar a mensagem “Email desconhecido”. -}
type Contato = (String, String, String, String)
agenda :: [Contato]
agenda = [("Ednaldo Pereira", "Rua do mamaco, 504", "+551140028922", "ednaldopereira@gmail.com"),
          ("Cleiton Rasta", "Morro da babilonia, 420", "+55110000000", "cleitonrasta@gmail.com")]

acharContato :: String -> [Contato] -> String
acharContato email [] = "Email desconhecido"
acharContato email ((nomeAgenda, _, _, emailAgenda) : prox)
    | email == emailAgenda = nomeAgenda
    | otherwise = acharContato email prox


{- 15) Seja o tipo Pessoa e a lista de pessoas a seguir.
O tipo pessoa é uma tupla que inclui nome, altura, idade e estado civil (‘c’ ou ‘s’). -}
type Pessoa = (String, Float, Int, Char)
pessoas :: [Pessoa]
pessoas = [ ("Rosa", 1.66, 27,'F'),
            ("João", 1.85, 26, 'C'),
            ("Maria", 1.55, 62, 'S'),
            ("Jose", 1.78, 42, 'C'),
            ("Paulo", 1.93, 25, 'S'),
            ("Clara", 1.70, 33, 'C'),
            ("Bob", 1.45, 21, 'C'),
            ("Rosana", 1.58,39, 'S'),
            ("Daniel", 1.74, 72, 'S'),
            ("Jocileide", 1.69, 18, 'S') ]

-- A altura média entre todas as pessoas.
mediaAltura :: Float
mediaAltura = sum [altura | (_, altura, _, _) <- pessoas] / fromIntegral(length pessoas)

-- A idade da pessoa mais nova.
maisNova :: Int
maisNova = minimum [idade | (_, _, idade, _) <- pessoas]

-- O nome e o estado civil da pessoa mais velha
idadeMaisVelha :: Int
idadeMaisVelha = maximum [idade | (_, _, idade, _) <- pessoas]

infoMaisVelha :: Int -> [Pessoa] -> (String, Char)
infoMaisVelha idade ((nomePessoa, _, idadePessoa, estadoCivilPessoa) : prox)
    | idade == idadePessoa = (nomePessoa, estadoCivilPessoa)
    | otherwise = infoMaisVelha idade prox

getMaisVelha :: (String, Char)
getMaisVelha = infoMaisVelha idadeMaisVelha pessoas

-- Todos os dados de cada pessoa com 50 anos ou mais
acimaDe50 :: [Pessoa]
acimaDe50 = [x | x <- pessoas, (_, _, idade, _) <- [x], idade >= 50]

-- O número de pessoas casadas com idade superior a i (ex: i = 35).
casadas :: Int -> [Pessoa]
casadas idade = [x | x <- pessoas, (_, _, idadeAgenda, estadoCivil) <- [x], idadeAgenda >= idade, estadoCivil == 'C']


{- 16) Escreva a função insere_ord a seguir, que recebe uma lista polimórfica
ordenada de elementos (critério de ordenação crescente) e um novo elemento x (do
mesmo tipo da lista) e retorna a nova lista com o novo elemento inserido -}
insere_ord :: Ord t => t -> [t] -> [t]
insere_ord x [] = [x]
insere_ord x (y : ys)
    | x < y = x : y : ys
    | otherwise = y : insere_ord x ys


{- 17) Escreva a função reverte a seguir que recebe uma lista polimórfica e retorna uma
lista com seus elementos ao contrário. -}
reverte :: [a] -> [a]
reverte [] = []
reverte (x : xs) = reverte xs ++ [x]


{- 18) Escreva a função elimina_repet a seguir que recebe uma lista polimórfica e
retorna uma lista sem elementos repetidos. -}
elimina_repet :: Eq a => [a] -> [a]
elimina_repet [] = []
elimina_repet (x : xs)
    | x `elem` xs = elimina_repet xs
    | otherwise = x : elimina_repet xs


{- 19) Escreva a função notasTroco a seguir usando compreensão de listas que calcula
todas as combinações de notas para devolver o troco durante um pagamento, a partir de
uma lista com os valores das notas disponíveis (definido no arquivo .hs) e o valor do troco
x (argumento da função). -}
disponiveis :: [Int]
disponiveis = [1,2,5,10,20,50,100]

notasTroco :: Int -> [[Int]]
notasTroco 0 = [[]]
notasTroco total = [x : y | x <- disponiveis, x <= total, y <- notasTroco(total-x)]


{- 20) Desenvolver a função nRainhas que resolve o Problema das N rainhas, para um valor
n dado como entrada. Esse problema consiste em posicionar N rainhas num tabuleiro N x
N de forma que nenhuma rainha possa capturar outra rainha em um único movimento. O
resultado deve conter uma lista de todas as soluções possíveis para o valor n dado como
entrada, em que cada solução é uma lista que apresenta a posição da linha de cada
rainha em ordem de coluna (colunas de 1 a N). Por exemplo, a lista [3,1,4,2] é uma
possível solução para o problema de 4 rainhas em um tabuleiro 4x4, onde: a 1a
rainha é posicionada na 1a coluna e 3 a linha, a 2a rainha é posicionada na 2a
coluna e 1 a linha, a 3a rainha é posicionada na 3a  coluna e 4a linha e a 4a
rainha é posicionada na 4a coluna e 2 a linha. Note que essa não é a única solução 
para a instância de 4 rainhas e a lista [3,1,4,2] é uma sub-lista da lista de saída. -}
linha :: [Int] -> Bool
linha (x : xs) = x `elem` xs

-- [Coluna, Linha]
ataqueDiag :: (Int, Int) -> (Int, Int) -> Bool
ataqueDiag (x, y) (x1, y1) = abs(x - x1) /= abs(y - y1)

diagonal :: [[Int]] -> Bool
diagonal ([x, y] : [x1, y1] : zs) = ataqueDiag (x, y) (x1, y1) || diagonal ([x1, y1] : zs)
-- TODO: Arrumar a checagem diagonal, percorrendo todas as possibilidades

verificaComidas :: Int -> [[Int]] -> Bool
verificaComidas n (x : xs) = (linha x || diagonal (zipar [1..n] x)) || verificaComidas n xs

nRainhas :: Int -> [[Int]]
nRainhas 0 = [[]]
nRainhas n = [x | x <- permutations [1..n], verificaComidas n [x]]
