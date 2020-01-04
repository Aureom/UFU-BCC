//Sejam a e b os catetos de um triangulo, onde a hipotenusa ˆ e obtida pela equac¸ ´ ao: ˜
//hipotenusa = √a² + b². Fac¸a uma func¸ao que receba os valores de ˜ a e b e calcule o
//valor da hipotenusa atraves da equac¸ ´ ao.

#include <stdio.h>
#include <math.h>

double hypotenuse(double a, double b){
    return sqrt(a*a + b*b);
}

int main(){
    double a, b;

    printf("Insira o valor dos catetos 'A' e 'B' do triangulo: ");
    scanf("%lf %lf", &a, &b);

    printf("Hipotenusa: %.2lf", hypotenuse(a, b)); //Poderiamos simplesmente usar a função hypot da biblioteca math.h, mas....
}