//Fac¸a uma func¸ao que receba 3 n ˜ umeros inteiros como par ´ ametro, representando horas, ˆ
//minutos e segundos, e os converta em segundos.

#include <stdio.h>

int convertToSecs(int hours, int minutes, int seconds) {
    return (hours * 3600) + (minutes * 60) + seconds;
}

int main() {
    int hours, minutes, seconds;

    printf("Insira 3 numeros, um representando horas, outros minutos e outros segundos, para serem convertidos em segundos");
    scanf("%d %d %d", &hours, &minutes, &seconds);

    printf("\nTotal de %d segundos", convertToSecs(hours, minutes, seconds));
}