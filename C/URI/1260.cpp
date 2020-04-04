//
// Created by kaioa on 19/03/2020.
//

#include <map>
#include <iostream>

using namespace std;

int main() {
    map<string, int> trees;
    int cases, totalCount, count = 0;

    cin >> cases;
    cin.ignore();
    cin.ignore();

    for (int i = 0; i < cases; i++) {
        if(count != 0) cout << endl;

        trees.clear();
        totalCount = 0;

        string helper;
        while (getline(cin, helper)) {
            if(helper.empty()) break;
            trees[helper]++;
            totalCount++;
        }

        for(auto const& map : trees){
            double percent = (map.second*100.0)/totalCount;
            cout.precision(4);
            cout << map.first << " " << fixed << percent << endl;
        }

        count++;
    }

    return(0);
}