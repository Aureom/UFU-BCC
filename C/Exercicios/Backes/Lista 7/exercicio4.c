//4. Fac¸a uma func¸ao para verificar se um n ˜ umero ´ e um quadrado perfeito. Um quadrado ´
//perfeito e um n ´ umero inteiro n ´ ao negativo que pode ser expresso como o quadrado de ˜
//outro numero inteiro. Ex: 1, 4, 9...

#include <stdio.h>
#include <math.h>

int verifyPerfectSquare(int nmr) {
    return sqrt(nmr) == (int) sqrt(nmr);
}

int main() {
    int nmr;
    printf("Insira um numero para verificar se o mesmo é um quadrado perfeito.");
    scanf("%d", &nmr);

    if(verifyPerfectSquare(nmr)){
        printf("O número %d é um quadrado perfeito", nmr);
    }else {
        printf("O número %d não é um quadrado perfeito", nmr);
    }
}