//
// Created by kaioa on 02/04/2020.
//

#include <iostream>

using namespace std;

int main() {
    ios::sync_with_stdio(false);

    int cases;
    cin >> cases;
    for (int i = 0; i < cases; ++i) {
        unsigned int num;
        cin >> num;
        cout << (num % 2 == 0 ?  0 : 1) << endl;
    }
}