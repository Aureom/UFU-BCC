//
// Created by kaioa on 22/03/2020.
//

#include <iostream>
#include <algorithm>

using namespace std;

bool evenAndOdd(unsigned int x, unsigned int y){
    if(x % 2 == 0 && x < y) return true;
    if(y % 2 == 0 && y < x) return false;
    if(y < x) return true;
    if(x < y) return false;
}

int main() {
    unsigned int cases = 0;

    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    cin >> cases;
    unsigned int numbers[cases];
    for (int i = 0; i < cases; ++i) {
        cin >> numbers[i];
    }

    sort(numbers, numbers + cases, evenAndOdd);
    for (int i = 0; i < cases; ++i) {
        cout << numbers[i] << endl;
    }

    return(0);
}