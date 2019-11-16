//Escreva uma func¸ao que receba um n ˜ umero inteiro maior do que zero e retorne a soma ´
//de todos os seus algarismos. Por exemplo, ao numero 251 corresponder ´ a o valor 8 (2 ´
//+ 5 + 1). Se o numero lido n ´ ao for maior do que zero, o programa terminar ˜ a com a ´
//mensagem “Numero inv ´ alido”.

#include <stdio.h>

int sumOfAllNumbers(int number){
    int sum = 0;

    while (number > 0) {
        sum += number % 10;
        number = number / 10;
    }

    return sum;
}

int main(){
    int number = 0;

    printf("Digite um numero maior que zero: \n");
    while(0 >= number) {
        scanf("%d", &number);
    }

    printf("Soma de todos os algarismos do numero: %d", sumOfAllNumbers(number));
}