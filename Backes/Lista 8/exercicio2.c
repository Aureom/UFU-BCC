//Fac¸a uma func¸ao recursiva que calcule e retorne o fatorial de um n ˜ umero inteiro N.

#include <stdio.h>

int factorial(int x){
    if(2 > x) return 1;
    return x * factorial(x - 1);
}

int main(){
    int x;

    printf("Insira um numero: ");
    scanf("%d", &x);

    printf("Fatorial de %d = %d\n", x, factorial(x));
}