//
// Created by kaioa on 08/11/2019.
//
#include <stdio.h>

int pair(int value){
    return value % 2 == 0 ? 1 : 0;
}

int main(){
    int number;
    printf("Insira um numero: ");
    scanf("%d", &number);
    pair(number) ? printf("%d é par!", number) :  printf("%d não é par!", number);
}