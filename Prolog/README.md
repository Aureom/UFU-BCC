
# PROLOG - Um breve resumo sobre a linguagem [Prolog](https://en.wikipedia.org/wiki/Prolog)

De inicio devemos saber que essa  linguagem é bem diferente das usuais, por se tratar de uma linguagem de programação lógica ela trabalha com uma base de dados que no caso são os fatos. Por exemplo:
```prolog
humano('kaio').
```
Nesse exemplo estamos dizendo que eu (kaio) sou um humano, isso passa a ser um fato. Por exemplo, ao consultar recebemos o seguinte resultado:
```prolog
?- humano(kaio).
true.

?- humano(X).
X = kaio.
```

## Operadores aritméticos


|Operador  |Definição              |Exemplo       | Saida      |
|----------|-----------------------|--------------|------------|
| +        |Adição                 | 2 + 4        | 6          |
| -        |Subtração              | 4 - 2        | 2          |
| *        |Multiplicação          | 2 * 4        | 8          |
| /        |Divisão                | 4 / 2        | 2          |
| //       |Divisão arredondada    | 7 // 4       | 1          |
| mod      |Resto da divisão       | 7 mod 4      | 3          |
| **       |Exponenciação          | 3 ** 2       | 9          |

## Operadores lógicos

|Operador    |Definição              |Exemplo       | Saida      |
|------------|-----------------------|--------------|------------|
| ,          |Conjunção lógica ''E'' | ex :- a, b.  |            |
| ;          |Disjunção lógica ''OU''| ex :- a; b.  |            |
| \\+, not() |Negação ''NÃO''        | \\+ (2 = 4). | Verdadeiro |

## Operadores comparativos

Os operadores comparativos, funcionam comparando duas variaveis, como por exemplo 'X' e 'Y'

|Operador |Definição                          |Exemplo                 |
|---------|-----------------------------------|------------------------|
| =       |Unificação                         | X = Y. (Y é X e X é Y) |
| \\=     |Desunificação                      | X \\= Y.               |
| ==      |Igualdade                          | X == X.                |
| \\==    |Desigualdade                       | X \\== Y.              |
| =:=     |Igualdade nos valores da expressão | X =:= Y.               |