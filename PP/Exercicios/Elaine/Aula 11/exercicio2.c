//
// Created by kaioa on 08/11/2019.
//
#include <stdio.h>

int getHighest(int x, int y){
    return x > y ? x : y;
}

int main(){
    int num[2];
    printf("Insira dois numeros: ");
    scanf("%d %d", &num[0], &num[1]);
    printf("%d é o maior numero", getHighest(num[0], num[1]));
}