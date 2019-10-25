/*
   Ler um conjunto de numeros reais, armazenando-o em vetor e calcular o quadrado das ´
    componentes deste vetor, armazenando o resultado em outro vetor. Os conjuntos temˆ
    10 elementos cada. Imprimir todos os conjuntos.
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
    double value[8];
    int x = 0, y = 0;

    for (int i = 0; i < 8; ++i) {
        printf("Insira o %dº numero: ", i);
        scanf("%lf", &value[i]);
    }

    printf("Insira dois valores entre 0 e 7");
    while(1 > x || x > 7) scanf("%d", &x);
    while(1 > y || y > 7) scanf("%d", &y);

    printf("Resultado de %.2lf + %.2lf = %.2lf", value[x], value[y], value[x] + value[y]);
}