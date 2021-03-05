//Escreva uma func¸ao recursiva que calcule a soma dos primeiros ˜ n cubos: S(n) = 13 +
//2
//3 + ... + n
//3

#include <stdio.h>

int sumCubed(int x){
    if(1 >= x) return 1;
    return x*x*x + sumCubed(x-1);
}

int main(){
    int x;

    printf("Insira um numero: ");
    scanf("%d", &x);

    printf("Valor da soma dos cubos entre 1 e %d = %d\n", x, sumCubed(x));
}