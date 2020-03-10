module Lista02 where
import Data.List

-- Crie uma função que intercala os elementos de duas listas, de qualquer tamanho, contendo números inteiros, numa nova lista.
intercala::[Int]->[Int]->[Int]
intercala x [] = x
intercala [] y = y
intercala (x:xs) (y:ys) = x: y: intercala xs ys -- "x: y:" define a ordem, assim x vem primeiro que y na intercalação

{- Defina novos tipos para representar os dados contidos numa agenda telefônica
  pessoal. Em seguida, crie uma função para recuperar o nome de um contato, a partir
  de um número de telefone. Caso o número não seja encontrado, retornar a mensagem
  “Telefone desconhecido”.

  contato = (nome, endereço, telefone, email)-}
type Contato = ([Char], [Char], [Char], [Char])
type Agenda = [Contato]

listaContato :: Agenda
listaContato = [("Voyager 1", "Meio interestelar", "05091977125600", "voyager1@nasa.gov."), -- Data de lançamento 05 Sept 1977 12:56:00  = telefone
                ("Voyager 2", "Heliosfera", "20081977142900", "voyager2@nasa.gov."), -- Data de lançamento 20 Aug 1977 14:29:00 = telefone
                ("New Horizons", "Cinturão de Kuiper", "19012006190000", "newhorizons@nasa.gov."), -- Data de lançamento 19 January, 2006, 19:00:00 = telefone
                ("WMAP", "Órbita heliossíncrona", "30062001094646", "wmap@nasa.gov.")] -- Data de lançamento 30 June, 2001, 9:46:46 = telefone

acharContato :: [Char]->Agenda->[Char]
acharContato num [] = "Telefone desconhecido"
acharContato num ((nome, _, telefone, _):prox) | num == telefone = nome
                                               | otherwise = acharContato num prox

-- Faça uma função para converter uma data, escrita no formato dd/mm/aaaa (calendário Gregoriano) na correspondente data (ddd/aaaa) do calendário Juliano.