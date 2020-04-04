//
// Created by kaioa on 02/04/2020.
//

#include <iostream>
#include <vector>
#include <algorithm>
#include <sstream>

using namespace std;

bool largerToSmallest(string x, string y){
    return x.size() > y.size();
}

int main() {
    ios::sync_with_stdio(false);

    int cases;
    cin >> cases;
    cin.ignore();

    vector<string> words;
    while(cases--){
        string line, tmp;
        getline(cin, line);
        istringstream iss(line);
        while (iss >> tmp) {
            words.push_back(tmp);
        }

        stable_sort(words.begin(), words.end(), largerToSmallest);
        for (unsigned int i = 0; i < words.size(); ++i) {
            i+1 == words.size() ? cout << words[i] :  cout << words[i] << ' ';
        }

        cout << endl;
        words.clear();
    }
}