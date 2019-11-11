//Fac¸a uma func¸ao que receba dois n ˜ umeros e retorne qual deles ´ e o maior.

#include <stdio.h>
#include <math.h>

double highestValue(double x, double y){
    return x > y ? x : y;
}

int main(){
    double x, y;

    printf("Insira dois numeros para verificar qual possui o maior valor: ");
    scanf("%lf %lf", &x, &y);

    printf("O numero %.2lf é o maior. UaU!", highestValue(x, y));
}