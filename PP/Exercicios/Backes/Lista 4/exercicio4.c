/*
. Fac¸a um programa que leia um vetor de 8 posic¸oes e, em seguida, leia tamb ˜ em dois va- ´
    lores X e Y quaisquer correspondentes a duas posic¸oes no vetor. Ao final seu programa ˜
    devera escrever a soma dos valores encontrados nas respectivas posic¸ ´ oes ˜ X e Y .
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
    double value[7];
    int x = 0, y = 0;

    for (int i = 0; i < 8; ++i) {
        printf("\nInsira o %d\xf8 numero: ", i + 1);
        scanf("%lf", &value[i]);
    }

    printf("\nInsira dois valores entre 0 e 7");
    while(1 > x || x > 7) scanf("%d", &x);
    while(1 > y || y > 7) scanf("%d", &y);

    printf("\nResultado de %.2lf + %.2lf = %.2lf", value[x], value[y], value[x] + value[y]);
}