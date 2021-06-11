{- Exercício 7) Jogo “Pedra, Papel, Tesoura”
a) Defina um tipo algébrico Jogada, para representar uma possível jogada, ou
seja: Pedra ou Papel ou Tesoura. -}
data Jogada = Pedra | Papel | Tesoura
            deriving (Enum, Show)

{- b) Defina a função vence, que recebe duas instâncias de Jogada j1 e j2 e retorna
True se j1 vence j2 no jogo. Ex: -}
vence :: Jogada -> Jogada -> Bool 
vence Pedra Tesoura = True
vence Papel Pedra = True
vence Tesoura Papel = True
vence Pedra Papel = False
vence Papel Tesoura = False
vence Tesoura Pedra = False
vence Pedra Pedra = False
vence Tesoura Tesoura = False
vence Papel Papel = False


{- b) Defina a função vencedoras que recebe uma lista de duplas de jogadas e retorna
uma lista com as jogadas vencedoras. No caso de uma dupla que resulte em empate,
retorna o primeiro elemento da tupla. Ex:
> vencedoras [(Pedra,Tesoura),(Tesoura,Pedra), (Tesoura,Tesoura)]
[Pedra, Pedra, Tesoura] -}
vencedoras :: [(Jogada, Jogada)] -> [Jogada]
vencedoras x = [venceEnum x y | (x, y) <- x]

venceEnum :: Jogada -> Jogada -> Jogada 
venceEnum Pedra Tesoura = Pedra
venceEnum Papel Pedra = Papel
venceEnum Tesoura Papel = Tesoura
venceEnum Pedra Papel = Papel
venceEnum Papel Tesoura = Tesoura
venceEnum Tesoura Pedra = Pedra
venceEnum Pedra Pedra = Pedra
venceEnum Tesoura Tesoura = Tesoura
venceEnum Papel Papel = Papel