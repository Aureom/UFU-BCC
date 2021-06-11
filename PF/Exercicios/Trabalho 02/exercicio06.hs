{- 
data Exp =
    Val Int -- um numero
    | Add Exp Exp -- soma de duas expressoes
    | Sub Exp Exp -– subtração de duas expressoes

avalia :: Num a => Exp a -> a
avalia (Val x) = x
avalia (Add exp1 exp2) = (avalia exp1) + (avalia exp2)
avalia (Sub exp1 exp2) = (avalia exp1) - (avalia exp2)

a) Expanda as definições acima para que sejam incluídas expressões
usando as operações multiplicação e divisão (além de soma e subtração). -}
data Exp = Val Double
         | Add Exp Exp -- soma de duas expressoes
         | Sub Exp Exp -- subtração de duas expressoes
         | Mul Exp Exp -- multiplicação de duas expressoes
         | Div Exp Exp -- divisao de duas expressoes
          deriving (Show)

avalia :: Exp -> Double
avalia (Val x) = x
avalia (Add exp1 exp2) = avalia exp1 + avalia exp2
avalia (Sub exp1 exp2) = avalia exp1 - avalia exp2
avalia (Mul exp1 exp2) = avalia exp1 * avalia exp2
avalia (Div exp1 exp2) = avalia exp1 / avalia exp2

{- b) Avalie as expressões abaixo, primeiro declarando-as de acordo com a
sintaxe do tipo algébrico e depois executando a função avalia sobre essas
declarações: (3+12)*(15-5)/(1*3) e - ((6+8-5+1)*(2+6/2)) -}
verifica1A :: Double
verifica1A = (3 + 12) * (15 - 5) / (1 * 3)
verifica1 :: Double
verifica1 = avalia(Div (Mul (Add (Val 3) (Val 12)) (Sub (Val 15) (Val 5))) (Mul (Val 1) (Val 3)))

verifica2A :: Double
verifica2A = (6 + 8 - 5 + 1) * (2 + 6 / 2)
verifica2 :: Double
verifica2 = avalia(Mul (Add (Sub (Add (Val 6) (Val 8)) (Val 5)) (Val 1)) (Add (Val 2) (Div (Val 6) (Val 2))))