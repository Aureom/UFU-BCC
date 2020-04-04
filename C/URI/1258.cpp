//
// Created by kaioa on 22/03/2020.
//

#include <iostream>
#include <algorithm>

using namespace std;

struct shirt{
    string name;
    string color;
    char size;
};

bool sortShirts(shirt p1, shirt p2){
    if(p1.color == p2.color){
        if(p1.size == p2.size) return p1.name < p2.name;
        return p1.size > p2.size;
    }else{
        return p1.color < p2.color;
    }
}

int main() {
    ios::sync_with_stdio(false);  // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio
    int cases = 1, count = 0;

    while(cases){
        cin >> cases;
        if(!cases) break;
        if(count != 0) cout << endl;

        struct shirt shirts[cases];
        for (int i = 0; i < cases; ++i) {
            cin.ignore();
            getline(cin, shirts[i].name);
            cin >> shirts[i].color >> shirts[i].size;
        }

        sort(shirts, shirts + cases, sortShirts);
        for (int j = 0; j < cases; ++j) {
            cout << shirts[j].color << ' ' << shirts[j].size << ' ' <<  shirts[j].name << endl;
        }

        count++;
    }
}