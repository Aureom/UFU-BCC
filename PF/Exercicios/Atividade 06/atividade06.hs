{- 1) Refaça as seguintes funções dos roteiros 2, 3 e 4, utilizando o comando
“where” para definições locais (incluindo funções auxiliares que são
necessárias na solução da função principal): 

    a) Escreva a função valida que indica se uma data é válida ou não. -}
type Data = (Int, Int, Int)

valida :: Data -> Bool 
valida (dia, mes, ano) 
    | dia >= 1 && dia <= 31 && (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) = True
    | dia >= 1 && dia <= 30 && (mes == 4 || mes == 6 || mes == 9 || mes == 11) = True
    | dia >= 1 && dia <= 28 && mes == 2 && not (bissexto ano) = True
    | dia >= 1 && dia <= 29 && mes == 2 && bissexto ano = True
    | otherwise = False
    where 
        bissexto ano
            | mod ano 400 == 0 = True 
            | mod ano 4 == 0 && mod ano 100 /= 0 = True 
            | otherwise = False

{- b) Escreva a função bissextos a seguir que recebe uma lista de inteiros e
retorna uma lista com os valores que representam anos bissextos. -}
bissextos :: [Int] -> [Int]
bissextos n = [x | x <- n, bissexto x]
    where
        bissexto ano
            | mod ano 400 == 0 = True
            | mod ano 4 == 0 && mod ano 100 /= 0 = True
            | otherwise = False

{- c) Escreva a função atrasados que recebe um parâmetro do tipo
Emprestimos e a Data atual, e retorna uma lista com todos os
empréstimos atrasados. -}
type Emprestimo = (String, String, Data, Data, String)

atrasados :: [Emprestimo] -> Data -> [Emprestimo]
atrasados emprestimos dataAtual = [x | x <- emprestimos, emprestimoAtrasado x dataAtual]
    where
        emprestimoAtrasado (_, _, _, dataDevolucao, _) dataHoje
            | precede dataDevolucao dataHoje = True
            | otherwise = False
        emprestimos =
            [("H123C9","BSI945",(12,9,2009),(20,09,2009),"aberto"),
            ("L433C5","BCC021",(01,9,2009),(10,09,2009),"encerrado"),
            ("M654C3","BCC008",(04,9,2009),(15,09,2009),"aberto")]
        precede (diaX, mesX, anoX) (diaY, mesY, anoY)
            | anoX < anoY = True
            | anoX == anoY && mesX < mesY = True
            | anoX == anoY && mesX == mesY && diaX < diaY = True
            | otherwise = False

{- d) Faça uma segunda definição da função recursiva fibo2 que retorna
o n-ésimo termo da sequência de Fibonacci utilizando recursividade
e os conceitos a seguir (use a função passo(x,y)). -}
type Par = (Int, Int)

fibo2 :: Int -> Par
fibo2 x 
    | x == 0 = (0, 1)
    | otherwise = passo(fibo2(x-1))
    where
        passo (x,y) = (y, x+y)

{- e) Escreva a função fatorial usando a função prodIntervalo. -}
fatorial :: Int -> Int
fatorial n = prodIntervalo 1 n
    where
        prodIntervalo m n
            | m == n = n
            | otherwise = m * prodIntervalo(m+1) n


{- 2) Refaça as funções do exercício 1, utilizando o comando “let” para
definições locais (incluindo funções auxiliares que são necessárias na
solução da função principal). Repetir para os itens “a” a “e”. -}
{- a -}
bissexto ano
    | mod ano 400 == 0 = True
    | mod ano 4 == 0 && mod ano 100 /= 0 = True
    | otherwise = False

validaLet :: Data -> Bool 
validaLet (dia, mes, ano) =
    let
        t1 = dia >= 1 && dia <= 31 && (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12)
        t2 = dia >= 1 && dia <= 30 && (mes == 4 || mes == 6 || mes == 9 || mes == 11)
        t3 = dia >= 1 && dia <= 28 && mes == 2 && not (bissexto ano)
        t4 = dia >= 1 && dia <= 29 && mes == 2 && bissexto ano
    in t1 || t2 || t3 || t4
        
