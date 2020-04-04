//
// Created by kaioa on 02/04/2020.
//

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    int n;
    while(cin >> n){
        if(n == 0) break;

        vector<int> prices, pairPrices;
        int current;
        for (int i = 0; i < n*2; ++i) {
            cin >> current;
            prices.push_back(current);
        }

        for (int j = 0; j < prices.size() / 2; ++j) {
            int max = prices[j], min = prices[prices.size() - 1 - j];
            //if(max == min) continue;
            pairPrices.push_back(max + min);
        }

        sort(pairPrices.begin(), pairPrices.end());

        cout << pairPrices[pairPrices.size() - 1] << ' ' << pairPrices[0] << endl;
    }

    return(0);
}