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

{- QuickSort original -}
quicksort :: Ord a => [a] -> ([a], Int)
quicksort [] = ([], 0)
quicksort (s:xs) = (restoEsq ++ [s] ++ restoDir, (length restoEsq + length restoDir) + cnt + cnt1)
    where
        (restoEsq, cnt) = quicksort [x |x <- xs, x < s]
        (restoDir, cnt1) = quicksort [x |x <- xs, x >= s]

{- - Variação 1: modifique o algoritmo original para que ao invés dos elementos maiores e
menores serem encontrados com buscas independentes, que seja elaborada e utilizada a
função divide que percorre a lista uma única vez, retornando os elementos menores em uma
lista e os elementos menores em outra.
EX: > divide 'j' "pindamonhangaba" Resposta: ("idahagaba","pnmonn") -}
quicksort1 :: Ord a => [a] -> ([a], Int)
quicksort1 [] = ([], 0)
quicksort1 (s:xs) = (lista1 ++ [s] ++ lista2, cnt1+cnt2+cnt3)
    where
        (l1, l2, cnt1) = divide s xs
        (lista1, cnt2) = quicksort1 l1
        (lista2, cnt3) = quicksort1 l2

divide :: Ord a => a -> [a] -> ([a], [a], Int)
divide x [] = ([], [], 0)
--divide x lst = (filter (< x) lst, filter (>= x) lst)
divide x (y:ys)
    | y < x = (y : l1, l2, n+1)
    | otherwise  = (l1, y : l2, n+1)
    where
        (l1, l2, n) = divide x ys

{- - Variação 2: modifique a variação 1 para que o elemento pivô seja obtido a partir da análise
dos 3 primeiros elementos da lista, sendo que o pivô será o elemento mediano entre eles.
Exemplo: na lista [3, 9, 4, 7, 8, 1, 2], os elementos 3, 9 e 4 seriam analisados e o pivô escolhido
seria 4. Caso a lista a ser analisada tenha menos que 3 elementos, o pivô é sempre o primeiro.
- Realizar execuções comparativas nas listas dadas como exemplo entre os algoritmos da
Variação 1, 2 e do algoritmo original para avaliar: 1) o número de comparações em cada
execução; 2) o tempo de execução (apenas verifiquem se existe uma mudança aparente de
tempo de processamento). Apresentar esses resultados em um arquivo PDF, fazendo uma
análise dos resultados encontrados. -}

quicksort2 :: Ord a => [a] -> ([a], Int)
quicksort2 [] = ([], 0)
quicksort2 [x] = ([x], 0)
quicksort2 x = (lista1 ++ [pivo] ++ lista2, cnt1+cnt2+cnt3)
    where
        mediana = take 3 x
        pivo
            | length mediana < 3 = head mediana
            | otherwise = mediano3 (head mediana) (mediana!!1) (mediana!!2)
        (l1, l2, cnt1) = divide pivo x
        (lista1, cnt2) = quicksort1 l1
        (lista2, cnt3) = quicksort1 l2

mediano3 :: Ord a => a -> a -> a -> a
mediano3 a b c
    | c > b && b > a = b
    | b > a && a > c = a
    | c > a && a > b = a
    | b > c && c > a = c
    | c < a && b < c = c
    | otherwise = b