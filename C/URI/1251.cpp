//
// Created by kaioa on 22/03/2020.
//

#include <iostream>
#include <algorithm>
#include <map>
#include <vector>

using namespace std;

int main() {
    ios::sync_with_stdio(false); // O codigo roda 3x mais rapido, mas não posso utilizar a biblioteca stdio

    map<char, int> charCount;
    int count = 0;

    string line;
    while(getline(cin, line) && !line.empty()){
        if(count != 0) cout << endl;
        charCount.clear();
        for (char& i : line) {
            charCount[i]++;
        }

        vector<pair<char, int>> vec;
        copy(charCount.begin(), charCount.end(), back_inserter<vector<pair<char,int>>>(vec));
        sort(vec.begin(), vec.end(), [](const pair<char, int>& l, const pair<char, int>& r) {
            if (l.second != r.second) return l.second < r.second;
            return l.first > r.first;
        });

        for (auto const &pair: vec) {
            cout << (int) pair.first << ' ' << pair.second << endl;
        }

        count++;
    }
    return(0);
}