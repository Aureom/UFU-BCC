//Fac¸a uma func¸ao que receba a data atual (dia, m ˜ es e ano em inteiro) e exiba-a na tela ˆ
//no formato textual por extenso. Exemplo: Data: 01/01/2000, Imprimir: 1 de janeiro de
//2000

#include <stdio.h>

void dateConverter(int day, int month, int year) {
    char* months[] = { "janeiro", "fevereiro", "marco", "abril", "maio", "junho", "julho", "agosto", "setembro" , "outubro", "novembro", "dezembro"};
    printf("\n%d de %s de %d", day, months[month - 1], year);
}

int main() {
    int day = 0, month = 0, year;
    printf("Insira a data no seguinte formato (DD/MM/AAAA): ");
    while(!(month >= 1 && month <= 12 && day >= 1 && day <= 31)) {
        scanf("%u/%u/%u", &day, &month, &year);
    }
    dateConverter(day, month, year);
}