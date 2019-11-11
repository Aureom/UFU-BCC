#include <stdio.h>
#include <stdlib.h>

int main(){
    double value[10];
    double highest = 0, lowest = 0;

    for (int i = 0; i < 10; ++i) {
        printf("\nInsira o %d\xf8 numero: ", i);
        scanf("%lf", &value[i]);

        if(i == 0) {
            highest = value[i];
            lowest = value[i];
        }else{
            if(value[i] > highest) highest = value[i];
            if(lowest > value[i]) lowest = value[i];
        }
    }

    printf("O menor numero inserido foi: %.2lf\nE o menor foi: %.2lf", highest, lowest);
}