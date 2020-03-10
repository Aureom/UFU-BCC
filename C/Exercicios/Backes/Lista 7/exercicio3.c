//Fac¸a uma func¸ao para verificar se um n ˜ umero ´ e positivo ou negativo. Sendo que o valor ´
//de retorno sera 1 se positivo, -1 se negativo e 0 se for igual a 0.

#include <stdio.h>

int verifySignal(double nmr) {
    return nmr == 0 ? 0 : nmr > 0 ? 1 : -1;
}

int main() {
    double nmr;
    printf("Insira um numero para verificar se o mesmo é positivo ou negativo.");
    scanf("%lf", &nmr);

    if(verifySignal(nmr) == 0){
        printf("O número inserido é 0, nem negativo, nem positivo!");
    }else if(verifySignal(nmr) == -1){
        printf("O número inserido é negativo!");
    }else{
        printf("O número inserido é positivo!");
    }
}