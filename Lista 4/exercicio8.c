#include <stdio.h>
#include <stdlib.h>

int main(){
    int value[6];

    for (int i = 0; i < 6; ++i) {
        printf("\nInsira o %d\xf8 numero: ", i);
        scanf("%d", &value[i]);
    }

    for (int i = 5; i >= 0; --i) {
        printf("\n%d", value[i]);
    }
}