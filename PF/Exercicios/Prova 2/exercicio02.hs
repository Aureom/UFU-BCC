{- 4ª Questão (EXTRA) Estou anulando a questão 2 -}
-- Kaio Augusto de Souza - 11921BCC040
data Horario = AntesMD Int Int Int
             | AposMD Int Int Int
             deriving Show

maisTarde :: Horario -> Horario -> Horario
maisTarde (AntesMD x1 y1 z1) (AntesMD x2 y2 z2)
    | x1 > x2 = AntesMD x1 y1 z1
    | x1 == x2 && y1 > y2 = AntesMD x1 y1 z1
    | x1 == x2 && y1 == y2 && z1 > z2 = AntesMD x1 y1 z1
    | otherwise = AntesMD x2 y2 z2

maisTarde (AposMD x1 y1 z1) (AposMD x2 y2 z2)
    | x1 > x2 = AposMD x1 y1 z1
    | x1 == x2 && y1 > y2 = AposMD x1 y1 z1
    | x1 == x2 && y1 == y2 && z1 > z2 = AposMD x1 y1 z1
    | otherwise = AposMD x2 y2 z2

maisTarde (AposMD x1 y1 z1) (AntesMD x2 y2 z2) = AposMD x1 y1 z1
maisTarde (AntesMD x1 y1 z1) (AposMD x2 y2 z2) = AposMD x1 y1 z1