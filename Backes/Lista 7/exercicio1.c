//Crie uma func¸ao que recebe como par ˜ ametro um n ˆ umero inteiro e devolve o seu dobro.

#include <stdio.h>

int multiply(int x) { 
    return x * 2; 
}

int main() {
    int x;
    
    printf("Insira um numero inteiro: ");
    scanf("%d", &x);
    
    printf("Dobro: %d", multiply(x));
}