#include <stdio.h>
#include <stdlib.h>

int main(){
    double value[15];
    double total = 0;

    for (int i = 0; i < 15; ++i) {
        printf("\nInsira o %d\xf8 numero: ", i);
        scanf("%lf", &value[i]);
        total += value[i];
    }

    printf("Media geral da turma: %lf", total/15);
}