//
// Created by kaioa on 11/03/2020.
//

#include <stdio.h>
#include <stdlib.h>

struct cadastro {
    char nome[10], rua[20];
    int idade, numero;
};

int main(){
    struct cadastro c[4];
    int i;
    for (i = 0; i < 4; ++i) {
        gets(c[i].nome);
        scanf("%d", &c[i].idade);
        gets(c[i].rua);
        scanf("%d", &c[i].numero);
    }
    system("pause");
    return 0;
}
