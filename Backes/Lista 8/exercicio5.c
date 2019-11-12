//. Fac¸a uma func¸ao recursiva que calcule e retorne o N- ˜ esimo termo da sequ ´ encia Fibo- ˆ
//nacci. Alguns numeros desta sequ ´ encia s ˆ ao: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89...

#include <stdio.h>

int fibonacci(int x){
    if(x == 0) return 0;
    if(x == 1 || x == 2) return 1;
    return fibonacci(x - 2) + fibonacci(x - 1);
}

int main(){
    int x;

    printf("Insira um numero para encontralo na sequencia de fibonacci: ");
    scanf("%d", &x);

    printf("\n = %d", fibonacci(x));
}