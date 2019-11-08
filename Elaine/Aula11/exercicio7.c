//
// Created by kaioa on 08/11/2019.
//
#include <stdio.h>

int checkPerfectNumber(double nmbr){
    int soma = 0;

    for(int i  = 1; i < nmbr; ++i){
        soma += i;
        if (nmbr == soma) return 1; //perfeito
    }

    return 0; // não é perfeito
}

int main(){
    int nmbr;
    scanf("%d", &nmbr);
    checkPerfectNumber(nmbr) ? printf("%d é perfeito", nmbr) : printf("%d nao é perfeito", nmbr);
}