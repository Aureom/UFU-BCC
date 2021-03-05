//Fac¸a uma func¸ao que receba dois n ˜ umeros inteiros positivos por par ´ ametro e retorne a ˆ
//soma dos N numeros inteiros existentes entre eles

#include <stdio.h>

void sumBetween(int x, int y){
    int highest = x > y ? x : y, lowest = x > y ? y : x, sum = 0;

    for (int i = lowest; i < highest; ++i) {
        sum += i;
    }

    printf("Soma dos numeros entre %d e %d = %d", lowest, highest, sum);
}

int main() {
    int a, b;

    printf("Insira dois numeros para calcular a soma de todos entre eles: \n");
    scanf("%d %d", &a, &b);
    sumBetween(a, b);
}