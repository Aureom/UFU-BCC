//Crie um programa que receba tres valores (obrigatoriamente maiores que zero), repre- ˆ
//sentando as medidas dos tres lados de um tri ˆ angulo. Elabore func¸ ˆ oes para: ˜
//(a) Determinar se eles lados formam um triangulo, sabendo que: ˆ
//• O comprimento de cada lado de um triangulo ˆ e menor do que a soma dos outros ´
//dois lados.
//(b) Determinar e mostrar o tipo de triangulo, caso as medidas formem um tri ˆ angulo. ˆ
//Sendo que:
//• Chama-se equilatero o tri ´ angulo que tem tr ˆ es lados iguais. ˆ
//• Denominam-se isosceles o tri ´ angulo que tem o comprimento de dois lados ˆ
//iguais.
//• Recebe o nome de escaleno o triangulo que tem os tr ˆ es lados diferentes

#include <stdio.h>
#include <ctype.h>

#define true 1
#define false 0

int verifyTriangle(const double sides[3]){
    if(sides[0] + sides[1] < sides[2]) return false;
    if(sides[0] + sides[2] < sides[1]) return false;
    if(sides[1] + sides[2] < sides[0]) return false;
    return true;
}

char* getTriangleName(const double sides[3]){
    if(sides[0] == sides[1] == sides[2]) return "equilatero";
    if(sides[0] == sides[1] || sides[1] == sides[2] || sides[2] == sides[0]) return "isóscecles";
    return "escaleno";
}

int main() {
    double sides[3] = {0, 0, 0};
    char option = ' ';

    for (int i = 0; i < 3; ++i) {
        printf("\nInsira a medida do lado %d do triangulo: ", i+1);
        while (0 >= sides[i]){
            scanf("%lf", &sides[i]);
        }
    }

    while (tolower(option) != 'a' && tolower(option) != 'b'){
        printf("\nEscolha uma opcao\n\na) Verificar se forma um triangulo\nb) Determinar o tipo de triangulo");
        scanf("%c", &option);
    }

    if(tolower(option) == 'a'){
        verifyTriangle(sides) ? printf("\nForma um triangulo") : printf("\nNão forma um triangulo");
    }else{
        printf("\nO triangulo inserido é um triangulo %s", getTriangleName(sides));
    }
}