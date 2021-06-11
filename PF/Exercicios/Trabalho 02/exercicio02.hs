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

{- Seleção original -}
selecao :: Ord a => [a] -> ([a], Int)
selecao [] = ([], 0)
selecao xs = ([x] ++ selecaoResto, cnt + cnt2 + cnt3)
    where
        (x, cnt) = minimo xs
        (y, cnt2) = remove x xs
        (selecaoResto, cnt3) = selecao y

remove :: Ord a => a -> [a] -> ([a], Int)
remove a [] = ([], 0)
remove a (x:xs)
    | a == x = (xs, cnt+1)
    | otherwise = (x:rmvResto, cnt)
    where
        (rmvResto, cnt) = remove a xs

minimo :: Ord a => [a] -> (a, Int)
minimo [] = (undefined, 0)
minimo [x] = (x, 0)
minimo (x:xs)
    | x <= minimoResto = (x, cnt+1)
    | otherwise = (minimoResto, cnt)
    where
        (minimoResto, cnt) = minimo xs


{- - Variação1: Refaça o código original para que a busca pelo menor elemento (função mínimo) ea eliminação desse menor elemento da lista a ser ordenada (função remove) ocorra numamesma função (remove_menor), sem a necessidade de se percorrer a lista duas vezes a cadaiteração. -}
selecao1 :: Ord a => [a] -> ([a], Int)
selecao1 [] = ([], 0)
selecao1 xs = ([x] ++ selecaoResto, cnt + cnt2)
    where
        (resto, x, cnt) = removeMinimo xs
        (selecaoResto, cnt2) = selecao1 resto

removeMinimo :: Ord a => [a] -> ([a], a, Int)
removeMinimo [] = ([], undefined, 0)
removeMinimo [x] = ([], x, 0)
removeMinimo (x:xs)
    | x <= minimoResto = (minimoResto:removeResto , x, cnt+1)
    | otherwise = (x:removeResto, minimoResto, cnt)
    where
        (removeResto, minimoResto, cnt) = removeMinimo xs

{- Variação 2: Refaça a implementação do algoritmo Seleção usando funções genéricas (foldr oufoldr1) . -}
selecao2 :: Ord a => [a] -> ([a], Int)
selecao2 [] = ([], 0)
selecao2 xs = ([x] ++ selecaoResto, cnt + cnt2)
    where
        x = foldr1 min xs
        (y, cnt) = remove x xs
        (selecaoResto, cnt2) = selecao2 y