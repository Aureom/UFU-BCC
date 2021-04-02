{- 2) Gere por enumeração as seguintes listas:
a) [5,4,3,2,1]
b) [a,c,e]
c) [1,4,7,10,13,16]
d) [(1,1),(-2,5),(-5,9),(-8,13),(-11,17)] *obs: também é necessário usar
a função zip para criar as tuplas -}
listaA :: [Int]
listaA = [5, 4..1]

listaB :: [Char]
listaB = ['a', 'c'..'e']

listaC :: [Int]
listaC = [1, 4..16]

listaD :: [(Int, Int)]
listaD = zip [1, -2.. -11] [1, 5..17]


{- 3) Funções que utilizam listas enumeradas
a) Utilizando enumeração, construir uma função que dados dois inteiros a e b construa a
lista dos inteiros contidos no intervalo fechado [a,b]. Quando a for igual a b, a função
devolve a lista unitária [a]. Quando a > b a função deverá devolver a lista vazia. -}
intervalo :: Int -> Int -> [Int]
intervalo a b = [a..b]


{- 3-b) Utilizando enumeração, construir uma função que dados dois inteiros a e b construa a
lista dos inteiros pares contidos no intervalo aberto (a,b). Quando a for igual a b ou a > b
a função devolve a lista vazia. (*Dica: verificar se a é par ou ímpar)
even = par // odd = impar
-}
intervaloPares :: Int -> Int -> [Int]
intervaloPares a b
    | even a && odd b = [a+2, a+4..b-1]
    | even a && even b = [a+2, a+4..b-2]
    | odd a && odd b = [a+1, a+3..b-1]
    | otherwise = [a+1, a+3..b-2]


{- 5) Usando lista por compreensão, escreva a função quadrados que recebe dois inteiros e
retorna os quadrados dos números entre eles. -}
quadrados :: Int -> Int -> [Int]
quadrados a b = [x*x | x <- [a..b]]


{- 6) Usando lista por compreensão, escreva a função seleciona_ímpares que recebe um
lista de inteiros e retorna uma nova lista com todos os números ímpares presentes na lista
de entrada -}
selecionaImpares :: [Int] -> [Int]
selecionaImpares lista = [x | x <- lista, odd x]


{- 7) Escreva a função tabuada que recebe um valor inteiro e retorna a lista de seus dez
primeiros múltiplos -}
tabuada :: Int -> [Int]
tabuada n = [x*n | x <- [1..10]]


{- 8) Escreva a função bissextos a seguir que recebe uma lista de inteiros e retorna uma
lista com os valores que representam anos bissextos. Dica: use a função bissexto do
roteiro anterior. -}
bissexto :: Int -> Bool
bissexto ano
    | mod ano 400 == 0 = True
    | mod ano 4 == 0 && mod ano 100 /= 0 = True
    | otherwise = False

bissextos :: [Int] -> [Int]
bissextos n = [x | x <- n, bissexto x]


{- 9) Usando lista por compreensão, escreva a função sublistas que recebe uma lista
formada por sublistas de um mesmo tipo e retorna uma lista com todos os elementos da
lista de entrada na mesma ordem, mas no nível da lista principal, sem sublistas. -}
sublistas :: [[Int]] -> [Int]
sublistas listaComListas = [ x | lista <- listaComListas, x <- lista]


{- 10) Sejam os tipos Data, Emprestimo, Emprestimos e a variável bdEmprestimo do
exemplo da Biblioteca. Escreva a função atrasados que recebe um parâmetro do tipo
Emprestimos e a Data atual, e retorna uma lista com todos os empréstimos atrasados. -}
precede :: Data -> Data -> Bool
precede (diaX, mesX, anoX) (diaY, mesY, anoY)
    | anoX < anoY = True
    | anoX == anoY && mesX < mesY = True
    | anoX == anoY && mesX == mesY && diaX < diaY = True
    | otherwise = False

type Data = (Int, Int, Int)
type Emprestimo = (String, String, Data, Data, String)
type Emprestimos = [Emprestimo]
bdEmprestimo::Emprestimos
bdEmprestimo =
 [("H123C9","BSI945",(12,9,2009),(20,09,2009),"aberto"),
 ("L433C5","BCC021",(01,9,2009),(10,09,2009),"encerrado"),
 ("M654C3","BCC008",(04,9,2009),(15,09,2009),"aberto")]

emprestimoAtrasado :: (a, b, c, Data, e) -> Data -> Bool
emprestimoAtrasado (_, _, _, dataDevolucao, _) dataHoje
  | precede dataDevolucao dataHoje = True
  | otherwise = False

atrasados :: [Emprestimo] -> Data -> [Emprestimo]
atrasados emprestimos dataAtual = [x | x <- emprestimos, emprestimoAtrasado x dataAtual]


{- 11) Usando compreensão de listas, escreva a função uniaoNRec a seguir que faz a união
de duas listas de modo que ela mantenha todos os elementos da 1a lista na mesma
ordem e no final acrescenta apenas os elementos da 2a lista que não estejam presentes
na 1a lista. -}
uniaoNRec :: [Int] -> [Int] -> [Int]
uniaoNRec listaA listaB = listaA ++ [y | y <- listaB, y `notElem` listaA]