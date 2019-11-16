//Fac¸a uma func¸ao chamada DesenhaLinha. Ele deve desenhar uma linha na tela usando ˜
//varios s ´ ´ımbolos de igual (Ex: ========). A func¸ao recebe por par ˜ ametro quantos sinais ˆ
//de igual serao mostrados.

#include <stdio.h>

void drawLine(int size){
    for (int i = 0; i < size; ++i) {
        printf("=");
    }
    printf("\n");
}

int main() {
    int size = 0;

    printf("Insira o tamanho desejado da linha: \n");
    while (0 >= size){
        scanf("%d", &size);
    }
    drawLine(size);
}