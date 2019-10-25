/*
   Crie um programa que le 6 valores inteiros e, em seguida, mostre na tela os valores lidos.
 */

#include <stdio.h>

int main(){
    int array[6];

    for (int i = 0; i < 6; ++i) {
        printf("Insira o %dº numero: ", i);
        scanf("%d", &array[i]);
    }
    for (int i = 0; i < 6; ++i) printf("%d", array[i]);
}