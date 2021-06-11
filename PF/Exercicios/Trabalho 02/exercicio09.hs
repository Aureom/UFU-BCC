{- Exercício 9) a) Defina o Tipo Algébrico Estudante para registrar informações de alunos
de universidades e colégios. O objetivo é realizar a união das informações destes
estudantes. Cada ocorrência de estudante deve ter um identificador que diferencie
universitários de colegiais. Além disso, se for um aluno de colégio, devem existir as
informações: ano (1o, 2o ou 3o), nome do colégio (Nacional, Olimpo e Gabarito)
matricula (5 letras), altura e peso. Se for um aluno universitário, devem existir as
informações: nome da universidade (UFU, UNITRI e UNA), nome do curso
(Computação, Medicina, Direito e Música), matricula (8 dígitos), altura e idade. Crie
uma pequena base de estudantes com pelo menos 20 instâncias, sendo 10 alunos
colegiais e 10 alunos universitários. Em cada grupo, 3 alunos devem ter altura abaixo
de 1,70, 5 alunos devem ter altura entre 1,70 e 1,90 e 2 alunos devem ter altura acima
de 1,90.
 -}
data Estudante = Colegial Ano Colegio Matricula Altura Peso
               | Universitario Universidade Curso Matricula Altura Idade

data Ano = Primeiro | Segundo | Terceiro
data Colegio = Nacional | Olimpo | Gabarito
data Matricula = ColegialM String
               | UniversitarioM Int
               deriving (Show)
type Altura = Float
type Peso = Int

data Universidade = UFU | UNITRI | UNA
data Curso = Computação | Medicina | Direito | Música
type Idade = Int

criaMatriculaCol :: String -> Matricula
criaMatriculaCol x 
    | length x == 5 = ColegialM x
    | otherwise = undefined 

criaMatriculaUni :: String -> Matricula
criaMatriculaUni x 
    | length x == 8 = UniversitarioM y
    | otherwise = undefined 
    where
        y = read x :: Int

estudantes :: [Estudante]
estudantes = [Colegial Primeiro Olimpo (criaMatriculaCol "EJHIM") 1.65 67,
              Colegial Segundo Gabarito (criaMatriculaCol "FMWMA") 1.21 25,
              Colegial Primeiro Olimpo (criaMatriculaCol "SEIJI") 1.56 87,
              Colegial Segundo Nacional (criaMatriculaCol "PSAIP") 1.78 64,
              Colegial Terceiro Nacional (criaMatriculaCol "NUMTO") 1.89 78,
              Colegial Terceiro Olimpo (criaMatriculaCol "LHNHY") 1.82 45,
              Colegial Primeiro Nacional (criaMatriculaCol "JHDRI") 1.74 78,
              Colegial Segundo Nacional (criaMatriculaCol "IQBFU") 1.79 98,
              Colegial Terceiro Nacional (criaMatriculaCol "FDPNQ") 1.82 57,
              Colegial Primeiro Olimpo (criaMatriculaCol "ZEZRH") 1.98 97,
              Colegial Segundo Olimpo (criaMatriculaCol "QVUJT") 2.58 125,
    
              Universitario UFU Computação (criaMatriculaUni "80020229") 1.50 19,
              Universitario UFU Computação (criaMatriculaUni "04683261") 1.60 18,
              Universitario UFU Computação (criaMatriculaUni "02659412") 1.65 22,
              Universitario UFU Computação (criaMatriculaUni "35517017") 1.71 23,
              Universitario UFU Computação (criaMatriculaUni "19438365") 1.73 98,
              Universitario UFU Computação (criaMatriculaUni "99765660") 1.75 32,
              Universitario UFU Computação (criaMatriculaUni "52662817") 1.76 21,
              Universitario UFU Computação (criaMatriculaUni "21967457") 1.77 47,
              Universitario UFU Computação (criaMatriculaUni "46785971") 1.79 21,
              Universitario UFU Computação (criaMatriculaUni "93587394") 1.92 15,
              Universitario UFU Computação (criaMatriculaUni "98580546") 1.94 54]

{- b) Implemente a função descobre_altos, utilizando a função verifica_alto do exercício
anterior para receber a base de estudantes (ou seja, a lista contendo os dados dos 2o
estudantes armazenados) e retornar uma lista de duplas com o numero de matricula
na 1a posição da tupla, conceito nebuloso de pessoa alta (verdadeiro, falso ou talvez) na 2a
 posição da tupla, ou seja, o retorno é do tipo (Int,Nebuloso) -}
data Nebuloso = Verdadeiro 
                | Falso 
                | Talvez Float
            deriving (Show)

fuzzifica :: Float -> Nebuloso
fuzzifica x 
    | x <= 0 = Falso
    | x >= 1 = Verdadeiro
    | otherwise = Talvez x

verificaAlto :: Float -> Nebuloso 
verificaAlto altura = fuzzifica((altura-1.70)/0.20)

descobreAltos :: [Estudante] -> [(Matricula, Nebuloso)]
descobreAltos estudantes = [descobreAltosHelper x | x <- estudantes]
    where 
        descobreAltosHelper (Colegial _ _ matricula altura _) = (matricula, verificaAlto altura)
        descobreAltosHelper (Universitario _ _ matricula altura _) = (matricula ,verificaAlto altura)