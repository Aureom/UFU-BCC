//Fac¸a uma func¸ao que receba dois valores num ˜ ericos e um s ´ ´ımbolo. Este s´ımbolo representara a operac¸ ´ ao que se deseja efetuar com os n ˜ umeros. Se o s ´ ´ımbolo for + devera´
//ser realizada uma adic¸ao, se for ˜ − uma subtrac¸ao, se for ˜ / uma divisao e se for ˜ ∗ sera´
//efetuada uma multiplicac¸ao.

#include <stdio.h>

double calc(double numbers[2], char operator){
    if(operator == '+') return numbers[0] + numbers[1];
    else if(operator == '-') return numbers[0] + numbers[1];
    else if(operator == '/') return numbers[0] / numbers[1];
    else if(operator == '*') return numbers[0] * numbers[1];
}

int main(){
    double numbers[2];
    char operator = ' ';

    printf("\nInsira 2 numeros: ");
    for (int i = 0; i < 2; ++i) {
        scanf("%lf", &numbers[i]);
    }

    printf("\nInsira algum operador (+) (-) (*) (/): ");
    while(operator != '+' && operator != '-' && operator != '/' && operator != '*'){
        scanf("%c", &operator);
    }

    printf("\nResultado: %.2lf", calc(numbers, operator));
}