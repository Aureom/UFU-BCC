//
// Created by kaioa on 08/11/2019.
//
#include <stdio.h>

double result(int x){
    return ((5.0 + x) / x - 2.0 * x) * +x;
}

int main(){
    int nmbr;
    printf("Insira um numero para calcular a funcao: ");
    scanf("%d", &nmbr);
    printf("\nResultado: %lf", result(nmbr));
}