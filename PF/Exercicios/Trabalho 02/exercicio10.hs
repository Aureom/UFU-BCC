{-Exercício 10) Considere o tipo algébrico ArvBinInt visto em sala para representar
árvores binárias que armazenam números inteiros. Elabore as funções a seguir que
manipulam árvores binárias:
folhas: recebe uma árvore binária e devolve uma listagem com todos os nós
folhas (não internos) existentes na árvore. Percorrer a árvore em préordem.
somaNosinternos: somar os valores de todos os elementos da árvore binária que
são nós internos. Percorrer a árvore em pós-ordem.
pertence: recebe um valor inteiro e verifica se esse valor é igual a algum dos
elementos da árvore binária. Percorrer a árvore em ordem simétrica.-}

data ArvBinInt = Nulo |
                    No Int ArvBinInt ArvBinInt 
                    deriving Show
arvEx :: ArvBinInt
arvEx = (No 8
            (No 3
                (No 1 Nulo Nulo)(No 6
                                    (No 4 Nulo Nulo)(No 7 Nulo Nulo)))
            (No 10
                Nulo
                    (No 14
                        (No 13 Nulo Nulo)Nulo)))
folhas :: ArvBinInt -> [Int]
folhas Nulo = []
folhas (No x left right) = [x] ++ (folhas left) ++ (folhas right) 

somaNosinternos :: ArvBinInt -> Int
somaNosinternos Nulo = 0
somaNosinternos (No x left right) = somaNosinternos left + somaNosinternos right + x

pertence :: Int -> ArvBinInt -> Bool
pertence y arv = if (pertenceAux y arv == 0) then False else True
    where 
        pertenceAux :: Int -> ArvBinInt -> Int
        pertenceAux y Nulo = 0
        pertenceAux y (No x left right) = pertenceAux y left + (if y == x then 1 else 0) + pertenceAux y right

--pertence1 :: Int -> ArvBinInt -> Bool
--pertence1 y (No x left right) = if y==x then True else pertence y left pertence y right
--nao consegui pensar em um jeito do else conseguir usar a recursao para esquerda e para direita