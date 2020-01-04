//Crie uma func¸ao recursiva que receba um n ˜ umero inteiro positivo N e calcule o somat ´ orio ´
//dos numeros de 1 a N.

#include <stdio.h>

int sum(int x){
    if(0 >= x) return 0;
    return x + sum(x - 1);
}

int main(){
    int x;

    printf("Insira um numero: ");
    scanf("%d", &x);

    printf("Valor somado de 1 ate %d = %d\n", x, sum(x));
}