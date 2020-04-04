//
// Created by kaioa on 02/04/2020.
//

#include <iostream>

using namespace std;

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    int startNum;
    cin >> startNum;
    for (int i = startNum; i < startNum+12; ++i) {
        if(i % 2 != 0) cout << i << endl;
    }

    return(0);
}