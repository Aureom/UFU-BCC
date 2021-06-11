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

{- Insertion original -}

insercao :: Ord a => [a] -> ([a], Int)
insercao [] = ([], 0)
insercao (x:xs) = (restoOrd, cnt + cntOrd)
    where
        (resto, cnt) = insercao xs
        (restoOrd, cntOrd) = insereOrd x resto

insereOrd :: Ord a => a -> [a] -> ([a], Int)
insereOrd x [] = ([x], 0)
insereOrd x (y:ys)
    | x <= y = (x:y:ys, cnt+1)
    | otherwise = (y : resto, cnt+1)
    where
        (resto, cnt) = insereOrd x ys

{- Variação 1: Refaça a implementação do algoritmo Inserção usando funções genéricas(foldr ou foldr1) -}
--insercao1 :: t a -> ([a], Int)
--insercao1 = foldr 