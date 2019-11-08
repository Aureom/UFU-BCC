//
// Created by kaioa on 08/11/2019.
//
#include <stdio.h>

double convert(double nmbr, char opt){
    if(opt == 'A' || opt == 'a'){
        return (9.0 * nmbr / 5) + 32;
    }else if(opt == 'B' || opt == 'b') {
        return 5 * (nmbr - 32.0) / 9;
    }
}

int main(){
    double nmbr;
    char opt = ' ';

    printf("\na) Celsius: converte de Farenheit para Celsius\nb) Farenheit: converte de Celsius para Farenheit.");
    while(opt != 'A' && opt != 'a' && opt != 'B' && opt != 'b'){
        scanf("%c", &opt);
    }

    printf("Insira a temperatura: ");
    scanf("%lf", &nmbr);

    printf("Resultado: %.2lf", convert(nmbr, opt));
}