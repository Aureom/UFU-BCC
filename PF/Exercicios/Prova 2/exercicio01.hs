x1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
x2=[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
x3=[11,12,13,14,15,16,17,18,19,20,1,2,3,4,5,6,7,8,9,10]
x4=[10,9,8,7,6,5,4,3,2,1,20,19,18,17,16,15,14,13,12,11]
x5=[11,12,13,14,15,5,4,3,2,1,16,17,18,19,20,10,9,8,7,6]
x6=[1,12,3,14,5,15,4,13,2,11,6,17,8,19,20,10,9,18,7,16]
x7 = [20,8,2,11,13,3,7,18,14,4,16,10,15,1,9,17,19,12,5,6]

-- Kaio Augusto de Souza - 11921BCC040

quicksort2::(Ord a) => [a] -> ([a], Int)
quicksort2 [] = ([], 0)
quicksort2 [x] = ([x], 0)
quicksort2 (s:xs) = (listEsq ++ [s] ++ listDir, cnt+cnt2+cnt3)
    where 
        (lst1, lst2, cnt) = divide s xs
        (listEsq, cnt2) = quicksort2 lst1
        (listDir, cnt3) = quicksort2 lst2


divide:: (Ord a) => a -> [a] -> ([a],[a], Int)
divide p [] = ([],[], 0)
divide p (x:xs) = if (x > p) then (x:l1, l2, cnt+1) else (l1,x:l2, cnt+1)
  where 
      (l1, l2, cnt) = divide p xs

