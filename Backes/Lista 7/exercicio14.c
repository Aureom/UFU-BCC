//CONSUMO (Km/l) MENSAGEM
//menor que 8 Venda o carro!
//entre 8 e 14 Economico! ˆ
//maior que 12 Super economico! ˆ
//14. Fac¸a uma func¸ao que receba a dist ˜ ancia em ˆ Km e a quantidade de litros de gasolina
//consumidos por um carro em um percurso, calcule o consumo em Km/l e escreva uma
//mensagem de acordo com a tabela acima:

#include <stdio.h>

double calcKmL(double km, double consm){
    double kmL = km/consm;

    if(kmL <= 8) printf("Venda o carro!");
    else if(14 > km) printf("Economico!");
    else printf("Super economico!");
}

int main(){
    double km, consm;

    printf("\nInsira os kilometros rodados e o consumo em litros: ");
    scanf("%lf %lf", &km, &consm);

    calcKmL(km, consm);
}