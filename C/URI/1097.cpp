//
// Created by kaioa on 02/04/2020.
//

#include <iostream>

using namespace std;


int main() {
    ios::sync_with_stdio(false);
    unsigned short int i, j, n = 7;
    for (i = 1; i < 10; i += 2){
         for (j = n; j > (n - 3); j--) cout << "I=" << i << ' ' << "J=" << j << endl;
         n += 2;
    }
}