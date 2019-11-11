//Fac¸a umam func¸ao que receba a altura e o raio de um cilindro circular e retorne o volume ˜
//do cilindro. O volume de um cilindro circular e calculado por meio da seguinte f ´ ormula: ´
//V = π ∗ raio2 ∗ altura, onde π = 3.141592.

#include <stdio.h>
#include <math.h>

double cylinderVol(double height, double radius){
    return M_PI * (radius*radius) * height;
}

int main(){
    double height, radius;

    printf("Insira o valor da altura e raio do cilindro: ");
    scanf("%lf %lf", &height, &radius);

    printf("Volume do cilindro: %.2lf", cylinderVol(height, radius));
}