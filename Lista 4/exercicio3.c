/*
   Ler um conjunto de numeros reais, armazenando-o em vetor e calcular o quadrado das ´
    componentes deste vetor, armazenando o resultado em outro vetor. Os conjuntos temˆ
    10 elementos cada. Imprimir todos os conjuntos.
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
    int value[10], result [10];

    for (int i = 0; i < 10; ++i) {
        printf("\nInsira o %d\xf8 numero: ", i);
        scanf("%d", &value[i]);
        result[i] = value[i] * value[i];
    }

    for (int i = 0; i < 10; ++i)
        printf("\nResultado da potencia quadratica de %d = %d", value[i], result[i]);
}