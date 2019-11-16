//. Fac¸a uma func¸ao que retorne o maior fator primo de um n ˜ umero.

#include <stdio.h>

int powXy(int x, int y){
    if(1 >= y) return x;
    return x * powXy(x, y - 1);
}

int main(){
    int x, y;

    printf("Insira um numero e a sua potencia: ");
    scanf("%d %d", &x, &y);

    printf("%d elevado a potencia de %d = %d\n", x, y, powXy(x, y));
}