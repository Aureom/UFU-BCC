data ArvoreBinInt = Nulo | No Int ArvoreBinInt ArvoreBinInt
    deriving Show

arvEx :: ArvoreBinInt
arvEx = No 7
            (No 3 (No 6 Nulo Nulo) (No 1 (No 4 Nulo Nulo) Nulo))
            (No 10 Nulo (No 14 Nulo Nulo))

simOrdem :: ArvoreBinInt -> [Int]
simOrdem Nulo = []
simOrdem (No x esq dir) = simOrdem esq ++ [x] ++ simOrdem dir

buscaMult3 :: ArvoreBinInt -> String -> Int
buscaMult3 arv tipo
    | tipo == "sim" = head (filter apenasDiv3 (simOrdem arv))
    | tipo == "pre" = last (filter apenasDiv3 (simOrdem arv))
    | otherwise = -1

apenasDiv3 :: Integral a => a -> Bool
apenasDiv3 x = mod x 3 == 0