{- b -}
bissextosLet :: [Int] -> [Int]
bissextosLet n = 
    let 
        bissexto ano
            | mod ano 400 == 0 = True
            | mod ano 4 == 0 && mod ano 100 /= 0 = True
            | otherwise = False
    in [x | x <- n, bissexto x]

{- c -}
atrasadosLet :: [Emprestimo] -> Data -> [Emprestimo]
atrasadosLet emprestimos dataAtual =
    let
        emprestimoAtrasado (_, _, _, dataDevolucao, _) dataHoje
            | precede dataDevolucao dataHoje = True
            | otherwise = False
        emprestimos =
            [("H123C9","BSI945",(12,9,2009),(20,09,2009),"aberto"),
            ("L433C5","BCC021",(01,9,2009),(10,09,2009),"encerrado"),
            ("M654C3","BCC008",(04,9,2009),(15,09,2009),"aberto")]
        precede (diaX, mesX, anoX) (diaY, mesY, anoY)
            | anoX < anoY = True
            | anoX == anoY && mesX < mesY = True
            | anoX == anoY && mesX == mesY && diaX < diaY = True
            | otherwise = False
    in [x | x <- emprestimos, emprestimoAtrasado x dataAtual]

{- d -}
fibo2Let :: Int -> Par
fibo2Let x =
    let
        passo (x,y) = (y, x+y)
    in 
        if x == 0 then (0, 1) else passo(fibo2(x-1))

{- e -}
fatorialLet :: Int -> Int
fatorialLet n = 
    let
        prodIntervalo m n
            | m == n = n
            | otherwise = m * prodIntervalo(m+1) n
    in prodIntervalo 1 n


{- 3) Aplicar Beta-redução nas expressões lambda a seguir: 
    a) (λ x.2*x + 1) 3
        (2*3 + 1)
        6 + 1 = 7

    b) (λ xy.x-y) 5 7
        5-7 = -2

    c) (λ yx.x-y) 5 7
        7-5 = 2

    d) (λ xy.x-y) (λz.z/2)
        λ.y ((λ.z z/2) - y)

    e) (λ xy.x-y) ((λz.z/2) 6) 1
        (λ xy.x-y) (λz.6/2) 1
        (λ xy.x-y) 3 1
        3-1 = 2

    f) (λ x.λ y. - x y) 9 4
        (λ y. - 9 y) 4
        - 9 4
        9-4 = 5

    g) (λ x.xx) (λ y.y)
        (λ y.y)

-}


{- 5) Codifique as seguintes expressões do cálculo lambda em Haskell e avalie as
mesmas no GHCi: 

a) (λx λy. y)((λz. z)(λz. z))(λw. w) 5 -}
lambda1 = (\x -> \y -> y) ((\z -> z)(\z -> z)) (\w -> w) 5 

{- b) ((λf. (λx. f(f x))) (λy. (y * y))) 3 -}
lambda2 = (\f -> (\x -> f(f x))) (\y -> y*y) 3 

{- c) ((λf. (λx. f(f x))) (λy.(+ y y))) 5 -}
lambda3 = (\f -> (\x -> f(f x))) (\y -> y+y) 5 

{- d) ((λx. (λy. + x y) 5) ((λy. - y 3) 7)) -}
lambda4 = (\x -> (\y -> x+y) 5) ((\y -> y - 3) 7)

{- e) (((λf. (λx. f(f(f x)))) (λy. (y * y))) 2) -}
lambda5 = (((\f -> (\x -> f(f(f x)))) (\y -> (y*y))) 2)

{- f) (λx. λy. + x ((λx. - x 3) y)) 5 6 -}
lambda6 = (\x -> \y -> x + ((\x -> x-3) y)) 5 6