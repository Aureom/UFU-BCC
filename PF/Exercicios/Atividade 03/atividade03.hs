{- 1) Operador lógico OU (pré-fixo): -}
{- a) Apresente 3 definições para o operador lógico OU, utilizando casamento de padrões -}
(||) :: Bool -> Bool -> Bool
True  || _ = True
False || False = False
False || True = True

{- b) Apresente 2 definições para o operador lógico OU, utilizando expressões condicionais (no lugar de casamento de padrões). -}
ou :: Bool -> Bool -> Bool
ou x y
   | not x && not y = False
   | otherwise = True

{- 2) Defina uma função que recebe dois pontos no espaço e retorna a distância entre eles.
Considere que um ponto no espaço é representado por uma dupla de números (float) que
correspondem às coordenadas do ponto. -}
type Ponto = (Float, Float)
distance :: Ponto -> Ponto -> Float
distance (x1, y1) (x2, y2) = sqrt((x2 - x1)^2 + (y2 - y1)^2)

{- 3) Dado um valor inteiro, escreva a função recursiva fatorial. Obs: Fazer uma
definição usando guardas e outra com casamento de padrões -}
fatCas :: Int -> Int
fatCas 0 = 1
fatCas x = x * fatCas(x-1)

fatGuarda :: Int -> Int
fatGuarda x
  | x == 0 = 1
  | otherwise = x * fatGuarda(x-1)

{- 4) Dado um número inteiro n, escreva a função recursiva fibo que retorna o n-ésimo
termo da sequência de Fibonacci a seguir, sendo os casos base F0 = 0 e F1 = 1. Utilize a
definição recursiva vista em sala: fibo(n) = fibo(n-2) + fibo(n-1).
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ... -}
fibonacci :: Int -> Int
fibonacci x
  | x == 0 = 0
  | x == 1 = 1
  | otherwise = fibonacci(x-1) + fibonacci(x-2)

{- 5) Dado um número inteiro n, escreva a função recursiva n_tri, que retorna o n-ésimo
termo da sequência de números triangulares, dada a seguir.
0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, ... -}
nTriangular :: Int -> Int
nTriangular n
  | n == 0 = 0
  | otherwise = n + nTriangular(n-1)

{- 6) Escreva a função potencia2, que calcula a potência de 2 elevada a um expoente n
de forma recursiva: 2^n = 2^n-1 * 2. -}
potencia2 :: Int -> Int
potencia2 0 = 1
potencia2 n = potencia2(n-1) * 2

{- 7) 
   a) Escreva a função recursiva prodIntervalo: dados dois inteiros m e n, onde m<n,
retorna o produto: m*(m+1)*...(n-1)*n. -}
prodIntervalo :: Int -> Int -> Int
prodIntervalo m n
    | m == n = n
    | otherwise = m * prodIntervalo(m+1) n

{- b) Reescreva a função fatorial usando a função prodIntervalo -}
fatorial :: Int -> Int
fatorial n = prodIntervalo 1 n

{- 8) Defina de forma recursiva as funções resto_div e div_inteira, que retornam o
resto e o quociente da divisão inteira de um inteiro m por inteiro n, realizando subtrações
sucessivas de n a partir de m.
Ex: m=20 e n=3: 20-3=17, 17-3=14, 14-3=11, 11-3=8, 8-3=5, 5-3=2.
Como 2<3: resto=2 e quociente=6 -}
restoDiv :: Int -> Int -> Int
restoDiv m n
    | m - n < 0 = m
    | otherwise = restoDiv (m-n) n

{- 9) Implemente a função mdc, usando a definição recursiva vista em sala:
mdc(m,n) = m, se n = 0
mdc(m,n) = mdc(n, k), se n > 0, sendo k = m mod n
Obs: Fazer uma definição usando guardas e outra com casamento de padrões -}
mdc :: (Int, Int) -> Int
mdc(m, n)
    | n == 0 = m
    | otherwise = mdc(n, mod m n)

mdcGuarda :: (Int, Int) -> Int
mdcGuarda(m, 0) = m
mdcGuarda(m, n) = mdcGuarda(n, mod m n)

{- 10) Implemente a função binomial usando a definição recursiva vista em sala:
binomial (n,k) = 1, se k = 0
binomial (n,k) = 1, se k = n
binomial (n,k) = binomial (n-1,k) + binomial (n-1,k-1), se 0 < k < n
Observe que binomial (n,k) não é definido se k>n.
Obs: Fazer uma definição usando guardas e outra com casamento de padrões -}
binomial :: (Int, Int) -> Int
binomial(n, k)
    | k > n = -1 -- evitar loop infinito
    | k == 0 = 1
    | k == n = 1
    | otherwise = binomial(n-1, k) + binomial(n-1, k-1)

binomialGuarda :: (Int, Int) -> Int
binomialGuarda(n, 0) = 1
binomialGuarda(n, k) =
    if k > n
        then -1 -- evitar loop infinito
    else if k == n
            then 1
        else
            binomialGuarda(n-1, k) + binomialGuarda(n-1, k-1)

{- 11) ** Exercício de maior complexidade da lista**
Faça uma segunda definição da função recursiva fibo2 que retorna o n-ésimo termo da
sequência de Fibonacci utilizando recursividade e os conceitos a seguir (dica: defina a
função passo(x,y)).
a) Defina um par na sequência de Fibonacci como (n,n+1).
Exemplos: (1,1), (3,5), (55,89), (233,377)
b) Dois pares consecutivos na sequência podem ser considerados como um passo:
(x,y) => (y, x+y). Exemplos: (1,1) => (1,2); (3,5) => (5,8); (55,89) => (89, 144)
c) A partir do par inicial (1,1), podemos definir o enésimo par, como a aplicação
consecutiva de n passos:
(1,1) => (1,2) => (2,3) => (3,5) => (5,8) => (8,13) => (13,21) => (21,34) => (34,55) =>...
d) O n-ésimo termo (para n>0) é o primeiro elemento do enésimo par.
Ex: quarto par: (3,5) e quarto termo: 3 e décimo par: (55,89) e décimo termo: 55 -}
type Par = (Int, Int)

passo :: (Int, Int) -> Par
passo (x,y) = (y, x+y)

fibo2 :: Int -> Par
fibo2 x 
    | x == 0 = (0, 1)
    | otherwise = passo(fibo2(x-1))