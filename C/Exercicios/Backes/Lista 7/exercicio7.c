//Fac¸a uma func¸ao que receba uma temperatura em graus Celsius e retorne-a convertida ˜
//em graus Fahrenheit. A formula de convers ´ ao˜ e:´ F = C ∗ (9.0/5.0) + 32.0, sendo F a
//temperatura em Fahrenheit e C a temperatura em Celsius.

#include <stdio.h>

double convert(double tempCelsius){
    return (9.0 * tempCelsius / 5) + 32;
}

int main(){
    double tempCelsius;

    printf("Insira a temperatura em Celsius para ser convertida em Farenheit.");
    scanf("%lf", &tempCelsius);

    printf("Resultado: %.2lf", convert(tempCelsius));
}