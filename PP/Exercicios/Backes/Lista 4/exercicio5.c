#include <stdio.h>
#include <stdlib.h>

int main(){
    int value[10];
    int pair = 0;

    for (int i = 0; i < 10; ++i) {
        printf("\nInsira o %d\xf8 numero: ", i);
        scanf("%d", &value[i]);
    }

    for (int i = 0; i < 10; ++i) {
        if(value[i] % 2 == 0) pair++;
    }

    printf("Voce inseriu %d numeros pares", pair);
}