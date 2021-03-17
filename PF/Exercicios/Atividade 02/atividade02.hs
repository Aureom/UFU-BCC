{- 1) Reescreva as funções do último roteiro (dobro, quadruplicar, hipotenusa, distância),
definindo a prototipação de tipos de cada função. Obs: se você já fez isso no primeiro
roteiro, envie novamente para o exercício ficar completo. -}
double :: Int -> Int 
double n = n * 2

quadruple :: Int -> Int
quadruple n = double (double n)

hypotenuse :: Float -> Float -> Float
hypotenuse a b = sqrt(a^2 + b^2)

distance :: Float -> Float -> Float -> Float -> Float
distance x1 y1 x2 y2 = sqrt((x2 - x1)^2 + (y2 - y1)^2)

{- 2) Abra o ambiente interativo GHCi e avalie as seguintes expressões -}
-- Foto na pasta imagens

{- 3) Dado um valor monetário em reais, escreva uma função conversao que retorna uma tupla-3
com o valor em Real, Dolar e Euro, sendo que 1 real = 3,96 dólares = 4,45 euros. -}
conversao :: Float -> (Float, Float, Float)
conversao reais = (reais, reais * 3.96, reais * 4.45)

{- 4) Implemente a função bissexto que, dado um ano (inteiro), indique se ele é bissexto ou não. -}
bissexto :: Int -> Bool
bissexto ano 
    | mod ano 400 == 0 = True 
    | mod ano 4 == 0 && mod ano 100 /= 0 = True 
    | otherwise = False 

{- 5) Defina o tipo Data dado a seguir. Escreva a função bissexto2 que recebe uma data e indique
se ela pertence a um ano bissexto ou não. -}
type Data = (Int, Int, Int)

bissexto2 :: Data -> Bool
bissexto2 (dia, mes, ano) = bissexto ano

{- 6) Escreva a função valida que indica se uma data é válida ou não. -}
valida :: Data -> Bool 
valida (dia, mes, ano) 
    | dia >= 1 && dia <= 31 && (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) = True
    | dia >= 1 && dia <= 30 && (mes == 4 || mes == 6 || mes == 9 || mes == 11) = True
    | dia >= 1 && dia <= 28 && mes == 2 && not (bissexto ano) = True
    | dia >= 1 && dia <= 29 && mes == 2 && bissexto ano = True
    | otherwise = False

{- 7) Escreva a função precede que recebe 2 datas e indica se a 1a data é anterior à 2a. -}
precede :: Data -> Data -> Bool
precede (diaX, mesX, anoX) (diaY, mesY, anoY)
    | anoX < anoY = True 
    | anoX == anoY && mesX < mesY = True
    | anoX == anoY && mesX < mesY && diaX < diaY = True
    | otherwise = False

{- 8) Implemente as estruturas de dados (tuplas) para um sistema de gerenciamento de bibliotecas e
depois as defina como tipos. -}
-- Livro: composto por código do livro, título do livro, autor, editora e ano de publicação.
type Livro = (String, String , String , String, Int)
-- Aluno: composto por código do aluno, nome, e-mail e telefone.
type Aluno = (String, String, String, String)
-- Empréstimo: composto por código do livro, código do aluno, data de empréstimo, data de devolução e situação.
type Emprestimo = (String, String, Data, Data, String)

{- 9) Seja o tipo Emprestimo e o exemplo dado a seguir, composto por código do livro, código do
aluno, data de empréstimo, data de devolução e situação. Escreva uma função que verifica se um
empréstimo está em dia, dado um empréstimo e a data de hoje. -}
e1::Emprestimo
e1 = ("H123C9","BSI200945",(12,9,2009),(20,9,2009),"aberto")

emprestimoEmDia :: Emprestimo -> Data -> Bool
emprestimoEmDia (_, _, _, dataDevolucao, situacao) dataAtual
  | situacao == "fechado" = True
  | dataDevolucao == dataAtual = True
  | precede dataAtual dataDevolucao = True
  | otherwise = False