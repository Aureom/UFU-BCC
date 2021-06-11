l1=[1..2000]
l2=[2000,1999..1]
l3=l1++[0]
l4=[0]++l2
l5=l1++[0]++l2
l6=l2++[0]++l1
l7=l2++[0]++l2
x1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
x2=[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
x3=[11,12,13,14,15,16,17,18,19,20,1,2,3,4,5,6,7,8,9,10]
x4=[10,9,8,7,6,5,4,3,2,1,20,19,18,17,16,15,14,13,12,11]
x5=[11,12,13,14,15,5,4,3,2,1,16,17,18,19,20,10,9,8,7,6]
x6=[1,12,3,14,5,15,4,13,2,11,6,17,8,19,20,10,9,18,7,16]
x7 = [20,8,2,11,13,3,7,18,14,4,16,10,15,1,9,17,19,12,5,6]

{- Bolha original -}
bolha :: (Num b, Ord a) => [a] -> ([a], b)
bolha [] = ([], 0)
bolha lista = bolhaOrd lista 0 (length lista)

bolhaOrd :: (Eq t1, Num t1, Ord a, Num t2) => [a] -> t2 -> t1 -> ([a], t2)
bolhaOrd lista i 0 = (lista,i)
bolhaOrd lista i n = bolhaOrd lst j (n-1)
    where 
        (lst,j) = trocas (lista,i)

trocas :: (Ord a, Num b) => ([a], b) -> ([a], b)
trocas ([x],i) = ([x],i)
trocas (x:y:zs, i)
    | x > y = (y:lst1, j1)
    | otherwise = (x:lst2, j2)
    where   
        (lst1,j1) = trocas(x:zs, i+1)   -- como inverte x com y soma 1 no contador
        (lst2,j2) = trocas(y:zs, i)     -- como não inverte x com y mantem o valor

{- Variação 1: parada do algoritmo é antecipada quando uma iteração de trocas é finalizada sem que nenhuma troca efetiva seja realizada na iteração completa. -}
bolha1 :: (Num b, Ord a, Eq b) => [a] -> ([a], b)
bolha1 [] = ([], 0)
bolha1 lista = bolhaOrd1 lista 0 (length lista)

bolhaOrd1 :: (Num t1, Eq t1, Eq t2, Ord a, Num t2) => [a] -> t2 -> t1 -> ([a], t2)
bolhaOrd1 lista i 0 = (lista,i)
bolhaOrd1 lista i n 
    | j == 0 = (lista, i)
    | otherwise = bolhaOrd1 lst j (n-1)
    where 
        (lst,j) = trocas (lista,i)

{- Variação 2: faz parada antecipada e, a cada iteração de trocas, a avaliação é realizada ignorando o último elemento cuja posição foi fixada. Ou seja, diminui o tamanho da lista a ser ordenada a cada iteração. -}
bolha2 :: (Num b, Ord a, Eq b) => [a] -> ([a], b)
bolha2 [] = ([], 0)
bolha2 lista = bolhaOrd1 lista 0 (length lista)

bolhaOrd2 :: (Num t1, Eq t1, Eq t2, Ord a, Num t2) => [a] -> t2 -> t1 -> ([a], t2)
bolhaOrd2 lista i 0 = (lista,i)
bolhaOrd2 lista i n 
    | j == 0 = (lista, i)
    | otherwise = bolhaOrd2 lst j (n-1)
    where 
        (lst,j) = trocas2 (lista,i)

trocas2 :: (Ord a, Num b) => ([a], b) -> ([a], b)
trocas2 ([x],i) = ([x],i)
trocas2 (x:y:zs, i)
    | x > y = (y:lst1, j1)
    | otherwise = (x:lst2, j2)
    where   
        (lst1,j1) = trocas(x:zs, i+1)   -- como inverte x com y soma 1 no contador
        (lst2,j2) = trocas(y:zs, i)     -- como não inverte x com y mantem o valor
