{- 1) Implemente as funções recursivas vistas nas vídeo-aulas 9 e 10: conta_ch,
conta, maior, primeiros, pertence, uniaoR. -}
contaCh :: [Char] -> Int
contaCh [] = 0
contaCh (x : r) = 1 + contaCh r

conta :: [t] -> Int
conta [] = 0
conta (_ : r) = 1 + conta r

maior :: [Int] -> Int
maior [x] = x
maior (x : y : resto)
    | x > y = maior (x: resto)
    | otherwise = maior (y: resto)

primeiros :: Int -> [t] -> [t]
primeiros 0 _ = []
primeiros _ [] = []
primeiros n (x : xs) = x: primeiros (n-1) xs

pertence :: Eq t => t -> [t] -> Bool
pertence a [] = False
pertence a (x : z) = (a == x) || pertence a z

uniaoR :: Eq t => [t] -> [t] -> [t]
uniaoR [] list = list
uniaoR (x : xs) list =
    if pertence x list
        then uniaoR xs list
        else x: uniaoR xs list

{- 2) Escreva a função recursiva npares que recebe uma lista de inteiros e retorna a
quantidade de números pares pertencentes à lista. -}
npares :: [Int] -> Int
npares [] = 0
npares (x : r)
    | even x = 1 + npares r
    | otherwise = npares r

{- 3) Escreva a função recursiva produtorio que recebe uma lista de números e
retorna o produto de todos os seus elementos. -}
produto :: [Int] -> Int
produto [] = 0
produto [x] = x
produto (x : r) = x * produto r

{- 4) Escreva a função recursiva comprime a seguir que recebe uma lista de listas e
retorna uma lista contendo todos os elementos das sublistas. -}
comprime :: [[a]] -> [a]
comprime [] = []
comprime (x : r) = x ++ comprime r

{- 5) Escreva a função recursiva tamanho a seguir que recebe uma lista polimórfica
(de qualquer tipo) e retorna a quantidade de elementos que ela possui. -}
tamanho :: [a] -> Int
tamanho [] = 0
tamanho (_ : r) = 1 + tamanho r

{- 6) Escreva a função recursiva uniaoRec2 que faz a união de duas listas de modo
que mantenha todos os elementos da 1a lista na mesma ordem e no final
acrescenta os elementos da 2a lista que não estejam presentes na primeira. -}
uniaoRec2 :: Eq a => [a] -> [a] -> [a]
uniaoRec2 list [] = list
uniaoRec2 list (y : yr) 
    | pertence y list = uniaoRec2 list yr
    | otherwise = uniaoRec2 (list ++ [y]) yr
