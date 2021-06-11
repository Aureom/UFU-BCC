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

{- Pesquise e implemente em Haskell o algoritmo mergsort, incluindo um contador decomparações elementares realizadas durante a ordenação. -}
mergesort :: (Ord a) => [a] -> ([a],Int)
mergesort [] = ([], 0)
mergesort [x] = ([x], 0)
mergesort x = (l3, cnt1+cnt2+cnt3)
    where
        l1 = take (div (length x) 2) x
        l2 = drop (div (length x) 2) x
        (l1Sort, cnt1) = mergesort l1
        (l2Sort, cnt2) = mergesort l2
        (l3, cnt3) = merge l1Sort l2Sort

merge :: (Ord a) => [a] -> [a] -> ([a], Int)
merge x [] = (x, 0)
merge [] x = (x, 0)
merge (x:xs) (y:ys)
    | x <= y = (x:l1, n1+1)
    | otherwise = (y:l2, n2+1)
    where
        (l1,n1) = merge xs (y:ys)
        (l2,n2) = merge (x:xs) ys
