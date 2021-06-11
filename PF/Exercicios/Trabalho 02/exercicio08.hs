{- Exercício 8) Lógica Nebulosa
a) Crie o tipo algébrico Nebuloso que pode ter os valores Verdadeiro; Falso; ou Talvez que
define um conceito intermediário entre Verdadeiro e Falso. No caso do valor Talvez, ele deve
ser associado a ele um valor float que representa o grau de pertinência. O valores Verdadeiro e
Falso não devem estar associados a valores. -}
data Nebuloso = Verdadeiro 
                | Falso 
                | Talvez Float
            deriving (Show)

{- b) Crie uma função fuzzifica que recebe um valor numérico (Float) representando o grau de
pertinência e retorna um conceito Nebuloso, com o valor Falso caso o grau seja menor ou igual
a 0, Verdadeiro se for maior ou igual a 1 e Talvez associado ao grau de pertinência, caso
contrário. -}
fuzzifica :: Float -> Nebuloso
fuzzifica x 
    | x <= 0 = Falso
    | x >= 1 = Verdadeiro
    | otherwise = Talvez x

{- c) Considere a definição nebulosa do conceito “pessoa alta” como: dada a altura da pessoa ,
então pertinência a pessoa alta é dada por (altura-1,70)/0,20

Cria a função verifica_alto que recebe um valor que representa a altura de uma pessoa
(em float) e retorna o valor nebuloso associando a altura ao conceito pessoa alta. -}
verificaAlto :: Float -> Nebuloso 
verificaAlto altura = fuzzifica((altura-1.70)/0.20)

{- d) Considere a definição nebulosa do conceito “carro barato” como: dado o custo de um carro,
então pertinência a carro barato é dado por: (50.000-Custo)/ 20.000

Cria a função verifica_barato que recebe um valor que representa o custo de um carro
(em float) e retorna o valor nebuloso associando o custo ao conceito carro barato. -}
verificaBarato :: Float -> Nebuloso
verificaBarato custo = fuzzifica((50000-custo) / 20000)