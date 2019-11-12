//Crie uma func¸ao recursiva que receba dois inteiros positivos ˜ k e n e calcule kn

#include <stdio.h>

int powKn(int k, int n){
    if(1 >= n) return k;
    return k * powKn(k, n - 1);
}

int main(){
    int k, n;

    printf("Insira um numero e a sua potencia: ");
    scanf("%d %d", &k, &n);

    printf("%d elevado a potencia de %d = %d\n", k, n, powKn(k, n));
}