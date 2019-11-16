//Elabore uma func¸ao que receba tr ˜ es notas de um aluno como par ˆ ametros e uma letra. ˆ
//Se a letra for A, a func¸ao dever ˜ a calcular a m ´ edia aritm ´ etica das notas do aluno; se for P, ´
//devera calcular a m ´ edia ponderada, com pesos 5, 3 e 2.

#include <stdio.h>

double result(const double scr[3], char letter){
    double avg = 0;
    if(letter == 'a' || letter == 'A'){
        for (int i = 0; i < 2; ++i) {
            avg += scr[i] / 3.0;
        }
    }else if(letter == 'p' || letter == 'P'){
        for (int i = 0; i < 2; ++i) {
            i == 0 ? avg += scr[i] * 5 : i == 1 ? avg += scr[i] * 3 : i == 2 ? avg += scr[i] * 2 : 0;
        }
        avg = avg / 3;
    }
    return avg;
}

int main(){ // Copiei do exercicio 3 da Elaine :)
    double score[3];
    char letter = ' ';
    printf("Insira as 3 notas: ");
    scanf("%lf %lf %lf", &score[0], &score[1], &score[2]);
    printf("\nEscolha: \n - A -> Media aritimeticaa\n - P -> Media ponderada\n");
    while(letter != 'A' && letter != 'a' && letter != 'P' && letter != 'p') {
        scanf("%c", &letter);
    }
    printf("Media: %lf", result(score, letter));
}