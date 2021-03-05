# Ponteiros 

Utilizado para guardar um endereço especifico na memória

- Referencia um local da memória onde existe um dado do tipo declarado
- Pode ser inicializado referenciando um local na memória ou NULL

### Exemplo

```c
int x; // guardamos um inteiro
int *y; // guarda o endereço na memória que possui um número inteiro
char w, *z; // pode ser declarado com outras variaveis
int *i = &x; // receberá NULL, pois x não foi inicializado
char *k = NULL; // k não aponta para nenhum endereço na memória (na realidade aponta para o endereço 0, mas o endereço 0 na memoria é reservado para o valor nulo)
```



## Operadores

| Operador | Descrição                                                    |
| :------- | ------------------------------------------------------------ |
| *        | Quando declarando uma variável: sinaliza que ela é do tipo ponteiro <br />Quando não está declarando uma variável: acessa o conteúdo que está no endereço de memória |
| &        | Retorna o endereço da memória onde uma variável está armazenada |

