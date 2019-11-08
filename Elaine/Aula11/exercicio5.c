//
// Created by kaioa on 08/11/2019.
//
#include <stdio.h>

int result(int nmbr, char opt){
    int result = nmbr;
    if(opt == 'A' || opt == 'a'){
        for (int i = nmbr-1; i >= 1; --i) {
            result *= i;
            printf("%d, %d\n", result, i);
        }
    }else if(opt == 'B' || opt == 'b'){
        for (int i = nmbr-1; i >= 1; --i) {
            result += i;
        }
    }
    return result;
}

int main(){
    int nmbr = -1;
    char opt = ' ';
    printf("Insira um numero: ");
    while(0 > nmbr) {
        scanf("%d", &nmbr);
    }

    printf("\na) Fatorial: calcula e retorna o fatorial do número. Ex: para n = 4, n! = 4 * 3 * 2 * 1 = 24\nb) Somatório: calcula o somatório entre 1 e n. Ex: para n = 5, soma = 1+2+3+4+5 = 15.");
    while(opt != 'A' && opt != 'a' && opt != 'B' && opt != 'b'){
        scanf("%c", &opt);
    }

    printf("Resultado: %d", result(nmbr, opt));
}