//Fac¸a uma func¸ao e um programa de teste para o c ˜ alculo do volume de uma esfera. ´
//Sendo que o raio e passado por par ´ ametro. ˆ
//V = 4/3 ∗ π ∗ R³

#include <stdio.h>
#include <math.h>

double sphereVolume(double radius) {
    return 4.0/3 * M_PI * (radius*radius*radius);
}

int main() {
    int nmr;
    printf("Insira o raio da esfera para descobrir o volume: ");
    scanf("%d", &nmr);

    printf("%lf", sphereVolume(nmr));
}