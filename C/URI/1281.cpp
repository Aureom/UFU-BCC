//
// Created by kaioa on 22/03/2020.
//

#include <map>
#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    map<string, double> fruits;
    int cases = 0, fruitCount, quantityToBuy;
    double totalprice;

    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    cin >> cases;

    for (int i = 0; i < cases; i++) {
        fruits.clear();
        totalprice = 0.0;

        cin >> fruitCount;
        for (int j = 0; j < fruitCount; ++j) {
            string fruit;
            double price;
            cin>>fruit>>price;
            fruits[fruit] = price;
        }

        cin >> quantityToBuy;
        for (int j = 0; j < quantityToBuy; ++j) {
            string fruit;
            int qnt;
            cin>>fruit>>qnt;
            totalprice += fruits[fruit]*qnt;
        }

        cout << "R$ " << fixed << setprecision(2) << totalprice << endl;
    }

    return(0);
}